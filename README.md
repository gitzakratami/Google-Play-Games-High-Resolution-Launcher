# Google-Play-Games-High-Resolution-Launcher

A simple yet powerful solution to dramatically improve the image quality of Google Play Games on PC by forcing a high-resolution rendering technique known as Supersampling.

## The Problem

Even when a game on Google Play Games runs at your monitor's full native vertical resolution (e.g., 1080 pixels high on a 1080p monitor), the image can still appear **blurry, soft, and lacking in detail.**

This is not a resolution bug, but a quality issue. The game's default rendering, even at the correct resolution, may use poor anti-aliasing or asset scaling that results in an unsharp final picture.

## The Solution: Supersampling

This script provides a solution by forcing your graphics card to use **Supersampling** (a high-quality anti-aliasing method, also known as AMD's VSR or NVIDIA's DSR). Here’s how it works:

1.  It tricks the game into thinking you have a much higher resolution monitor (like 4K).
2.  The game's engine then renders the frame at this massive resolution, capturing far more detail in every line, texture, and effect.
3.  Your graphics card then cleanly downscales this ultra-high-quality image to fit your actual monitor's resolution.

The result is a crystal-clear, sharp, and stable image, far superior to what the game can produce on its own. It's like watching a 4K Blu-ray on a 1080p TV—the picture is noticeably better than a standard 1080p stream.

## Showcase: Before & After

The difference is significant. On the left is the game's default blurry rendering. On the right is the sharp, detailed image produced by this script.

| Before (Default Rendering) | After (Supersampling with this script) |
| :---: | :---: |
| *Miejsce na Twoje zdjęcie PRZED* | *Miejsce na Twoje zdjęcie PO* |
| ![Before](<img width="571" height="571" alt="Image" src="https://github.com/user-attachments/assets/d937305f-ba21-49b7-9809-2688d7058cf5" />) | ![After](https://i.imgur.com/your-after-image-url.png) |

---

## Files in This Repository

*   `launch_game.bat`: The main launcher script that you will configure and run to play your games.
*   `Find-GameURL.ps1`: A PowerShell helper script to easily find the hidden launch URLs for your installed games.
*   `QRes.exe`: A required third-party utility for changing screen resolution via command line. (Credit: [AlbertoMGV](https://github.com/AlbertoMGV/ScreenResolutionChanger))

---

## Setup Instructions

### 1. Enable Virtual Super Resolution

This feature is required for the script to work. You only need to do this once.

*   **For AMD:** Open AMD Radeon Software > Gaming > Display > Enable **Virtual Super Resolution**.
*   **For NVIDIA:** Open NVIDIA Control Panel > Manage 3D Settings > DSR - Factors > Select a scaling factor (e.g., 2.25x or 4.00x).

*Miejsce na zdjęcie pokazujące włączoną opcję VSR/DSR w panelu sterowania karty graficznej.*
![Enable VSR/DSR](https://i.imgur.com/your-gpu-panel-image-url.png)

### 2. Find Your Game's URL

The shortcuts created by Google Play Games are special links, and their full address is hidden. Use the included PowerShell script to find them.

1.  Right-click the `Find-GameURL.ps1` file and choose **"Run with PowerShell"**.
2.  A window will pop up and list all your installed Google Play games with their full Target URLs, highlighted in green.
3.  Copy the entire URL for the game you want to launch.

*Miejsce na zdjęcie pokazujące działanie skryptu Find-GameURL.ps1.*
![PowerShell Script Output](https://i.imgur.com/your-powershell-output-image-url.png)

### 3. Configure the Launcher Script

Now, right-click the `launch_game.bat` file and choose **Edit**. You only need to customize the variables in the `CONFIGURATION` section at the top.

```batch
:: ----------- CONFIGURATION -----------

REM Paste the full game URL you found using the PowerShell script.
set GAME_URL="googleplaygames://launch/?id=com.supercell.clashroyale"

REM The super-resolution you want the game to render at (e.g., 4K).
set HighResolution=/x:3840 /y:2160

REM Your monitor's native resolution that the script will return to.
set NativeResolution=/x:1920 /y:1080

REM The delay in seconds to wait for the game to load. Increase if your PC is slower.
set WaitTimeInSeconds=10

:: ------------------------------------
```

*   **`GAME_URL`**: Paste the full URL you copied in the previous step.
*   **`HighResolution` / `NativeResolution`**: Adjust these to match your setup.
*   **`WaitTimeInSeconds`**: Increase this value if the game loads slowly on your PC.

---

## How to Use

Once configured, simply **double-click the `launch_game.bat` file**.

A command prompt window will appear, perform all the steps automatically, and close itself. Your game will then be up and running with a beautifully sharp image!
