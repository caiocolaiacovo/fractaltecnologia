//
//  ListBeersInteractor.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 07/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation
import Alamofire

class ListBeersInteractor {
    var outputPresenter: BeersPresenter!
    
    func fetchAllBeers(_ page: Int) {
        var beers: [BeerItem] = []
        
        Alamofire.request("https://api.punkapi.com/v2/beers?page=\(page)&per_page=80").responseJSON { response in
            do {
                let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as! [Any]
                
                for (index, item) in json.enumerated() {
                    if let dic = item as? [String: Any] {
                        var beer = BeerItem()
                        beer.id = index
                        beer.name = dic["name"] as? String
                        beer.tagline = dic["tagline"] as? String
                        beer.imageUrl = dic["image_url"] as? String
                        
                        beers.append(beer)
                    }
                }
                
                self.outputPresenter.beersFetched(beers)
            }
            catch {
                print("error")
            }
        }
    }
    
    func fetchImage(from url: String, to cell: AnyObject) {
        let session = URLSession(configuration: .default)
        
        let downloadPicTask = session.dataTask(with: URL(string: url)!) { (data, response, error) in
            if error != nil {
                print("Error on fetch image.")
            } else {
                if let imageData = data {
                    self.outputPresenter.imageFetched(imageData, to: cell)
                }
            }
        }
        
        downloadPicTask.resume()
    }
}
