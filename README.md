# What I'm working on

## MVP
- Each workout has a date and a note
- In each workout, there are many exercises
- Exercises are a compilation of a movement and a serie (weights and reps)
- While doing a serie, one can see the previous performance on this movement

### Todo for MVP
- [x] Add a movement if it doesn't exist yet
- [x] Add series to an exercise
- [x] Update, Destroy for the right objects
- [x] Navigation
- [x] Last of the same serie of the same movement
- [x] Better handling of local time with local_time gem & timezone config
- [x] Everything to simple_form
- [x] Add logs
- [x] Flash messages
- [x] CSS (could get some improvements after Turbo)
- [x] Update and delete movements
- [x] Turbo it all
    - [x] Turbo workouts
    - [x] Turbo movements ~ UX is shit, to make better
    - [x] Turbo exercises
    - [x] Turbo series
    - [x] Re-arange css
- [x] Empty states
- [x] Better UX - figured sometimes less turbo and simple is better...
- [x] Users & Devise gem > workout & movements belong to user
- [ ] First wave of tests:
    - [x] Fixtures and system test for workouts
    - [x] Fixtures and system test for movements
    - [x] Fixtures and system test for exercises
    - [ ] Fixtures and system test for series > https://github.com/MaximeRobion/workout_app/pull/1
- [x] CSS clean-up
    - [x] Form labels
    - [x] Navbar
    - [x] Delete unused css files
    - [x] Homepage > removed it
    - [x] Mobile overview
    - [x] Devise views
- [x] Form errors handling
- [x] "On each side" vs "Total" weight indicator ~ https://github.com/MaximeRobion/workout_app/pull/2
- [ ] SuperSets (1 exercise with 2 movements)
- [ ] Push to prod

### Tech todo
- [ ] Test last performance
- [ ] Test series (fixtures and system test)
- [ ] Use form partial for series edit

## v1
- [ ] "you should charge up" algorithm on last_performance: all reps > 10, and total superior from 2 last times
- [ ] Statistics

## Features for the future...
- Notes on the serie / feedback if need to increase or decrease
- Movements have a picture and notes
- Handle KG and LBS
