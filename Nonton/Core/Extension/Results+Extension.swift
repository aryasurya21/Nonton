//
//  Results+Extension.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import Foundation
import RealmSwift

extension Results {
    func toCustomObjects<T: Object>(fromType: T.Type) -> [T] {
        var finalResult = [T]()
        for idx in stride(from: 0, to: self.count-1, by: 1){
            if let obj = self[idx] as? T {
                finalResult.append(obj)
            }
        }
        return finalResult
    }
}
