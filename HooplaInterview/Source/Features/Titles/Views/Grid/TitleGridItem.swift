//
//  TitleGridItem.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import SwiftUI

struct TitleGridItem: View {
	let title: TitleSummary

	private let cornerRadius: CGFloat = 4

	var body: some View {
		ZStack {
			VStack(spacing: 0) {
				ImageLoaderView(urlString: title.imageUrl)
					.aspectRatio(0.6, contentMode: .fit)
					.frame(maxHeight: 200)

				VStack(alignment: .leading) {
					Text(title.title)
						.font(.system(size: 11))
						.fontWeight(.semibold)
						.lineLimit(2)
						.truncationMode(.tail)
						.frame(maxWidth: .infinity, alignment: .leading)
					Spacer()

				}
				.frame(height: 36)
				.padding(3.0)
			}
		}
		.background {
			Rectangle()
				.fill(.tertiary.opacity(0.3))
				.clipShape(
					.rect(
						bottomLeadingRadius: cornerRadius,
						bottomTrailingRadius: cornerRadius,
						style: .continuous
					)
				)
		}

	}
}

#Preview {
	ZStack {
		let title: TitleSummary = .init(
			id: 1,
			title: "This is a Title For The Media",
			author: "Andrew McLean",
			imageUrl: Constants.randomImage,
			contentType: .comic
		)

		TitleGridItem(title: title)
			.frame(maxWidth: 120)
	}
}
