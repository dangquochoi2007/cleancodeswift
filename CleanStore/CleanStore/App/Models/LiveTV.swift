//
//  LiveTV.swift
//  CleanStore
//
//  Created by hoi on 4/7/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation


struct LiveTV {
    var id: String
    var name: String
    var hd: String
    var logo: String
    var epg_now: String
    var epg_next: String
}


class LiveTVStore: NSObject {
    
    static var shareInstance = LiveTVStore()
    
    func items() -> [LiveTV] {
        return [
            LiveTV(id: "1", name: "BILLIONS", hd: "1", logo: "cover_#1", epg_now: "TEST NOW", epg_next: "TEST NEXT"),
            LiveTV(id: "1", name: "SUITS", hd: "1", logo: "cover_#2", epg_now: "TEST NOW", epg_next: "TEST NEXT"),
            LiveTV(id: "1", name: "RAY DONOVAN", hd: "1", logo: "cover_#3", epg_now: "TEST NOW", epg_next: "TEST NEXT"),
            LiveTV(id: "1", name: "BREAKING BAD", hd: "1", logo: "cover_#4", epg_now: "TEST NOW", epg_next: "TEST NEXT"),
            LiveTV(id: "1", name: "NARCOS", hd: "1", logo: "cover_#5", epg_now: "TEST NOW", epg_next: "TEST NEXT"),
            LiveTV(id: "1", name: "BILLIONS", hd: "1", logo: "cover_#6", epg_now: "TEST NOW", epg_next: "TEST NEXT")
        ]
    }
    
}
