//
//  MockServices.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

#if DEBUG

final class MockTitlesService: TitlesServiceProtocol {
	var titles: [TitleSummary]
	var titleDetail: TitleDetail
	var shouldFail: Bool
	var error: Error
	var delay: Duration

	init(
		titles: [TitleSummary] = PreviewData.titleSummaries,
		titleDetail: TitleDetail = PreviewData.titleDetail(),
		shouldFail: Bool = false,
		error: Error = NetworkError.invalidResponse,
		delay: Duration = .seconds(0)
	) {
		self.titles = titles
		self.titleDetail = titleDetail
		self.shouldFail = shouldFail
		self.error = error
		self.delay = delay
	}

	func fetchPopularTitles() async throws -> [TitleSummary] {
		try await Task.sleep(for: delay)
		if shouldFail { throw error }
		return titles
	}

	func fetchTitleDetail(titleId id: Int) async throws -> TitleDetail {
		try await Task.sleep(for: delay)
		if shouldFail { throw error }
		return titleDetail
	}
}

#endif  
