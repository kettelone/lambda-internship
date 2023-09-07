class CustomErrors extends Error {
  public code: number;
  public message: string;

  constructor(code: number, message: string) {
    super(message);
    this.name = 'CustomErrors';
    this.code = code;
    this.message = message;
  }

  static userExist(): CustomErrors {
    return new CustomErrors(401, 'User with this email already exist');
  }

  static userNotExist(): CustomErrors {
    return new CustomErrors(401, 'User with this email doesn`t exist');
  }

  static loginWithGoogle(): CustomErrors {
    return new CustomErrors(
      401,
      'Login with Google and set password in settings'
    );
  }

  static invalidPassword(): CustomErrors {
    return new CustomErrors(401, 'Invalid password');
  }

  static notAuthenticated(): CustomErrors {
    return new CustomErrors(403, 'User is not authenticated');
  }

  static internal(): CustomErrors {
    return new CustomErrors(500, 'Internal server error');
  }
}

export default CustomErrors;
