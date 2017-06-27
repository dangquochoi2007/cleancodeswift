//
//  Menu.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation

struct Menu {
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    static func demo() -> [Menu] {
        var menus_list:[Menu] = []
        
        menus_list.append(Menu(id: "25", name: "US"))
        menus_list.append(Menu(id: "25", name: "English"))
        menus_list.append(Menu(id: "17", name: "Documentary"))
        menus_list.append(Menu(id: "11", name: "Music"))
        menus_list.append(Menu(id: "10", name: "News"))
        menus_list.append(Menu(id: "14", name: "Sports"))
        
        return menus_list
    }
}

struct LeftMenuPanel {
    
}


struct Category {
    
}
