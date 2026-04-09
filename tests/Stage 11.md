# Sprint 3

## User Story:
Campus User can reset forgotten password

| Test Case | Input | Expected Output | Actual output |
|---|---|---|---|
| 1 (Success) | **Precondition:** Existing campus user has a valid email address saved in the system. 1. Open `/password-reset/` 2. Enter the existing user email 3. Click **Send Reset Link** | The system accepts the request and redirects to the password reset confirmation page | Passed. `/password-reset/` opened correctly, email was submitted, and the system redirected to `/password-reset/done/` |
| 2 (Failure) | 1. Open `/password-reset/` 2. Leave email field empty 3. Click **Send Reset Link** | The page remains open and validation error is shown | Passed. The form stayed open and validation error was shown for the empty email field |
| 3 (Failure) | 1. Submit password reset request before `password_reset_done.html` template existed | The system should show the reset confirmation page | Failed first: `TemplateDoesNotExist at /password-reset/done/ app/password_reset_done.html`. Fixed. After adding the template, the confirmation page opened successfully |
| 4 (Success) | 1. Submit password reset request for existing user email after email templates were added | The system creates reset email content and continues the flow without template errors | Passed. The request completed and continued to `/password-reset/done/` without email template errors |
| 5 (Failure) | 1. Open valid reset link 2. Submit new password before `password_reset_complete.html` template existed | The system should show final success page after password change | Failed first: `TemplateDoesNotExist at /reset/done/ app/password_reset_complete.html`. Fixed. After adding the template, the final success page opened correctly |
| 6 (Failure) | 1. Open valid reset link 2. Enter different values in **New password** and **Confirm password** 3. Submit form | The system stays on reset form and shows validation error | Passed. The reset form remained open and password mismatch validation was shown |
| 7 (Success) | 1. Open valid reset link 2. Enter matching valid passwords 3. Submit form | The system resets the password and redirects to `/reset/done/` | Passed. Password reset completed successfully and `/reset/done/` opened correctly |
| 8 (Success) | 1. After reset completion, click **Go to Log in** 2. Log in with the new password | The user can log in successfully with the new password | Passed. Login worked with the new password after reset completion |
| 9 (Regression) | 1. Start the server after adding password reset routes 2. Open `/login/` | Existing login page still works and is not broken by password reset changes | Passed. Existing login page continued to work correctly after password reset routing was added |

