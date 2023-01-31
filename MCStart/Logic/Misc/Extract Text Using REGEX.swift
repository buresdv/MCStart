//
//  Extract Text Using REGEX.swift
//  MCStart
//
//  Created by David Bureš on 26.11.2022.
//

import Foundation

func extractTextFromStringUsingREGEX(for regex: String, in text: String) -> [String]
{
    do
    {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
        return results.map
        {
            String(text[Range($0.range, in: text)!])
        }
    }
    catch let error as NSError
    {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}
