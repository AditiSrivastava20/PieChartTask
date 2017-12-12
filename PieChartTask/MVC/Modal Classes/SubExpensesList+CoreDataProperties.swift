//
//  SubExpensesList+CoreDataProperties.swift
//  PieChartTask
//
//  Created by Sierra 4 on 21/03/17.
//  Copyright © 2017 codebrew2. All rights reserved.
//

import Foundation
import CoreData


extension SubExpensesList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SubExpensesList> {
        return NSFetchRequest<SubExpensesList>(entityName: "SubExpensesList");
    }
    @NSManaged public var quantity: String?
    @NSManaged public var id: String?
    @NSManaged public var itemName: String?
    @NSManaged public var parentId: String?
    @NSManaged public var price: String?
    
}
