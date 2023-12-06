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


Download the code [here:](https://github.com/joelsolo99/joelsolo99.github.io/blob/master/reusable_code/number_game_distractor_task.html)
Play the game [here:](assets/code_demos/retention_interval.html)
