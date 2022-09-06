//
//  PlayerDetailsViewController.swift
//  MoreNBA
//
//  Created by Oleh Pauk on 31.08.2022.
//

import UIKit

class PlayerDetailsViewController: UIViewController {

    var player: Player?
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var heightNumberLabel: UILabel!
    @IBOutlet weak var teamButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = player?.fullName
        navigationController?.navigationBar.prefersLargeTitles = true
        positionLabel.text = player?.position
        heightNumberLabel.text = player?.height
        teamButton.setTitle(player?.team.fullName, for: .normal)
    }
    
    @IBAction func onTeamButtonTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
        
        viewController.team = player?.team
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    

}
