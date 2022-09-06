//
//  TeamDetailsViewController.swift
//  MoreNBA
//
//  Created by Oleh Pauk on 04.09.2022.
//

import UIKit

class TeamDetailsViewController: UIViewController {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conferenceLabel: UILabel!
    
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = team?.name
        cityLabel.text = team?.city
        conferenceLabel.text = team?.conference
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
