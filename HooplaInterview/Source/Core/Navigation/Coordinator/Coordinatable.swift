//
//  Coordinatable.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import Foundation
import SwiftUI

protocol Coordinatable: Hashable {
	associatedtype Screen: View

	var id: String { get }

	@ViewBuilder
	func view() -> Screen
}
