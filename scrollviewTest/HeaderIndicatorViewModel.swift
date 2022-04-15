    //
    //  HeaderIndicatorViewModel.swift
    //
    //  Created by dophin on 2021/12/16.
    //

import Foundation
import UIKit
final class HeaderIndicatorViewmodel : ObservableObject {
        // for change tab
    @Published var selectedIndex:Int = 0
    
    @Published var scrolloffset:CGFloat? = nil
    var lastscrolloffset:CGFloat? = nil
    
    var isconfig:Bool = false
    var keys:[String] = []
}
