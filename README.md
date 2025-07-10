🛒 Online Shopping E-Shop (E-Commerce Website)
A Complete E-Commerce Platform for Selling Electronics Online

📌 About the Project
The E-Shop is a full-featured e-commerce website built to sell electronic products online. It demonstrates how a real-world online store like Amazon or Flipkart works, both on the customer side and the admin side.

Key Features for Users:

Visit & Browse: Customers can visit the website without logging in to explore products.

Register & Login: New users can create an account; returning users can log in securely.

Product Search & Filter: Browse all products and filter them by categories to find exactly what they need.

Shopping Cart: Add multiple items to the cart, update quantities, or remove items.

Secure Checkout (Demo): Proceed to checkout and enter payment details. (Note: Payment is for demo only — any card details will be accepted.)

Order Tracking: After placing an order, users can view their order details and check the shipping status.

Key Features for Admin:

Product Management: Add, update, or remove products from the store.

Inventory Control: Manage stock levels to ensure availability.

Order Management: View all orders placed, update shipping status, and mark items as shipped or delivered.

Customer Notifications: Keep customers informed through email alerts for registration, orders, and shipping updates.

✉️ Automated Email Notifications
One of the standout features is its built-in mailing system:

✅ Successful user registration confirmation

✅ Order placement confirmation

✅ Product back-in-stock notification

✅ Shipment and delivery updates

Note: Never share your generated app password to keep your account secure.

💻 Technologies Used
Frontend:

HTML

CSS

JavaScript

Bootstrap

Backend:

Java (JDK 8+)

JDBC

Servlet

JSP

Database:

MySQL

🧰 Software & Tools Required
Git

Java JDK 8+

Eclipse EE (Enterprise Edition)

Apache Maven

Tomcat Server (v8.0+)

MySQL Server & MySQL Workbench

🗂️ Dummy Database Initialization
1️⃣ Open MySQL Command Prompt or MySQL Workbench
2️⃣ Login:

bash
Copy
Edit
mysql -u <username> -p
3️⃣ Run the SQL Script:
Execute the queries from databases/mysql_query.sql to initialize your database.

🔑 Setup Mailing Functionality (Gmail App Password)
Sign in or create a Gmail account.

Visit Google Account Security and enable 2-Step Verification.

Go to App Passwords and verify your account.

Choose Other (Custom Name) → Enter E-Shop → Click Generate.

Copy the 16-digit app password and keep it safe for configuration.

Use this password (not your actual Gmail password) in your project settings.

⚙️ Importing & Running the Project in Eclipse EE
1️⃣ Open Eclipse Enterprise Edition (install if you don’t have it).
2️⃣ Import Project:

File → Import → Git → Projects from Git → Clone URI

Paste: https://github.com/Devpathak75/devs-E-shop.git

Select the master branch → Next → Finish

3️⃣ Configure Application Properties:

Go to Java Resources > src > application.properties

Set:

db.username & db.password → your MySQL credentials

mailer.email & mailer.password → your Gmail & generated app password

4️⃣ Build the Project:

Right-click the project → Run As → Maven Build

Enter clean install in goals → Apply → Run

5️⃣ Fix Build Path (if needed):

Right-click the project → Build Path → Configure Build Path → Libraries

Remove/update any red-marked libraries → Finish

6️⃣ Update Project:

Right-click → Maven → Update Project → Select Force Update → Apply → Close

7️⃣ Configure Tomcat Server:

If not configured:

Right-click the project → Run As → Run on Server → Define New Server → Select Tomcat v8.0+ → Add Project → Finish

If already configured:

Right-click → Run As → Run on Server → Select Tomcat Version → Next → Add Project → Finish

Or use the Servers tab to start/stop/debug your server.

8️⃣ Run Your Site:

Visit: http://localhost:8080/shopping-cart/

9️⃣ If Port Conflict:

Go to Server tab → Double-click Tomcat → Ports → Change HTTP/1.1 to 8083 → Save → Restart

Access: http://localhost:8083/shopping-cart/

🔐 Default Admin Login:

Username: dev@gmail.com

Password: dev

✨ Developed by:
Dev Deepak Pathak
