//
//  PlayerViewController.swift
//  TestHype
//
//  Created by ulixe on 08/09/2021.
//

import UIKit

class PlayerViewController: UIViewController {

    let tableView = UITableView()
    var player: NbaPlayer?
    weak var coordinator: NbaCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(PlayerCell.self, forCellReuseIdentifier: "playerCell")
        tableView.setup(vc: self)
    }
}

extension PlayerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? PlayerCell, let player = player else { return UITableViewCell() }
        let name = player.firstName ?? ""
        let surname = player.lastName ?? ""
        cell.config(
            name: name + " " + surname,
            team: player.team?.fullName ?? "",
            position: player.position ?? "",
            conference: player.team?.conference ?? "",
            division: player.team?.division ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
}



