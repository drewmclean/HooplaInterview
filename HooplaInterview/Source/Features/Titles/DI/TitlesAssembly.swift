//
//  TitlesAssembly.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import SwiftUI

@MainActor
enum TitlesAssembly {
	private static let sharedService: TitlesService = {
		let client = HTTPClient()
		return TitlesService(client: client)
	}()

	static func makePopularTitlesView() -> some View {
		let viewModel = TitlesGridViewModel(viewTitle: "Popular Titles", titlesService: sharedService)
		return MoviesGridView(viewModel: viewModel)
	}

	static func makeTitleDetailView(titleId: Int) -> some View {
		let viewModel = TitleDetailViewModel(titlesService: sharedService)
		return TitleDetailView(titleId: titleId, viewModel: viewModel)
	}

	static func makeTitlePlayerView(titleId: Int) -> some View {
		return ZStack {
			Color.green
			Text("Play Movie")
		}
	}
}
