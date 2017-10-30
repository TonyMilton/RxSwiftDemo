//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by Tony Milton on 30/10/17.
//  Copyright © 2017 Tony Milton. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    let model = GoogleModel()
    
    @IBOutlet weak var googleText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        model.createGoogleDataObservable(searchTerm: "Kittens")
            .subscribe(onNext: { [weak self] (element) in
                self?.googleText.text = element
            }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

