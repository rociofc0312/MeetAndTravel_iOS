//
//  UserTypeViewController.swift
//  meet&travel
//
//  Created by Miguel on 21/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class UserTypeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBackToLoginView(_ sender: UIBarButtonItem) {
        //self.performSegue(withIdentifier: "unwindToLoginViewController", sender: self)
        let loginView = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as!LoginViewController
        present(loginView, animated: true, completion: hnil)
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
