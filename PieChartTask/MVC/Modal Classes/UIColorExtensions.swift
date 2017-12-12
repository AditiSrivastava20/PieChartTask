//
//  ExpensesList+CoreDataProperties.swift
//  PieChartTask
//
//  Created by Sierra 4 on 21/03/17.
//  Copyright © 2017 codebrew2. All rights reserved.
//
import UIKit


extension UIColor
{
    static func random( ofCount: Int) -> [ UIColor]
    {
        let between =   {
            (from: Int, through: Int) -> CGFloat in
                let d = through - from
                return CGFloat(
                            Int(  arc4random_uniform( UInt32(d+1)))
                        )
        }
        
        var colors: [ UIColor] = []
        for _ in 0..<ofCount {
            let red: CGFloat = between( 0, 255)
            let green: CGFloat = between( 0, 255)
            let blue: CGFloat = between( 0, 255)
            
            let color = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
            colors.append( color)
        }
        
        return colors
    }
}
