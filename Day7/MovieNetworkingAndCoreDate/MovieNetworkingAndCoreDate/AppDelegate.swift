//
//  AppDelegate.swift
//  MovieNetworkingAndCoreDate
//
//  Created by Esraa Hassan on 4/1/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var manageContext: NSManagedObjectContext?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        manageContext = persistentContainer.viewContext

        return true
    }
    
    func saveRemoteMovies(movies:[Movie])->[RemoteMovie]{
        var remoteMovie = [RemoteMovie]()
        guard let entity = NSEntityDescription.entity(forEntityName: "RemoteMovie",in: manageContext!)else{
            fatalError("Couldn't find entity discription!")
        }
        for data in movies{
            let movie = RemoteMovie(entity: entity, insertInto: manageContext)
            movie.setValue(data.name, forKey: "name")
            movie.setValue(data.image, forKey: "image")
            movie.setValue(data.releaseYear, forKey: "releaseYear")
            movie.setValue(data.rate, forKey: "rate")
//            movie.releaseYear = data.releaseYear as? NSDecimalNumber
//            movie.rate = data.rate
//
//            movie.image = data.image
            print("image added")
            var genreString = ""
            for movieGenre in data.genre{
                genreString += movieGenre
                genreString += ", "
            }
            movie.setValue(genreString, forKey: "genre")
            remoteMovie.append(movie)
        }
        do{
            try manageContext?.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        return remoteMovie
    }
    
    func saveLocalMovies(movieObject:Movie)->LocalMovie{
        
        guard let entity = NSEntityDescription.entity(forEntityName: "LocalMovie",in: manageContext!)else{
            fatalError("Couldn't find entity discription!")
        }
        let savedMovie = LocalMovie(entity: entity, insertInto: manageContext)
        
        savedMovie.setValue(movieObject.name, forKey: "name")
        savedMovie.setValue(movieObject.image, forKey: "image")
        savedMovie.setValue(movieObject.releaseYear, forKey: "releaseYear")
        savedMovie.setValue(movieObject.rate, forKey: "rate")
        
        var genreString = ""
        for movieGenre in movieObject.genre{
            genreString += movieGenre
        }
        savedMovie.setValue(genreString, forKey: "genre")
        do{
            try manageContext?.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        return savedMovie
    }
    
    func clearRemoteMovies(movies: [RemoteMovie]){
        do{
            for movie in movies{
                manageContext?.delete(movie)
            }
            try manageContext?.save()
        }
        catch{
            print("error in clear remote Movies")
        }
        
    }
    
    func getRemoteMovies()->[RemoteMovie]{
        var remoteMovies = [RemoteMovie]()
        let fetchRequest = NSFetchRequest<RemoteMovie>(entityName: "RemoteMovie")
        
        do{
            remoteMovies = try manageContext!.fetch(fetchRequest)
        }
        catch{
            print("error in fetch remoteMovie")
        }
        return remoteMovies
    }
    
    func getLocalMovies()->[LocalMovie]{
        var remoteMovies = [LocalMovie]()
        let fetchRequest = NSFetchRequest<LocalMovie>(entityName: "LocalMovie")
        
        do{
            remoteMovies = try manageContext!.fetch(fetchRequest)
        }
        catch{
            print("error in fetch localMovie")
        }
        return remoteMovies
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "MovieNetworkingAndCoreDate")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

