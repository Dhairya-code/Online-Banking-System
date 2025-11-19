# Online Banking System - Installation Guide

## Prerequisites

1. **Java Development Kit (JDK)** - Version 8 or higher
2. **Apache Tomcat** - Version 9 or higher
3. **Oracle Database** - Version 11g or higher
4. **Oracle JDBC Driver** - ojdbc.jar

## Step 1: Database Setup

### Create Oracle Database Connection

```sql
-- Connect as system user
CONNECT system/123@xe;

-- Create Admin Table
CREATE TABLE admintable (
    username VARCHAR2(50) PRIMARY KEY,
    password VARCHAR2(50) NOT NULL
);

-- Create Account Table
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

-- Insert Sample Admin Account
INSERT INTO admintable (username, password) VALUES ('admin', 'admin123');
COMMIT;
```

## Step 2: Tomcat Configuration

1. Download Apache Tomcat from https://tomcat.apache.org/
2. Extract Tomcat to your preferred location
3. Copy `ojdbc.jar` to `TOMCAT_HOME/lib/`
4. Configure Tomcat port (default: 8080) in `TOMCAT_HOME/conf/server.xml`

## Step 3: Project Deployment

1. Copy project folder to `TOMCAT_HOME/webapps/`
2. Rename project folder to desired name (e.g., `OnlineBanking`)
3. Ensure WebContent folder contains all JSP files

## Step 4: Configure Database Connection

Update database connection details in each JSP file:

```java
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe", 
    "system", 
    "123"
);
```

## Step 5: Start Tomcat

### On Windows:
```batch
cd TOMCAT_HOME\bin
catalina.bat start
```

### On Linux/Mac:
```bash
cd TOMCAT_HOME/bin
./catalina.sh start
```

## Step 6: Access Application

Open your web browser and navigate to:
```
http://localhost:8080/OnlineBanking/Home.jsp
```

## Default Login Credentials

**Admin Login:**
- Username: admin
- Password: admin123

**User Login:**
Create new accounts from the Admin Panel

## Project Structure

```
OnlineBanking/
├── WebContent/
│   ├── Home.jsp
│   ├── Admin.jsp
│   ├── UserLogin.jsp
│   ├── UserDashboard.jsp
│   ├── AdminPanel.jsp
│   ├── NewAccount.jsp
│   ├── CheckBalance.jsp
│   ├── MoneyTransfer.jsp
│   ├── Deposit.jsp
│   ├── WithdrawMoney.jsp
│   ├── ChangePasswordUser.jsp
│   ├── ChangePasswordAdmin.jsp
│   ├── ClosingAccount.jsp
│   ├── TransactionHistory.jsp
│   ├── style.css
│   └── images/
│       └── logo13.png
├── WEB-INF/
│   └── web.xml
└── README.md
```

## Troubleshooting

### Database Connection Error
- Verify Oracle is running
- Check JDBC driver is in Tomcat lib folder
- Verify database username and password
- Check database connection string format

### JSP Files Not Loading
- Ensure files are in WebContent folder
- Check file permissions
- Verify Tomcat is running
- Check Tomcat logs for errors

### Port Already in Use
- Change Tomcat port in server.xml
- Kill process using port 8080

## Security Notes

- Always use encrypted passwords in production
- Implement HTTPS for secure communication
- Use parameterized queries to prevent SQL injection
- Implement proper session management
- Add CSRF token validation

## Support

For issues or questions, refer to FILES_SUMMARY.md for detailed file documentation.
