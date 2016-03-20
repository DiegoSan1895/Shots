//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func dateFromString(dateString: AnyObject?) -> NSDate?{
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    if let dateString  = dateString as? String, date = dateFormatter.dateFromString(dateString){
        return date
    }else{
        print("Parse date \(dateString) error")
        return nil
    }
}

dateFromString("2012-03-15T01:52:33Z")