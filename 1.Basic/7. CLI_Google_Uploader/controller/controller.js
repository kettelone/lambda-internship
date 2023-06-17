import * as path from 'path'
import * as fs from 'fs'
import axios from 'axios'
import mime from 'mime-types'

import { google } from 'googleapis'

const oauth2Client = new google.auth.OAuth2(
  process.env.CLIENT_ID,
  process.env.CLIENT_SECRET,
  process.env.REDIRECT_URI
)

oauth2Client.setCredentials({ refresh_token: process.env.REFRESH_TOKEN })

const drive = google.drive({
  version: 'v3',
  auth: oauth2Client,
})

class ControllerClass {
  async uploadImage(filePath, fileName) {
    try {
      const folderId = '1Edsi7-NvAx-ltdr8g08ImZIzXl2DslwX'
      const mime_type = mime.contentType(filePath)
      const imgExtension = mime.extension(mime_type)
      let file_name
      if (fileName === '') {
        file_name = `${path.basename(filePath)}`
      } else {
        file_name = `${fileName}.${imgExtension}`
      }
      console.log('file name is: ', file_name)

      const fileMetadata = {
        name: file_name,
        parents: [folderId],
      }

      const media = {
        mimeType: mime_type,
        body: fs.createReadStream(filePath),
      }

      const response = await drive.files.create({
        resource: fileMetadata,
        media: media,
        fields: 'id',
      })

      return response
    } catch (e) {
      console.log(e.message)
    }
  }
  async shortenUrl(imageId) {
    const baseUrl = `https://drive.google.com/file/d/${imageId}/view`

    try {
      const config = {
        headers: { Authorization: `Bearer ${process.env.TINYURL_API_TOKEN}` },
      }
      const response = await axios.post(
        'https://api.tinyurl.com/create',
        {
          url: baseUrl,
        },
        config
      )
      return response.data.data.tiny_url
    } catch (e) {
      console.log(e.message)
    }
  }
}

export { ControllerClass }
