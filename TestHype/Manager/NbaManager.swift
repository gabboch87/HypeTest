//
//  NbaManager.swift
//  TestHype
//
//  Created by ulixe on 08/09/2021.
//

import Foundation
import UIKit

class NbaManager: NSObject {
    
    override init() { }
    
    func getTeams(onSuccess: @escaping ([NbaTeam])-> Void, onError: @escaping () -> Void) {
        let request = NbaRequest()
        request.getAllTeams { result in
            switch result {
            case .success(let teams):
                onSuccess(teams)
            case .failure(_):
                onError()
            }
        }
    }
    
    func getPlayers(onSuccess: @escaping ([NbaPlayer])-> Void, onError: @escaping () -> Void){
        let request = NbaRequest()
        request.getAllPlayers { result in
            switch result {
            case .success(let players):
                onSuccess(players)
            case .failure(_):
                onError()
            }
        }
    }
}
