//
//  ImageLoaderView.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
	let urlString: String
	let resizingMode: ContentMode = .fill

	var body: some View {
		Rectangle()
			.opacity(0.001)
			.overlay {
				WebImage(url: .init(string: urlString))
					.resizable()
					.indicator(.activity)
					.aspectRatio(contentMode: resizingMode)
					.allowsHitTesting(false)
			}
			.clipped()
	}

}

#Preview {
	ImageLoaderView(urlString: Constants.randomImage)
		.frame(width: 100, height: 300)
}
