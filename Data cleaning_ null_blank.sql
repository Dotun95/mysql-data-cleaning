# looking at null values and blank values

select * 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null; 

# industry column has some missing values

select *
from layoffs_staging2
where industry is null
or industry = '';

select *
from layoffs_staging2
where company = 'Airbnb';

# set blanks to null

update layoffs_staging2
set industry = null
where industry ='';


select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
where (t1.industry is null or t1.industry ='')
and t2.industry is not null;

update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry is null )
and t2.industry is not null;

#check if any other industry still has null

select *
from layoffs_staging2
where industry is null
or industry ='';

