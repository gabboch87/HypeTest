//
//  TeamViewController.swift
//  TestHype
//
//  Created by ulixe on 07/09/2021.
//

import UIKit

class TeamViewController: UIViewController {

    let tableView = UITableView()
    var teamPlayers: [NbaPlayer]?
    weak var coordinator: NbaCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "customCell")
        tableView.setup(vc: self)
    }
}

extension TeamViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamPlayers?.count ?? 0 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomCell, let players = teamPlayers else { return UITableViewCell() }
        let name = players[indexPath.row].firstName ?? ""
        let surname = players[indexPath.row].lastName ?? ""
        cell.config(fullName: name + " " + surname, conference: teamPlayers?[indexPath.row].position ?? "", fakeImage: true)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let player = teamPlayers?[indexPath.row] else { return }
        coordinator?.pushPlayer(teamPlayer: player)
    }
}



