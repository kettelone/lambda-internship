class APIError {
	code: number
	message: string

	constructor(code: number, message: string) {
		this.code = code
		this.message = message
	}

	static badRequest(msg: string) {
		return new APIError(400, msg)
	}

	static unauthorized(msg: string) {
		return new APIError(401, msg)
	}

	static notFound(msg: string) {
		return new APIError(404, msg)
	}

	static conflict(msg: string) {
		return new APIError(409, msg)
	}

	static internal(msg: string = 'Internal error') {
		return new APIError(500, msg)
	}
}

export default APIError
