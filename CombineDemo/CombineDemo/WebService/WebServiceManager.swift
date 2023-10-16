//
//  WebServiceManager.swift
//  CombineDemo
//
//  Created by Santosh Kumar Singh on 13/03/23.
//

import Foundation
import Combine

enum APIError: LocalizedError {
    case requestNotFormed
    
    var errorDescription: String? {
        switch self {
        case .requestNotFormed: return "Unable to form the request."
        }
    }
}

class WebServiceManager: NSObject {
    
    static let sharedService = WebServiceManager()
        
    enum HTTPMethodType: String {
        case POST = "POST"
        case GET = "GET"
    }
    
    func requestAPI<T: Decodable>(url: String, parameter: [String: AnyObject]? = nil, httpMethodType: HTTPMethodType = .GET) -> AnyPublisher<T, APIError> {
        guard let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
            let url = URL(string: escapedAddress) else {
                return Fail(error: APIError.requestNotFormed).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethodType.rawValue
        
        if let requestBodyParams = parameter {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: requestBodyParams, options: .prettyPrinted)
            } catch {
                return Fail(error: APIError.requestNotFormed).eraseToAnyPublisher()
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .catch { _ in Fail(error: APIError.requestNotFormed).eraseToAnyPublisher() }
            .eraseToAnyPublisher()
    }
}
