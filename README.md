# README

# Project1 - Film Rave

## Project Overview

Drawing on the concepts and lessons learned for both back-end and front-end development, I have embarked on a one-week journey to try and build a website that allows users to review movies and add a rating to display their satisfaction or dissatisfaction of a particular viewing. 

## Motivation (How & Why)

Whilst there are many existing solutions for this exact same 'problem' and one might ask: why would someone opt to use this very simplified version over something far more sophisticated such as IMDB's rating and reviewing system? 

That is a very good question and unfortunately I can't answer that, but what I can say is that it replicates a lot of the functionality that a site like IMDB offers, but obviously not to the same extent. 

### Tech/frameworks Used

Built with 

* HTML
* CSS
* Ruby
* Rails
* BootStrap

### Link to Game

This is [a link to my git repo](https://github.com/ram-ram14/cuddly-octo-pancake).

### Features

* You can search for a movie based on a title and it will display the poster image and other parameters. 
* You can add reviews anonymously and I guess other people can view them. 

### Approach Taken

* Started off by planning and drawing a mockup of the different models and how they would interoperate. 
* Created a new rails app.
* Added all of the required gems that were needed.
* Created a database
* Generated all of the models
* Similarly, I generated all of the controllers
* Added methods for each action to the controllers
* Added views for the actions
* Configured all of the routes
* Worked on integrating the API
* Styled the website towards the end


### Difficulties encountered when building this

The main difficulties I found were in relation to the user sign-up and login process, which took up a significant amount of my time. I found that I was going through many rabbit holes to enforce for specific characters when creating a password or adding functionality to 'forget a password', which I gave entirely as I had more pressing functionality to build. 

In addition, integrating the API was a troublesome hurdle that I had to overcome as the webpage would not display more than the poster image. Afterwards, I managed to get more information to display but it had come at the cost of the website being more slow. Initially also, the website would display all the results relating to the movie title that was searched and it was difficult to limit the result to 1 website, but I managed a way around that. 

Lastly, on the reviews display, it is missing a paramater for the title. I did not have enough time to display the value from the form on the page. 


### How to use?

* Go to localhost:3000/users/new and sign up by adding a username, email address, password and password confirmation. A word of caution that the password fields must match in order to continue. Click the 'Sign up!' button. 
* This should redirect you to localhost:3000 where you can search for a movie title in the search bar and click 'Search'. 
* Upon clicking the search button, it should display information relating to the movie whereby you can 'add a review'. 
* This should redirect you to the 'localhost:3000/movies/...' where you'll be able to view reviews if a user has added a review to that movie. 
* You can now click 'add a review' where you should see a form appear. 
* Fill in the entries and hit 'Submit Review' which should take you back to the reviews page where you'll be able to view your review and any others. 
* Clicking 'Home' will redirect you to the 'localhost:3000/movies' and clicking 'Log out...' should redirect you to the 'localhost:3000/login' page. 
* Using your previous details, you should be able to click 'Sign in' and login successfully. 

### Credits & Acknowledgements 

A special thanks to Joel, CJ, Mark and Tina for helping me integrate the OMDB API.

