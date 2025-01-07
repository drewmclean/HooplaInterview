//
//  TitleDetail.swift
//  HooplaInterview
//
//  Created by Andrew McLean on 1/7/25.
//

import Foundation

struct TitleDetail: Decodable, Identifiable, Hashable {
	let id: Int
	let title: String
	let author: String
	let imageUrl: String
	let contentType: TitleContentType
	let synopsis: String

	enum CodingKeys: String, CodingKey {
		case id
		case title
		case author
		case imageUrl = "image_url"
		case contentType = "content_type"
		case synopsis
	}
}
