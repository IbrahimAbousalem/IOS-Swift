//
//  Manager.swift
//  Employee-Manager
//
//  Created by Esraa Hassan on 3/25/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import Foundation

class Manager : Person{
    override func getSalary() -> Double {
        return salary * 2
    }
}
