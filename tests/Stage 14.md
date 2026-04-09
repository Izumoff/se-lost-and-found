# Sprint 3

## User Story:
Campus Administrator can manage users and roles via Admin Console

| Test Case | Input | Expected Output | Actual Output |
|---|---|---|---|
| 1 (Success) | **Precondition:** Logged in as superuser. 1. Click **Admin Console** in main menu | Admin Console page (`/admin-console/`) opens | Passed. Admin Console opened with two options: View All Reports and Manage Users & Roles |
| 2 (Access Control) | **Precondition:** Logged in as non-superuser. 1. Check main menu | Admin Console link is not visible | Passed. Admin Console link not shown for non-superuser |
| 3 (Security Redirect) | **Precondition:** Logged in as non-superuser. 1. Manually open `/admin-console/` | User is redirected to `/reports/` | Passed. Redirect worked correctly |
| 4 (Navigation) | **Precondition:** Logged in as superuser. 1. Open `/admin-console/` 2. Click **View All Reports** | Redirect to `/admin-console/reports/` and show all reports | Passed. All reports displayed without filtering restrictions |
| 5 (Navigation) | **Precondition:** Logged in as superuser. 1. Open `/admin-console/` 2. Click **Manage Users & Roles** | Redirect to `/admin-console/users/` and show users list | Passed. Users list page opened successfully |
| 6 (Display Users) | **Precondition:** At least 2 non-admin users exist. 1. Open `/admin-console/users/` | All non-superuser accounts are listed | Passed. All users displayed, superuser hidden |
| 7 (Display Role) | **Precondition:** Users assigned to groups. 1. Open users page | Each user shows current role (group name) | Passed. Roles displayed correctly |
| 8 (Update Role - Success) | **Precondition:** User exists. 1. Select different role from dropdown 2. Click **Update Role** | User role is updated and success message appears | Passed. Role updated and success alert shown |
| 9 (Update Role - Replace Logic) | **Precondition:** User has existing role. 1. Change role | Previous role removed, new role assigned | Passed. Only one role assigned after update |
| 10 (Invalid Role Protection) | **Precondition:** Modify POST manually with invalid group name | System ignores invalid role and does not crash | Passed. No change applied, system stable |
| 11 (Back Navigation) | **Precondition:** On users page. 1. Click **Back to Admin Console** | Redirect to `/admin-console/` | Passed. Navigation works correctly |
| 12 (UI Integrity) | 1. Navigate through Admin Console and pages | No layout break, styling consistent | Passed. UI consistent with existing layout |
