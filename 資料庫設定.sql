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
('完成專案進度50%', 'Finished', '2022-05-26 10:00:00'),
('打電話給王小姐', 'Finished', '2022-05-27 09:30:00');

INSERT INTO task (content, taskStatus) 
VALUES 
('報名活動', 'Undo'),
('列印文件', 'Undo');