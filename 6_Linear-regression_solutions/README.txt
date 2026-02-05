The dataset we are using is called 'PSYC2001_social-media-data-cleaned.csv',
The dataset is the same as 'PSYC2001_social-media-data.csv', except that -999s
(missing values) have been replaced with NAs.

and it can be found in the folder Data/

This dataset was collected as part of an experiment investigating social media use in young Australian adults. 
Sixty young adults answered questions about their **social media usage** as well as their **political attitudes**. 
Data about their **social media usage** (e.g., likes) was collected while they used their preferred platforms 
under various conditions.

The variables in the data are:

- id – a unique identifier (S1–S60)
- age – age in years
- time_on_social – average hours/day on social media (self-report diary)
- urban – urban (1) or rural (2) area (based on postcode density)
- good_mood_likes – likes/10 min during a good mood (from platform + diary)
- bad_mood_likes – as above, but during bad mood
- followers – average number of followers across platforms

The next 3 columns are political attitude subscales:

- polit_informed – how politically informed they feel (e.g., read news daily)
- polit_campaign – how much they engage in campaign-related discussion
- polit_activism – involvement in activism (e.g., protests, petitions)

These scores have been aggregated into the composite score 'polit_attitude' using the 
formula '0.25 * polit_informed + 0.35 * polit_campaign + 0.4 * polit_activism'




