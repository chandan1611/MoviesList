//
//  ApiManager.swift
//  Assignment
//
//  Created by Chandan on 27/02/22.
//

import Foundation
import Alamofire


class ApiManager
{

func getMoview(page: Int, completion : @escaping(Movies ) -> ()) {
       let urlStr = "https://api.themoviedb.org/3/movie/top_rated?api_key=ec01f8c2eb6ac402f2ca026dc2d9b8fd&page=\(page)"
    AF.request(urlStr, method: .get).response { responseData in

      guard let jsonData = responseData.data else {
            return
      }

      let decoder = JSONDecoder()
        do {
            let movies = try decoder.decode(Movies.self, from: jsonData)
            print(movies)
            completion(movies)
        } catch {
            print("getDataList Unexpected error: \(error).")
        }
    }
}
}
