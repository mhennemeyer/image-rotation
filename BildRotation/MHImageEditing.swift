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
      let rad = CGFloat(degree / 180 * .pi)
      var boundingFrame = CGRect(origin: CGPoint.zero,size:  image.size)
        .applying(CGAffineTransform(rotationAngle: rad))
      boundingFrame.origin = CGPoint.zero
      
      boundingFrame.size.width.round(.down)
      boundingFrame.size.height.round(.down)
      
      UIGraphicsBeginImageContextWithOptions(boundingFrame.size, false, image.scale)
      let context = UIGraphicsGetCurrentContext()!
      
      context.translateBy(
        x: boundingFrame.midX,
        y: boundingFrame.midY
      )
      context.rotate(by: rad)
      
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
