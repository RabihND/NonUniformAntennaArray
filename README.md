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
  <p align="center"><img src="./stuff/design.gif" width="250"></p>
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

<p align="center"> <img  src="./stuff/antnna_array.jpg" width="1000"> </p>  
<p align="justify"><b>Antenna arrays</b> have been employed in wireless communications and radars to synthesize beampatterns with the smallest BW and PSLL achievable. When evaluating the performance of different types of arrays, <b>half-power beamwidth (HPBW)</b> and <b>PSLL</b> are the main metrics to consider. <b>Directivity</b>, or the ratio of energy delivered in the intended direction to total energy communicated, is another key performance characteristic. Traditionally, linear arrays with consistent inter-element spacing have been commonly used. ULAs with uniform excitation-current amplitudes or weights have a short BW but a large PSLL.</p>

<p align="justify">We propose a <b>NULA</b> with <b>non-uniform weights</b> in this work. The weights were calculated using a normal window function and the logarithmic function was used for inter-element spacing. A variety of window functions are available in the literature, but only the Bartlett-Hanning window function was employed for this proof of concept.</p>

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

Major frameworks/libraries used in this project:

- [MATLAB 2021b](https://www.mathworks.com/)
- [CVX](http://cvxr.com/cvx/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- PARTS -->

## Parts

**1. INTRODUCTION**
 - What is the array Half Power Beam Width (HPBW)?
 - What is the array Directivity?

**2. MODEL OF THE SYSTEM**
<p align="center"> <img  src="./stuff/NLUA.png" width="500"></p>
<p align="center"><b><i>Fig.1</b> Geometry and notations used for non-uniform linear array.</i></p> 

- **Problem1:** 
<p align="justify">First, regarding the window that is used for weighting we can see this resulting figure that describes the Beam patterns for various windows for N = 16;</p>
<p align="center"> <img  src="./stuff/windows.png" width="500"></p>

- **Problem2:**
<p align="justify">Second, to clarify the <b>relationship</b> between <b>HPBW, BW, and directivity</b> as we mentioned before we consider a standard 16-element linear array pointed at the broadside.Fist we find the <b>Dolph-Chebychev weightings</b> for sidelobes of -20dB, -30dB, and -40dB.
After that, we plot the resulting beam pattern and we compute the HPBW. BW, and the directivity.</p>
<p align="center"> <img  src="./stuff/dolph.png" width="800"></p>

- **Problem3:**
<p align="justify">By using the technique introduced in the reference <b>“Optimum Array Processing”</b> by <i>Harry L. Van Trees </i><sup>[2]</sup>  we design a beam pattern that maximizes the directivity subject to a -35 dB constraint of the sidelobe; considering a standard linear array with 16 elements. After that, we compare the resulting BW with that of a 16 element SLA using DolphChebychev weighting.</p>
<p align="center"> <video  src="./stuff/iteration.mp4" width="800"></p>



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
