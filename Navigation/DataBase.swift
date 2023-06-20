//
//  DataBase.swift
//  Navigation
//
//  Created by Sergey Bragin on 19.06.2023.
//

import Foundation
import UIKit

struct DataBase {
    
    var image: String
    
    static func generatetCV() -> [DataBase] {
        
        var post = [DataBase]()
        post.append(DataBase(image: "1"))
        post.append(DataBase(image: "2"))
        post.append(DataBase(image: "3"))
        post.append(DataBase(image: "4"))
        post.append(DataBase(image: "5"))
        post.append(DataBase(image: "6"))
        post.append(DataBase(image: "7"))
        post.append(DataBase(image: "8"))
        post.append(DataBase(image: "9"))
        post.append(DataBase(image: "10"))
        post.append(DataBase(image: "11"))
        post.append(DataBase(image: "12"))
        post.append(DataBase(image: "13"))
        post.append(DataBase(image: "14"))
        post.append(DataBase(image: "15"))
        post.append(DataBase(image: "16"))
        post.append(DataBase(image: "17"))
        post.append(DataBase(image: "18"))
        post.append(DataBase(image: "19"))
        post.append(DataBase(image: "20"))
        
        return post
    }
}
