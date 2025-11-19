# Online Banking System - JSP Files Summary

## WebContent JSP Files

This document provides a summary of all JSP files in the Online Banking System project.

### Core JSP Files

1. **Home.jsp** - Landing page with navigation menu for login (Admin/User) and contact
2. **NewAccount.jsp** - Account creation form with fields for PAN, account type, personal details, and initial balance
3. **Admin.jsp** - Admin login panel with options for account management
4. **UserDashboard.jsp** - User dashboard showing balance, transactions, transfer options
5. **AdminPanel.jsp** - Admin dashboard with options for account creation, closure, password changes
6. **CheckBalance.jsp** - Check account balance by account number with database query
7. **MoneyTransfer.jsp** - Transfer funds between accounts with balance validation
8. **WithdrawMoney.jsp** - Withdraw funds with account and holder verification
9. **Deposit.jsp** - Deposit money into an account
10. **ChangePassword.jsp (Admin)** - Admin password change functionality
11. **ChangePassword.jsp (User)** - User password change with verification
12. **ClosingAccount.jsp** - Account deletion/update with account details display
13. **TransactionHistory.jsp** - View account transaction history

## Key Features

- Bootstrap 5 responsive UI design
- Font Awesome icons for better UX
- Database connectivity using Oracle JDBC driver
- Form validation and error handling
- Session management for security
- Account balance management
- Secure password handling

## Database Tables

- **accounttable** - Stores account information (account number, customer details, balance, password)
- **admintable** - Stores admin credentials

## Connection Details

- **Database**: Oracle (jdbc:oracle:thin:@localhost:1521:xe)
- **Username**: system
- **Password**: 123

## Technology Stack

- **Frontend**: HTML5, CSS3, Bootstrap 5, Font Awesome
- **Backend**: JSP, Java Servlets
- **Database**: Oracle Database
- **JDBC Driver**: oracle.jdbc.driver.OracleDriver

## Notes

All JSP files contain embedded database connectivity code using JDBC PreparedStatements for secure SQL execution. The application uses iframes for page navigation and session management for user authentication.
