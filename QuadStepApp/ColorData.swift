//
//  ColorData.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2021/11/05.
//  Copyright © 2021 Keisuke Ueda. All rights reserved.
//

import Foundation

class ColorData {
    
    static let shared = ColorData()
    
    func getColorData() -> [[String]] {
        let colorDataList = [red, orange, yellow, yellowGreen, green, blueGreen, aquaSky, blue, indigo, violet, magenta, pink, brown, blackWhite, gold, silver]
        
        return colorDataList
    }
    
    let red: [String] = ["ea5548", "e95464", "e9474d", "e94709", "e83f5f", "d7003a", "c82b55", "b7282d", "932e44"]
    let orange: [String] = ["fbd8b5", "f7b977", "f6ad48", "f39800", "f08300", "efa718", "ee7948", "ed6d3d", "df6c31"]
    let yellow: [String] = ["fff33f", "fff2b8", "fff262", "ffdc00", "ffd900", "fcc800", "f8b500", "f5e56b", "d2b74e"]
    let yellowGreen: [String] = ["d9e367", "d7cf3a", "c8d921", "c5de93", "c4c46a", "afd147", "a7d28d", "9dc04c", "9d973b"]
    let green: [String] = ["98ce97", "67be8d", "4f8a5d", "3ab483", "258c6d", "00aa6e", "009854", "007c45", "005842"]
    let blueGreen: [String] = ["7faba9", "7ebeab", "68b7a1", "259f94", "00a496", "009aa3", "008969", "005c4c", "005243"]
    let aquaSky: [String] = ["bce2e8", "a2d7dd", "a0d8ef", "a0d8ea", "89c3eb", "83ccd2", "6c9bd2", "64bcc7", "00afcc"]
    let blue: [String] = ["3a8daa", "2980af", "26499d", "239dda", "1d50a2", "00a0e9", "008db7", "007d8e", "0068b7"]
    let indigo: [String] = ["55576c", "213a70", "1f2e55", "18448e", "154577", "0f5779", "082752", "006788", "001d42"]
    let violet: [String] = ["c5b3d3", "bbbcde", "8e8bc2", "714f9d", "706caa", "5654a2", "51318f", "4e67b0", "4052a2"]
    let magenta: [String] = ["eb6e9f", "e95295", "e55a9b", "e4007f", "d9aacd", "d1bada", "cc7db1", "895687", "460d43"]
    let pink: [String] = ["fef4f4", "fdeadf", "f5b090", "f4ada3", "f29c9f", "f09199", "e94e66", "e7acb9", "da8d93"]
    let brown: [String] = ["bf7834", "965036", "916f24", "8e5e4a", "814336", "762e05", "6f4e27", "6f4d3e", "612c16"]
    let blackWhite: [String] = ["fffffc", "fbfdff", "fbfaf3", "f8f5e3", "4e4449", "4b2d16", "2f2725", "27120a", "24130d"]
    let gold: [String] = ["fdd75d", "fdd000", "fabf13", "f8b856", "f7dc8d", "e48e00", "d98032", "c4972f", "a36b21"]
    let silver: [String] = ["ced1d3", "c9c9c4", "afafb0", "a99e93", "949495", "7b8174", "7a7c7d", "767676", "615f62"]
}
