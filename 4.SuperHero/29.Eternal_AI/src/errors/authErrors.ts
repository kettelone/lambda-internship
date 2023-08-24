class AuthError extends Error {
  public code: number;
  public message: string;

  constructor(code: number, message: string) {
    super(message);
    this.name = 'AuthError';
    this.code = code;
    this.message = message;
  }

  static userExist(): AuthError {
    return new AuthError(401, 'User with this email already exist');
  }

  static userNotExist(): AuthError {
    return new AuthError(401, 'User with this email doesn`t exist');
  }

  static loginWithGoogle(): AuthError {
    return new AuthError(401, 'Login with Google and set password in settings');
  }

  static invalidPassword(): AuthError {
    return new AuthError(401, 'Invalid password');
  }

  static internal(): AuthError {
    return new AuthError(500, 'Internal server error');
  }
}

export default AuthError;
