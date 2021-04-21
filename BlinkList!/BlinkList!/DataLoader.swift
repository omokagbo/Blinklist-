//
//  DataLoader.swift
//  BlinkListMini
//
//  Created by omokagbo on 14/04/2021.
//

import Foundation

public class DataLoader {
    @Published var book = [Book]()
    
    init() {
        load()
        sorted()
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "jsonData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let dataFromJson = try JSONDecoder().decode([Book].self, from: data)
                
                self.book = dataFromJson
            } catch {
                print(error)
            }
        }
        
    }
    
    func sorted() {
        self.book = self.book.sorted(by: {$0.id ?? 0 < $1.id ?? 0})
    }
}
