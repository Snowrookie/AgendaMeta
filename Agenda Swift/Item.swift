//
//  Item.swift
//  Agenda Swift
//
//  Created by Antonio Carlos Dourado on 31/08/22.
//

import Foundation
import CoreData
@objc(Item)
class Item: NSManagedObject, Identifiable {
    @NSManaged var name: String?
    @NSManaged var timestamp: Date?
}

extension Item {
    static func getAllItem() -> NSFetchRequest<Item> {
        let request: NSFetchRequest<Item> = Item.fetchRequest() as! NSFetchRequest<Item>
        
        let sort = NSSortDescriptor(key: "timestamp", ascending: true)
        request.sortDescriptors = [sort]
        
        return request
    }
}
