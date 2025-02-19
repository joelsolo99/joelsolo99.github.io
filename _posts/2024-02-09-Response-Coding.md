---
layout: post
title: Response Coding
subtitle: How can changing the response coding process increase reproducibilty? 
cover-img: https://reproducibilitea.org/assets/images/reproducibiliTea_logo.svg
thumbnail-img: https://reproducibilitea.org/assets/images/reproducibiliTea_logo.svg
category: Code
tags:  research methods, code, HTML, JavaScript, Open Source, R, Reproducibilty, Reproducibilitea
author: Joel Solomons
---

**Preface**

My PhD is based around factors affecting why people might interpret exactly the same stimulus in different ways. Almost all of my research is experimental, and requires a paradigm that collects character-based identification responses from participants. In this paradigm, participants are tasked with identifying various objects, and their responses are recorded for analysis.

Each response is evaluated against a known correct identification response and is marked as either correct or incorrect. This binary outcome variable provides a clear and quantifiable measure of the participant’s performance. It allows for a precise analysis of the cognitive processes involved in object identification, offering valuable insights into the intricacies of human cognition. I appreciate that other experimental paradigms are very different and influence from a knowledgeable researcher might be key in detecting an effect. The data from these experiments are collated into a very long (sometimes 10,000+ observations) csv file, and I need to manually code each response as correct or incorrect. I can safely say that coding is my least favourite part of my research.

**Variability and Reproducibility in Coding**

The coding process in an experiment can introduce unaccounted for variance, which can affect the reproducibility of the experiment. The accuracy of coding is dependent on the experimenter's understanding and interpretation of the data. Even slight variations in the coding process can lead to significant differences in the results. This is particularly true when there are multiple correct responses or slight variations in spelling compared to the known correct answer. These factors can introduce a level of subjectivity into the coding process, making it difficult to achieve complete accuracy. This lack of consistency can affect the reproducibility of the experiment, as different experimenters might code the same data differently.

**Blinding and Double Blinding**

In most fields, the experimenter is blind to the condition of the experiment. However, when all the data is presented in a dataset (like those returned by OpenSesame), it's easy for the experimenter to become unblinded, leading to biased coding responses. To mitigate that, it's advisable to hide every column in the dataset from the researcher performing the coding except for those that are absolutely necessary for the process. Hiding certain variables, such as conditions, counterbalance and participant number helps to maintain the integrity of the blinding process. Furthermore, if a person with no knowledge of the experiment were to perform the coding, it could introduce a level of double blinding. This would further reduce the potential for bias and increase the reproducibility of the experiment.

**Randomisation to Reduce Bias**

To further reduce any patterns that might introduce bias from the researcher, a script or function can be used to randomise the order in which the dataset is presented. This ensures that the coding process is not influenced by the order of the data. Randomisation helps to ensure that the responses are coded on an individual level, and the researcher does not fall into a pattern of coding all the responses from a participant in a certain way. This can significantly improve the reproducibility of the experiment, as it reduces the potential for bias arising from pattern recognition in the coding process.

**Researcher Fatigue and Its Impact**

In the context of coding long datasets, researcher fatigue is another factor that can introduce variability and affect the reproducibility of the experiment. As the coding process progresses, the researcher may experience cognitive fatigue, which can lead to errors or inconsistencies in the coding. This is particularly true for large datasets, where the coding process can be time-consuming and mentally demanding. Fatigue can affect the researcher's attention to detail, their decision-making abilities, and their overall performance. This can result in a decline in the quality of the coding over time, introducing additional variance into the data. To mitigate the effects of researcher fatigue, it's advisable to take regular breaks during the coding process, and if possible, to spread the coding over several sessions. This can help to maintain a consistent level of performance and reduce the potential for fatigue-related errors, thereby enhancing the reproducibility of the experiment.

**Drawbacks of the Proposed Techniques**

While blinding (or double-blinding), taking regular breaks and using randomisation techniques can help to minimise the gap between how I would code responses and a naïve researcher would code responses, there are some instances where doing so would be counterproductive. There have been multiple instances of participants in my experiments blatantly not following the instructions, whether that was due to a lack of understanding, concentration or participants trying to get through as quickly as possible. I've had to exclude participants for giving the same response to every prompt when that is very obviously not the case, and that wouldn't be detected if the data had been randomised and conditions and participant numbers blinded from me. Writing a script or function to help code data is also quite time consuming, meaning it's only worthwhile if you have a very large dataset or expect to collect similarly formatted data in the future.

I've included code for when there is one and two binary outcome variables based on matching a known correct answer. In the single outcome variable script, I've added code to automatically code correct responses as '1' and NA values as '0', which significantly speeds things up and often reduces the load on the researcher by up to 40%.

[Single Response Code:](https://github.com/joelsolo99/joelsolo99.github.io/blob/master/reusable_code/single_outcome_autocode.R)

[Double Response Code:\
\
](https://github.com/joelsolo99/joelsolo99.github.io/blob/master/reusable_code/double_outcome_autocode.R)
