//
//  AddNewUserVC.swift
//  MVVMTask
//
//  Created by tamimy on 3/21/20.
//  Copyright © 2020 tamimy. All rights reserved.
//

import UIKit

class AddNewUserVC: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var addBtnOutlet: UIButton!
    
    var viewModel: UserHandler = UserHandler()
    
    override func viewDidLoad() {
        setupView()
        super.viewDidLoad()
    }
    
    func setupView()
    {
        addBtnOutlet.layer.masksToBounds = true
        addBtnOutlet.layer.cornerRadius = 10
    }
    
    @IBAction func addBtn(_ sender: Any)
    {
        let flag: Bool?
        
        let username = usernameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if(!(username.isEmpty) && !(password.isEmpty))
        {
            flag = viewModel.addUser(username: username, password: password)
            
            if(flag ?? false)
            {
                self.dismiss(animated: true, completion: nil)
            }
        }
        else
        {
            usernameTF.placeholder = "fill username field first, please..."
            passwordTF.placeholder = "fill password field first please..."
        }
    }
    
    @IBAction func backBtn(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
