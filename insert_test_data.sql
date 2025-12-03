USE berties_books;

INSERT INTO users (username, first, last, email, hashedPassword) VALUES
('admin', 'Admin', 'User', 'admin@example.com', '$2a$10$Y6GS4oQXU1wFv1Qz.1YzrOMQe1tPq6JQGQb5JMh03O5yRpvUndo1u'); 
-- password is "password"

INSERT INTO books (title, author, price) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 12.99),
('1984', 'George Orwell', 9.99),
('Pride and Prejudice', 'Jane Austen', 7.50),
('The Hobbit', 'J.R.R. Tolkien', 15.49);

INSERT INTO audit (action) VALUES
('Initial system setup');