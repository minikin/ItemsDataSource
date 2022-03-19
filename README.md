[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner-direct.svg)](https://vshymanskyy.github.io/StandWithUkraine)

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

- Create collections with any data types
- Reusable UICollectionViewCell and UICollectionReusableView
- UICollectionView at its core
- Easy extendable

## Requirements

- iOS 10.0+
- Xcode 9.0+
- Swift 5.0+

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

if you're using `CocoaPods 1.5.0+` you can include `ItemsDataSource` as static library:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

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

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate ItemsDataSource into your project manually.
Just copy files from `Sources` folder to your projects:

```swift

CellDescriptor.swift
Groupable.swift
Itemable.swift
ItemsDataSource.swift
SupplementaryDescriptor.swift
```

## Usage

Define your model as usual

```swift
import UIKit
import ItemsDataSource

struct Vitamin {

  // MARK: - Instance Properties

  let name: String
  let amount: Double
}
```

Conform your model to `Itemable`

```swift

extension Vitamin: Itemable {
  var itemCellDescriptor: CellDescriptor {
    return CellDescriptor(reuseIdentifier: ReuseIdentifier.vitaminCell, configure: configureIngredientCell)
  }
}

```

Add `configure` method to model in extension

```swift
extension Vitamin {
  func configureIngredientCell(_ cell: ViataminCell) {
    cell.vitaminNameLabel.text = name
    cell.backgroundColor = UIColor.randomColor()
  }
}
```

In ViewController inject your datasource

```swift

import ItemsDataSource
import UIKit

final class ExampleViewController: UIViewController {

  // MARK: - Injections

  public var vitaminsDataSourse = ItemsDataSource(items: [Vitamin](),
                                                  cellDescriptor: { $0.itemCellDescriptor })

  // MARK: - IBOutlets

  @IBOutlet var exampleCollectionView: UICollectionView! {
    didSet {
      setExampleCollectionViewDataSource()
      exampleCollectionView.delegate = self
      setExampleCollectionViewLayout()
      exampleCollectionView.reloadData()
    }
  }

  // MARK: - Instance Properties

  var vitamins = [Vitamin]()

  // MARK: - ViewController LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
    print("vitamins", vitamins)
  }

  // MARK: - Helpers

  private func setExampleCollectionViewDataSource() {
    vitaminsDataSourse.items = vitamins
    exampleCollectionView.dataSource = vitaminsDataSourse
  }

  private func setExampleCollectionViewLayout() {
    let layout = CommonFlowLayout(columns: 2,
                                  itemHeight: 200,
                                  inset: 5,
                                  spacing: 0,
                                  lineSpacing: 5)
    exampleCollectionView.collectionViewLayout = layout
  }
}

// MARK: - UICollectionViewDelegate

extension ExampleViewController: UICollectionViewDelegate {}
```

For more details, please check an iOS example or ask me on twitter: [@minikin](https://twitter.com/minikin)

## Support

Post issues and feature requests on the GitHub [issue tracker](https://github.com/minikin/ItemsDataSource/issues).

## License

ItemsDataSource is released under the MIT license. [See LICENSE](https://github.com/minikin/ItemsDataSource/blob/master/LICENSE) for details.
