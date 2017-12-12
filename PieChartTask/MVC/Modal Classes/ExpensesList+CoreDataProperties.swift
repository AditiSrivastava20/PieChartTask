//
//  ExpensesList+CoreDataProperties.swift
//  PieChartTask
//
//  Created by Sierra 4 on 21/03/17.
//  Copyright © 2017 codebrew2. All rights reserved.
//

import Foundation
import CoreData


extension ExpensesList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExpensesList> {
        return NSFetchRequest<ExpensesList>(entityName: "ExpensesList");
    }

    @NSManaged public var expense: String?
    @NSManaged public var id: String?

}
