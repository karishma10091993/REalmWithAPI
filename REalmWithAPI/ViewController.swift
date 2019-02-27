//
//  ViewController.swift
//  REalmWithAPI
//
//  Created by kireeti on 27/02/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    var tableDat = [TableData]()
   var uiRealm = try! Realm()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        add()
    print(Realm.Configuration.defaultConfiguration.fileURL?.path)
    
    }


    func add(){
        
        let urlStr = "http://iphone.us2guntur.com/SubcatResponseNew?catid=10047"
        let url = URL.init(string: urlStr)
        let urlSession = URLSession.init(configuration: .default)
        _ = urlSession.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {return}
           
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let finalResult = json["finalresult"] as! [[String:Any]]
               
               
                    for result in finalResult{
                        let catName = TableData.init(dict: result)
                       self.uiRealm = try! Realm()
                        do{
                            try self.uiRealm.write({ () -> Void in
                          self.uiRealm.add(catName)
                            
                            }
                        )
                            let resultFromDB = self.uiRealm.objects(TableData.self)
                           self.tableDat = Array(resultFromDB)
                            print("self.tableDat------>",self.tableDat)
                        }catch{
                            print("Realm Error")
                        }
                       
                      
                }
                
            }catch {
                print("error")
            }
            }.resume()
    }
}

