//
//  EnvironmentObjectProtocolWrapper.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import Foundation

class EnvironmentObjectProtocolWrapper<P>: ObservableObject {
    let value: P
    
    init(value: P) {
        self.value = value
    }
}
