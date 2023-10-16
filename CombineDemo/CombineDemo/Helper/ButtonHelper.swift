//
//  ButtonHelper.swift
//  CombineDemo
//
//  Created by Santosh Kumar Singh on 03/10/23.
//

import Foundation
import UIKit

class ButtonCombineComponent {
    @Published var titleForNormalState: String?
    @Published var imageNameForNormalState: String?
    @Published var backgroundColor: UIColor?  // Should be text
    @Published var cornorRadius: CGFloat?
    @Published var isHidden: Bool?
}
