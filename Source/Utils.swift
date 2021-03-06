//
//  Utils.swift
//  APIModel
//
//  Copyright (c) 2015 Rootof Creations HB. All rights reserved.
//

import Foundation

func convertNSDictionaryToDictionary(nsDict: NSDictionary) -> Dictionary<String, AnyObject> {
    var dict: [String: AnyObject] = [:]
    
    for (key, value) in nsDict {
        dict[key.description!] = value as AnyObject
    }
    
    return dict
}

func JSONtoDictionary(dict: [String:JSON]) -> [String:[String]] {
    var newDict: [String:[String]] = [:]
    
    for (key, value) in dict {
        if let errors = value.arrayObject {
            var err: [String] = []
            for errorMessage in errors {
                if let e = errorMessage as? String {
                    err.append(e)
                }
            }
            newDict[key] = err
        }
    }
    
    return newDict
}
