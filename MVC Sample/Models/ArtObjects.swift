//
//  ArtObject.swift
//  MVC Sample
//
//  Created by Roma Gritsuk on 27/01/2023.
//

import Foundation

struct ArtOdjectsResponse: Decodable{
    let artObjects: [ArtObject]
}

struct ArtObject: Decodable{
    let id: String
    let objectNumber: String
    let title: String
    let headerImage: HeaderImage
}

struct HeaderImage: Decodable {
    let url: String
}
