//
//  TitleContentType.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//


enum TitleContentType : String, Decodable {
	case movie
	case audiobook
	case comic
	case tv
	case music
}

extension TitleContentType {
	var title: String {
		switch self {
		case .audiobook: "Audiobook"
		case .comic: "Comic"
		case .movie: "Movie"
		case .music: "Music"
		case .tv: "TV Show"
		}
	}

	var actionTitle: String {
		switch self {
		case .tv, .movie, .comic:
			return "Watch"
		case .audiobook, .music:
			return "Listen"
		}
	}

	var symbolName: String {
		switch self {
		case .audiobook: "beats.headphones"
		case .comic, .tv, .movie: "play.tv"
		case .music: "music.note"
		}
	}

}
