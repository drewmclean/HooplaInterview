//
//  AppView.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import SwiftUI

struct AppView: View {
	@State var coordinator: Coordinator = Coordinator()

	var body: some View {
		NavigationStack(path: $coordinator.navigationPath) {
			AppScreen.popularTitles.view()
				.navigationDestination(for: AppScreen.self) { screen in
					screen.view()
				}
				.fullScreenCover(item: $coordinator.fullScreenCover) { item in
					item.view()
				}
		}
		.environment(coordinator)
	}
	
}
