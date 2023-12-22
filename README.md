# Complaint_Analysis_AMA
Data analysis to complaints, compliments and suggestions to the Portuguese Admnistrative Modernization Agency (AMA), over the different sevices (social security, citizen store) and places (stores, web channels) - MySQL.

1. Data Source:
- Data sources found on "dados.gov", provided by the Portuguese Admnistrative Modernization Agency (AMA).
- Two datasets used:
- Complaints, compliments and suggestions - Electronic yellow book:
- Information available was date, type of action, type of communication channel, public service provider, location, cause and average response time;
- 3 CSV files with a total of 3953 rows and 10 columns;​
- Service Locations:
- Information available was public service provider, location, latitude and longitude;
- 1 CSV file with 227 rows and 20 columns.

2. Data Exploration:
- In MySQL, the main skills used were Union, Joins, Case, If statement and Aggregate Functions.
- Get aquainted with the data and performed the main tasks:
- Check for duplicate values;
- Extract the year from the submission date;
- Substitute null values;
- Union of the 3 files complaints, compliments and suggestions in a single table;
- Join the previous table with the service locations table.
