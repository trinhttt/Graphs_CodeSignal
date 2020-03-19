//
//  ViewController.swift
//  Graphs_CodeSignal
//
//  Created by Trinh Thai on 3/19/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func newRoadSystem(roadRegister: [[Bool]]) -> Bool {
        var cities = [City].init(repeating: City(), count: roadRegister.count)
        
        for (i,row) in roadRegister.enumerated() {
            for (j,road) in row.enumerated() {
                if road {
                    cities[i].outBound.append(j)
                    cities[j].inbound.append(i)
                }
            }
        }
        
        for i in 0..<roadRegister.count {
            if cities[i].inbound.count != cities[i].outBound.count {
                return false
            }
        }
        return true
    }
    
    struct City {
        var name = 0
        var outBound = [Int]()
        var inbound = [Int]()
    }
    /*var roadRegister = [[false, true,  false, false],
     [false, false, true,  false],
     [true,  false, false, true ],
     [false, false, true,  false]]
     var roadRegister1 = [[false, true,  false, false, false, false, false],
     [true,  false, false, false, false, false, false],
     [false, false, false, true,  false, false, false],
     [false, false, true,  false, false, false, false],
     [false, false, false, false, false, false, true ],
     [false, false, false, false, true,  false, false],
     [false, false, false, false, false, true,  false]]
     self.newRoadSystem(roadRegister: roadRegister)
     self.newRoadSystem(roadRegister: roadRegister1)*/
    // USEABLE NOTE:
    // ** where
    // ** zip to use { $0 != $1 }
    func BEST_newRoadSystem(roadRegister: [[Bool]]) -> Bool {
        var incomingRoads = Array<Int>(repeating: 0, count: roadRegister.count)
        var outgoingRoads = Array<Int>(repeating: 0, count: roadRegister.count)
        for i in 0..<roadRegister.count {
            for j in 0..<roadRegister[i].count where roadRegister[i][j] == true {
                incomingRoads[i] += 1
                outgoingRoads[j] += 1
                print(incomingRoads)
                print(outgoingRoads)
            }
        }
        /*
         [1, 0, 0, 0]
         [0, 1, 0, 0]
         [1, 1, 0, 0]
         [0, 1, 1, 0]
         [1, 1, 1, 0]
         [1, 1, 1, 0]
         [1, 1, 2, 0]
         [1, 1, 1, 1]
         [1, 1, 2, 1]
         [1, 1, 2, 1]
         */
        print("zip \(zip(incomingRoads, outgoingRoads))") // zip Zip2Sequence<Array<Int>, Array<Int>>(_sequence1: [1, 1, 2, 1], _sequence2: [1, 1, 2, 1])
        return !zip(incomingRoads, outgoingRoads).contains { $0 != $1 }
    }
}

