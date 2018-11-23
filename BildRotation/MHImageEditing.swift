//
//  MHImageEditing.swift
//  BildRotation
//
//  Created by Matthias Hennemeyer on 22.11.18.
//  Copyright © 2018 Matthias Hennemeyer. MIT.
//

import UIKit

enum MHImageEditing {}

extension MHImageEditing {
  class Rotation {
    static func rotateImage(_ image: UIImage, degree: Float) -> UIImage? {
      // (0)
      let rad = CGFloat(degree / 180 * .pi)
      
      // (1)
      var boundingFrame = CGRect(origin: CGPoint.zero, size: image.size)
        // (1.1)
        .applying(CGAffineTransform(rotationAngle: rad))
      
      // (1.2)
      boundingFrame.origin = CGPoint.zero
      
      // (1.3)
      boundingFrame.size.width.round(.down)
      boundingFrame.size.height.round(.down)
      
      // (2)
      UIGraphicsBeginImageContextWithOptions(
        boundingFrame.size,
        false, // (2.1)
        image.scale // (2.2)
      )
      // (2.3)
      let context = UIGraphicsGetCurrentContext()!
      
      // (3)
      context.translateBy(
        x: boundingFrame.midX,
        y: boundingFrame.midY
      )
      
      // (4)
      context.rotate(by: rad)
      
      // (5)
      image.draw(
        in: CGRect(
          // (5.1)
          x: -image.size.width/2,
          y: -image.size.height/2,
          width: image.size.width,
          height: image.size.height
        )
      )
      
      // (2.4)
      let newImage = UIGraphicsGetImageFromCurrentImageContext()
      
      // (2.5)
      UIGraphicsEndImageContext()
      return newImage
    }
  }
}
