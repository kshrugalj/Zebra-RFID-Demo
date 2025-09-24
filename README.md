<br />
<div align="center">
  <a href="https://github.com/your_username/repo_name">
    <img src="https://i.imgur.com/your-logo-image.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">HAWKEYE: Autonomous Reshop Revolution</h3>

  <p align="center">
    [cite_start]An end-to-end autonomous solution that finds, picks, and consolidates misplaced items in a retail environment[cite: 18].
    <br />
    <a href="#about-the-project"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="#usage">View Demo</a>
    ·
    <a href="https://github.com/your_username/repo_name/issues">Report Bug</a>
    ·
    <a href="https://github.com/your_username/repo_name/issues">Request Feature</a>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

[cite_start]In retail, misplaced items represent a hidden cost and a silent drain on productivity and profit[cite: 6, 7]. [cite_start]Associates can spend up to two hours per shift manually searching for misplaced products, a slow and labor-intensive process that detracts from customer service and critical stocking tasks[cite: 9, 11]. [cite_start]According to Walmart Associate Yusuf Abdin, "At least two hours of my shift, every single day, is just hunting for things that aren't where they're supposed to be"[cite: 14, 15].

HAWKEYE addresses this challenge directly. [cite_start]It is an autonomous system designed to **Detect**, **Retrieve**, and **Consolidate** misplaced items, converting wasted labor into productive work[cite: 81].

Here's why HAWKEYE is a revolutionary solution:
* [cite_start]**Efficiency:** By automating the reshop process, HAWKEYE frees up associates to focus on high-value tasks like customer interaction and shelf stocking[cite: 124, 125].
* [cite_start]**Speed:** The system is projected to be 70% faster than the manual process, reducing item retrieval time from ~5 minutes to ~1.5 minutes per item[cite: 82].
* [cite_start]**ROI:** HAWKEYE is designed to pay for itself in approximately 24 months by significantly reducing labor costs associated with manual reshopping[cite: 83]. [cite_start]The system is projected to reduce daily labor from 10 hours to just 2 hours for supervision[cite: 82].
* [cite_start]**Improved Experience:** It leads to a better experience for both associates, by eliminating frustrating tasks [cite: 123][cite_start], and customers, by ensuring better on-shelf availability and a more organized store[cite: 128, 129].

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

The HAWKEYE system is an integrated solution leveraging industry-leading hardware and intelligent software.

* **Central Command & Control (The Brain):**
    * [![Zebra][Zebra.com]][Zebra-url]
    * [cite_start]Zebra Aurora Software serves as the central command, managing the robot fleet and orchestrating all hardware movements through its SDK and APIs[cite: 28, 29, 35].

* **Mobile Platform (The Legs):**
    * [![Zebra][Zebra.com]][Zebra-url]
    * [cite_start]The Zebra Fetch Freight100 is an autonomous mobile base that uses LiDAR and 3D cameras for safe and reliable navigation alongside shoppers[cite: 51, 52, 53, 54].

* **Robotic Manipulator (The Arm):**
    * [![Universal Robots][UniversalRobots.com]][UR-url]
    * [cite_start]A Universal Robots UR5e, a Zebra Certified Payload, provides an 850mm reach and a 5 kg payload capacity to access items from floor to eye level[cite: 57, 58, 59, 61].

* **Perception System (The Senses):**
    * [![Zebra][Zebra.com]][Zebra-url]
    * [cite_start]**Vision:** Zebra Aurora™ Vision, an arm-mounted industrial camera, uses AI to pinpoint items on cluttered shelves[cite: 67, 70].
    * [cite_start]**Touch:** A custom, foam-based suction gripper gently handles a wide variety of packaging, from cardboard boxes to plastic[cite: 69, 71].

* **Item Detection Infrastructure:**
    * [![Zebra][Zebra.com]][Zebra-url]
    * [cite_start]An in-store RFID infrastructure identifies misplaced items in real-time[cite: 22]. [cite_start]The system uses a ZEBRA FXP20 POS RFID Reader for automated bulk scanning during the consolidation phase[cite: 73, 74, 78].

* **Task Prioritization (Intelligent Queue):**
    * [cite_start]A proprietary machine learning model integrates with Zebra Aurora to create the most efficient retrieval path[cite: 39]. [cite_start]The model analyzes items based on priority factors like perishability, quantity left, and price[cite: 39, 46, 47, 48].

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

To get a local copy of the simulation environment up and running, follow these simple steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* ROS (Robot Operating System)
* Python 3.8+
* npm
    ```sh
    npm install npm@latest -g
    ```

### Installation

_Below is an example of how you can instruct your audience on installing and setting up your app._

1.  Clone the repo
    ```sh
    git clone [https://github.com/github_username/repo_name.git](https://github.com/github_username/repo_name.git)
    ```
2.  Install required packages
    ```sh
    pip install -r requirements.txt
    ```
3.  Enter your simulation API Keys in `config.js`
    ```js
    const API_KEY = 'ENTER YOUR API';
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

The HAWKEYE system operates in a continuous, three-step cycle to maintain store organization autonomously.

1.  [cite_start]**DETECT:** The store's RFID infrastructure constantly monitors for items that are out of place[cite: 22]. [cite_start]When a misplaced item is identified, its coordinates are instantly sent to the Zebra Aurora software[cite: 31].

2.  [cite_start]**RETRIEVE:** The Zebra Aurora software adds the task to an intelligent queue, prioritized by a machine learning model[cite: 33, 39]. [cite_start]A HAWKEYE robot is then dispatched to the precise location[cite: 24]. [cite_start]Using its Zebra Aurora™ Vision camera, the robot pinpoints the item, and the Universal Robots UR5e arm uses its custom suction gripper to gently retrieve it[cite: 57, 69, 70].

3.  [cite_start]**CONSOLIDATE:** The robot collects multiple items to create an efficient, bulk placement process[cite: 26]. Once its bin is full, it returns to a designated consolidation point for sorting and eventual return to the proper shelf location.

_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Roadmap

-   [x] Conceptualization & Component Selection
-   [x] Financial ROI Modeling
-   [ ] Phase 1: Single-Robot Proof of Concept in Simulated Environment
-   [ ] Phase 2: Live Pilot Program in a Single Retail Store
-   [ ] Phase 3: Multi-Robot Fleet Management & Coordination
    -   [ ] Integrate advanced collision avoidance
    -   [ ] Optimize task allocation between multiple units
-   [ ] Phase 4: Integration with Live Inventory & Planogram Systems

See the [open issues](https://github.com/your_username/repo_name/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the Unlicense License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact

[cite_start]Team 6 - Adit, Akash, Kshrugal, Manu, Rishi, Sanjay [cite: 3, 4]

Project Link: [https://github.com/your_username/repo_name](https://github.com/your_username/repo_name)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to.

* [cite_start][Walmart](https://corporate.walmart.com/) [cite: 1]
* [cite_start][Zebra Technologies](https://www.zebra.com/) [cite: 5]
* [Universal Robots](https://www.universal-robots.com/)
* [cite_start][McKinsey & Company (Retail Automation ROI Benchmarks)](https://www.mckinsey.com/) [cite: 153]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[product-screenshot]: https://i.imgur.com/G5T8YhV.png
[Zebra.com]: https://img.shields.io/badge/Zebra_Technologies-000000?style=for-the-badge&logo=zebra&logoColor=white
[Zebra-url]: https://www.zebra.com/
[UniversalRobots.com]: https://img.shields.io/badge/Universal_Robots-00A9E0?style=for-the-badge&logo=universal-robots&logoColor=white
[UR-url]: https://www.universal-robots.com/
