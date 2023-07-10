# What I'm working on

MVP:
- Each workout has a date and a note
- In each workout, there are many exercises
- Exercises are a compilation of a movement and a serie (weights and reps)
- While doing a serie, one can see the previous performance on this movement

Todo for MVP
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
- [] Turbo it all
    - [x] Turbo workouts
    - [x] Turbo movements ~ UX is shit, to make better
    - [x] Turbo exercises
    - [x] Turbo series
    - [x] Re-arange css
- [x] Empty states
- [x] Better UX - figured sometimes less turbo and simple is better...
- [x] Users & Devise gem > workout & movements belong to user
- [] Test everything:
    - [] Seeding db
    - [] Integration tests
    - [] System tests
- [] CSS clean-up
    - [] Form labels
    - [] Devise views
    - [] Navbar
    - [] Delete unused css files
    - [] Mobile overview
    - [] Homepage
- [] Clean back (model, helpers, controller)
- [] "On each side" vs "Total" weight indicator
- [] SuperSets (Exercise with 2 movements)
- [] Movement name > lower and capitalize

Features for the future...
- SuperSets (Exercise with 2 movements)
- Notes on the serie / feedback if need to increase or decrease
- Movements have a picture and notes
- Handle KG and LBS
- Statistics

