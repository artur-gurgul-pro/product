//
//  ViewController.swift
//  Product
//
//  Created by Artur Gurgul on 07.12.23.
//

import UIKit
import Combine
import SPUtils
import SPRepositories
import SPContract
import SPModels


class ViewController: UIViewController {
    
    var cancelables = Set<AnyCancellable>()
    
    @Injected(\.usersRepository) var usersRepository: AnyUsersRepository
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersRepository
            .getAll()
            .catch { _ in Empty<User, Never>() }
            .collect()
            .sink { users in
                let map = users.dictionay(keyPath: \.id)
                print(map[1]?.name)
            }.store(in: &cancelables)
    }
}

