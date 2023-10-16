//
//  ButtonExtension.swift
//  CombineDemo
//
//  Created by Santosh Kumar Singh on 03/10/23.
//

import Foundation
import UIKit

extension UIButton {
    // Combine
    var normalTitleText: String? {
        get {
            return title(for: .normal)
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }
    
    var normalStateImage: UIImage? {
        get {
            return image(for: .normal)
        }
        set {
            setImage(newValue, for: .normal)
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
}
