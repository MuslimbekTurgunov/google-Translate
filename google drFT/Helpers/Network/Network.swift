//
//  Network.swift
//  google drFT
//
//  Created by Azizbek Salimov on 14.05.2022.
//
import UIKit
import Lottie
extension HomePage {
    enum Language {
        case uz
        case en
    }
    func UrlSessionSetup(from: Language, to: Language, text: String){
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "Accept-Encoding": "application/gzip",
            "X-RapidAPI-Host": "google-translate1.p.rapidapi.com",
            "X-RapidAPI-Key": "27f5d8eb69mshff30991d0850671p10ddbejsn6102a7ac8bcc"
        ]

    let postData = NSMutableData(data: "q=\(text)".data(using: String.Encoding.utf8)!)
    postData.append("&target=\(to)".data(using: String.Encoding.utf8)!)
    postData.append("&source=\(from)".data(using: String.Encoding.utf8)!)

    let request = NSMutableURLRequest(url: NSURL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = postData as Data

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Translate.self, from: data)
                    self.myTranslatedText = decodedData.data.translations.first!.translatedText
                    DispatchQueue.main.async {
                        self.textViewBottom.text = decodedData.data.translations.first!.translatedText
                        print(decodedData.data.translations.first!.translatedText)
                    }



                } catch {
                    print(error)
                }
            }

        }

    })

    dataTask.resume()

    }

}
