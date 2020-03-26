//
//  ViewController.swift
//  MVVMTask
//
//  Created by tamimy on 3/21/20.
//  Copyright © 2020 tamimy. All rights reserved.
//

import UIKit

class UsersVC: UIViewController {

    @IBOutlet weak var usersTV: UITableView!
    
    let viewModel: UserHandler = UserHandler()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        usersTV.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addUserBtn(_ sender: Any)
    {
        let addNewObj = storyboard?.instantiateViewController(withIdentifier: "AddNewUserVC") as? AddNewUserVC
        addNewObj?.viewModel = viewModel
        self.present(addNewObj!, animated: true, completion: nil)
    }
}

extension UsersVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getUsersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = viewModel.getUserData(index: indexPath).username
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC
        details?.index = indexPath
        details?.viewModel = viewModel
        self.present(details!, animated: true, completion: nil)
    }
    
    
}

