//
//  ViewController.swift
//  MoreNBA
//
//  Created by Oleh Pauk on 31.08.2022.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var players: [Player] = []
    let apiClient: ApiClient = ApiClientImpl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Players"
        navigationController?.navigationBar.prefersLargeTitles = true
        reload()
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
    
    @IBAction func reloadButtonClick(_ sender: UIButton) {
        reload()
    }
    
    func showLoading() {
        activityIndicator.startAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    func showError() {
        activityIndicator.stopAnimating()
        errorLabel.isHidden = false
        reloadButton.isHidden = false
    }
    
    func showData() {
        activityIndicator.stopAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    func reload() {
        showLoading()
        apiClient.getPlayers(completion: {result in
            DispatchQueue.main.async {
                switch result {
                case.success(let players):
                    self.players = players
                    self.tableView.reloadData()
                    self.showData()
                case.failure:
                    self.players = []
                    self.tableView.reloadData()
                    self.showError()
                }
            }
        })
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "PlayerDetailsViewController") as! PlayerDetailsViewController
        
        viewController.player = players[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

