//
//  MockData.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

#if DEBUG

enum PreviewData {
	static let titleSummaries = [
		TitleSummary(
			id: 1,
			title: "Spider-Man",
			author: "Stan Lee",
			imageUrl: Constants.randomImage,
			contentType: .comic
		),
		TitleSummary(
			id: 2,
			title: "The Dark Knight",
			author: "Christopher Nolan",
			imageUrl: Constants.randomImage,
			contentType: .movie
		),
		TitleSummary(
			id: 3,
			title: "Project Hail Mary",
			author: "Andy Weir",
			imageUrl: Constants.randomImage,
			contentType: .audiobook
		),
		TitleSummary(
			id: 4,
			title: "Abbey Road",
			author: "The Beatles",
			imageUrl: Constants.randomImage,
			contentType: .music
		)
	]

	static func titleDetail(contentType: TitleContentType = .audiobook) -> TitleDetail {
		switch contentType {
		case .comic:
			return TitleDetail(
				id: 1,
				title: "Spiderman",
				author: "Stan Lee",
				imageUrl: Constants.randomImage,
				contentType: .comic,
				synopsis: "This is a random comic description."
			)
		case .movie:
			return TitleDetail(
				id: 2,
				title: "The Dark Knight",
				author: "Christopher Nolan",
				imageUrl: Constants.randomImage,
				contentType: .movie,
				synopsis: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice."
			)
		case .audiobook:
			return TitleDetail(
				id: 3,
				title: "Project Hail Mary",
				author: "Andy Weir",
				imageUrl: Constants.randomImage,
				contentType: .audiobook,
				synopsis: "Ryland Grace is the sole survivor on a desperate, last-chance mission—and if he fails, humanity and the Earth itself will perish."
			)
		case .music:
			return TitleDetail(
				id: 4,
				title: "Abbey Road",
				author: "The Beatles",
				imageUrl: Constants.randomImage,
				contentType: .music,
				synopsis: "Abbey Road is the eleventh studio album by the English rock band the Beatles, released on 26 September 1969 by Apple Records."
			)
		case .tv:
			return TitleDetail(
				id: 5,
				title: "Nova",
				author: "PBS",
				imageUrl: Constants.randomImage,
				contentType: .tv,
				synopsis: "Description for Nova TV show goes here."
			)
		}
	}
}

#endif
