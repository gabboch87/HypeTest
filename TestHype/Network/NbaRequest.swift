//
//  NbaRequest.swift
//  TestHype
//
//  Created by ulixe on 08/09/2021.
//

import Foundation

struct NbaRequest {
    func getAllTeams(completion: @escaping(Result<[NbaTeam], NbaError>) -> Void){
        let headers = [
            "x-rapidapi-host": "free-nba.p.rapidapi.com",
            "x-rapidapi-key": "1fc4b4be27mshdc06ad905943d0cp135f5ajsn020f6c5fcf95"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://free-nba.p.rapidapi.com/teams?page=0")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let resp = try decoder.decode(GetAllTeamsResponse.self, from: jsonData)
                completion(.success(resp.data))
            } catch {
                completion(.failure(.cantProcessData))
            }
        })

        dataTask.resume()
    }
    
    func getAllPlayers(completion: @escaping(Result<[NbaPlayer], NbaError>) -> Void) {
        let headers = [
            "x-rapidapi-host": "free-nba.p.rapidapi.com",
            "x-rapidapi-key": "1fc4b4be27mshdc06ad905943d0cp135f5ajsn020f6c5fcf95"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://free-nba.p.rapidapi.com/players?per_page=5000&page=0")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let resp = try decoder.decode(GetAllPlayersResponse.self, from: jsonData)
                completion(.success(resp.data))
            } catch {
                completion(.failure(.cantProcessData))
            }
        })

        dataTask.resume()
        
    }
    
    
    
}
