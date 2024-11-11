// i forgot to uploud it here
create INDEX idx_countries_name on countries(name);

create INDEX idx_employees_name_surname on employees(name, surname);

create unique INDEX idx_employees_salary_range on employees(salary);

create INDEX idx_employees_name_substring on employees((substring(name from 1 for 4)));

create INDEX idx_employees_departments_budget_salary on employees(department_id);
create INDEX idx_departments_budget on departments(budget);
