//
//  RailroadRepository.swift
//  JointMap
//
//  Created by Aleksey Kayryak on 19.01.2021.
//

import Foundation
import SQLite

protocol RailroadRepository {
    func getRailroads() -> [Railroad]
}

struct Railroad {
    let id: Int
    let name: String
}

class RailroadRepositorySqlite: RailroadRepository {
    private var database: Connection? = nil
    
    init(filename: String) {
        do {
            database = try Connection(filename)
        } catch {
            print("error opening \(filename)")
        }
    }
    
    func getRailroads() -> [Railroad] {
        guard let database = database else { return [] }
        let name = Expression<String>("Name")
        let id = Expression<Int>("ID")
        do {
            let roads = Table("RailRoad")
            return try database.prepare(roads).map { Railroad(id: $0[id], name: $0[name]) }
        } catch {
            return []
        }
    }
}
