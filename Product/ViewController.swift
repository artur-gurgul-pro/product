//
//  ViewController.swift
//  Product
//
//  Created by Artur Gurgul on 07.12.23.
//

import UIKit
import SPUtils

struct User {
    let id: Int
    let name: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let users = [User(id: 1, name: "Artur"), User(id: 2, name: "Michał")]
        
        let map = users.dictionay(keyPath: \.id)
        
        print(map[1]?.name)
    }


}

