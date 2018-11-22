//
//  LoginViewController.swift
//  meet&travel
//
//  Created by Miguel on 21/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import os
class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var user: Any?
    var token: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInButton(_ sender: Any){
        MeetAndTravelApi.requestLogin(authorization: "", parameters: buildRequest(), responseHandler: handleResponse, errorHandler: handleError)
    }
    
    func buildRequest() -> [String:String]{
        let user = [
            "email" : emailTextField.text,
            "password": passwordTextField.text
        ]
        
        return user as! [String: String]
    }
    
    
    func handleResponse(response: NetworkResponse) {
        
        if response.token != nil {
            
            let user = response.user
            let userToken = response.token
            
            let encoder = JSONEncoder()
            let defaults = UserDefaults.standard
            
            //Encoding object to save it on user defaults
            if let encoded = try? encoder.encode(user){
                defaults.set(encoded, forKey: "SavedUser")
            }
            
            defaults.set(userToken, forKey: "SavedToken")
            //Check if object was saved
            if let savedUser = defaults.object(forKey: "SavedUser") as? Data{
                let decoder = JSONDecoder()
                if let loadedUser = try? decoder.decode(User.self, from: savedUser){
                    print(loadedUser)
                }
            }
            
            //Perform segue to change view
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    
    func handleError(error: Error) {
        let message = "Error on Sources Request: \(error.localizedDescription)"
        os_log("%@", message)
        let alertController = UIAlertController(title: "Alert", message: "Invalid email or password", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title:"Accept", style: UIAlertAction.Style.default,handler:nil))
        
        self.present(alertController,animated: true, completion: nil)
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
