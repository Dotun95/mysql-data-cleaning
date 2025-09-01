# Standardizing data

# finding issues in your data and fixing it

# use the trim() function to get rid of unncessary spaces

select company, trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

# some industry field have crypto while some have crypto currency, so we are going to make all of them to be just "crypto"

select *
from layoffs_staging2
where industry like 'crypto%';

update layoffs_staging2
set industry = 'crypto'
where industry like 'crypto%';

# confirm changes have been made

select distinct industry
from layoffs_staging2;

# onto the next column

select distinct country
from layoffs_staging2;

# noticed a full stop after united states; need to remove it

select distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'united states%';

# check to confirm updates have been made

select distinct country
from layoffs_staging2;

# onto the next

select * 
from layoffs_staging2;

# change the date format

select `date`,
str_to_date(`date`, '%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');

#check to confirm updates have been made

select `date`
from layoffs_staging2;

# change the date type from text to date

alter table layoffs_staging2
modify column `date` date;

select *
from layoffs_staging2

