# Data cleaning

# 1) Remove duplicates if any
# 2) Standadize the data
# 3) Null values or blank values
# 4) Remove columns/rows that aren't necessary

# first step is to replicate the table you want to work on in order to preserve the original table incase of any mistake

create table layoffs_staging
like layoffs;

select * 
from layoffs_staging;

insert layoffs_staging
select *
from layoffs;

# Removing duplicates

select*,
row_number() over (
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging;

with duplicate_cte as
(
select*,
row_number() over (
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging
)

select * 
from duplicate_cte
where row_num > 1;

# To confirm the results are duplicate, take one and check

select *
from layoffs_staging
where company = 'Hibob';

# Next step is to delete the duplicates

# create a new table called 'layoffs_staging2' and add a new column called 'row_num'


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



select* 
from layoffs_staging2;

insert into layoffs_staging2 
select*,
row_number() over (
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging;

select* 
from layoffs_staging2
where row_num > 1;

#Delete duplicates

#SET SQL_SAFE_UPDATES = 0;
delete 
from layoffs_staging2
where row_num > 1;

# check to confirm that they have been deleted

select* 
from layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2;






