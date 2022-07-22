//
//  Log.swift
//  MVCWithUIKIt
//
//  Created by abhishek dhiman on 10/07/22.
//

import Foundation

class Log {
    
  static func echo(key : String = "", text : Any? = "") {
    if(!DevFlag.debug){
      return
    }
    if(key != DevFlag.key && !DevFlag.showAll){
      return
    }
    guard let textEx = text else {
        print("\(key) -> nil")
        return
    }
    print("\(Date()) \(key) -> \(textEx)")
  }
}
