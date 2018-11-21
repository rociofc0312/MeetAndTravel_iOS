//
//  RegisterViewController.swift
//  meet&travel
//
//  Created by Developer User on 11/21/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import os

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telephoneTexField: UITextField!
    @IBOutlet weak var dniTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func registerButton(_ sender: Any) {
        MeetAndTravelApi.requestRegister(authorization: "", parameters: buildUser(), responseHandler: handleResponse, errorHandler: handleError)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func buildUser()-> [String: String]{
        let user = [
            "firstname": firstnameTextField.text,
            "lastname": lastnameTextField.text,
            "email": emailTextField.text,
            "telephone": telephoneTexField.text,
            "dni": dniTextField.text,
            "birthdate": birthDateTextField.text,
            "password": passwordTextField.text,
            "confirm_password": confirmPasswordTextField.text
        ]
        return user as! [String : String]
    }
    
    func handleResponse(response: NetworkResponse) {
        print("Message: \(response.message!))")
    }
    
    func handleError(error: Error) {
        let message = "Error on Sources Request: \(error.localizedDescription)"
        os_log("%@", message)
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
