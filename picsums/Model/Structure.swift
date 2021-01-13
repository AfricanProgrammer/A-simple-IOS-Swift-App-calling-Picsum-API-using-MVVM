//
//  Structure.swift
//  Picsum
//
//  Created by Admin on 2021/01/11.
//

import Foundation

struct Structure:Decodable {
    let id:String
    let author : String
    let width: Int
    let url: String
    let download_url: String
}
