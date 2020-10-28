//
//  PomoFileManager.swift
//  Pomopomo
//
//  Created by Vinh Pham on 10/25/20.
//

import Foundation
import UniformTypeIdentifiers
import FileProvider

var logFile = pomoFile()

struct pomoFile {
    
    // Contains the directory of the app's log file
    static var logFileDir : URL?
    
    // Get the document directory of the app
    private func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // Standard init, create a logFileDir
    init(){
        
        if pomoFile.logFileDir == nil {
            pomoFile.logFileDir = self.getDocumentDirectory().appendingPathComponent("log.txt")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
    }
    
    // Write the content to the log file
    func write(content: String){
        do {
            try content.write(to: pomoFile.logFileDir!, atomically: true, encoding: .utf8)
        } catch {
            print("Writting error occured", error.localizedDescription)
        }
    }
    
    // Read the content from the log file
    func read() -> String{
        var fileContent : String
        
        do {
            fileContent = try String(contentsOf: pomoFile.logFileDir!)
            print(fileContent)
        } catch {
            print("Reading error occured", error.localizedDescription)
            fileContent = error.localizedDescription
        }
        
        return fileContent
    }
    
    func clear() {
        let emptyString = ""
        do {
            try emptyString.write(to: pomoFile.logFileDir!, atomically: false, encoding: .utf8)
        } catch {
            print(error)
        }
    }
}


