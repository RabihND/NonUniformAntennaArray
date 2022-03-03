<div id="top"></div>

<h1 align="center"> EW course project  </h1>

<p align="center">
    <a alt="Version">
        <img src="https://img.shields.io/github/v/release/RabihND/NonUniformAntennaArray?color=14adfa&logo=Semantic%20Web&logoColor=14adfa&style=for-the-badge" /></a>
    <a  alt="Downloads">
        <img src="https://img.shields.io/github/downloads/RabihND/NonUniformAntennaArray/total?logo=App%20Store&logoColor=white&style=for-the-badge" /></a>
    <a href="https://github.com/RabihND/NonUniformAntennaArray/graphs/contributors" alt="Contributers">
        <img src="https://img.shields.io/github/contributors/RabihND/NonUniformAntennaArray?color=6fd671&logo=WhiteSource&style=for-the-badge" /></a>
    <a href="https://github.com/RabihND/NonUniformAntennaArray//network/members" alt="Forks">
        <img src="https://img.shields.io/github/forks/RabihND/NonUniformAntennaArray?color=cccccc&logo=Node-RED&style=for-the-badge" /></a>
    <a href=" https://github.com/RabihND/NonUniformAntennaArray/stargazers">
        <img src="https://img.shields.io/github/stars/RabihND/NonUniformAntennaArray?color=8e6be8&logo=Ethereum&logoColor=8e6be8&style=for-the-badge" alt="Stars" /></a>
    <a alt="Visitors">
        <img src="https://visitor-badge-reloaded.herokuapp.com/badge?page_id=RabihND/NonUniformAntennaArray?color=14adfa&logo=Android&style=for-the-badge" /></a>
    <a href="https://github.com/RabihND/NonUniformAntennaArray/master/LICENSE.txt">
        <img src="https://img.shields.io/github/license/RabihND/NonUniformAntennaArray?color=%2363afdb&logo=letsencrypt&style=for-the-badge" alt="License"></a>
    
</p>

<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center"> Non-Uniform Antenna Array🎲</h3>
  <p align="center"><img src="./stuff/antenna.gif" width="200"></p>
  <p align="center">
   A Review article using MATLAB
    <br />
    <a href="https://github.com/RabihND/NonUniformAntennaArray"><strong>Explore the documents »</strong></a>
    <br />
    <br />
  </p>
</div>

---

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary> 
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#parts">Parts</a></li>
    <li><a href="#results">Results</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#refenences">Refenences</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

<p align="center"> <img  src="./stuff/mastermind.jpg" width="1000"> </p>  
<p align="justify"><b>Mastermind</b> is a code-breaking game in which two players compete against each other. The game begins when the first participant, dubbed <b>"The Codemaker"</b>, generates a four-digit (color) code that is hidden. The second participant, dubbed <b>"The Codebreaker"</b> then guesses a code.</p>

<p align="justify">The codemaker then evaluates the estimate by handing certain black and white pins to the codebreaker (plus and minus in the paper version). The codebreaker guesses another code based on the evaluation, and the game continues until the codebreaker finds (or fails to locate) the concealed code within the maximum number of <b>tries</b>.

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

Major frameworks/libraries used in this project:

- [MATLAB 2021b](https://www.mathworks.com/)
- [CVX](http://cvxr.com/cvx/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- PARTS -->

## Parts

**1. Master Mind Class**

The main MasterMind game Process; it contains:

- **get_random_solution()**: Returns a random "solution" to be the hidden code.
- **check_guess()**: Returns the nb of "correct" and nb of "misplaced" guess.
- **get_correct_colors()**: Returns the "correct" colors.
- **get_misplaced_colors()**: Returns the "misplaced" colors.
- **is_won()**: Verify that the guess is correct according to the solution.

**2. MainWindowUi Class** (GUI_Window)

The main window of the game designed by Qt; it contains:

- **setupUi()**: The QT codes that generate the main window.
- **resetButtonClicked()**: That delete the selected colors.
- **set_thisguesstable()**: connect the colors.
- **clicked_color()**: Send the selected colors to the Guess table.
- **clicked_submit()**: After clicking the submit button; its check the guess and return the score to the Scores Table.
- **show_game_over()**: Show the Game Over Dialog. -**print_score()**: print score in the terminal (NOT GUI).

**3. GameOverWindow Class** (GUI_Window)

The resulting window, which shows the player's loss(+) or victory(-).

- **display_text()**: Return a text with include the result of the game.(Win/Loss)

**4. Splash Screen Class** (GUI_Windows)

> {⌛}

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- RESULTS -->

## Results

**GUI OUTPUT:**

<details>
<summary>ScreenShoot Preview 🖼️</summary>
  <body>
    <p align="center"> <img src="./stuff/GUI_output.jpg" width="200"> </p>
  </body>
</details>

---

**TERMINAL OUTPUT:**

<details>
<summary>ScreenShoot Preview 🖼️</summary>
  <body>
    <p align="center"> <img src="./stuff/terminal_output.jpg" width="300"> </p>
  </body>
</details>

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- REFERENCES -->

## Refenences

🔎

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->

## Contacts

Rabih ND - [@RabihND](https://github.com/RabihND)

**Project Link:** [https://github.com/RabihND/NonUniformAntennaArray](https://github.com/RabihND/NonUniformAntennaArray)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ROADMAP -->

## Roadmap

- [x] Write the main code-map.
- [x] Design the GUI window.
- [x] Write the MasterMain Core Functions.
- [x] Design the GameOver window.
- [x] <a href="https://github.com/RabihND/AP2021-2022-Final/releases/latest"><strong>Build the .EXE Release</strong></a>
- [ ] Splash screen
- [ ] Build APK release.

<p align="right">(<a href="#top">back to top</a>)</p>

---

<div align="center">
<p>
<img src="./stuff/logo.png" width="110">
<p align="center"><b>
Amirkabir University  of Technology</b>

(Tehran Polytechnic)

</p>
</p>
</div>
