# Vipect

Write an iOS app following VIPER architecture. But in an **easy way**.
Besides it is prepared to be used with dependency injection using Swinject

## Viper the easy way
We all know Viper is cool. But we also know that it's hard to setup. This library intends to simplify all that boilerplate process. If you don't know yet what Viper is, check this out: [Architecting iOS Apps with VIPER (objc.io)](https://www.objc.io/issues/13-architecture/viper/)

## Installation

### Requirements

- iOS 11.0+
- Swift 5.1+
- Xcode 11.0+

### Swift Package Manager (SPM)
You can easily install this framework using SPM on Xcode. Go to `File | Swift Packages | Add Package Dependency...` in Xcode and search for "https://github.com/asam139/Vipect.git"

### CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects.

Specify Vipect into your project's Podfile:

```ruby
platform :ios, '11.0'
use_frameworks!

pod 'Vipect'
```

## Features

### Create modules easily using Xcode templates
Vipect Xcode templates are in the folder `Templates`

To install them, run the script `config.sh`

```
sh config.sh
```
