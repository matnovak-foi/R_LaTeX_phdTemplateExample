# R_LaTeX_phdTemplateExample

R_LaTeX_phdTemplateExample (Version 1.0), Copyright (c) 2019 Matija Novak (matnovak@foi.hr).

R_LaTeX_phdTemplateExample is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Foobar is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Foobar.  If not, see <https://www.gnu.org/licenses/>.

This project represents a template for phd thesis at Faculty of Organization and Informatics, University of Zagreb.

The template contais R scripts, Rnw swave files were used to generate the phd thesis entitled "Effect of source-code preprocessing techniquers on plagiarsim detection accuracy in 
student programming assignments". The starting point is the main.Rnw which includes tex, Rnw and R files. The build will generate main.tex and then run LaTeX to build the main.tex file and genreate the main.pdf.

Please note:

1. The template contais dummy data in xmlx files wich are not correct data and should only be used as an example how to build Rnw files and generate images, tables and LaTeX code form R swave. 

2. When the code is compiled it generates the LaTeX code wich is avalible in main.tex and other tex files. 

3. Main.pdf is the final version of the document once LaTeX code is built.

4. The project uses the project R_ReviewPlagiarsimDetection from which it uses the ExampleReviewExcel.xmlx as well some other R scripts to genreate some images. The path to ReviewPlagiarsimDetection shoud in chapter_headers.R be configured. 

5. The project also uses the R_UtilityFunctions project which needs to be installed as R library, before it can be used.
