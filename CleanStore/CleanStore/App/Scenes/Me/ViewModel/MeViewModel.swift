//
//  MeViewModel.swift
//  CleanStore
//
//  Created by hoi on 30/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

struct MeViewModel
{
    //---------------------------------
    struct FetchPromotion
    {
        // -- Request
        struct Request
        {
        }
        
        
        // -- Response
        struct Response
        {
            var promotionList: [Promotion]
        }
        
        
        // -- View Model
        struct ViewModel
        {
            struct DisplayedPromotion
            {
                var description: String
            }
            
            var displayedPromotionsList: [DisplayedPromotion]
        }
    }
    //---------------------------------
}
