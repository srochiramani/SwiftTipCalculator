//
//  TipPercentages.swift
//  Tips
//
//  Created by Sunny Rochiramani on 4/18/15.
//  Copyright (c) 2015 Sunny Rochiramani. All rights reserved.
//

import Foundation

enum TipPercentages: Int {
    
    case EIGHTEEN = 0, TWENTY, THIRTY
    
    func getValue(self) -> Int {
        switch self {
        case .EIGHTEEN:
            return 18
        case .TWENTY:
            return 20
        case .THIRTY:
            return 30
        default:
            return 0
        }
    }
}
