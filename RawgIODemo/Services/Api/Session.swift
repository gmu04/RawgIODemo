//
//  Session.swift
//  RagwIODemo
//
//  Created by Gokhan Mutlu on 23.01.2022.
//

import Foundation

/*
 	A session might be URLSession as expected,
 	or an offline session for development or presenting to client,
	or a TestSession for unit testing.

 */

protocol Session{
	associatedtype Task:DataTask
	
	func dataTask(with url: URL,
				  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> Task
}


protocol DataTask {
	func resume()
}

extension URLSession: Session{ }
extension URLSessionDataTask: DataTask { }

