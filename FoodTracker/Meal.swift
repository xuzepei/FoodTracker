//
//  Meal.swift
//  FoodTracker
//
//  Created by xuzepei on 15/12/10.
//  Copyright © 2015年 xuzepei. All rights reserved.
//

import UIKit

class Meal:NSObject,NSCoding {
    
    //MARK: -Types
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    //MARK: -Properties
    
    var name:String
    var photo:UIImage?
    var rating:Int
    
    static let savePath = NSURL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true).URLByAppendingPathComponent("meals")
    
    
    //MARK: -Initialization
    
    required init?(name:String, photo:UIImage?, rating:Int) {
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        if name.isEmpty || rating < 0{
        
            return nil
        }
    }
    
    //MARK: -NSCoding
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(self.name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(self.photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(self.rating, forKey: PropertyKey.ratingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        self.init(name: name, photo: photo, rating: rating)
        
    } // NS_DESIGNATED_INITIALIZER

}
