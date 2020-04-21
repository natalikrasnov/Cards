//
//  Translate.swift
//  cards
//
//  Created by hyperactive on 06/12/2018.
//  Copyright © 2018 hyperactive. All rights reserved.
//

import UIKit

class Translate {
    static let api = "trnsl.1.1.20181206T133451Z.e5b75ae3700662a5.2a8555596fe25a3a2093d2249425712b465e0b5b"
    static let baseURL = "https://translate.yandex.net/api/v1.5/tr.json/translate?"
    static let language = "en-he"
    static var arrayOfText:[String] = []
    //static var translates:[String] = []
    
    class func getTranslate(withWord word: String, completion:@escaping(String)->()){
        arrayOfText.append(word)
        
        guard let url = URL(string: "\(baseURL)key=\(api)&text=\(arrayOfText.popLast()!)&lang=\(language)") else {
            print("error")
            return
        }
        let session = URLSession.shared
            session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    completion("")
                    return
                }
//                if let response = response {
//                    completion("")
//                    print(response)
//                }
                if let data = data {
                    print(data)
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options:.allowFragments) as? [String:Any]{
                            print(json)
                            for (key, value) in json {
                                if key == "text"{
                                    if let thisword = value as? [String] {
                                        guard let newWord = thisword.first else {
                                            continue
                                        }
                                        print(newWord)
                                        //Translate.translates.append(newWord)
                                        completion(newWord)
                                        return
                                    }
                                }
                            }
                            completion("")
                            return
                        }
                    } catch {
                        print(error)
                        completion("")
                        return
                    }
                }else{
                    completion("")
                    return
                }
                
            }.resume()
    }
    
   
}

