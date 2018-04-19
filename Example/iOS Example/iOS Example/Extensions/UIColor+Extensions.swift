//
//  UIColor+Extensions.swift
//  iOS Example
//
//  Created by Sasha Prokhorenko on 05.01.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

extension UIColor {
  static func randomColor() -> UIColor {
    let hue = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
    let saturation = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
    let brightness = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
  }
}
