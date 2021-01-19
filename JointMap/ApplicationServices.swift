//
//  ApplicationServices.swift
//  JointMap
//
//  Created by Aleksey Kayryak on 19.01.2021.
//

import Foundation

protocol ApplicationServices: class {
    var localDataSource: LocalDataSource { get }
}

class DefaultApplicationServices: ApplicationServices {
    var localDataSource: LocalDataSource
    
    init(localDataSource: LocalDataSource) {
        self.localDataSource = localDataSource
    }
}
