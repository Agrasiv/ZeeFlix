//
//  DBUtility.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation
import FMDB

class DBUtility {
    static let shared = DBUtility()
    
    func databaseFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let dir = paths[0] as NSString
        let db_path = dir.appendingPathComponent("FavouriteMovies.db")
        let source_localdb = (Bundle.main.resourcePath! as NSString).appendingPathComponent("www/FavouriteMovies.db")
        if !FileManager.default.fileExists(atPath: db_path){
            do {
                try FileManager.default.copyItem(atPath: source_localdb, toPath: db_path as String)
                return dir.appendingPathComponent("FavouriteMovies.db")
            } catch let error as NSError {
                print("Unable to create directory \(error)")
            }
        }
        return dir.appendingPathComponent("app.db")
    }
}
