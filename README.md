# README

This project is not completed and has no front-end done yet. The vision of the project is to create an app which enable user to store eng-pl translations in private dictionary.
Main features:
 - alogaritm authomatically create english synonyms of words based on already existing words,
 - when word is deleted and other record/records in database have this word in english_synonyms column, those records are authomatically updated to deletion of this word from english_synonyms column,
 - app provide a handfull of exercises to help memorize words from private dictionary. In that order the system of repetitions will be provided.

 For now only learning mode works. Learning mode include 5 types of exercises. Repetition mode will use only one from these exercises - the hardest. App itself will decide which words user have to repeat each day.
