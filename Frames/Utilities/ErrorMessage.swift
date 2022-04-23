//
//  ErrorMessage.swift
//  Frames
//
//  Created by Aleksandra on 08.04.2022.
//

import Foundation

enum ErrorMessage: String, Error {
case unableToComplite = "Unable to complited your request. Please check your internet connection."
case invalidResponse = "Ivalid response from server. Please, try again."
case invalidData = "The data received from server was invalid. Please try again."
case wrongName = "No results for this query. Try something else."
}
