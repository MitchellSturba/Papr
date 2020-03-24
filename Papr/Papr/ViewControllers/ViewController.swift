//
//  ViewController.swift
//  Papr
//
//  Created by Mitchell Sturba on 2020-03-22.
//  Copyright © 2020 Mitchell Sturba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToFirstScreen(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }


}

