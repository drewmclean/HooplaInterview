//
//  Routing.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import Foundation
import SwiftUI

enum AppScreen : Hashable, @preconcurrency Coordinatable {
	case popularTitles
	case titleDetail(TitleSummary)

	var id: String {
		switch self {
		case .popularTitles:
			return "popularTitles"
		case .titleDetail(let title):
			return "titleDetail_\(title.id)"
		}
	}

	@MainActor
	@ViewBuilder
	func view() -> some View {
		switch self {
		case .popularTitles:
			TitlesAssembly.makePopularTitlesView()
		case .titleDetail(let movie):
			TitlesAssembly.makeTitleDetailView(titleId: movie.id)
		}
	}
}

enum FullScreenCover: String, Identifiable, @preconcurrency Coordinatable {
	var id: String {
		self.rawValue
	}

	case moviePlayer

	@MainActor
	@ViewBuilder
	func view() -> some View {
		switch self {
		case .moviePlayer:
			TitlesAssembly.makeTitlePlayerView(titleId: 0)
		}
	}
	
}
