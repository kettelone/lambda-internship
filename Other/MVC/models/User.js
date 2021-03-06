/*Using an ORM (mongoose) to interact with a simple user database model*/
const mongoose = require('mongoose')

var User = mongoose.model('User', {
  username: { type: String, required: true },
  password: { type: String, required: true },
  first_name: { type: String },
  last_name: { type: String },
})

//export database model(user)
module.exports = { User }
