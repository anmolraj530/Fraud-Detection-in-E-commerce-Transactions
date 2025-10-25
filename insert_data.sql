INSERT INTO users VALUES
(1, 'John', 'India', '2024-01-10', 'Mobile'),
(2, 'Amit', 'India', '2024-02-20', 'Desktop'),
(3, 'Sara', 'USA', '2024-03-05', 'Tablet'),
(4, 'David', 'UK', '2024-04-10', 'Mobile'),
(5, 'Sneha', 'India', '2024-05-15', 'Desktop');

INSERT INTO transactions VALUES
(101, 1, 5000, 'Credit Card', '2024-05-12 10:00:00', 'Success'),
(102, 1, 7000, 'Debit Card', '2024-05-13 09:00:00', 'Refunded'),
(103, 2, 15000, 'UPI', '2024-05-14 11:30:00', 'Success'),
(104, 3, 1000, 'Credit Card', '2024-05-14 12:00:00', 'Failed'),
(105, 4, 3000, 'UPI', '2024-05-15 08:45:00', 'Refunded'),
(106, 5, 20000, 'Credit Card', '2024-05-16 14:00:00', 'Success');

INSERT INTO login_activity VALUES
(201, 1, '2024-05-10 08:00:00', '192.168.1.10', 'Mobile'),
(202, 2, '2024-05-10 08:05:00', '192.168.1.10', 'Desktop'),
(203, 3, '2024-05-11 09:00:00', '10.0.0.15', 'Tablet'),
(204, 4, '2024-05-12 10:00:00', '192.168.1.15', 'Mobile'),
(205, 5, '2024-05-13 11:00:00', '10.0.0.25', 'Desktop');

INSERT INTO refunds VALUES
(301, 102, 'Product not received', 7000, '2024-05-17'),
(302, 105, 'Defective item', 3000, '2024-05-18');
