//
//  ViewController.swift
//  MoreNBA
//
//  Created by Oleh Pauk on 31.08.2022.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let players: [Player] = [
        Player(
            firstname: "LeBron",
            lastname: "James",
            team: lakers,
            position: "SF",
            height: "6'8''"
        ),
        Player(
            firstname: "Anthony",
            lastname: "Davis",
            team: lakers,
            position: "PF",
            height: "7'0''"
        ),
        Player(
            firstname: "Jimmy",
            lastname: "Butler",
            team: heat,
            position: "SG",
            height: "6'6''"
        ),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Players"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Player", for: indexPath)
        let player = players[indexPath.row]
        cell.textLabel?.text = player.fullName
        cell.detailTextLabel?.text = player.team.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "PlayerDetailsViewController") as! PlayerDetailsViewController
        
        viewController.player = players[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

