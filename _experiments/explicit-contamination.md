---
layout: post
title: Explicit Contamination Experiment
subtitle: What&#39s wrong with previous Mooney Image Studies?
editor_options: 
  markdown: 
    wrap: 72
---

If you've read my [very first
post](/_posts/2023-12-05-Mooney-Images.html) on this site, you'll know
that my first introduction to Mooney images was [an article from a cyber
security journal](https://inria.hal.science/hal-01109765) discussing the
usefulness of implicit memory-based authentication techniques. While the
paper was certainly strong in its intended field, it left some aspects
of the psychology behind the process unanswered. This is the first
experiment I ever conducted, so I thought it would be fitting for the
first ever experiment on this site. My goal is to make all of my
research accessible to anyone, whether they have a background in
psychology or not. This post is *not* in APA format and you probably
couldn't reproduce my experiment from it (but if you want to just ask me
and I will provide everything you need)!

**The Shortfalls of Previous Research**

Previous research has attempted to address these issues by exploring
alternative forms of authentication. One such approach involves
leveraging implicit memory through the use of priming. However, these
studies have often failed to account for the influence of explicit
memory, leading to what is known as explicit memory contamination. How
can we be certain that the implicit memory techniques employed for
authentication are actually implicit memory? I refer to the
aforementioned uncertainty as #Explicit Memory Contamination#

**What are Priming and Mooney Images, and how are they relevant?**

Priming is a psychological phenomenon where exposure to one stimulus
influences the response to another stimulus. In the context of online
authentication, users are ‘primed’ to certain images, by seeing the
Mooney image alongside the original version, which they later identify
for access. Mooney images, named after cognitive psychologist Craig
Mooney, are two-tone, thresholded images of easily identifiable objects.
They are extremely difficult to identify unless the viewer has
previously seen the intact image, making them a top candidate for
priming-based authentication.

This experiment sought to address the shortcomings of previous research
by examining the extent to which Mooney images are identified implicitly
and explicitly. It aimed to isolate the effects of priming from explicit
memory contamination.

**Design**

The experiment employed a 4-condition, within-subjects design. It
consisted of a priming phase, where participants were exposed to both
matched (real) and unmatched (randomly generated) pairs of Mooney and
greyscale images, and a recall phase, where participants were shown only
Mooney images and asked to identify them. 'Real' Mooney images were
images Mooney images created from a real image of an object. 'Random'
Mooney images were Mooney images created from random noise or an
abstract scene.

We hypothesised that ‘real’ stimuli would yield a significantly higher
proportion of correct identification responses than ‘random’ stimuli,
indicating a higher priming effect for real images, due to the priming
experienced when exposed to a real object alongside its Mooney image. We
also expected that the proportion of ‘old’ responses would be higher for
old items than new items, suggesting that the priming effect worked. We
also expected an interaction: the advantage in identification would be
higher for the effect of real/random when images were already seen, as
priming to a real image should elicit a bigger effect than priming to a
'random' image.

## Method

**Design**

The experiment was designed as a 4 condition, within-subjects study. The
independent variable was the type of stimulus shown (real or fake, old
or new), and the dependent variables were the identification and
recognition of these stimuli.

**Procedure**

The experiment was divided into two phases - a study phase and a test
phase. In the study phase, participants were shown pairs of images and
asked to remember them. In the test phase, they were shown Mooney images
and asked to identify them and indicate whether they had seen them
before.

Why OpenSesame? The experiment was conducted using OpenSesame, an
open-source experiment building program. This was particularly useful as
it has an extension, OSWeb, that allows the experiment to be run in a
web browser. Given the ongoing pandemic, this enabled the researchers to
collect data online, ensuring the safety of all participants.

## Results

![Violin Plot showing the Correct Identification Responses, Per
Condition](assets/img/explicit-contamination/pID_violin.png)

![Violin Plot showing the Correct Recognition Responses, Per
Condition](assets/img/explicit-contamination/pOld_violin.png)

We used Bayesian Generalised Linear Mixed Models (GLMMs) to investigate the effects of old vs new and matching vs non-matching Mooney images on correct identification and recognition responses. The results revealed significant main effects and interactions, which can be understood in conjunction with the Estimated Marginal Means (EMMs).

**Identification Responses:**

There was overwhelming evidence for the main effect of Old/New (BF = 4.46E + 154), the main effect of Matching/Non-Matching (BF = 1.65E + 78), and their interaction (BF = 9.41E + 03).
The EMM for new, matching stimuli was -0.96, and for new, non-matching stimuli, it was -17.26. This suggests that participants had difficulty identifying new images, especially those that did not match the greyscale images they were primed with.
For old, matching stimuli, the EMM was 0.50, and for old, non-matching stimuli, it was -3.37. This indicates that participants were better at identifying old images that matched the greyscale images, but still had difficulty with old images that did not match. The effect size for real/random was 1.04, indicating a large effect, and the effect size for new/old was -0.53, indicating a medium effect.

**Recognition Responses:**

Similarly, there was overwhelming evidence for the main effect of Old/New (BF = 4.89E + 270), the main effect of Matching/Non-Matching (BF = 4.21E + 71), and their interaction (BF = 7.92E + 03).
The differences in EMMs between the various combinations of new and old, matching and non-matching stimuli, suggest significant effects of both age (old vs new) and type (matching vs non-matching) on the recognition of Mooney images.
In summary, the results provide strong evidence that both the age (old vs new) and type (matching vs non-matching) of Mooney images significantly affect the ability of participants to correctly identify and recognise these images. These findings have important implications for the use of Mooney images in authentication systems. The effect size for real/random was 0.34, indicating a small effect, and the effect size for new/old was -1.80, indicating a very large effect.

For those of you who don't understand GLMMs or statistics, significance is a measure of whether we believe an effect was due to chance. So, for our effect of old/new on identification was due to change, we have a Bayes factor of 4.46e+154, or 4 with 154 zeros! That is the how much more likely it is that there is an effect than that there isn't. When there's that much evidence in favour of an effect, we can be pretty confident that the effect is real. We accept any Bayes Factor (BF) above 3 as significant. Similarly, effect sizes (measured in Cohen's d, or *d*) tell you the actual difference between the two groups: we can have a massive effect but it not be significant (large effect size, BF less than 3) or we could have a tiny effect size and it be significant (small effect size, BF larger than 3). These things happen all the time. In our study, we've got huge Bayes factors and a mix of effect sizes, so we can be confident that there is a real difference between the conditions, and that the difference is big enough to be relevant outside of the experimental setting.




