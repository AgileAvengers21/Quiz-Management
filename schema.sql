CREATE DATABASE quizDB;
use quizDB;

CREATE TABLE AdminTable ( 
    userid VARCHAR(20) PRIMARY KEY ,
    password VARCHAR(20) not null 
);

INSERT INTO AdminTable VALUES('admin', 'admin');

CREATE TABLE StudentTable (
    userid VARCHAR(20) PRIMARY KEY ,
    password VARCHAR(20) not null,
    name VARCHAR(20) not null 
);

CREATE TABLE InstructionTable (
    instruction VARCHAR(35)
);

CREATE TABLE QuestionTable (
    question VARCHAR(40),
    a VARCHAR(40),
    b VARCHAR(40),
    c VARCHAR(40),
    d VARCHAR(40),
    answer VARCHAR(20)
);






