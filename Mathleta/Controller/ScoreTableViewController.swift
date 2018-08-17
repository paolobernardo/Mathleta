//
//  ScoreTableViewController.swift
//  Mathleta
//
//  Created by Paolo Bernardo on 14/08/18.
//  Copyright © 2018 Paolo Bernardo. All rights reserved.
//

import UIKit
import RealmSwift

class ScoreTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var players : Results<Player>?
    let realm = try! Realm()
    
    @IBOutlet weak var scoreTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreTableView.delegate = self
        scoreTableView.dataSource = self
        
        fetchPlayers()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players?.count ?? 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath)
        
        if let player = players?[indexPath.row]{
            cell.textLabel?.text = player.name
            cell.detailTextLabel?.text = "\(player.score)"
        }
        
        return cell
    }
    
    
    func fetchPlayers(){
        players = realm.objects(Player.self)
        players = players?.sorted(byKeyPath: "score", ascending: false)
        scoreTableView.reloadData()
    }

    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
