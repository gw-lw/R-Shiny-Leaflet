# ProgrammingR-Python
•	Guiding question
For individuals who travel in DC, bikes might be an excellent choice if he/ she demand convenience, flexibility, speed, and independence. Bike travel also provides experiences of exercises, meeting exciting people, and sense of adventure. But what about a group of people that are more five? Most shared bikes dispersed with three or less at the same spot. While Capital Bikeshare could be the only choice for larger groups of travelers, in many cases, these groups would either find there are not enough bikes for all of them or as many empty docks to return these bikes.
This tool is designed to cope with the above problem, helping groups of people who love green travel and adventure through illustrating data of Capital Bikeshare locations.

•	Why is the question of interest, and to whom?
The question is interesting because people are making efforts to find ways that are environment-friendly to substitute traditional ways. Bike travel is becoming increasingly popular in major US cities. It could be a challenge for a group of tourists or other people who choose to travel by bike if they cannot find locations that they can easily ride-on and return the bikes.

•	My workflow
The tool uses R Shiny and Leaflet to implement. To run the tool locally, simply follow these steps:
1.	Download data from this link(.csv format): 
http://opendata.dc.gov/datasets/capital-bike-share-locations
2.	Open R Studio and create a new project
3.	Open ”ui.R” and “server.R” in the new project
4.	Click Run App to run the tool
•	How the application helps answer the question
Users can obtain bike and dock locations through “marker” view, and composition available bikes vs. empty docks in the “pie” view. To accommodate for people in larger groups, the user can filter results by dragging the slid bar to see desired results. By clicking an individual marker or pie, the user can receive detailed information on each parking location.
