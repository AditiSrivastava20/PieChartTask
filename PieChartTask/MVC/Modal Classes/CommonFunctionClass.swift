//
//  CommonFunctionClass.swift
//  PieChartTask
//
//  Created by Sierra 4 on 21/03/17.
//  Copyright © 2017 codebrew2. All rights reserved.
//

import Foundation
import UIKit

class CommonFunctionClass
{
    class func alertMessage(title1: String,messageString: String, title2: String, obj: UIViewController)
    {
        let alertController = UIAlertController(title: title1, message:
            messageString , preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: title2, style: UIAlertActionStyle.default,handler: nil))
        obj.present(alertController, animated: true, completion: nil)
    }
}
