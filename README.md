# 🚀 SpaceX Explorer

A beautiful Flutter app that explores SpaceX rockets, launch pads, and landing pads — with live refresh, offline awareness, and a sleek UI.

## Screenshots

<p align="center">
  <img src="screenshots/home.png" width="20%"/>
  <img src="screenshots/settings.png" width="20%"/>
  <img src="screenshots/about.png" width="20%"/>
</p>

---

## 📱 Features

- 🔥 View latest **Rockets**, **Launch Pads**, and **Landing Pads**
- 🔄 Pull-to-refresh with a **custom rocket animation**
- 📡 Smart offline detection using `connectivity_plus`
- 📦 State management with `Provider`
- 💥 Custom UI components and icons
- 📴 Graceful handling when no internet is available

---

## 🧠 Tech Stack

- **Flutter** 💙
- **MVC Architecture** for clean code separation
- `provider` for state management
- `connectivity_plus` for network status
- `custom_refresh_indicator` for animated pull-to-refresh
- `vibration` for subtle haptic feedback
- `flutter_svg` for scalable vector assets

---

## 🖼️ Screenshots

| Rockets View | Launch Pads | Landing Pads |
|---------------|--------------|--------------|
| ![rockets](screenshots/rockets.png) | ![launchpads](screenshots/launchpads.png) | ![landingpads](screenshots/landpads.png) |

---

## 🔌 API Source

All data is powered by the awesome [SpaceX API](https://github.com/r-spacex/SpaceX-API) 🚀  
REST endpoints are used to fetch real-time information about rockets, launch pads, and landing pads.

---

## 🛠️ Setup Instructions

### 1. Clone the repo

```bash
git clone https://github.com/rZoysa/SpaceX.git
cd spacex_explorer
