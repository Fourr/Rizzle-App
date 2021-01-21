//
//  GatherService.swift
//  Rizzle App
//
//  Created by Johnny Sheffer on 1/18/21.
//

import Foundation
import AVKit
final class GatherService {

    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    func getJSON(data: Data) -> Feed? {
        do {
            let FeedStruct = try JSONDecoder().decode(Feed.self, from: data)
            return FeedStruct
        } catch {
            return nil
        }
    }
    func ConvertToRealFeed(feed: Feed) -> [[realFeed]] {
        var multirealFeedArray = [[realFeed]]()
        var trendingFeedArray = [realFeed]()
        var mwFeedArray = [realFeed]()
        var naFeedArray = [realFeed]()
        var popularFeedArray = [realFeed]()
        //let image = createThumbnailOfVideoFromRemoteUrl(url: feed[0].nodes[0].video.encodeURL)
        //let realFeeditem = realFeed(title: feed[0].title, url: feed[0].nodes[0].video.encodeURL, image: image!)
        //realFeedArray.append(realFeeditem)
        for item in feed {
            for deeperitem in item.nodes {
                let image = createThumbnailOfVideoFromRemoteUrl(url: deeperitem.video.encodeURL)
                let realFeeditem = realFeed(title: item.title, url: deeperitem.video.encodeURL, image: image!)
                if(item.title == "Trending") {
                    trendingFeedArray.append(realFeeditem)
                } else if (item.title == "Must Watch") {
                    mwFeedArray.append(realFeeditem)
                } else if (item.title == "Newly Added") {
                    naFeedArray.append(realFeeditem)
                } else if (item.title == "Popular") {
                    popularFeedArray.append(realFeeditem)
                }
                
            }
            
        }
        multirealFeedArray.append(trendingFeedArray)
        multirealFeedArray.append(mwFeedArray)
        multirealFeedArray.append(naFeedArray)
        multirealFeedArray.append(popularFeedArray)
        return multirealFeedArray
    }

}
