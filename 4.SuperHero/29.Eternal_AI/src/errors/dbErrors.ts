class DBError extends Error {
  public code: number;
  public message: string;

  constructor(code: number, message: string) {
    super(message);
    this.name = 'DBError';
    this.code = code;
    this.message = message;
  }

  static userExist(): DBError {
    return new DBError(409, 'User with this email already exist');
  }
  static internal(): DBError {
    return new DBError(500, 'Internal server error');
  }
}

export default DBError;
