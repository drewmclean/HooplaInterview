//
//  HTTPRequest.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import Foundation

struct HTTPRequest {
	let endpoint: Endpoint
	let method: HTTPMethod
	let headers: [String: String]

	init(
		endpoint: Endpoint,
		method: HTTPMethod = .get,
		headers: [String: String] = [:]
	) {
		self.endpoint = endpoint
		self.method = method
		self.headers = headers
	}
}
