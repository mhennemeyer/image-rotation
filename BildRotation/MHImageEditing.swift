//
//  MHImageEditing.swift
//  BildRotation
//
//  Created by Matthias Hennemeyer on 22.11.18.
//  Copyright © 2018 Matthias Hennemeyer. All rights reserved.
//

import UIKit

enum MHImageEditing {}

extension MHImageEditing {
  class Rotation {
    static func rotateImage(_ image: UIImage, degree: Float) -> UIImage? {
      let radians = CGFloat(degree / 180 * .pi)
      var rotatedFrame = CGRect(origin: CGPoint.zero,size:  image.size)
        .applying(CGAffineTransform(rotationAngle: radians))
      rotatedFrame.origin = CGPoint.zero
      
      
      
      rotatedFrame.size.width.round(.down)
      rotatedFrame.size.height.round(.down)
      
      UIGraphicsBeginImageContextWithOptions(rotatedFrame.size, false, image.scale)
      let context = UIGraphicsGetCurrentContext()!
      
      context.translateBy(
        x: rotatedFrame.midX,
        y: rotatedFrame.midY
      )
      context.rotate(by: radians)
      
      image.draw(
        in: CGRect(
          x: -image.size.width/2,
          y: -image.size.height/2,
          width: image.size.width,
          height: image.size.height
        )
      )
      
      
      let newImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return newImage
    }
  }
}
