/// Error codes for firebase platform exceptions. Do not edit this.
const String ERROR_USER_DISABLED = "ERROR_USER_DISABLED";
const String ERROR_USER_NOT_FOUND = "ERROR_USER_NOT_FOUND";
const String ERROR_OPERATION_NOT_ALLOWED = "ERROR_OPERATION_NOT_ALLOWED";
const String ERROR_WRONG_PASSWORD = "ERROR_WRONG_PASSWORD";
const String ERROR_INVALID_EMAIL = "ERROR_INVALID_EMAIL";
const String ERROR = "error";
const String ERROR_EMAIL_ALREADY_IN_USE = "ERROR_EMAIL_ALREADY_IN_USE";
const String ERROR_WEAK_PASSWORD = "ERROR_WEAK_PASSWORD";

/// Messages to display for firebase platform exceptions. You can edit this.
const String USER_DISABLED_MESSAGE = "User has been disabled.";
const String USER_NOT_FOUND_MESSAGE = "User does not exist.";
const String OPERATION_NOT_ALLOWED_MESSAGE =
    "Email and password account is not enabled.";
const String WRONG_PASSWORD_MESSAGE = "Incorrect password.";
const String INVALID_EMAIL_MESSAGE = "Email address is not valid.";
const String ERROR_ERROR_MESSAGE = "Please check email and password fields.";
const String EMAIL_ALREADY_IN_USE_MESSAGE = "Email address is already in use.";
const String WEAK_PASSWORD_MESSAGE = "Please choose a stronger password.";

// Login messages
const String LOGIN_ERROR_MESSAGE = "Error while logging in.";
const String LOGIN_SUCCESS_MESSAGE = "Welcome";

// Change password messages
const String CHANGE_PASSWORD_ERROR_MESSAGE =
    "There was an error while changing your password.";
const String CHANGE_PASSWORD_SUCCESS_MESSAGE =
    "You have successfully changed your password.";
const String CHANGE_PASSWORD_PLATFORM_ERROR_MESSAGE =
    "Please check all the fields.";

const String PASSWORDS_DO_NOT_MATCH_MESSAGE = "The passwords do not match.";
const String PASSWORDS_LENGTH_MESSAGE =
    "The password must be 8 characters long.";

// Create account messages
const String CREATE_ACCOUNT_SUCCESS_MESSAGE =
    "Your account has been created successfully. Please login to continue.";
const String CREATE_ACCOUNT_ERROR_MESSAGE =
    "There was an error while creating your account.";

// Forgot password messages
const String FORGOT_PASSWORD_SUCCESS_MESSAGE =
    "A password reset email has been sent to your inbox.";
const String FORGOT_PASSWORD_ERROR_MESSAGE =
    "There has been an error while processing your request.";

String loginPlatformExceptionHandler(String errorCode) {
  print(errorCode);
  String message;
  switch (errorCode) {
    case ERROR_USER_DISABLED:
      message = USER_DISABLED_MESSAGE;
      break;
    case ERROR_USER_NOT_FOUND:
      message = USER_NOT_FOUND_MESSAGE;
      break;
    case ERROR_OPERATION_NOT_ALLOWED:
      message = OPERATION_NOT_ALLOWED_MESSAGE;
      break;
    case ERROR_WRONG_PASSWORD:
      message = WRONG_PASSWORD_MESSAGE;
      break;
    case ERROR_INVALID_EMAIL:
      message = INVALID_EMAIL_MESSAGE;
      break;
    case ERROR:
      message = ERROR_ERROR_MESSAGE;
      break;
    default:
      message = LOGIN_ERROR_MESSAGE;
  }
  return message;
}

String changePasswordPlatformExceptionHandler(String errorCode) {
  String message;
  switch (errorCode) {
    case ERROR_USER_DISABLED:
      message = USER_DISABLED_MESSAGE;
      break;
    case ERROR_USER_NOT_FOUND:
      message = USER_NOT_FOUND_MESSAGE;
      break;
    case ERROR_OPERATION_NOT_ALLOWED:
      message = OPERATION_NOT_ALLOWED_MESSAGE;
      break;
    case ERROR_WRONG_PASSWORD:
      message = WRONG_PASSWORD_MESSAGE;
      break;
    default:
      message = CHANGE_PASSWORD_ERROR_MESSAGE;
  }
  return message;
}

String createAccountPlatformExceptionHandler(String errorCode) {
  String message;
  switch (errorCode) {
    case ERROR_INVALID_EMAIL:
      message = INVALID_EMAIL_MESSAGE;
      break;
    case ERROR_EMAIL_ALREADY_IN_USE:
      message = EMAIL_ALREADY_IN_USE_MESSAGE;
      break;
    case ERROR_WEAK_PASSWORD:
      message = WEAK_PASSWORD_MESSAGE;
      break;
    default:
      message = CREATE_ACCOUNT_ERROR_MESSAGE;
  }
  return message;
}

String forgotPasswordPlatformExceptionHandler(String errorCode) {
  String message;
  switch (errorCode) {
    case ERROR_INVALID_EMAIL:
      message = INVALID_EMAIL_MESSAGE;
      break;
    case ERROR_USER_NOT_FOUND:
      message = USER_NOT_FOUND_MESSAGE;
      break;
    default:
      message = FORGOT_PASSWORD_ERROR_MESSAGE;
  }
  return message;
}
