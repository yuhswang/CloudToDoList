--CREATE DATABASE cloudService;

USE cloudService;

CREATE TABLE task (
	id INT NOT NULL IDENTITY(1,1),
	content NVARCHAR(50) NOT NULL,
	taskStatus NVARCHAR(20) NOT NULL,
	finishedTime DATETIME2
);

INSERT INTO task (content, taskStatus, finishedTime) 
VALUES 
('�����M�׶i��50%', 'Finished', '2022-05-26 10:00:00'),
('���q�ܵ����p�j', 'Finished', '2022-05-27 09:30:00');

INSERT INTO task (content, taskStatus) 
VALUES 
('���W����', 'Undo'),
('�C�L���', 'Undo');