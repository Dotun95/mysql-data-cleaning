# Remove Unnecessary columns and rows


select * 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null; 

# SET SQL_SAFE_UPDATES = 0;
delete 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null; 


select *
from layoffs_staging2;

# the row_num column was created to find duplicates and as such it is no longer needed therefore we have to drop it

alter table layoffs_staging2
drop column row_num;

#Check to confirm column has been dropped

select *
from layoffs_staging2;


