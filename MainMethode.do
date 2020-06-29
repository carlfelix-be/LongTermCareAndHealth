/*
Description:
// 	this do-file invokes subsequent do-file to merge: OECD, Eurostat and SHARE Datasets found in /workspace/dta/in
	invokes subsequent do-file to run regression analysis on data
	invokes subsequent do-file to save data output
	
Run instructions:
	first run: 	modify directory line :	29
				run /workspace/do/setupWorkspace.do		line : 33


Acknowledgments:

	this dofile and the subsequent dofiles it envokes use in part code written by:
		Cristoph Wolf and Merih Ates as student guidelines for the Seminar "empirisches Forschungspraktikum II"
		Behaghel, Langer & Müller for a paper submited in the seminar "empirisches Forschungspraktikum II"
		Nicolas J. Cox posted on statalist.org
		
	The analytical strategie for this research was in part supervised by / discused with Danny Khoi On and Hartmut Lanzinger
	
	I would like to extend special thanks to Danny Khoi On and Hartmut Lanzinger


*/
clear
set more off

capture log close
cd "/Users/carlfelix/Documents/Uni/Bachelor-Arbeit/Data/Stata/workspace" //modify to your current working driectory here 

// setup workspace

//do "do/setupWorkspace.do"

// prepare data
//

// macro
do "do/Macro-Methode.do"

// micro
/*
do W1-Methode.do
do W2-Methode.do
do W3-Methode.do
do W4-Methode.do

To run drag sharew5_rel7-0-0_ALL_datasets_stata - sharew7_rel7-0-0_ALL_datasets_stata
to "/workspace/dta/in/"

do "do/W5-Methode.do"
do "do/W6-Methode.do"
do "do/W7-Methode.do"
*/

//Main Analysis A : Panel regression - micro level
//
log using "doc/PanelRegressionA.smcl", replace

clear

do "do/prepPanelDataA.do"

do "do/PanalAnalysisA.do"

log c

//Main Analysis B : Panel regression - macro level
//
log using "doc/PanelRegressionB.smcl", replace

clear

do "do/prepPanelDataB.do"

do "do/PanelAnalysisB.do"

log c
