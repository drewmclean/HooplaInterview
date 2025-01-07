//
//  MovieDetailView.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import SwiftUI

struct TitleDetailView: View {
	let titleId: Int
	@State private var viewModel: TitleDetailViewModel
	@Environment(Coordinator.self) private var coordinator

	init(titleId: Int, viewModel: TitleDetailViewModel) {
		self.titleId = titleId
		self._viewModel = State(initialValue: viewModel)
	}

	var body: some View {
		ZStack {
			if viewModel.isLoading {
				ProgressView()
					.scaleEffect(1.5) 
					.progressViewStyle(CircularProgressViewStyle())
			} else if let _ = viewModel.error {
				errorText
			} else if let title = viewModel.titleDetail {
				detailContent(title: title)
			}
		}
		.task {
			await viewModel.loadTitleDetail(titleId: titleId)
		}
		.alert("Start watching \(viewModel.titleDetail?.title ?? "")", isPresented: $viewModel.showWatchPopup) {
			Button("OK", role: .cancel) {
				
			}
		}
	}

	private var errorText: some View {
		Text("We're sorry but something went wrong. Please try again.")
			.font(.body)
			.foregroundStyle(.secondary)
			.multilineTextAlignment(.center)
			.padding(.horizontal, 60)
	}

	private func detailContent(title: TitleDetail) -> some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 16) {
				ImageLoaderView(urlString: title.imageUrl)
					.aspectRatio(contentMode: .fill)
				
				VStack(alignment: .leading, spacing: 4) {
					Text(title.title)
						.font(.title2)
						.bold()

					Text(title.contentType.title)
						.font(.caption)
						.foregroundStyle(.secondary)

					Text("By: \(title.author)")
						.font(.caption)
						.foregroundStyle(.secondary)
				}

				Text(title.synopsis)
					.font(.body)

				Button(action: {
					viewModel.showWatchPopup = true
				}) {
					Label(
						playButtonTitle(for: title.contentType),
						systemImage: "play.circle"
					)
					.padding(.vertical, 8)
					.font(.title2)
					.frame(maxWidth: .infinity)
					.background(Color.blue)
					.foregroundColor(.white)
					.clipShape(RoundedRectangle(cornerRadius: 8))
				}
			}
			.padding()
		}
		.scrollIndicators(.hidden)
	}

}

extension TitleDetailView {

	private func playButtonTitle(for contentType: TitleContentType) -> String {
		switch contentType {
		case .tv, .movie:
			return "Watch"
		case .audiobook, .music:
			return "Listen"
		case .comic:
			return "Read"
		}
	}

}

#Preview("Default") {
	TitleDetailView(titleId: 0, viewModel: .preview())
		.environment(Coordinator())
}

#Preview("Error") {
	TitleDetailView(titleId: 0, viewModel: .previewError)
		.environment(Coordinator())
}

#Preview("Loading") {
	TitleDetailView(titleId: 0, viewModel: .previewLoading)
		.environment(Coordinator())
}
