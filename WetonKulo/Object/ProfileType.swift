//
//  ProfileType.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 07/06/23.
//

import Foundation

enum ProfileType: CaseIterable {
    case man
    case woman
    
    var isMan: Bool {
        return self == .man
    }
    
    var isWoman: Bool {
        return self == .woman
    }
    
    var image: String {
        switch self {
        case .man:
            return "imgPria"
        case .woman:
            return "imgWanita"
        }
    }
    
    var text: String {
        switch self {
        case .man:
            return "Pasangan Pria"
        case .woman:
            return "Pasangan Wanita"
        }
    }
    
    var form: String {
        switch self {
        case .man:
            return "cewenya"
        case .woman:
            return "COWO GES"
        }
    } 
    
}
