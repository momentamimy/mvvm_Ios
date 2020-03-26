//
//  ViewModel.swift
//  MVVMTask
//
//  Created by tamimy on 3/22/20.
//  Copyright © 2020 tamimy. All rights reserved.
//

import Foundation

class UserHandler: NSObject {
    
    var userArr: [User] = []
    
    override init() {
        super.init()
        dummyUsers()
    }
    
    func dummyUsers()
    {
        for i in 1...5
        {
            let user = User(username: "\(i)- tamimy", password: "0123456")
            userArr.append(user)
        }
    }
    
    func getUsersCount() -> Int {
        return userArr.count
    }
    
    func getUserData(index: IndexPath) -> User {
        return userArr[index.row]
    }
    
    func addUser(username: String, password: String) -> Bool {
        let user = User(username: username, password: password)
        userArr.append(user)
        return true
    }
    
    func deleteUser(index: IndexPath)
    {
        userArr.remove(at: index.row)
    }
}
