//
//  TitleDetailViewModel.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import Foundation

@Observable
@MainActor
final class TitleDetailViewModel {
	private let titlesService: TitlesServiceProtocol

	var titleDetail: TitleDetail?
	var isLoading = false
	var error: Error?
	var showWatchPopup = false

	init(titlesService: TitlesServiceProtocol) {
		self.titlesService = titlesService
	}

	func loadTitleDetail(titleId: Int) async {
		isLoading = true
		do {
			titleDetail = try await titlesService.fetchTitleDetail(titleId: titleId)
		} catch {
			self.error = error
		}
		isLoading = false
	}
}

// MARK: Preview Mocks

#if DEBUG
extension TitleDetailViewModel {

	static func preview(contentType: TitleContentType = .audiobook) -> TitleDetailViewModel {
		let detail = PreviewData.titleDetail(contentType: contentType)
		return TitleDetailViewModel(
			titlesService: MockTitlesService(titleDetail: detail)
		)
	}

	static var previewError: TitleDetailViewModel {
		return TitleDetailViewModel(
			titlesService: MockTitlesService(shouldFail: true)
		)
	}

	static var previewLoading: TitleDetailViewModel {
		return TitleDetailViewModel(
			titlesService: MockTitlesService(delay: .seconds(5))
		)
	}
	
}
#endif
