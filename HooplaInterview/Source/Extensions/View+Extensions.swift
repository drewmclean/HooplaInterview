//
//  View+Extensions.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import SwiftUI

extension View {

	func imageOverlayGradientBackground() -> some View {
		self
			.background(LinearGradient(
				colors: [.black.opacity(0), .black.opacity(0.3), .black.opacity(0.5), .black],
				startPoint: .top,
				endPoint: .bottom
			))
	}

}
