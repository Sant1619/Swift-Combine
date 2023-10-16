//
//  PostWebService.swift
//  CombineDemo
//
//  Created by Santosh Kumar Singh on 13/03/23.
//

import Foundation
import Combine

struct PostWebService {
    
    func fetchPostList() -> AnyPublisher<[UserPost], APIError> {
        let url = WebServiceConstants.baseURL + WebServiceConstants.postAPI
        let placeResponsePublisher: AnyPublisher<PostResponse, APIError> = WebServiceManager.sharedService.requestAPI(url: url)
    
        return placeResponsePublisher.print("\n fetch web service")
            .map { $0.posts }
            .eraseToAnyPublisher()
    }
    
}
