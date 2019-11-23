[![CocoaPods](https://img.shields.io/cocoapods/p/PadView.svg)](https://cocoapods.org/pods/PadView)
[![CocoaPods](https://img.shields.io/cocoapods/v/PadView.svg)](http://cocoapods.org/pods/PadView)
[![Pod License](https://cocoapod-badges.herokuapp.com/l/PadView/badge.png)](https://www.apache.org/licenses/LICENSE-2.0.html)
[![Build Status](https://travis-ci.org/levantAJ/PadView.svg?branch=master)](https://travis-ci.org/levantAJ/PadView)

# 🩹 PadView
PadView is a bottom pad view controller

## Requirements

- iOS 9.0 or later
- Xcode 10.0 or later

## Installation
There is a way to use PadView in your project:

- using CocoaPods

### Installation with CocoaPods

```
pod 'PadView'
```
### Build Project

At this point your workspace should build without error. If you are having problem, post to the Issue and the
community can help you solve it.

## How To Use

```swift
import PadView

let contentView = UIView()
contentView.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    contentView.heightAnchor.constraint(equalToConstant: 100)
])
let padVC = PadViewViewController(contentView: contentView)
present(padVC, animated: false, completion: nil)
```

## Author
- [Tai Le](https://github.com/levantAJ)

## Communication
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Licenses

All source code is licensed under the [MIT License](https://raw.githubusercontent.com/levantAJ/PadView/master/LICENSE).
