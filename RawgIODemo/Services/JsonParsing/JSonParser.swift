//
//  JSonParser.swift
//  RagwIODemo
//
//  Created by Gokhan Mutlu on 23.01.2022.
//

import Foundation

protocol JSonParser{
	associatedtype T
	associatedtype TError:Error
	func parse(data:Data) -> Result<T,TError>
}


