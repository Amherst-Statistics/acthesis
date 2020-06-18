# Files

## man
Description documents generated automatically by Roxygen. Do not edit.

## R

* *thesis.R*: This is a function called in output in the YAML of the driver Rmd file to specify using the Amherst College Senior Thesis LaTeX template and cls files. Allows changes to default R code chunk settings.
* *acthesis.R*: Null (package name)

## inst/rmarkdown/templates
* *template.yaml:* Provides name and description of thesis template file

### ./skeleton
* *amherstthesis.cls* 
* *\_bookdown.yml*
* *template.tex*
* *skeleton.Rmd*: default index file
    - Make sure thesis guidelines url is up to date
    - Make sure thesis cover sheet url is up to date
* *00--99 chapter.Rmd files*: instructions on how to use each chapter document and features of working in RMarkdown

#### ./skeleton/csl
* *apa.csl* APA bibliography style file

#### ./skeleton/bib
* *thesis.bib* demo bibliography file


#### ./skeleton/data
* *flights.csv* demo data file

#### ./skeleton/figures
* *amherst.png* demo figure (amherst logo)
* *subdivision.pdf* demo figure 


## comps\_example
Used to test acstats-thesis package

1. Delete folder
2. Build package and install
3. Create new RMarkdown file from template
4. Select AC Statistics Thesis from menu
5. Name folder *comps_example*







