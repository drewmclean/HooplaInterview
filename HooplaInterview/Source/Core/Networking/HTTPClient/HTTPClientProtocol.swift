//
//  HTTPClientProtocol.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import Foundation

protocol HTTPClientProtocol {
	func sendRequest<T: Decodable>(_ request: HTTPRequest) async throws -> T
}
