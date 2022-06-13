//
//  MasterPlaylist.swift
//  Pantomime
//
//  Created by Thomas Christensen on 25/08/16.
//  Copyright © 2016 Sebastian Kreutzberger. All rights reserved.
//

import Foundation

open class MasterPlaylist {
    var playlists = [MediaPlaylist]()
//    var subtitles = [MediaSubtitle]()
    
    open var path: String?

    public init() {}

    open func addPlaylist(_ playlist: MediaPlaylist) {
        playlists.append(playlist)
    }

    open func getPlaylist(_ index: Int) -> MediaPlaylist? {
        if index >= playlists.count {
            return nil
        }
        return playlists[index]
    }

    open func getPlaylistCount() -> Int {
        return playlists.count
    }
    
    open func getPlaylists(type: MediaType) -> [MediaPlaylist] {
        return playlists.filter { $0.type == type }
    }
    
//    open func getSubtitleCount() -> Int {
//        return subtitles.count
//    }
//
//    open func addSubtitle(_ subtitle: MediaSubtitle) {
//        subtitles.append(subtitle)
//    }
//
//    open func getSubtitle(_ index: Int) -> MediaSubtitle? {
//        if index >= subtitles.count {
//            return nil
//        }
//        return subtitles[index]
//    }
}
