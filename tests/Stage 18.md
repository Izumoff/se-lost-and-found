# Sprint 3 — Security Test Cases

**Stage:** Road Map 4 — Stage 7 Security Hardening :contentReference[oaicite:0]{index=0}

| Test Case | Input | Expected Output | Actual Output |
|---|---|---|---|
| 1. Spaces-only title rejected | Create/edit report with Title=`"   "` | Form is not submitted. Validation error shown for Title. | Worked as expected. Validation error shown. |
| 2. Spaces-only description rejected | Create/edit report with Description=`"   "` | Form is not submitted. Validation error shown for Description. | Worked as expected. Validation error shown. |
| 3. Spaces-only location rejected | Create/edit report with Location=`"   "` | Form is not submitted. Validation error shown for Location. | Worked as expected. Validation error shown. |
| 4. Too-short title rejected | Title=`"a"` | Form is not submitted. Title length validation error shown. | Worked as expected. Validation error shown. |
| 5. Too-short description rejected | Description=`"abc"` | Form is not submitted. Description length validation error shown. | Worked as expected. Validation error shown. |
| 6. XSS script tag in report field | `<script>alert('xss')</script>` in title/description/location | No popup. Value is rendered as text, not executed. | Worked as expected. No popup. Script did not execute. |
| 7. XSS image onerror payload | `<img src="x" onerror="alert('xss')">` | No popup. Value is escaped / shown as text. | Worked as expected. No popup. Payload did not execute. |
| 8. HTML formatting injection | `<b>bold test</b>` | Text is shown safely, not interpreted as active HTML. | Worked as expected. No unsafe rendering occurred. |
| 9. Unsafe template rendering audit | Search project for `|safe` and `mark_safe` | No unsafe rendering helpers found in project templates/code. | Worked as expected. Search showed no `|safe` / `mark_safe`. |
| 10. SQL injection in search query | `/reports/?query=' OR '1'='1` | No crash. No unexpected data exposure. Normal filtered behavior only. | Worked as expected. No crash, no bypass. |
| 11. SQL injection in location filter | `/reports/?location=' OR '1'='1` | No crash. No filter bypass. | Worked as expected. No crash, no bypass. |
| 12. SQL injection union attempt | `/reports/?query=' UNION SELECT * FROM auth_user --` | No crash. Input treated as text, not SQL. | Worked as expected. No SQL execution occurred. |
| 13. Logged-out access to protected action | Open `/reports/1/resolve/` while logged out | Redirect to login page, action not performed. | Initially redirected to `/accounts/login/` and gave 404. **Fixed** by setting `LOGIN_URL='/login/'`. Final result: redirected to `/login/` correctly. |
| 14. GET request blocked for resolve | Open `/reports/1/resolve/` while logged in | Redirect away / no state change because action requires POST. | Worked as expected. No report change from GET request. |
| 15. GET request blocked for close | Open `/reports/1/close/` while logged in | Redirect away / no state change because action requires POST. | Worked as expected. No report change from GET request. |
| 16. GET request blocked for close-own | Open `/reports/1/close-own/` while logged in | Redirect away / no state change because action requires POST. | Worked as expected. No report change from GET request. |
| 17. POST action still works after hardening | Use UI buttons/forms for Resolve / Close / Close Own / Status Update | Action succeeds only through form POST with CSRF token. | Worked as expected. Actions succeeded from UI forms. |
| 18. CSRF protection on report forms | Inspect all POST forms | Every POST form contains `{% csrf_token %}`. | Worked as expected. Verified in report form, report detail, admin users, and all other POST forms. |
| 19. Campus user blocked from staff-only actions | Campus user tries status change / resolve / close staff actions | Redirected / denied. No state change. | Worked as expected. Unauthorized user could not perform staff actions. |
| 20. Campus user blocked from editing another user report | Login as campus user and open edit URL for another user report | Redirected to reports. Edit not allowed. | Worked as expected. Access denied. |
| 21. Staff user allowed for staff workflow | Login as Security Office Staff and change report status | Status updates successfully. | Worked as expected. Staff actions succeeded. |
| 22. Invalid state transition blocked | Try changing status on already resolved/closed report | No change should occur. | Worked as expected. Status did not change for non-open report. |
| 23. CSRF-protected role update | Admin changes user role from Admin Users page | Role changes only through POST form with CSRF token. | Worked as expected. Role update succeeded through secure form. |
| 24. Security regression check after Stage 7 | Retest XSS, SQL injection, CSRF, and access control | All protections remain active and app still works normally. | Worked as expected. Stage 7 tested successfully end-to-end. |

## Security Summary
- Input validation works
- XSS payloads do not execute
- SQL injection payloads do not affect queries
- Protected actions require login
- State-changing actions require POST
- POST forms include CSRF tokens
- Staff/admin permissions are enforced correctly
