//
//  HomeViewModel.swift
//  CombineDemo
//
//  Created by Santosh Kumar Singh on 18/03/23.
//

import Foundation
import Combine

class HomeViewModel {
    @Published private(set) var firstName: String = ""
    @Published private(set) var lastName: String = ""
    @Published private(set) var address: String = ""
    
    var startButton = ButtonCombineComponent()
    
}


