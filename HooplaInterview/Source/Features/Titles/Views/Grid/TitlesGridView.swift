//
//  MoviesGridView.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import SwiftUI

struct MoviesGridView: View {
	@Environment(Coordinator.self) private var coordinator

	@State private var viewModel: TitlesGridViewModel

	private static let gridSpacing: Double = 8

	private let columns = [
		GridItem(.flexible(), spacing: gridSpacing),
		GridItem(.flexible(), spacing: gridSpacing),
		GridItem(.flexible(), spacing: gridSpacing)
	]

	init(viewModel: TitlesGridViewModel) {
		self._viewModel = State(initialValue: viewModel)
	}

	var body: some View {
		ZStack {
			if viewModel.isLoading {
				ProgressView()
			} else if let _ = viewModel.error {
				Text("We're sorry but something went wrong.")
			} else {
				ScrollView {
					LazyVGrid(columns: columns, spacing: Self.gridSpacing) {
						ForEach(viewModel.titles) { title in
							TitleGridItem(title: title)
								.onTapGesture {
									coordinator.push(.titleDetail(title))
								}
						}
					}
					.padding()
				}
				.scrollIndicators(.hidden)
			}
		}
		.navigationTitle(viewModel.viewTitle)
		.task {
			await viewModel.loadTitles()
		}
	}

}

#Preview("Default") {
	NavigationStack {
		MoviesGridView(viewModel: .preview)
	}
	.environment(Coordinator())
}

#Preview("Loading") {
	NavigationStack {
		MoviesGridView(viewModel: .previewLoading)
	}
	.environment(Coordinator())
}

#Preview("Error") {
	NavigationStack {
		MoviesGridView(viewModel: .previewError)
	}
	.environment(Coordinator())
}

