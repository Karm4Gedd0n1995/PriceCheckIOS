//
//  DataBase.swift
//  PriceCheck2.0
//
//  Created by Frederic Hammer on 02.06.23.
//

import Foundation
import CoreData

class DataBase : ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var favData : [Item] = []
    
    init() {
        container = NSPersistentContainer(name: "CoreData") // name muss name des models sein
        
        
        container.loadPersistentStores { description, error in
            
            if let error = error {
                fatalError("core data store failed: \(error.localizedDescription)")
            }
        }
        fetchData()
        
    }
    
    func fetchData(){
        
        let request = NSFetchRequest<Item>(entityName: "Item")
        
        
        do {
            favData = try container.viewContext.fetch(request)
        } catch {
            print("error fetching: \(error)")
        }
    }
        
    func saveData(isFavorite: Bool, name: String, image: String) {
        
        let newData = Item(context: container.viewContext)
        
        newData.isFavorite = isFavorite
        newData.name = name
        newData.image = image
        
        do{
            
            try container.viewContext.save() } catch {
                print("error saving: \(error)")
            }
        
        fetchData()
    }
    
    func deleteData(indexSet: IndexSet) {
        guard let index = indexSet.first else {
            print("No index inside IndexSet")
            return
        }
        let dataDelete = favData[index]
        container.viewContext.delete(dataDelete)
        
        // error handling und änderungen speichern
        do {
            try container.viewContext.save()
            fetchData()
        } catch {
            print("Error while deleting a todo \(error)")
        }
    }
}
