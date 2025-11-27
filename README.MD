# Bertie’s Books – Web Application  
A complete Node.js + Express web application for managing Bertie’s Books.  
The system includes user authentication, session handling, book management, audit logging, database scripts, and fully styled EJS views.

---

## Project Overview  
Bertie’s Books is a fully functional web platform where users can:

- Register an account  
- Log in / log out (with session support)  
- View a list of books  
- Add, edit, and delete books  
- Search for books  
- View bargain books (under £20)  
- Access a consistent navigation system  
- Trigger audit logs on key actions  

This project was built as coursework for **Dynamic Web Applications**, demonstrating secure authentication, form handling, database integration, and professional UI/UX.

---

## Tech Stack

| Technology       | Purpose |
|------------------|---------|
| **Node.js**      | Server runtime |
| **Express.js**   | Web framework & routing |
| **EJS**          | Templating engine |
| **MySQL**        | Relational database |
| **bcryptjs**     | Password hashing |
| **express-session** | User authentication session |
| **dotenv**       | Environment variable support |
| **CSS**          | Custom styling |

---

## Project Structure  

```
06_berties_33828328/
├── routes/
│   ├── users.js
│   ├── books.js
├── views/
│   ├── users/
│   │   ├── login.ejs
│   │   ├── register.ejs
│   │   ├── loggedin.ejs
│   │   ├── login_failed.ejs
│   ├── books/
│   │   ├── list.ejs
│   │   ├── add.ejs
│   │   ├── edit.ejs
│   │   ├── search.ejs
│   ├── partials/
│   │   └── navbar.ejs (optional if using partials)
│   ├── index.ejs
├── public/
│   └── main.css
├── create_db.sql
├── insert_test_data.sql
├── index.js
├── README.md
```

---

## Installation Instructions  

### Clone the repository  
```
git clone <your-repo-url>
cd 06_berties_33828328
```

### Install dependencies  
```
npm install
```

### Configure database credentials  
The marker will set environment variables like this:

- `BB_HOST=localhost`
- `BB_USER=berties_books_app`
- `BB_PASSWORD=qwertyuiop`
- `BB_DATABASE=berties_books`

Your application reads these automatically.

### Set up the database  
Run:

```
mysql -u root -p < create_db.sql
mysql -u root -p < insert_test_data.sql
```

### 5️⃣ Run the application  
```
node index.js
```

Then open:  
**http://localhost:8000**

---

## Authentication Workflow  

### ✔ Registration  
Users can create an account with:

- First name  
- Last name  
- Email  
- Username  
- Password  

Passwords are hashed using **bcryptjs** before storage.

### ✔ Login  
The login process includes:

- Sanitisation of username and password  
- Database lookup  
- bcrypt password verification  
- Storing user session on success  
- Logging audit events  

### ✔ Logout  
Sessions are destroyed, and users return to the login page.

---

## Book Management Features  

### ✔ List Books  
Displays complete book catalogue with:

- ID  
- Name  
- Price  
- Edit/Delete buttons  

### ✔ Add Book  
Allows adding new book entries to the database.

### ✔ Edit Book  
Users can update existing books, including name and price.

### ✔ Delete Book  
Deletes a book entry — includes confirmation prompt.

### ✔ Search Books  
Search by name; results are shown in a styled table.

### ✔ Bargain Books  
Lists all books under £20.

---

##  Audit Logging  

Every key event writes to the `audit_log` table:

- Successful logins  
- Failed logins  
- Unknown usernames  
- Wrong passwords  
- Book actions  

This provides traceability and transparency.

---

## User Interface & Styling  

### Key UI Components:
- Responsive navigation bar  
- Dynamic Login/Logout button  
- Centred containers for all pages  
- Styled tables  
- Styled action buttons (`Edit`, `Delete`, `Add Book`, etc.)  
- Clean success and error pages  

### CSS Highlights:
- Flexbox-based navbar positioning  
- Button colour themes for actions  
- Table hover effects  
- Card-based page layout  

---

## Input Sanitisation

Sanitisation has been applied only to user-supplied form data that is inserted into the database or used for authentication. In the `routes/users.js` file, the following fields are sanitised before being stored or checked:
- first name  
- last name  
- email  
- username  
- password  

These fields are sanitised to prevent injection attacks and to ensure that only clean data is stored.

Sanitisation is **not applied** to route parameters such as IDs because all SQL interactions use **parameterised queries**, which protect against SQL injection. This avoids unnecessary filtering while preserving security.

---

## Testing the Website  

### Suggested test flow:
1. Register a new user  
2. Login with your credentials  
3. Add a few books  
4. Search for a book  
5. Edit a book  
6. Delete a book  
7. View bargain books  
8. Attempt wrong passwords to test audit logs  
9. Log out and verify navbar updates  

---

## Developer Notes  

- Session middleware exposes `user` to all EJS views  
- MySQL connection uses environment variables for portability  
- Database scripts guarantee predictable setup for marking  
- Buttons and layout were styled for clarity and ease of use  

---

## 👤 Author  
**Mercedes Anegbeh**  
Third-Year Computer Science Student  
Dynamic Web Applications Coursework – Bertie’s Books

