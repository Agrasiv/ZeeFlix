//
//  Database.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 12/11/2023.
//

import Foundation
import FMDB

class Database {
    
    static let sharedInstance = Database()
    var db: FMDatabase?
    
    func openUserDb(userId: String) -> FMDatabase? {
        let userId = userId.uppercased()
        let t = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let s = String(format: "%@/localUser1%@.db", t, userId)
        db = FMDatabase(path: s)
        if let db = db, !db.open() {
            return nil
        }
        return db
    }
}
