-- Create Database
CREATE DATABASE RecipeDatabase;
USE RecipeDatabase;

-- Create Ingredients Table
CREATE TABLE Ingredients (
    ingredient_id INT PRIMARY KEY,
    ingredient_name VARCHAR(255),
    calories_per_unit FLOAT,
    protein_per_unit FLOAT,
    carbs_per_unit FLOAT,
    fat_per_unit FLOAT,
    unit_of_measure VARCHAR(50), -- New field for unit of measure
    quantity FLOAT -- New field for quantity
);

-- Create Recipes Table
CREATE TABLE Recipes (
    recipe_id INT PRIMARY KEY,
    recipe_name VARCHAR(255),
    total_time INT,
    source VARCHAR(255),
    servings INT -- New field for servings
);

-- Create Instructions Table
CREATE TABLE Instructions (
    instruction_id INT PRIMARY KEY,
    recipe_id INT FOREIGN KEY REFERENCES Recipes(recipe_id),
    step_number INT,
    instruction_text TEXT
);

-- Create RecipeIngredients Table
CREATE TABLE RecipeIngredients (
    recipe_id INT FOREIGN KEY REFERENCES Recipes(recipe_id),
    ingredient_id INT FOREIGN KEY REFERENCES Ingredients(ingredient_id),
    quantity FLOAT,
    notes VARCHAR(255),
    unit_of_measure VARCHAR(50) -- New field for unit of measure
);

-- Create InstructionIngredients Table
CREATE TABLE InstructionIngredients (
    instruction_id INT FOREIGN KEY REFERENCES Instructions(instruction_id),
    ingredient_id INT FOREIGN KEY REFERENCES Ingredients(ingredient_id),
    quantity FLOAT,
    notes VARCHAR(255),
    unit_of_measure VARCHAR(50) -- New field for unit of measure
);

-- Create MealPlans Table
CREATE TABLE MealPlans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(255),
    meal_date DATE, -- Use a single date
    recipe_id INT FOREIGN KEY REFERENCES Recipes(recipe_id),
    servings_planned INT
);

-- Create PlannedMeals Table
CREATE TABLE PlannedMeals (
    plan_id INT FOREIGN KEY REFERENCES MealPlans(plan_id),
    recipe_id INT FOREIGN KEY REFERENCES Recipes(recipe_id),
    servings_planned INT
);
