# Mastermind
### A game by Zoilo Mercedes for the LinkedIn REACH Apprentice Engineer III Interview.

This game was created using Xcode 10.1 and Swift 4.2. 
- The game is made to be played in landscape mode.
- The game is currently designed to be played on an iPhone XR Simulator with mouse and keyboard.

## Thought Process
Initially, I knew what tools I would be using to build the project, but the creative idea which would shape the final build did not come until after a couple days. As such, I started with what I know: building out the most basic app architecture using the coordinator pattern, which is extensible enough to accomodate any app with multiple levels of functionality. As I built out the foundation, the requirements for the game started to remind me of how hacking is portrayed in popular media, with Cowboy Bebop being at the forefront. This is what helped me choose the overall theme of hacking/cracking. I tried to follow SOLID principles as much as possible. Using the delegate pattern helped me automatically manage object memory, as well as helps to observe the single responsibility principle. 

## Creative Implementations
### Implemented
- I stylized the app in full, minimal dark mode. 
- There are views which are animated to move in and out of the screen on certain UI interactions. 
- guess history is implemented as a disappearing TableView.
- I implemented gamification by adding the ability to have multiple back to back sessions of number guessing, as long as you guess correctly. 
- Multiple wins will create a streak, which can be used as a high score. 
- I added a settings pane, which allows a user to toggle the values for the number of digits, minimum and maximum numbers.
- All settings values persist across runs.

### Planned
- I want to implement an actual story. Breaking into someone's hidden stuff could be a very compelling storyline. 
	- For example, breaking into someone's computer and finding sensitive documents could initiate a storyline which would lead the player down a path of cracking to continue the story.
- Since streaks could be used as high scores, having a local/global leaderboard would be possible by adding a backend.
- Powerup mechanics could help make the game more interesting.
	- a player could get a free autohack to continue their streak
	- extra hints could help the player in a pinch
	- some powerup could automatically deduce a single digit of the sequence


## Premise
- MasterMind is an app where you, with the help of an AI toolkit called MasterMind, scour the net for hackable entities and break into their every secret.
- Upon finding an entity, MasterMind scans and detects an attack vector, and displays a 4-8 digit number which you must guess.
- MasterMind is the best tool in its class, but it's not infallible. In fact, you only get 10 chances to break the system.
- It is still in early alpha, so only basic hints about the encoded number can be deduced.
- Despite this, MasterMind is a highly popular, as well as highly illegal tool. If you run out of chances, you will be found and arrested for high cyber crimes.
- Planned upgrades include the ability to acquire the secrets stored within the encoded entity. Anything is vulnerable - from the documents of an unsavory megacorporation to a middle class family's college fund.

