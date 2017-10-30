//
//  GoogleModel.swift
//  RxSwiftDemo
//
//  Created by Tony Milton on 30/10/17.
//  Copyright © 2017 Tony Milton. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class GoogleModel {
    
   
    func createGoogleDataObservable(searchTerm: String) -> Observable<String> {
        return Observable<String>.create( {(observer)  -> Disposable in
            
            let session = URLSession.shared
            let task = session.dataTask(with: URL(string: "https://www.google.com.au/search?q=" + searchTerm)!) { (data, response, error) in
                DispatchQueue.main.async {
                    if let err = error {
                        observer.onError(err)
                    } else {
                        if let googleString = String(data: data!, encoding: .ascii) {
                            observer.onNext(googleString)
                        } else {
                            observer.onNext("Error! Unable to parse the response data from Google")
                        }
                        
                        observer.onCompleted()
                    }
                }
            }
            
            task.resume()
            
            return Disposables.create(with: {
                task.cancel()
            })
        })
    }
}
