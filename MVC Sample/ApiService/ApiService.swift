//
//  ApiService.swift
//  MVC Sample
//
//  Created by Roma Gritsuk on 26/01/2023.
//

import Foundation

class ApiService {
    static let shared = ApiService()
    
    private let session = URLSession.shared
    
    func getArtObjectsPage(compliteon: @escaping ([ArtObject]) -> Void) {
        let task = session.dataTask(with: URLRequest(url: URL(string: ApiConst.apiCollectionsUrl)!)) {
            data, responce, error in
            if let error = error {
                print("HTTP Request faled: \(error)")
            }
            
            guard let data = data else {return}
            
            do{
                let decoder = JSONDecoder()
                let dataResponse = try decoder.decode(ArtOdjectsResponse.self, from: data)
                compliteon(dataResponse.artObjects)
            }catch{
                print("HTTP Request faled: \(error)")
            }
        }
        task.resume()
    }
}
