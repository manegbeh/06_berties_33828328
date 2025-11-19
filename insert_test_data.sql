# Insert data into the tables

USE berties_books;

INSERT INTO books (name, price)VALUES('Brighton Rock', 20.25),('Brave New World', 25.00), ('Animal Farm', 12.99) ;

INSERT INTO users (username, first, last, email, hashedPassword)
VALUES ('gold', 'Gold', 'User', 'gold@example.com', '$2b$12$Ct2d7EGeqJSFrLZ0oHZqZeiY4W5SgrA8J7ov3wPjY/n82QgWJ9uxG');