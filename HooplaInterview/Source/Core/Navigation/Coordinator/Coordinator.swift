//
//  Coordinator.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import SwiftUI

@Observable final class Coordinator {
	var navigationPath = NavigationPath()
	var fullScreenCover: FullScreenCover?

	func push(_ screen: AppScreen) {
		navigationPath.append(screen)
	}

	func presentFullScreen(_ cover: FullScreenCover) {
		fullScreenCover = cover
	}

	func pop() {
		navigationPath.removeLast()
	}

	func popToRoot() {
		navigationPath.removeLast(navigationPath.count)
	}

	func dismiss() {
		fullScreenCover = nil
	}

}
