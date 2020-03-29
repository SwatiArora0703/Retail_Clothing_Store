/* IMPORT THE DATA FROM THE CSV TO LOCAL SAS LIBRARY MYSASLIB
  USE DBMS OPTION AS CSV AND REPLACE IF DATASET WITH SAME NAME EXISTS
*/
PROC IMPORT OUT=MYSASLIB.Retail_Clothing_Store
	DATAFILE='/folders/myfolders/SASUSER.v94/clothing_store_mod8.csv'
	DBMS=CSV REPLACE;
	*GET THE VARIABLE NAMES FROM THE CSV File;
	GETNAMES=YES;
	* DIRECT TO SAS THAT THE DATA STARTS AT ROW NO 2 IN EXCEL;
	DATAROW=2;
RUN;

/* CALCULATING THE MEANS USING THE PROC MEANS CODE 
*/
PROC MEANS DATA = MYSASLIB.RETAIL_CLOTHING_STORE;
	* SET TITLE FOR THE OUTPUT RESULTS;
	TITLE 'MEANS ON ALL THE VARIABLES';
RUN;


/* MULTIPLE LINEAR REGRESSION BETWEEN SALES AND OTHER ADV VARIABLES
*/
PROC REG DATA = MYSASLIB.MOTOR_PROD_SALES;
	*BUILD A MODEL ON SALE AND OTHER ADV VARIABLES;
	MODEL Sales = radio paper TV POS;
	*SETTING UP TITLE OF THE OUTPUT;
	TITLE "Multiple Linear Regression on Sales and other variables";
RUN;	


/* SINGLE LINEAR REGRESSION BETWEEN SALES AND RADIO
*/
PROC REG DATA = MYSASLIB.MOTOR_PROD_SALES;
	*BUILD A MODEL ON SALE AND RADIO;
	MODEL Sales = radio;
	*SETTING UP TITLE OF THE OUTPUT;
	TITLE "Single Linear Regression on Sales and radio";
RUN;	

/* ANOVA MEASURE OF MEANS TEST FOR CREDIT CARD USE
*/
PROC ANOVA DATA=MYSASLIB.RETAIL_CLOTHING_STORE PLOTS(MAXPOINTS = NONE);
	CLASS CC_CARD;
	MODEL MON = CC_CARD;
	MEANS CC_CARD/TUKEY ;
	*SETTING UP TITLE FOR THE OUTPUT;
	TITLE "ANOVA Test of Means on Credit Card Used";
RUN;

/* MULTIPLE LINEAR REGRESSION BETWEEN TOTAL NET SALES AND PROMOTIONS ON FILE
*/
PROC REG DATA = MYSASLIB.RETAIL_CLOTHING_STORE PLOTS(MAXPOINTS = NONE);
	*BUILD A MODEL ON TOTAL NET SALES AND NO OF PROMOTIONS ON FILE;
	MODEL MON = PROMOS;
	*SETTING UP TITLE OF THE OUTPUT;
	TITLE "Linear Regression on Total Net Sales and Number of Promotions on File";
RUN;	

	/* LINEAR REGRESSION BETWEEN NUMBER OF VISITS AND NUMBER OF DAYS ON FILE
	*/
	PROC REG DATA = MYSASLIB.RETAIL_CLOTHING_STORE PLOTS(MAXPOINTS = NONE);
		*BUILD A MODEL ON NUMBER OF VISITS AND NUMBER OF DAYS ON FILE;
		MODEL FRE = DAYS;
		*SETTING UP TITLE OF THE OUTPUT;
		TITLE "Linear Regression on Number of Visits and Number of days on file";
	RUN;	


/* ANOVA MEASURE OF MEANS TEST FOR CREDIT CARD USE AND NUMBER OF VISITS
*/
PROC ANOVA DATA=MYSASLIB.RETAIL_CLOTHING_STORE PLOTS(MAXPOINTS = NONE);
	CLASS CC_CARD;
	MODEL FRE = CC_CARD;
	MEANS CC_CARD/TUKEY ;
	*SETTING UP TITLE FOR THE OUTPUT;
	TITLE "ANOVA Test of Means on Credit Card Used and Number of Visits";
RUN;


