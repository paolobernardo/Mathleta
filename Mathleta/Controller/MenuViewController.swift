//
//  MenuViewController.swift
//  Mathleta
//
//  Created by Paolo Bernardo on 14/08/18.
//  Copyright © 2018 Paolo Bernardo. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.text = ""
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame"{
            let newPlayer = Player()
            newPlayer.name = nameTextField.text!
            
            let destinationVC = segue.destination as! GameViewController
            destinationVC.player = newPlayer
        }
    }
    
}
