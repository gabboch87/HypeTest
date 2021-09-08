//
//  TeamsViewController.swift
//  TestHype
//
//  Created by ulixe on 07/09/2021.
//

import UIKit

class TeamsViewController: UIViewController {

    let tableView = UITableView()
    var nbaTeams = [NbaTeam]() {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
    }
    var nbaPlayers: [NbaPlayer]?
    let manager = NbaManager()
    weak var coordinator: NbaCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupTableView()
        getTeams()
        getPlayers()
    }

    func setupNavigationController(){
        self.title = "NBA TEAMS"
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "customCell")
        tableView.setup(vc: self)
    }
    
    func getTeams(){
        let loader = self.loader()
        manager.getTeams { [weak self] teams in
            self?.stopLoader(loader: loader)
            self?.nbaTeams = teams
        } onError: {
            self.stopLoader(loader: loader)
            self.showErrorAlert(title: "Ops!", message: "No data available", retry: true) {
                self.getTeams()
            }
        }
    }
    
    func getPlayers(){
        manager.getPlayers { [weak self] players in
            self?.nbaPlayers = players
        } onError: {}
    }
}

extension TeamsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nbaTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        cell.config(fullName: nbaTeams[indexPath.row].fullName ?? "", conference: nbaTeams[indexPath.row].conference ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teamPlayers = nbaPlayers?.filter { (player) -> Bool in
            player.team?.fullName == nbaTeams[indexPath.row].fullName
        }
        if let players = teamPlayers, !players.isEmpty {
            coordinator?.pushTeam(fullName: nbaTeams[indexPath.row].fullName ?? "", teamPlayers: players)
        } else {
            self.showErrorAlert(title: "Ops!", message: "No data available", retryCompletion: {})
        }
    }
}


