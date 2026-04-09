# Sprint 3

## User Story:
Campus Administrator can view all reports (no filtering restrictions)

| Test Case | Input | Expected Output | Actual Output |
|---|---|---|---|
| 1 (Success) | **Precondition:** User is Django superuser. 1. Log in 2. Open `/admin-console/reports/` | Admin Console page opens and displays all reports | Passed. Page loaded successfully and all reports (published and unpublished) were visible |
| 2 (Success) | **Precondition:** Database contains both published and unpublished reports. 1. Log in as superuser 2. Open `/admin-console/reports/` | System shows both published and unpublished reports | Passed. All reports were displayed regardless of publication status |
| 3 (Failure) | **Precondition:** User is NOT superuser. 1. Log in as normal user 2. Open `/admin-console/reports/` | User is redirected to `/reports/` | Passed. Non-admin user was redirected to reports page |
| 4 (Success) | **Precondition:** User is superuser. 1. Log in 2. Open Admin Console via navigation link | Admin Console link is visible and navigates correctly | Passed. Link appeared in navbar and opened admin reports page |
| 5 (Failure) | **Precondition:** User is NOT superuser. 1. Log in as normal user 2. Check navbar | Admin Console link is NOT visible | Passed. Link was not displayed for non-admin user |
| 6 (Regression) | 1. Open `/reports/` 2. Use filters and scopes | Existing reports functionality remains unchanged | Passed. Filters, scopes, and report list behaved as before |
| 7 (Regression) | 1. Open any report detail page from admin console | Report detail page opens correctly | Passed. Report detail page opened without errors |
