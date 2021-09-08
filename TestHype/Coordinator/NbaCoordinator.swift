//
//  NbaCoordinator.swift
//  TestHype
//
//  Created by ulixe on 08/09/2021.
//

import Foundation
import UIKit

protocol NbaCoordinatorDelegate: class {
    var children: [NbaCoordinator] {get set}
    var nav: UINavigationController {get set}
    func start()
    func pushTeam(fullName: String, teamPlayers: [NbaPlayer])
    func pushPlayer(teamPlayer: NbaPlayer)
}

class NbaCoordinator: NbaCoordinatorDelegate {
    var children = [NbaCoordinator]()
    
    var nav: UINavigationController
    
    init(navController: UINavigationController) {
        self.nav = navController
    }
    
    func start() {
        let vc = TeamsViewController()
        vc.coordinator = self
        nav.pushViewController(vc, animated: false)
    }
    
    func pushTeam(fullName: String, teamPlayers: [NbaPlayer]) {
        let vc = TeamViewController()
        vc.coordinator = self
        vc.title = fullName
        vc.teamPlayers = teamPlayers
        self.nav.pushViewController(vc, animated: true)
    }
    
    func pushPlayer(teamPlayer: NbaPlayer) {
        let vc = PlayerViewController()
        let name = teamPlayer.firstName ?? ""
        let surname = teamPlayer.lastName ?? ""
        vc.title = name + " " + surname
        vc.player = teamPlayer
        vc.coordinator = self
        self.nav.pushViewController(vc, animated: true)
    }
}
