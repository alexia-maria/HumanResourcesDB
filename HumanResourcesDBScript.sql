CREATE TABLE Departments (
    department_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL
);

INSERT INTO Departments(department_id, name) VALUES (1, 'IT');
INSERT INTO Departments(department_id, name) VALUES (2, 'HR');
INSERT INTO Departments(department_id, name) VALUES (3, 'Finance');
INSERT INTO Departments(department_id, name) VALUES (4, 'Marketing');
INSERT INTO Departments(department_id, name) VALUES (5, 'Sales');

CREATE TABLE Employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    department_id NUMBER,
    role VARCHAR2(50) CHECK (role IN ('Employee', 'Project Manager', 'HR Admin')),
    salary NUMBER(10,2),
    hire_date DATE DEFAULT SYSDATE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

select * from employees;


INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (1, 'John', 'Doe', 1, 'Employee', 50000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (2, 'Jane', 'Smith', 2, 'Project Manager', 70000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (3, 'Alice', 'Brown', 3, 'HR Admin', 80000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (4, 'Samantha', 'Waller', 1, 'Employee', 50000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (5, 'Gordon', 'Robbins', 2, 'Employee', 55000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (6, 'Lewis', 'Cunningham', 3, 'Employee', 40000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (7, 'Joan', 'Maxwell', 1, 'Employee', 55000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (8, 'Traci', 'Douglas', 2, 'Employee', 65000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (9, 'Gale', 'Hart', 3, 'Employee', 70000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (10, 'Dean', 'Kelley', 2, 'Employee', 75000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (11, 'Kathleen', 'Moran', 4, 'Employee', 50000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (12, 'Joel', 'Hardy', 4, 'Employee', 60000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (13, 'Erika', 'Betts', 5, 'Employee', 55000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (14, 'Mo', 'Nixon', 3, 'Employee', 55000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (15, 'Rowena', 'Watts', 4, 'Employee', 65000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (16, 'Narinder', 'Barrat', 5, 'Employee', 70000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (17, 'Tony', 'Langford', 5, 'Employee', 50000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (18, 'Erika', 'Betts', 5, 'Employee', 80000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (19, 'Charles', 'Norman', 1, 'Project Manager', 70000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (20, 'Amber', 'Hudson', 3, 'Project Manager', 80000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (21, 'Rebekah', 'McCann', 2, 'Project Manager', 90000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (22, 'Stan', 'Knight', 4, 'Project Manager', 75000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (23, 'Ada', 'Green', 5, 'Project Manager', 80000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (24, 'Melissa', 'Randall', 3, 'HR Admin', 80000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (25, 'Hope', 'Conelly', 3, 'HR Admin', 85000, SYSDATE);
INSERT INTO Employees(employee_id, first_name, last_name, department_id, role, salary, hire_date) VALUES (26, 'Jerome', 'Roe', 3, 'HR Admin', 80000, SYSDATE);

-- USER ROLES
CREATE ROLE employee_role;
CREATE ROLE project_manager_role;
CREATE ROLE hr_admin_role;

SELECT * FROM departments;

-- GRANTS FOR EMPLOYEES
GRANT SELECT ON Employees TO employee_role;

-- GRANTS FOR PROJECT MANAGERS
GRANT SELECT, UPDATE(salary) ON Employees TO project_manager_role;
grant select on departments to project_manager_role;

-- GRANTS FOR HR ADMINS
GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO hr_admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Departments TO hr_admin_role;

-- CREATING USERS AND GRANTING THEM ROLES
CREATE USER emp1 IDENTIFIED BY password;
GRANT employee_role TO emp1;

CREATE USER pm1 IDENTIFIED BY password;
GRANT project_manager_role TO pm1;

CREATE USER hr1 IDENTIFIED BY password;
GRANT hr_admin_role TO hr1;


-- Trigger for auditing salary modifications

CREATE TABLE Salary_Audit (
    audit_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id NUMBER,
    old_salary NUMBER(10,2),
    new_salary NUMBER(10,2),
    changed_by VARCHAR2(50),
    change_date TIMESTAMP DEFAULT SYSTIMESTAMP
);


CREATE OR REPLACE TRIGGER trg_salary_audit
BEFORE UPDATE OF salary ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Salary_Audit (employee_id, old_salary, new_salary, changed_by)
    VALUES (:OLD.employee_id, :OLD.salary, :NEW.salary, USER);
END;
/


-- Modifying the salary to test the trigger

UPDATE Employees SET salary = salary * 1.10 WHERE employee_id = 1;

SELECT * FROM Salary_Audit;



-- Procedure to promote an employee

CREATE OR REPLACE PROCEDURE Promote_Employee (
    p_employee_id NUMBER,
    p_new_role VARCHAR2,
    p_salary_increase NUMBER
) AS
BEGIN
    UPDATE Employees
    SET role = p_new_role,
        salary = salary * (1 + p_salary_increase / 100)
    WHERE employee_id = p_employee_id;
END;
/

-- Promoting an employee to test the procedure

EXEC Promote_Employee(1, 'Project Manager', 10);
SELECT * FROM Employees WHERE employee_id = 1;


-- Functionthat calculates the average salary in a department

CREATE OR REPLACE FUNCTION Get_Avg_Salary (p_department_id NUMBER)
RETURN NUMBER IS
    v_avg_salary NUMBER(10,2);
BEGIN
    SELECT AVG(salary) INTO v_avg_salary
    FROM Employees
    WHERE department_id = p_department_id;

    RETURN v_avg_salary;
END;
/

-- Testing the function

SELECT Get_Avg_Salary(1) FROM dual;


-- Pachage that list all the employees from a department

CREATE OR REPLACE PACKAGE HR_Report AS
    PROCEDURE List_Employees_By_Department(p_department_id NUMBER);
END HR_Report;
/

CREATE OR REPLACE PACKAGE BODY HR_Report AS
    PROCEDURE List_Employees_By_Department(p_department_id NUMBER) IS
        CURSOR emp_cursor IS 
            SELECT first_name, last_name, role, salary 
            FROM Employees 
            WHERE department_id = p_department_id;
        v_emp emp_cursor%ROWTYPE;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Employees in Department ID: ' || p_department_id);
        FOR v_emp IN emp_cursor LOOP
            DBMS_OUTPUT.PUT_LINE(v_emp.first_name || ' ' || v_emp.last_name || 
                                 ' - ' || v_emp.role || ' - $' || v_emp.salary);
        END LOOP;
    END List_Employees_By_Department;
END HR_Report;
/


-- Testing the package

SET SERVEROUTPUT ON;
EXEC HR_Report.List_Employees_By_Department(1);





