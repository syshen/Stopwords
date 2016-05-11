//
//  StopWords.swift
//  StopWordsSample
//
//  Created by Shih Yun Shen on 5/11/16.
//  Copyright © 2016 Shih Yun Shen. All rights reserved.
//

import Foundation

public class Stopwords {
    public static var mainBundle = NSBundle.mainBundle()
    public let lang:String
    public let stopwords:[String]?
    
    init(_ lang:String) {
        self.lang = lang
        self.stopwords = Stopwords.get(self.lang)
    }
    
    public class func get(lang:String) -> [String]? {
        guard let bundleUrl = mainBundle.URLForResource("stopwords", withExtension: "bundle") else {
            print("fail to get bundle URL")
            return nil
        }
        
        let bundle = NSBundle(URL: bundleUrl)
        guard let path = bundle?.pathForResource(lang, ofType: "txt") else {
            return nil
        }
        
        do {
            let content = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            return content.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: "\n"))
        } catch {
        }
        
        return nil
    }
    
    public subscript(word:String) -> Bool {
        if let stopwords = self.stopwords {
            if stopwords.contains(word) {
                return true
            }
        }
        return false
    }
}