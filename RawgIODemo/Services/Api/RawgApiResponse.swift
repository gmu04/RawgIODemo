//
//  RawgResponse.swift
//  RagwIODemo
//
//  Created by Gokhan Mutlu on 23.01.2022.
//

import Foundation

/**
 Root object for rawg.io api response
 Count: it can be used for paging
 */
struct RawgApiResponse:Decodable{
	let count:Int
	let results:[Game]
}

