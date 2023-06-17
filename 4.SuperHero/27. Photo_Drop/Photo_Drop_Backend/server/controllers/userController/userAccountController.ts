import { Request, Response, NextFunction } from 'express'
import jwt from 'jsonwebtoken'
import { AppUser, Person, SelfieMini } from '../../models/relations'
import APIError from '../../errors/APIError'
import userAccountService from '../../services/userService/telegramService'
import albumService from '../../services/userService/albumService'

const generateJwt = (id: string, phone: string, countryCode: string): string =>
	jwt.sign({ id, phone, countryCode }, process.env.SECRET_KEY!, {
		expiresIn: '24h'
	})

class UserAccountController {
	async createAppUser(
		req: Request,
		res: Response,
		next: NextFunction
	): Promise<void> {
		const { phone, countryCode } = req.body as { [key: string]: string }
		try {
			const appUserExist = await AppUser.findOne({ where: { phone } })
			if (appUserExist) {
				const { id } = appUserExist
				const token = generateJwt(id, phone, countryCode)
				res.json({ token })
				return
			}
			const appUser = await AppUser.create({
				phone,
				countryCode,
				textMessagesNotification: true,
				emailNotification: true,
				unsubscribe: false
			})
			let personExist = await Person.findOne({ where: { phone } })
			if (personExist) {
				const { id } = appUser
				const token = generateJwt(id, phone, countryCode)
				res.json({ token })
			} else {
				personExist = await Person.create({ phone })
				const { id } = appUser
				const token = generateJwt(id, phone, countryCode)
				res.json({ token })
			}

			// Send notification to TG about user albums
			const uniqueAlbumIds = await albumService.findUniqueAlbumIds(
				personExist.id
			)
			if (uniqueAlbumIds.length === 0) {
				return
			}
			const startString = `${process.env.FRONT_BASE_URL}/albums/`
			let finalString = ''
			uniqueAlbumIds.forEach((albumId: any) => {
				finalString += `${startString}${albumId}\n\n`
			})
			await userAccountService.sendNotification(phone, finalString)
			return
		} catch (e) {
			console.log(e)
			next(APIError.internal('Internal error while creating user'))
		}
	}

	async getMe(
		req: Request<{}, {}, {}, { userId: string }>,
		res: Response,
		next: NextFunction
	): Promise<void> {
		try {
			const { userId } = req.query
			if (!req.headers.authorization) {
				next(APIError.unauthorized('Missing authorization token'))
				return
			}
			const token = req.headers.authorization.split(' ')[1] // Bearer ddhcjhdsjcsdcs
			jwt.verify(token, process.env.SECRET_KEY!)
			const user = await AppUser.findOne({ where: { id: userId } })
			if (!user) {
				next(APIError.unauthorized('User was not found'))
				return
			}
			const selfie = await SelfieMini.findOne({
				where: { appUserId: userId, active: true }
			})
			const {
				id,
				name,
				phone,
				countryCode,
				email,
				textMessagesNotification,
				emailNotification,
				unsubscribe
			} = user
			const userObject: { [key: string]: string | boolean | null } = {
				id,
				name,
				phone,
				countryCode,
				email,
				textMessagesNotification,
				emailNotification,
				unsubscribe
			}
			userObject.selfieKey = selfie ? selfie.name : null
			res.json({ userObject })
			return
		} catch (e) {
			next(APIError.internal('Internal error'))
		}
	}

	async editName(
		req: Request,
		res: Response,
		next: NextFunction
	): Promise<void> {
		const { id, name } = req.body as { [key: string]: string }
		try {
			const user = await AppUser.findOne({ where: { id } })
			if (!user) {
				next(APIError.notFound('User not found'))
				return
			}
			user.name = name
			user.save()
			res.json({ user })
			return
		} catch (e) {
			console.log(e)
			next(APIError.internal('Internal error on edit name'))
		}
	}

	async editPhone(
		req: Request,
		res: Response,
		next: NextFunction
	): Promise<void> {
		const { id, phone, countryCode } = req.body as { [key: string]: string }
		try {
			const user = await AppUser.findOne({ where: { id } })
			if (!user) {
				next(APIError.notFound('User not found'))
				return
			}
			const oldPhone = user.phone
			user.phone = phone
			user.countryCode = countryCode
			await user.save()
			const person = await Person.findOne({ where: { phone: oldPhone } })
			if (person) {
				person.phone = phone
				person.save()
			}
			const token = generateJwt(id, phone, countryCode)
			res.json({ user, token })
			return
		} catch (e) {
			console.log(e)
			next(APIError.internal('Internal error on edit phone'))
		}
	}

	async editEmail(
		req: Request,
		res: Response,
		next: NextFunction
	): Promise<void> {
		const { id, email } = req.body as { [key: string]: string }
		try {
			const user = await AppUser.findOne({ where: { id } })
			if (!user) {
				next(APIError.notFound('User not found'))
				return
			}
			user.email = email
			user.save()
			res.json({ user })
			return
		} catch (e) {
			console.log(e)
			next(APIError.internal('Internal error on edit email'))
		}
	}

	async editNotificationSettings(
		req: Request,
		res: Response,
		next: NextFunction
	): Promise<void> {
		const { id } = req.body as { id: string }
		const {
			textMessagesNotification,
			emailNotification,
			unsubscribe
		} = req.body as { [key: string]: boolean }
		try {
			const user = await AppUser.findOne({ where: { id } })
			if (!user) {
				next(APIError.notFound('User not found'))
				return
			}
			user.textMessagesNotification = textMessagesNotification
			user.emailNotification = emailNotification
			user.unsubscribe = unsubscribe
			user.save()
			res.json({ user })
			return
		} catch (e) {
			console.log(e)
			next(APIError.internal('Internal error on edit Notification'))
		}
	}
}

export default new UserAccountController()