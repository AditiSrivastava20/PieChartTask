//
//  ViewController.swift
//  database2
//
//  Created by Sierra 4 on 20/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit
import Charts

class SummaryViewController: UIViewController
{
    @IBOutlet weak var pieView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear( animated)
        
        // 1. create chart view
        let chart = PieChartView( frame: self.pieView.frame)
        
        // 2. generate chart data entries
        let yVals: [Double] = [ 873, 568, 937, 726, 696,908,776]
        var entries = [ ChartDataEntry]()
        for (i, v) in yVals.enumerated() {
            let entry = ChartDataEntry()
            entry.x = Double( i)
            entry.y = v
            
            entries.append( entry)
        }
    
    // 3. chart setup
    let set = PieChartDataSet( values: entries, label: "Pie Chart")
    set.colors = UIColor.random(ofCount: entries.count)
    
    let data = PieChartData( dataSet: set)
    chart.data = data
    // no data text
    chart.noDataText = "No data available"
    // user interaction
    chart.isUserInteractionEnabled = true
    
    // 3a. style
    chart.backgroundColor = Palette.Background
    
    chart.legend.textColor = Palette.InfoText
    // description
    let d = Description()
    d.text = "pocket DB"
    chart.chartDescription = d
    chart.centerText = "Pie Chart"
    
    // 4. add chart to UI
    self.pieView.addSubview( chart)

    }
}

