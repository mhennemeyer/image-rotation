//
//  UIImage+Rotation.swift
//  BildRotation
//
//  Created by Matthias Hennemeyer on 21.11.18.
//  Copyright © 2018 Matthias Hennemeyer. All rights reserved.
//

import UIKit

extension UIImage {
  func rotate(degree: Float) -> UIImage? {
    let radians = CGFloat(degree / 180 * .pi)
    var rotatedFrame = CGRect(origin: CGPoint.zero,size:  self.size)
      .applying(CGAffineTransform(rotationAngle: radians))
    rotatedFrame.origin = CGPoint.zero
    
    
    
    rotatedFrame.size.width.round(.down)
    rotatedFrame.size.height.round(.down)
    
    UIGraphicsBeginImageContextWithOptions(rotatedFrame.size, false, self.scale)
    let context = UIGraphicsGetCurrentContext()!
    
    context.translateBy(
      x: rotatedFrame.midX,
      y: rotatedFrame.midY
    )
    context.rotate(by: radians)
    
    self.draw(
      in: CGRect(
        x: -self.size.width/2,
        y: -self.size.height/2,
        width: self.size.width,
        height: self.size.height
      )
    )
    
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage
  }
}
