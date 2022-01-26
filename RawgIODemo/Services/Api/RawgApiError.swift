//
//  RawgApiError.swift
//  RagwIODemo
//
//  Created by Gokhan Mutlu on 23.01.2022.
//

import Foundation

enum RawgApiError: Error{
	case anyError(Error)
	case jsonParsing(String)
	case statusCodeNot200(String)
}
