//
//  StopWords.swift
//  StopWordsSample
//
//  Created by Shih Yun Shen on 5/11/16.
//  Copyright © 2016 Shih Yun Shen. All rights reserved.
//

import Foundation

public class Stopwords {
    public static var mainBundle = NSBundle(forClass: Stopwords.self)
    public let lang:String
    public let stopwords:[String]?
    
    public init(_ lang:String) {
        self.lang = lang
        self.stopwords = Stopwords.get(self.lang)
    }
    
    public class func get(lang:String) -> [String]? {
        guard let bundleUrl = mainBundle.URLForResource("stopwords", withExtension: "bundle") else {
            print("Fail to locate the bundle file")
            return nil
        }
        
        let bundle = NSBundle(URL: bundleUrl)
        guard let path = bundle?.pathForResource(lang, ofType: "txt") else {
            print("The language file is not found in the bundle file")
            return nil
        }
        
        do {
            let content = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            return content.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: "\n"))
        } catch {
            print("Error while load the language file")
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