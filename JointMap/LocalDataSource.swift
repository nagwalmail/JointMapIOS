//
//  ServicesProvider.swift
//  JointMap
//
//  Created by Aleksey Kayryak on 19.01.2021.
//

import Foundation

protocol LocalDataSource: class {
    var railroadRepository: RailroadRepository { get }
}

final class DefaultLocalDataSource: LocalDataSource {
    let railroadRepository: RailroadRepository
    
    init() {
        let url = Bundle.main.url(forResource: "data.sqlite", withExtension: nil)
        railroadRepository = RailroadRepositorySqlite(filename: url?.path ?? "")
    }
}
