# HUD

A modern HUD inspired by Apple Music and Apple Podcasts.

Appearance             | Light                                             | Dark
---------------------- | ------------------------------------------------- | ------------------------------------------------
HUD                    | ![](Screenshots/hud-light.gif)                    | ![](Screenshots/hud-dark.gif)
Activity Indicator HUD | ![](Screenshots/activity-indicator-hud-light.gif) | ![](Screenshots/activity-indicator-hud-dark.gif)


## Requirements

- iOS 13+

## Installation

You can install HUD via Swift Package Manager. For Xcode, please check this [documentation](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app).

## How to Use

### HUD

```swift
import HUD

let window: UIWindow = ...

let hud = HUD(
    image: UIImage(systemName: "heart"),
    title: "Loved",
    message: "This is a beautiful HUD."
)
window.show(hud)
```

### Activity Indicator HUD

```swift
import HUD

let window: UIWindow = ...

let hud = ActivityIndicatorHUD()
window.show(hud)
```
