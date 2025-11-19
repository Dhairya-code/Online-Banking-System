# Online Banking System

## Overview

A comprehensive Online Banking System built with **JSP** (JavaServer Pages), **Java Servlets**, and **Oracle Database**. This project provides a secure platform for banking operations including account creation, fund transfers, balance inquiries, and transaction history.

## Key Features

✅ **User Management**
- Create new bank accounts
- User authentication and login
- Password management and security
- Account closure/deletion

✅ **Banking Operations**
- Check account balance
- Transfer funds between accounts
- Deposit and withdraw money
- View transaction history
- Admin controls for account management

✅ **Security**
- Session-based authentication
- Encrypted password storage
- PreparedStatements for SQL injection prevention
- Role-based access control (Admin/User)

✅ **User Interface**
- Responsive Bootstrap 5 design
- Intuitive navigation with iframes
- Font Awesome icons
- Professional styling

## Technology Stack

| Component | Technology |
|-----------|------------|
| **Frontend** | HTML5, CSS3, Bootstrap 5, Font Awesome |
| **Backend** | JSP, Java Servlets |
| **Database** | Oracle Database (JDBC) |
| **Server** | Apache Tomcat |
| **Language** | Java |

## Project Structure

```
Online-Banking-System/
├── WebContent/
│   ├── Home.jsp                    # Landing page
│   ├── Admin.jsp                   # Admin login
│   ├── UserDashboard.jsp           # User dashboard
│   ├── AdminPanel.jsp              # Admin panel
│   ├── NewAccount.jsp              # Account creation
│   ├── CheckBalance.jsp            # Balance inquiry
│   ├── MoneyTransfer.jsp           # Fund transfer
│   ├── Deposit.jsp                 # Deposit money
│   ├── WithdrawMoney.jsp           # Withdraw money
│   ├── ChangePassword.jsp          # Password change
│   ├── ClosingAccount.jsp          # Account management
│   ├── TransactionHistory.jsp      # Transaction logs
│   ├── FILES_SUMMARY.md            # JSP files documentation
│   └── INSTALLATION_GUIDE.md       # Setup instructions
├── WEB-INF/
│   └── web.xml                    # Deployment descriptor
└── README.md                       # This file
```

## Quick Start

### Prerequisites
- Java Development Kit (JDK) 8+
- Apache Tomcat 9+
- Oracle Database 11g+
- Oracle JDBC Driver (ojdbc.jar)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Dhairya-code/Online-Banking-System.git
   cd Online-Banking-System
   ```

2. **Set up the database**
   - Create Oracle database tables as per INSTALLATION_GUIDE.md
   - Insert admin credentials

3. **Configure Tomcat**
   - Copy Oracle JDBC driver to Tomcat lib folder
   - Deploy application to Tomcat webapps

4. **Start Tomcat**
   ```bash
   cd TOMCAT_HOME/bin
   ./catalina.sh start
   ```

5. **Access the application**
   ```
   http://localhost:8080/OnlineBanking/Home.jsp
   ```

## Default Credentials

**Admin Account:**
- Username: `admin`
- Password: `admin123`

**Note:** Create new user accounts from Admin Panel

## Database Schema

### Admin Table
```sql
CREATE TABLE admintable (
    username VARCHAR2(50) PRIMARY KEY,
    password VARCHAR2(50) NOT NULL
);
```

### Account Table
```sql
CREATE TABLE accounttable (
    accountnumber VARCHAR2(20) PRIMARY KEY,
    customerid VARCHAR2(20),
    pancardnumber VARCHAR2(20),
    name VARCHAR2(100),
    fathername VARCHAR2(100),
    dateofbirth DATE,
    gender VARCHAR2(10),
    address VARCHAR2(200),
    email VARCHAR2(100),
    phone VARCHAR2(15),
    balance NUMBER(15, 2),
    accounttype VARCHAR2(20),
    password VARCHAR2(50)
);
```

## Features in Detail

### Account Management
- Create new bank accounts with full details
- Update account information
- Close/delete accounts
- View all accounts (Admin only)

### Transactions
- Transfer funds between accounts
- Deposit money
- Withdraw money
- Real-time balance updates
- Transaction validation

### Security Features
- Session-based user authentication
- Password-protected access
- Admin and User roles
- SQL injection prevention
- Secure database connections

## File Documentation

For detailed information about each JSP file, refer to:
- `WebContent/FILES_SUMMARY.md` - Complete JSP files documentation
- `WebContent/INSTALLATION_GUIDE.md` - Detailed setup instructions

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Database Connection Error | Verify Oracle is running, check JDBC driver in Tomcat/lib |
| JSP Files Not Loading | Check files in WebContent folder, verify Tomcat is running |
| Port Already in Use | Change port in Tomcat server.xml or kill process on 8080 |

## Security Recommendations

⚠️ **Important:** For production use:
- Implement HTTPS/SSL encryption
- Use encrypted password storage
- Implement CSRF token validation
- Add input validation and sanitization
- Enable database connection pooling
- Implement proper session management
- Add audit logging

## Future Enhancements

- [ ] Mobile app version
- [ ] Two-factor authentication
- [ ] Advanced transaction filtering
- [ ] Scheduled transfers
- [ ] Bill payments
- [ ] Loan management
- [ ] Analytics dashboard

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for improvements.

## License

This project is open source and available under the MIT License.

## Author

Dhairya Code - BTech CSE Student

## Support

For issues, questions, or suggestions, please open an issue on GitHub or contact the project maintainer.

---

**Last Updated:** November 2025
**Version:** 1.0
