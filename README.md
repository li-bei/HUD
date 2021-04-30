# HUD

A modern HUD inspired by Apple Music and Apple Podcasts.

![](Screenshots/light.png) ![](Screenshots/dark.png)

## How to Use

```swift
import HUD

let hud = HUD(
    image: UIImage(systemName: "heart"),
    title: "Loved",
    message: "This is a beautiful HUD."
)
window.show(hud)
```
