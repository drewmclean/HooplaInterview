//
//  NetworkingError.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import Foundation

enum NetworkError: Error {
	case invalidURL
	case invalidResponse
	case httpError(Int)
	case decodingError(Error)
	case underlying(Error)
}
