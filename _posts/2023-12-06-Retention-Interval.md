---
layout: post
title: Retention Interval 
subtitle: My first attempt at coding that isn't R
cover-img: /assets/img/mooney_image/easy/me_and_rudi.jpg
thumbnail-img: /assets/img/mooney_image/easy/me_and_rudi.jpg
category: Code
tags: retention interval, research methods, code, HTML, JavaScript, Open Source, 
author: Joel Solomons
---

As a cognitive psychologist, I do a lot of memory-based experiments. It's generally agreed that there should be some sort of distractor task present in a memory experiment for a retention interval, because this stops people rehearsing recently learned stimuli in their short-term memory, which would affect our test. It also helps mitigate against the primacy and recency effects by increasing the time between exposure and testing.

A lot of the distractor tasks I've seen previously are either hard work on the part of the experimenter or extremely dull on the part of the participant. For participants, cognitive experiments are unintersting enough, so I thought I'd make a more interesting distractor task.

A distractor task must be:

- Engaging: the task should engage the participant enough that it fully occupies their attention. This ensures that they cannot continue rehearsing the previous material.
- Unrelated to the test material: the task needs to be different enough from the test material that it cannot provide any cues that might help the retrieval of the learned material
- Of appropriate duration: the task should last long enough to prevent rehearsal, but not so long as to significantly affect the length of the experiment or cause the participants to forget most of the stimuli (leading to a floor effect). 

So I made a game of higher or lower. It's interactive, so by default engaging, because it requires participants to input numbers and think about whether their number is higher or lower. It also displays lots of statistics on the screen, such as number of guesses, correctly guessed numbers and average guesses per number. This should fully occupy the participants' attention. So long as the task isn't related to guessing random numbers, this game should be unrelated to most tasks. Finally, by default, the duration is 2 minutes, with a countdown, but this can be easily changed. 

The task is written in HTML and JavaScript, and it's the first thing I've written that isn't R code for data analysis! It works in OpenSesame as an inline HTML item, which is where I will be using it, but I'm sure it works with other experiment design programs too. It sort of works as a standalone HTML file, but this wasn't the aim.

As part of my commitment to open-source software and reproducibility, I have decided to make all my code freely available online. You can see the code on this website, or download the source code from my GitHub project or from the resources section at the top. I'm aiming to produce more reusable code so keep a look out!

```
<!-- 
	Title: Number Guessing Game
	Author: Joel Solomons
	Organisation: University of Plymouth
	Email: joel.solomons@plymouth.ac.uk
	Date: 05/12/2023
	Format: HTML
-->


<!DOCTYPE html>
<html>
<body>

<div id="gameDiv" style="display: flex; justify-content: center; align-items: center; height: 100vh;">
    <div id="gameContent" style="text-align: center;">
        <h2>Number Guessing Game</h2>

        <p>Guess a number between 1 and 100:</p>

        <input type="number" id="guess" name="guess" min="1" max="100">
        <button type="button" onclick="playGame()">Submit</button>

        <p id="message"></p>
        <p id="counter"></p>
        <p id="timer"></p>
        <p id="correctGuesses"></p>
        <p id="guessesPerNumber"></p>
    </div>

    <!-- Form -->
    <form id="moveOnForm" style="display: none; text-align: center;">
        
        <input type='submit' value='Continue with the experiment'>
    </form>
</div>

<script>
// Prepare phase
var gameIsOver = false; // Add this line to declare a variable indicating the game status
var randomNumber = Math.floor(Math.random() * 100) + 1;
var startTime = Date.now();
var guessCounter = 0;
var correctGuessCounter = 0;
var totalGuesses = 0;
var timeLeft = 120; // Time left in seconds

// Initialise game_over
var game_over = 0;

// Add an event listener to the input field
document.getElementById("guess").addEventListener("keyup", function(event) {
    // Number 13 is the "Enter" key on the keyboard
    if (event.keyCode === 13) {
        // Cancel the default action, if needed
        event.preventDefault();
        // Trigger the button element with a click
        playGame();
    }
});

// Game logic
function playGame() {
    var playerGuess = document.getElementById("guess").value;
    guessCounter++;
    document.getElementById("counter").innerHTML = "Number of guesses: " + guessCounter;
    if (playerGuess < randomNumber) {
        document.getElementById("message").innerHTML = "Too low! Try again.";
    } else if (playerGuess > randomNumber) {
        document.getElementById("message").innerHTML = "Too high! Try again.";
    } else {
        document.getElementById("message").innerHTML = "Congratulations! You found the number. A new number has been generated.";
        // Increase the correct guess counter and update the total guesses
        correctGuessCounter++;
        totalGuesses += guessCounter;
        document.getElementById("correctGuesses").innerHTML = "Number of correctly guessed numbers: " + correctGuessCounter;
        document.getElementById("guessesPerNumber").innerHTML = "Average number of guesses per number: " + (totalGuesses / correctGuessCounter).toFixed(2);
        // Generate a new random number and reset the guess counter
        randomNumber = Math.floor(Math.random() * 100) + 1;
        guessCounter = 0;
    }
}

// Run phase
function run() {
    // Update the timer
    timeLeft = 120 - Math.floor((Date.now() - startTime) / 1000);
    document.getElementById("timer").innerHTML = "Time left: " + timeLeft + " seconds";

    // Check if the game is over
    if (timeLeft <= 0) {
        // End the current item and move on to the next one
        document.getElementById("gameContent").style.display = "none"; // Hide the game content
        document.getElementById("moveOnForm").style.display = "block"; // Show the form
        clearInterval(intervalId); // Clear the interval
        gameIsOver = true; // Set the game over flag
        game_over = 1; // Set vars.game_over to 1 when the game is over
    }
}

// Call the run function every second to check the game status
var intervalId = setInterval(run, 1000);

</script>

</body>
</html>
```
Download the code [here:](https://github.com/joelsolo99/joelsolo99.github.io/blob/master/reusable_code/number_game_distractor_task.html)
