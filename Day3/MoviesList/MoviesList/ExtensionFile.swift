//
//  ExtensionFile.swift
//  MoviesList
//
//  Created by Esraa Hassan on 3/26/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    func toString() -> String? {
        let data: Data? = UIImagePNGRepresentation(self)
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}

extension String{
    func toImage()-> UIImage?{
        return UIImage.init(named: self)
    }
    
    func toFloat()->Float?{
        return Float(self)
    }
}

extension Float{
    func toString()->String?{
        return String(self)
    }
}
