//
//  MovieError.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import Foundation

enum MovieError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data."
        case .invalidEndpoint: return "Invalid endpoint."
        case .invalidResponse: return "Invalud response."
        case .noData: return "No Data."
        case .serializationError: return "Failed to decode data."
        }
    }
    
    var errorUserInfo: [String : Any] {
        return [NSLocalizedDescriptionKey: self.localizedDescription]
    }
}


enum DatabaseError: Error, CustomNSError {

  case invalidInstance
  case requestFailed
  
  var localizedDescription: String? {
    switch self {
    case .invalidInstance: return "Database can't instance."
    case .requestFailed: return "Your request failed."
    }
  }
    var errorUserInfo: [String : Any] {
        return [NSLocalizedDescriptionKey: self.localizedDescription]
    }
}
