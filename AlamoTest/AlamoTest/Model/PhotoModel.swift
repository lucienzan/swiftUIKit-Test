//
//  PhotoModel.swift
//  AlamoTest
//
//  Created by Daniel on 1/15/24.
//
import UIKit

struct APIPhotoResponse : Codable
{
    let results : [Result]
}

struct Result : Codable {
    let id : String
    let description : String?
    let urls : GetURL
    let user : User
}

struct GetURL : Codable {
    let regular : String
}

struct User: Codable {
    let id : String
    let username : String
    let name : String
}
