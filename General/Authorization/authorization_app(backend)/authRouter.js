const Router = require('express')
const router = new Router()

router.post('/sign_up',()=>console.log("Registration"))
router.post('/login', ()=>console.log("Login"))
router.post('/refresh',()=>console.log("Refresh"))
router.get('/me',()=>console.log("ME"))

module.exports = router