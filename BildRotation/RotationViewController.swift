//
//  RotationViewController.swift
//  BildRotation
//
//  Created by Matthias Hennemeyer on 21.11.18.
//  Copyright © 2018 Matthias Hennemeyer. MIT.
//

import UIKit

class RotationViewController: UIViewController {

  @IBOutlet weak var degreeLabel: UILabel!
  @IBOutlet weak var rotationSlider: UISlider!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet var rotationButtons: [UIButton]!
  
  var image: UIImage!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.image = UIImage(named: "icon.png")
    self.imageView.image = self.image
    setupRotationButtons()
  }
  
  // MARK: - Helper
  
  fileprivate func setupRotationButtons() {
    for button in rotationButtons {
      let degree = Float(button.tag)
      button.setTitle(degreeDisplayString(degree), for: .normal)
    }
  }
  
  fileprivate func degreeDisplayString(_ degree: Float) -> String {
    return String(format: "%.1f°", degree)
  }
  
  fileprivate func applyRotation(degree: Float) {
    degreeLabel.text = degreeDisplayString(degree)
    imageView.image = MHImageEditing.Rotation.rotateImage(
      image,
      degree: degree
    )
  }
  
  // MARK: - Actions
  
  @IBAction func rotationButtonTap(_ sender: UIButton) {
    let degree = Float(sender.tag)
    applyRotation(degree: degree)
    rotationSlider.value = degree
  }
  
  
  @IBAction func rotationSliderDidChange(_ sender: Any) {
    applyRotation(degree: rotationSlider.value)
  }
}

