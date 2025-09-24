# HAWK-EYE Autonomous Reshop System

**Project by: Team 6** (Adit, Akash, Kshrugal, Manu, Rishi, Sanjay) 
**In partnership with:** Walmart & ZEBRA 

---

## 1. Overview

HAWK-EYE is an end-to-end autonomous solution designed to find, pick, and consolidate misplaced items within a retail environment. By automating the tedious and time-consuming "reshop" process, HAWK-EYE converts wasted labor into productive work, enhances the associate and customer experience, and delivers a clear return on investment.

## 2. The Problem: The Hidden Cost of Misplaced Items

Misplaced items are a silent drain on retail productivity and profit. The current manual process is slow, labor-intensive, and inefficient.

**Wasted Labor:** Walmart associates spend up to two hours per shift manually searching for misplaced items. This is time spent on low-value tasks instead of helping customers or performing critical stocking duties.
**Operational Inefficiency:** Associates are pulled away from core responsibilities to load and move heavy reshop carts, hindering overall store productivity.

> "At least two hours of my shift, every single day, is just hunting for things that aren't where they're supposed to be. That's time I'm not on the floor helping customers find what they need." - Yusuf Abdin, Walmart Associate

## 3. The Solution: The HAWK-EYE System

HAWK-EYE automates the entire reshop process through a three-step system:

1.  **DETECT:** An in-store RFID infrastructure identifies misplaced items in real-time, pinpointing their exact coordinates.
2.  **RETRIEVE:** An autonomous mobile robot is dispatched to the precise location to retrieve the item from the shelf.
3.  **CONSOLIDATE:** The robot collects multiple items and brings them to a central point for a fast, bulk return process, eliminating item-by-item manual scans.

## 4. System Architecture & Technology

The HAWK-EYE system is built on a robust platform of Zebra-certified hardware and intelligent software.

* **The Brain (Software):**
    * **Zebra Aurora Software:** Serves as the central command and control for the entire operation. It manages the robot fleet via an intelligent task queue and orchestrates the hardware's movements using its SDK and APIs.
    * **Intelligent Queue:** A proprietary machine learning model integrates with Aurora to create the most efficient retrieval path. It prioritizes items based on factors like perishability, on-shelf quantity, and price.

* **The Body (Hardware):**
    * **The Legs (Base):** **Zebra Fetch Freight100** Autonomous Mobile Robot. It navigates safely alongside shoppers and associates using LiDAR and 3D cameras.
    * **The Arm:** **Universal Robots UR5e**, a Zebra Certified Payload. It provides an 850 mm reach and a 5 kg payload capacity to access items from floor to eye level.
    * **The Eyes (Vision):** **Zebra Aurora™ Vision**, an arm-mounted industrial camera that uses AI to pinpoint the exact location of a target item on a cluttered shelf.
    * **The Hand (Gripper):** A **Custom Suction Gripper** with a versatile foam-based end-effector that can gently and securely grip everything from cardboard boxes to plastic packaging.
    * **Consolidation Scanner:** A dock-mounted **ZEBRA FXP20 POS RFID Reader** for automated, error-free bulk scanning of returned items.

## 5. Financial Impact & ROI

The HAWK-EYE system is projected to pay for itself in approximately 24 months.

| Metric | Manual Process (Current State) | HAWK-EYE System (Projected) | Annual Savings |
| :--- | :--- | :--- | :--- |
| **Labor Hours/Day** | 10 hours (2 associates) | 2 hours (supervision/returns) | 8 hours/day |
| **Annual Labor Cost**| \$80,300 (@ \$22/hr) | \$16,060 | \$64,240 |
| **Item Retrieval Speed**| ~5 min/item | ~1.5 min/item | 70% Faster |

*Table data is estimated for illustration*.

* **Total Annual Benefit:** ~$88,240 (Includes \$64,240 in labor savings and an estimated \$24,000 in ad revenue).
* **Investment:** \$150,000 in Year 1 for hardware and integration, followed by \$10,000 per year for licensing and maintenance.
* **Break-Even Point:** End of Year 2.
* **5-Year Projection:** A cumulative net benefit of **+$241,200**, representing an approximate **160% ROI**.

## 6. Key Benefits

By automating the tedious, HAWK-EYE elevates the human experience for both associates and customers.

**Better Associate Experience** 
* Eliminates frustrating and low-value search tasks.
* Frees up staff to focus on helpful customer interactions and ensuring shelves are properly stocked.

**Better Customer Experience** 
* More associates are available on the floor to provide assistance.
* Faster item returns lead to better on-shelf availability of products.
* Contributes to a cleaner, more organized store environment.
