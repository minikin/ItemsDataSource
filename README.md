# ItemsDataSource

[![Build Status](https://travis-ci.org/minikin/ItemsDataSource.svg?branch=master)](https://travis-ci.org/minikin/ItemsDataSource)
[![CocoaPods](https://img.shields.io/cocoapods/v/ItemsDataSource.svg)](https://cocoapods.org/pods/ItemsDataSource)
[![Platform](https://img.shields.io/cocoapods/p/ItemsDataSource.svg?style=flat)](https://github.com/minikin/ItemsDataSource)


<img src="https://github.com/minikin/ItemsDataSource/blob/master/demo.gif?raw=true" width=300 />


ItemsDataSource is a generic datasource for UICollectionView.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Features

- [x] Create collections with any data types
- [x] Reusable UICollectionViewCell and UICollectionReusableView
- [x] UICollectionView at its core
- [x] Easy extendable

## Requirements
- iOS 10.0+ 
- Xcode 9.0+
- Swift 4.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1+ is required to build ItemsDataSource.

To integrate ItemsDataSource into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'ItemsDataSource'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate ItemsDataSource into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "ItemsDataSource" 
```

Run `carthage update` to build the framework and drag the built `ItemsDataSource.framework` into your Xcode project.

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but ItemsDataSource does support its use on supported platforms. 

Once you have your Swift package set up, adding ItemsDataSource as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.


#### Swift 4

```swift
dependencies: [
    .package(url: "https://github.com/minikin/ItemsDataSource.git")
]
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate ItemsDataSource into your project manually.
Just copy files from `Sources` folder to your projects:
```
CellDescriptor.swift
Groupable.swift
Itemable.swift
ItemsDataSource.swift
SupplementaryDescriptor.swift
```
## Usage

Define your model as usual

```
import UIKit
import ItemsDataSource

struct Vitamin {
	let name: String
	let ammount: Double
}
```

Conform your model  to ```Itemable```

```

extension Vitamin: Itemable {
	var itemCellDescriptor: CellDescriptor {
		get {
			return CellDescriptor(reuseIdentifier: ReuseIdentifier.vitaminCell, 
                                                  configure: self.configureIngredientCell)
		}
	}
}

```



Add ```configure``` method to model in extension

```
extension Vitamin {
	func configureIngredientCell(_ cell: ViataminCell) {
	        cell.vitaminNameLabel.text = name
	        cell.backgroundColor = UIColor.randomColor()
	}
}
```

Form more detailed exmaple, please check iOS example.

## License

ItemsDataSource is released under the MIT license. [See LICENSE](https://github.com/minikin/ItemsDataSource/blob/master/LICENSE) for details.
