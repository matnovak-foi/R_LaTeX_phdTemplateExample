# R_LaTeX_phdTemplateExample

The template is based on the forked project avalible at: https://github.com/matnovak-foi/unizgdoktoratljuska and the original is here: https://github.com/iugrina/unizgdoktoratljuska. 

R_LaTeX_phdTemplateExample (Version 1.0), Copyright (c) 2019 Matija Novak (matnovak@foi.hr).

R_LaTeX_phdTemplateExample is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

R_LaTeX_phdTemplateExample is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with R_LaTeX_phdTemplateExample.  If not, see <https://www.gnu.org/licenses/>.

This project represents a template for phd thesis at Faculty of Organization and Informatics, University of Zagreb.

The template contais R scripts, Rnw swave files were used to generate the phd thesis entitled "Effect of source-code preprocessing techniquers on plagiarsim detection accuracy in 
student programming assignments". The starting point is the main.Rnw which includes tex, Rnw and R files. The build will generate main.tex and then run LaTeX to build the main.tex file and genreate the main.pdf.

Please note:

1. The template contais dummy data in xmlx files wich are not correct data and should only be used as an example how to build Rnw files and generate images, tables and LaTeX code form R swave. 

2. When the code is compiled it generates the LaTeX code wich is avalible in main.tex and other tex files. 

3. Main.pdf is the final version of the document once LaTeX code is built.

4. The project uses the project R_ReviewPlagiarsimDetection from which it uses the ExampleReviewExcel.xmlx as well some other R scripts to genreate some images. The path to ReviewPlagiarsimDetection shoud in chapter_headers.R be configured. 

5. The project also uses the R_UtilityFunctions project which needs to be installed as R library, before it can be used.

File Model-based-bootstrapped-ANOVA.R taken from https://gist.github.com/smancuso/bf6bba3e3e6e3c17c940cda9eb869163 no license given.

License for WilcoxRallfun-v35.R:
#License: USC-RL v1.0
#The Software is made available for academic or non-commercial purposes only. The license is for 
#a copy of the program for an unlimited term. Individuals requesting a license for commercial use must pay for a commercial license.
# USC Stevens Institute for Innovation University of Southern California
#1150 S. Olive Street, Suite 2300
#Los Angeles, CA 90115, USA
#ATTN: Accounting
#DISCLAIMER.  USC MAKES NO EXPRESS OR IMPLIED WARRANTIES, EITHER IN FACT OR BY 
#OPERATION OF LAW, BY STATUTE OR OTHERWISE, AND USC SPECIFICALLY AND EXPRESSLY 
#DISCLAIMS ANY EXPRESS OR IMPLIED WARRANTY OF MERCHANTABILITY OR FITNESS FOR A 
#PARTICULAR PURPOSE, VALIDITY OF THE SOFTWARE OR ANY OTHER INTELLECTUAL PROPERTY 
#RIGHTS OR NON-INFRINGEMENT OF THE INTELLECTUAL PROPERTY OR OTHER RIGHTS OF ANY 
#THIRD PARTY. SOFTWARE IS MADE AVAILABLE AS-IS.
#LIMITATION OF LIABILITY.  TO THE MAXIMUM EXTENT PERMITTED BY LAW, IN NO EVENT WILL 
#USC BE LIABLE TO ANY USER OF THIS CODE FOR ANY INCIDENTAL, CONSEQUENTIAL, EXEMPLARY 
#OR PUNITIVE DAMAGES OF ANY KIND, LOST GOODWILL, LOST PROFITS, LOST BUSINESS AND/OR 
#ANY INDIRECT ECONOMIC DAMAGES WHATSOEVER, REGARDLESS OF WHETHER SUCH DAMAGES 
#ARISE FROM CLAIMS BASED UPON CONTRACT, NEGLIGENCE, TORT (INCLUDING STRICT LIABILITY 
#OR OTHER LEGAL THEORY), A BREACH OF ANY WARRANTY OR TERM OF THIS AGREEMENT, AND 
#REGARDLESS OF WHETHER USC WAS ADVISED OR HAD REASON TO KNOW OF THE POSSIBILITY OF 
#INCURRING SUCH DAMAGES IN ADVANCE.
#For commercial license pricing and annual commercial update and support pricing, please 
#contact:
#<Licensing Associate Name>
#USC Stevens Institute for Innovation
#University of Southern California
#1150 S. Olive Street, Suite 2300
#Los Angeles, CA 90015, USA
#Tel: <Licensing Associate phone number>
#Fax: +1 213-821-5001
#Email: 
#<Licensing Associate Email> 
#and cc to: 
#accounting@stevens.usc.edu
