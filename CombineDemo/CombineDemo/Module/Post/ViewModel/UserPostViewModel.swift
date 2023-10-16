//
//  PostViewModel.swift
//  CombineDemo
//
//  Created by Santosh Kumar Singh on 13/03/23.
//

import Foundation
import Combine

class UserPostViewModel {
    
    enum InputPostViewModel {
        case viewDidAppear
        case refreshButtonDidTap
    }
    
    enum OutputPostViewModel {
        case fetchPostDidFail(error: APIError)
        case fetchPostDidSuccess(posts: [UserPost])
    }
    
}
