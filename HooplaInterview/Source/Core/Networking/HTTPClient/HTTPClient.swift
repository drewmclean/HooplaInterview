//
//  HTTPClient.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import Foundation

final class HTTPClient: HTTPClientProtocol {

	func sendRequest<T: Decodable>(_ request: HTTPRequest) async throws -> T {
		guard let url = request.endpoint.url else {
			throw NetworkError.invalidURL
		}

		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = request.method.rawValue
		request.headers.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }
		
		do {
			let (data, response) = try await URLSession.shared.data(for: urlRequest)

			guard let httpResponse = response as? HTTPURLResponse else {
				throw NetworkError.invalidResponse
			}

			guard (200...299).contains(httpResponse.statusCode) else {
				throw NetworkError.httpError(httpResponse.statusCode)
			}

			do {
				return try JSONDecoder().decode(T.self, from: data)
			} catch {
				throw NetworkError.decodingError(error)
			}
		} catch {
			throw NetworkError.underlying(error)
		}
	}

}
