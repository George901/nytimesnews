//
//  DateHelper.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

class DateHelper: NSObject {
    
    static let shared: DateHelper = DateHelper()
    
    /// dd.mm.yyyy
    let dateFormatterDay: DateFormatter = DateFormatter()
    ///yyyy-mm-dd 2020-09-08
    let dateFormatterServer: DateFormatter = DateFormatter()
    
    override init() {
        dateFormatterDay.dateFormat = "dd.mm.yyyy"
        dateFormatterServer.dateFormat = "yyyy-mm-dd"
        super.init()
    }
    
}
