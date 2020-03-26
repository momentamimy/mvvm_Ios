//
//  DetailsVC.swift
//  MVVMTask
//
//  Created by tamimy on 3/21/20.
//  Copyright © 2020 tamimy. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var deleteBtnOutlet: UIButton!
    
    var viewModel: UserHandler = UserHandler()
    var index: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        usernameLbl.text = viewModel.getUserData(index: index ?? IndexPath(row: 0, section: 0)).username
        passwordLbl.text = viewModel.getUserData(index: index ?? IndexPath(row: 0, section: 0)).password
        
    }
    
    func setupView()
    {
        usernameLbl.layer.masksToBounds = true
        usernameLbl.layer.cornerRadius = 8
        
        passwordLbl.layer.masksToBounds = true
        passwordLbl.layer.cornerRadius = 8
        
        deleteBtnOutlet.layer.masksToBounds = true
        deleteBtnOutlet.layer.cornerRadius = 15
        
    }
    
    @IBAction func deleteBtn(_ sender: Any)
    {
        viewModel.deleteUser(index: index ?? IndexPath(row: 0, section: 0))
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
