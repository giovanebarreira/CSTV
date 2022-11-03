# CSTV

In this challenge, I have created an app that fetches the CSGO matches from PandaScore API and shows each match's details on a new screen.

# Instructions
*  Select an IDE that compiles and runs iOS code;
*  Select an iPhone simulator and run the "CSTV" target;
*  After the app launches, a list of the upcoming matches will be displayed;
*  Select and tap on a match and the match details screen will open;
*  In case of an error, an alert box will display the error type and a button to try to load again.

# Design choices
I worked with MVVM-C architecture, UIKit, and view code.

* The **MVVM-C** is the architecture that I am most familiar with its usage. 
	* 	MVVM separates the layers and facilitates the code organization;
	*  Usage of view model layer to separate the business rules from view controller;
	*  MVVM improves the testability of code;
	*  Easy communication between classes;
	*  The usage of coordinators separates navigation responsibility.


* The usage of **UIKit**, because I have a bigger base of knowledge.

* Using **view code**, I have more flexibility to create and modify UI elements.


# Third-party libraries
The library used was **KingFisher**, it is easier to download and cache images.
