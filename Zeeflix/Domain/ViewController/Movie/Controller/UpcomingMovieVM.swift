//
//  UpcomingMovieVM.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation
import CoreData
import UIKit

protocol UpcomingMovieVMProtocol {
    func loadUpcomingMovie()
}

class UpcomingMovieVM : BaseVM, UpcomingMovieVMProtocol {
    
    var upcomingMovieList : (([UpcomingMovieResponseData]) -> Void)?
    
    func loadUpcomingMovie() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UpcomingMovie")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        self.loading?(true)
        UpcomingMovieDAO.shared.getUpcomingMovie { [weak self] (response, error) in
            guard let self = self else {return}
            self.loading?(false)
            if let data = response?.data {
                self.upcomingMovieList?(data)
                for upcoming in data {
                    request.predicate = NSPredicate(format: "title == %@", upcoming.title ?? "")
                    do {
                        let results:[Any] = try context.fetch(request)
                        if results.count == 0 {
                            setupDatabaseForUpcomingMovie(dbName: "UpcomingMovie", image: upcoming.backdrop_path ?? "", title: upcoming.original_title ?? "")
                        } else {
                            
                        }
                    } catch {
                        
                    }
                }
            } else {
               
                do {
                    let result = try context.fetch(request)
                    let data = result as! [UpcomingMovieResponseData]
                    self.upcomingMovieList?(data)
                } catch let err as NSError {
                    print(err.debugDescription)
                }

                self.error?(error!.localizedDescription)
                return
            }
        }
    }
    
    func setupDatabaseForUpcomingMovie(dbName: String, image: String, title: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: dbName, in: context)
        let new = NSManagedObject(entity: entity!, insertInto: context)
        new.setValue(title, forKey: "image")
        new.setValue(image, forKey: "title")
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        
    }
    
    
}

    
