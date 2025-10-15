<!-- @format -->

### Objective

Jackpot!

You've landed a summer gig in Las Vegas! Unfortunately, it's 2020, and the casinos are closed due to COVID-19. Your boss wants to move some of the business online and asks you to build a full-stack app — a simple slot machine game. Build it to the specifications outlined in the Core Features section below.

### Getting Started

- Clone the repository to your locale machine.
- Build the application according to the specifications outlined below.
- Be sure to translate all language used in the specifications below into Rails conventions. For example, a specification to have a way to end the game should not result in a controller action named `end_game`, but should instead leverage the Rails convention of `delete`ing the game.

### Overview

- When a player first visits the application, if a session does not exist, a new session should be created and 10 credits should be added to the player's Bank Balance. If a session does exist, no additional funds should be added.
- The root page of the application should be a Game Entry screen.
- Starting the game should present the player with the Game Play screen.
- The Game Entry Fee is 10 credits.
- The Roll Cost is 1 credit.
- Each roll has 3 Slots.
- The game has 4 possible Slot Results: 🍋 (10 credit reward), 🍊 (20 credit reward), 🍉 (30 credit reward), and 🍒 (40 credit reward).
- To win, a player's roll must contain the same Slot Result in all available Slots.
- If the player keeps winning, they can play forever, but keep reading as the house might have something to say about that!

### Core Features

- **General:**

  - Use [`TailwindCSS`](https://tailwindcss.com/) for all styling.
  - Use [`Stimulus`](https://stimulus.hotwired.dev/) for any JavaScript behavior you add.
  - Feel free to leverage [`Turbo`](https://turbo.hotwired.dev/) if/when it makes sense.

- **Client side:**

  - The Game Entry screen should display the following:
    - Details about the game (e.g. the name of the game, the risk/reward, and the player's Bank Balance).
    - A Start call to action button (if the player doesn't have an active game and if the player's Bank Balance is greater than the Game Entry Fee).
    - A Continue call to action button (if the player has an active game).
    - The Game Balance.
    - A Results Area with a block for each of the available Slots (to display the results of a roll).
    - A Roll button below the Results Area that initiates a roll request to the server (if the Game Balance is above the Roll Cost amount).
  - After each roll, the Game Balance and the Result Area should update to show the result of each roll.
  - When the player's Game Balance is above zero, a Cash Out button should appear that allows the player to exit the game.

- **Server side:**

  - The start-game request should transfers the Game Entry Fee from the player's Bank Balance to the Game Balance.
  - For each roll, the server should decrement the Game Balance by the Roll Cost.
  - For a winning roll, the server should increment the Game Balance according to their rolled reward.
  - After every roll, the server should return the current Game Balance along with the result of the roll (e.g. 🍋🍒🍊).
  - A request made to create a new roll should fail if the Game Balance is less than the Roll Cost.
  - When the Game Balance is less than 40 credits, the roll response should be truly random.
  - If the Game Balance is more than 40 credits, then the server begins to alter the deal:
    - If the result of the current roll is a winning roll, before responding, the server performs an additional check.
    - The additional check should have a 30% chance of being true if there are less than 60 credits in the Game Balance, and a 60% chance of being true if the Game Balance is 60 credits or more.
    - If the result of the additional check is true, the server should re-roll and communicate the result of the new roll back to the player.
  - When the player makes a cash-out request, move credits from the Game Balance to the player's Bank Balance and return the player to the Game Entry screen.

- **Testing:**

  - Since projects can change very frequently at the beginning, we prefer to initially prioritize "getting real" over having code that's fully tested.
  - If you have time to create tests, focus them on the roll logic since that's where the core business logic takes place.
  - Don't let tests get in the way of getting the application functioning.
  - Make sure to use your application and ensure there are no logic or visual bugs to ensure that it demos well.

- **Bonus tasks:**
  Feel free to work on these, but only do so if you've completed the core functionality outlined above and still have time remaining for the challenge. Please commit the chages for each of these bonus items to their own branch and leave the `main` branch alone so that it only contains the core functionality.

      -   [cash-out-cheat] When the player hovers their mouse over the Cash Out button there should be a 40% chance that the button becomes disabled (this decision should be done on the client-side and should remain enabled or disabled until the next roll occurs).
      -   [roll-data-storage] Store the results of each roll into a table and associate it with a game so that we can keep track of win/loss ratios over time.
      -   [slot-animation] After submitting a roll request to the server, all blocks should enter a spinning state (a spinning 'X' character for example), and then show the result of the roll.
      -   [slot-animation-advanced] After receiving a response from the server, the first block should stop spinning after 500 milliseconds and display its result, the second block should spin for another 500 milliseconds and display its result, then the third block should spin for another 500 milliseconds before displaying its result.

### Evaluation Criteria

- Completeness: did you complete the Core Features as defined?
- Correctness: does the solution perform in sensible, thought-out ways?
- Maintainability: is the code well structured, follows Ruby/Rails conventions, and architected in a way to support the future?
- Testing: are there any logic issues or visual bugs?

### Project Completion

Please organize and design your code as if it were going into production. If you have questions about the project, reach out via Slack or send them via email to delynn@thereceptionist.com. When you are satisfied with your solution, push your changes to the `main` branch. After you have pushed your code, you may submit the project on the Code Submit assignment page.

All the best and happy coding,

The Receptionist Team
