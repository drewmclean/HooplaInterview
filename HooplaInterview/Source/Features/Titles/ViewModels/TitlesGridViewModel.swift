//
//  TitlesGridViewModel.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import Foundation

@Observable
@MainActor
final class TitlesGridViewModel {
	private let titlesService: TitlesServiceProtocol

	private(set) var viewTitle: String
	var titles: [TitleSummary] = []
	var isLoading = false
	var error: Error?

	init(viewTitle: String = "Titles", titlesService: TitlesServiceProtocol) {
		self.viewTitle = viewTitle
		self.titlesService = titlesService
	}

	func loadTitles() async {
		isLoading = true
		do {
			titles = try await titlesService.fetchPopularTitles()
		} catch {
			self.error = error
		}
		isLoading = false
	}
}

// MARK: Preview Mocks

#if DEBUG
extension TitlesGridViewModel {

	static var preview: TitlesGridViewModel {
		return TitlesGridViewModel(
			titlesService: MockTitlesService()
		)
	}

	static var previewError: TitlesGridViewModel {
		return TitlesGridViewModel(
			titlesService: MockTitlesService(shouldFail: true)
		)
	}

	static var previewLoading: TitlesGridViewModel {
		return TitlesGridViewModel(
			titlesService: MockTitlesService(delay: .seconds(10))
		)
	}

}
#endif
