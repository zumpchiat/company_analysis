DROP DATABASE IF EXISTS company;
CREATE DATABASE company;

USE `company`;

CREATE TABLE employee (
  Fname varchar(15) NOT NULL,
  Minit char,
  Lname varchar(15) NOT NULL,
  Ssn char(9) NOT NULL PRIMARY KEY,
  Bdate date,
  Address varchar(30),
  Sex char,
  Salary decimal(10,2) CHECK (Salary > 2000.0),
  Super_ssn char(9),
  Dno int NOT NULL DEFAULT 1,
  CONSTRAINT fk_employee FOREIGN KEY (Super_ssn) REFERENCES employee(Ssn)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);


CREATE TABLE departament (
   Dname varchar(15) NOT NULL,
   Dnumber int NOT NULL PRIMARY KEY,
   Mgr_ssn char(9) NOT NULL,
   Mgr_start_date date,
   Dept_create_date date,
   CONSTRAINT fk_dept FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn) ON UPDATE CASCADE,
   CONSTRAINT chk_dates CHECK (Dept_create_date < Mgr_start_date)
);

CREATE TABLE dept_locations (
  Dnumber int NOT NULL,
  Dlocation varchar(15) NOT NULL,
  PRIMARY KEY (Dnumber, Dlocation),
  CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE project (
  projectid int auto_increment ,
  Pname varchar(15) NOT NULL,
  Pnumber int NOT NULL ,
  Plocation varchar(15),
  Dnum int NOT NULL,
  PRIMARY KEY (projectid, Pnumber),
  CONSTRAINT unique_project UNIQUE (Pname),
   CONSTRAINT unique_projectid UNIQUE (projectid),
  CONSTRAINT fk_project FOREIGN KEY (Dnum) REFERENCES departament(Dnumber)
);

ALTER TABLE project
ADD UNIQUE (Pnumber);

-- Criando a tabela works_on
CREATE TABLE works_on (
  Essn char(9) NOT NULL,
  Pno int NOT NULL,
  Hours decimal(3,1) NOT NULL,
  PRIMARY KEY (Essn, Pno),
  CONSTRAINT fk_employee_works_on FOREIGN KEY (Essn) REFERENCES employee(Ssn),
  CONSTRAINT fk_project_works_on FOREIGN KEY (Pno) REFERENCES project(projectid)
);

CREATE TABLE dependent (
  Essn char(9) NOT NULL,
  Dependent_name varchar(15) NOT NULL,
  Sex char,
  Bdate date,
  Relationship varchar(8),
  PRIMARY KEY (Essn, Dependent_name),
  CONSTRAINT fk_dependent FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);

ALTER TABLE employee MODIFY Super_ssn char(9); 
ALTER TABLE employee MODIFY Super_ssn char(9); 

USE `company`;

INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) VALUES 
('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1),
('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 888665555, 5),
('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, 888665555, 4),
('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, 333445555, 5),
('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 333445555, 5),
('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 333445555, 5),
('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 987654321, 4),
('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 987654321, 4);

desc dependent;

insert into dependent values (333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
							 (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
                             (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
                             (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
                             (123456789, 'Michael', 'M', '1988-01-04', 'Son'),
                             (123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
                             (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');

insert into departament values ('Research', 5, 333445555, '1988-05-22','1986-05-22'),
							   ('Administration', 4, 987654321, '1995-01-01','1994-01-01'),
                               ('Headquarters', 1, 888665555,'1981-06-19','1980-06-19');

insert into dept_locations values (1, 'Houston'),
								 (4, 'Stafford'),
                                 (5, 'Bellaire'),
                                 (5, 'Sugarland'),
                                 (5, 'Houston');

INSERT INTO project (Pname, Pnumber, Plocation, Dnum) VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);


INSERT INTO works_on (Essn, Pno, Hours) VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('666884444', 3, 40.0),
('453453453', 1, 20.0),
('453453453', 2, 20.0),
('333445555', 2, 10.0),
('999887777', 4, 30.0),
('987987987', 4, 35.0),
('987987987', 3, 5.0),
('987654321', 3, 20.0),
('987654321', 2, 15.0),
('888665555', 2, 0.0);