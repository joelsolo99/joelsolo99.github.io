---
layout: post
title: Mooney Images and Cyber Security
subtitle: What do Cognitive Psychology and Cyber Security have in Common?
cover-img: /assets/img/mooney_images/easy/me_and_rudi.jpg
thumbnail-img: /assets/img/mooney_images/easy/me_and_rudi.jpg
category: Mooney Images
tags: mooney images, mooney, first post, R
author: Joel Solomons
---

It may seem a strange place to start this blog, especially seeing as my project has nothing to do with cyber-security, but it's how my whole project started.

![Me and my Cat as a Mooney Image](/assets/img/mooney_images/easy/me_and_rudi.jpg)

My first introduction to Mooney images was a paper by [Castellucia et al., 2017](https://inria.hal.science/hal-01109765). This paper wasn't in a psychological journal, rather a technical journal about cyber-security. The researchers were looking for an alternative to passwords, and came up with MooneyAuth.

Traditionally, authentication relies on explicit memory, which has its disadvantages; remembering a password is a high cognitive load, it's vulnerable to attacks such as brute force and social engineering, and good password practice is reliant upon user behaviour. In contrast, MooneyAuth uses the brain's ability to implicitly remember visual information, reducing the cognitive load, making brute-force and social engineering attacks unfeasible, and shifting the burden of security to the server (and therefore the qualified) rather than the end-user.

It works like this:

-   Enrollment phase: A user is presented with Mooney images, the corresponding original image, and the labels. This causes an implicit memory link between the label and the Mooney image, which is the secret part of the authentication

-   Authentication phase: The user is now presented with a series of Mooney images and asked to label them. As they are more likely to correctly identify the images they have seen the intact version of beforehand, it is possible to know which user was which by the images they are able to identify.

The reason this system is so resistant to attacks is that there is no expectation that the users will remember which images they have seen. Even users that have no memory of having taken part in the enrollment phase will be able to identify seen images significantly better than unseen images. That means a potential attacker wouldn't be able to know which images to learn. Also, if the attacker were to learn the entire set and identify all of the images in the authentication phase, the system would not let them in because that would involve sharing more information than the real user knows, therefore making it obvious that the system is being attacked.

You can have a go with MooneyAuth [here:](https://mooneyauth.org/static/index.php)
