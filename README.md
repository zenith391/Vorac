# Vorac
Vorac is a build toolset for V applications.

It is based on a `Voracer` JSON file which specify build directory, source directory alongside preferred compiler or and supported V versions.
## Utility
That project is just made for testing out V and won't serve to most people, however, it can replace
```
v -o binary .
```
by
```
vorac
```
Which is a gain of 8 characters (depending on binary name length) xD

## Advantages
Allow being lazy and free some characters
## Questions'n'Answers
- Q: Why not use a Makefile?
- A:  Well you can, but you won't have the feeling of adding a 150KB bloat to your software, duh!
- Q: Isn't V compiler arleady useful enough to replace Make and Vorac?
- A: Yes, but again, feel the bloat! And you don't need to type a nice ~250B file to actually build your software in V compiler, so use Vorac
- Q: Ok, if i build once an hour, and i written a 250B Voracer file, and it free me 8 characters per build, in how many time writing the Voracer file will be gotten back in terms of character written?
- A: 31.25 hours, or 1.3021 days
