//
//  TitlesService.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import Foundation

protocol TitlesServiceProtocol {
	func fetchPopularTitles() async throws -> [TitleSummary]
	func fetchTitleDetail(titleId: Int) async throws -> TitleDetail
}

final class TitlesService : TitlesServiceProtocol {
	private let client: HTTPClientProtocol

	init(client: HTTPClientProtocol = HTTPClient()) {
		self.client = client
	}

	func fetchPopularTitles() async throws -> [TitleSummary] {
		let request = HTTPRequest(endpoint: .popularTitles)
		let response: PopularTitlesResponse = try await client.sendRequest(request)
		return response.popular
	}

	func fetchTitleDetail(titleId: Int) async throws -> TitleDetail {
		let request = HTTPRequest(endpoint: .titleDetail(titleId: titleId))
		let response: TitleDetailResponse = try await client.sendRequest(request)
		return response.title
	}
}

struct PopularTitlesResponse : Decodable {
	let popular: [TitleSummary]
}

struct TitleDetailResponse : Decodable {
	let title: TitleDetail
}
