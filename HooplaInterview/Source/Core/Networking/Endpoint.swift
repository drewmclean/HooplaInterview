//
//  Endpoint.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import Foundation

enum Endpoint {
	case popularTitles
	case titleDetail(titleId: Int)

	private var baseURL: String {
		"https://midwest-tape.github.io/iOS-coding-challenge"
	}

	var path: String {
		switch self {
		case .popularTitles:
			return "/popular.json"
		case .titleDetail(let titleId):
			return "/title/\(titleId).json"
		}
	}

	var url: URL? {
		URL(string: baseURL + path)
	}

}
