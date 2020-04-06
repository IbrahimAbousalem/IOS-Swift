//
//  SqliteManager.swift
//  MoviesWithSqlite
//
//  Created by Esraa Hassan on 3/30/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import Foundation
import SQLite3

class SqliteManager {
    static var sqliteManager: SqliteManager = SqliteManager()
    var db: OpaquePointer?
    let dbPath: String = "myDb.sqlite"
    var fileURL: String?
    let createTableString = """

"""
    let insertStatementString = "INSERT INTO Movie (Name, ReleaseDate, Image, Rate) VALUES (?, ?, ?, ?);"
    let queryStatementString = "SELECT * FROM Movie;"

    private init(){
        fileURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath).path
        db = openDatabase()
        createTable()
    }
    
    func openDatabase() -> OpaquePointer? {
        var db: OpaquePointer?
        
        guard let path = fileURL else {
            print("part1DbPath is nil.")
            return nil
        }
        if sqlite3_open(path, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(path)")
            return db
        } else {
            print("Unable to open database.")
            return nil
        }
    }
    
    func createTable() {
        var createTableStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) ==
            SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("\nMovie table created.")
            } else {
                print("\nMovie table is not created.")
            }
        } else {
            print("\nMovie TABLE statement is not prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insert(movie: Movie) {
        var insertStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) ==
            SQLITE_OK {
            let name: String = movie.name
            let releaseDate: String = movie.releaseDate
            let image: String = movie.image
            let rate: Float = movie.rate
            
            sqlite3_bind_text(insertStatement, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (releaseDate as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (image as NSString).utf8String, -1, nil)
            sqlite3_bind_double(insertStatement, 4, Double(rate))

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("\nSuccessfully inserted row.")
            } else {
                print("\nCould not insert row.")
            }
        } else {
            print("\nINSERT statement is not prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func getAllMovieQuery()->[Movie]{
        var queryStatement: OpaquePointer?
        var movies:[Movie] = [Movie]()
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) ==
            SQLITE_OK {
   
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                // 3
                let name = sqlite3_column_text(queryStatement, 0)
                let releaseDate = sqlite3_column_text(queryStatement, 1)
                let image = sqlite3_column_text(queryStatement, 2)
                let rate = sqlite3_column_double(queryStatement, 3)
                
                let movie = Movie(name: String(cString: name!), releaseDate: String(cString: releaseDate!), image: String(cString: image!), rate: Float(rate))
                movies.append(movie)
                
                print("\nQuery Result:")
                //print("\(name)) | \(String(describing: image))")
                
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
        return movies
    }
    
}
