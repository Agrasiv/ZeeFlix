//
//  FavouriteDAO.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation
import FMDB

class FavouriteDAO {
    static let shared = FavouriteDAO()
    
    var filePath: String?
    func addFav(id: Int, name : String, photo: String) -> Bool {
        self.filePath = DBUtility.shared.databaseFilePath()
        let db = FMDatabase(path: self.filePath)
        if !db.open() {
            return false
        }
        do {
            if db.open() {
                try db.executeUpdate("INSERT INTO tblfavouritemovies (id, name, photo) VALUES (?, ?, ?)", values: [id, name, photo])
                return true
            } else {
                print("error1")
            }
            db.close()
        } catch {
            print("error")
        }
        return false
    }
}
