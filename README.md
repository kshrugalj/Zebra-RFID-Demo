# HAWK-EYE Autonomous Reshop System

[cite_start]**Project by: Team 6** (Adit, Akash, Kshrugal, Manu, Rishi, Sanjay) [cite: 3, 4]
[cite_start]**In partnership with:** Walmart & ZEBRA [cite: 1, 5]

---

## 1. Overview

[cite_start]HAWK-EYE is an end-to-end autonomous solution designed to find, pick, and consolidate misplaced items within a retail environment[cite: 17, 18]. [cite_start]By automating the tedious and time-consuming "reshop" process, HAWK-EYE converts wasted labor into productive work, enhances the associate and customer experience, and delivers a clear return on investment[cite: 81, 130].

## 2. The Problem: The Hidden Cost of Misplaced Items

[cite_start]Misplaced items are a silent drain on retail productivity and profit[cite: 7]. [cite_start]The current manual process is slow, labor-intensive, and inefficient[cite: 11].

* [cite_start]**Wasted Labor:** Walmart associates spend up to two hours per shift manually searching for misplaced items[cite: 9, 14]. [cite_start]This is time spent on low-value tasks instead of helping customers or performing critical stocking duties[cite: 10, 11, 14].
* [cite_start]**Operational Inefficiency:** Associates are pulled away from core responsibilities to load and move heavy reshop carts, hindering overall store productivity[cite: 10, 11].

> "At least two hours of my shift, every single day, is just hunting for things that aren't where they're supposed to be. That's time I'm not on the floor helping customers find what they need." - [cite_start]Yusuf Abdin, Walmart Associate [cite: 14, 15]

## 3. The Solution: The HAWK-EYE System

[cite_start]HAWK-EYE automates the entire reshop process through a three-step system[cite: 18]:

1.  [cite_start]**DETECT:** An in-store RFID infrastructure identifies misplaced items in real-time, pinpointing their exact coordinates[cite: 21, 22, 31].
2.  [cite_start]**RETRIEVE:** An autonomous mobile robot is dispatched to the precise location to retrieve the item from the shelf[cite: 23, 24].
3.  [cite_start]**CONSOLIDATE:** The robot collects multiple items and brings them to a central point for a fast, bulk return process, eliminating item-by-item manual scans[cite: 25, 26, 74, 75].

## 4. System Architecture & Technology

[cite_start]The HAWK-EYE system is built on a robust platform of Zebra-certified hardware and intelligent software[cite: 58].

* **The Brain (Software):**
    * [cite_start]**Zebra Aurora Software:** Serves as the central command and control for the entire operation[cite: 28, 29]. [cite_start]It manages the robot fleet via an intelligent task queue and orchestrates the hardware's movements using its SDK and APIs[cite: 32, 33, 35, 36].
    * [cite_start]**Intelligent Queue:** A proprietary machine learning model integrates with Aurora to create the most efficient retrieval path[cite: 39]. [cite_start]It prioritizes items based on factors like perishability, on-shelf quantity, and price[cite: 39, 46, 47, 48].

* **The Body (Hardware):**
    * [cite_start]**The Legs (Base):** **Zebra Fetch Freight100** Autonomous Mobile Robot[cite: 50, 51]. [cite_start]It navigates safely alongside shoppers and associates using LiDAR and 3D cameras[cite: 53, 54].
    * [cite_start]**The Arm:** **Universal Robots UR5e**, a Zebra Certified Payload[cite: 56, 57, 58]. [cite_start]It provides an 850 mm reach and a 5 kg payload capacity to access items from floor to eye level[cite: 59, 61, 63].
    * [cite_start]**The Eyes (Vision):** **Zebra Aurora™ Vision**, an arm-mounted industrial camera that uses AI to pinpoint the exact location of a target item on a cluttered shelf[cite: 66, 67, 70].
    * [cite_start]**The Hand (Gripper):** A **Custom Suction Gripper** with a versatile foam-based end-effector that can gently and securely grip everything from cardboard boxes to plastic packaging[cite: 68, 69, 71].
    * [cite_start]**Consolidation Scanner:** A dock-mounted **ZEBRA FXP20 POS RFID Reader** for automated, error-free bulk scanning of returned items[cite: 73, 76, 78].

## 5. Financial Impact & ROI

[cite_start]The HAWK-EYE system is projected to pay for itself in approximately 24 months[cite: 83].

| Metric | Manual Process (Current State) | HAWK-EYE System (Projected) | Annual Savings |
| :--- | :--- | :--- | :--- |
| **Labor Hours/Day** | 10 hours (2 associates) | 2 hours (supervision/returns) | 8 hours/day |
| **Annual Labor Cost**| \$80,300 (@ \$22/hr) | \$16,060 | \$64,240 |
| **Item Retrieval Speed**| ~5 min/item | ~1.5 min/item | 70% Faster |

[cite_start]*Table data is estimated for illustration*[cite: 82, 84].

* [cite_start]**Total Annual Benefit:** ~$88,240 (Includes \$64,240 in labor savings and an estimated \$24,000 in ad revenue)[cite: 136, 137, 141].
* [cite_start]**Investment:** \$150,000 in Year 1 for hardware and integration, followed by \$10,000 per year for licensing and maintenance[cite: 143].
* [cite_start]**Break-Even Point:** End of Year 2[cite: 145].
* [cite_start]**5-Year Projection:** A cumulative net benefit of **+$241,200**, representing an approximate **160% ROI**[cite: 147].

## 6. Key Benefits

[cite_start]By automating the tedious, HAWK-EYE elevates the human experience for both associates and customers[cite: 130].

[cite_start]**Better Associate Experience** [cite: 122]
* [cite_start]Eliminates frustrating and low-value search tasks[cite: 123].
* [cite_start]Frees up staff to focus on helpful customer interactions and ensuring shelves are properly stocked[cite: 124, 125].

[cite_start]**Better Customer Experience** [cite: 126]
* [cite_start]More associates are available on the floor to provide assistance[cite: 127].
* [cite_start]Faster item returns lead to better on-shelf availability of products[cite: 128].
* [cite_start]Contributes to a cleaner, more organized store environment[cite: 129].
