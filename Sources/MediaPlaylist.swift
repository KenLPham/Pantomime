//
// Created by Thomas Christensen on 24/08/16.
// Copyright (c) 2016 Nordija A/S. All rights reserved.
//

import Foundation

public enum MediaType: String {
    case unknown = "UNKNOWN"
    case audio = "AUDIO"
    case video = "VIDEO"
    case subtitles = "SUBTITLES"
    case closeCaptions = "CLOSED-CAPTIONS"
}

open class MediaPlaylist {
    var masterPlaylist: MasterPlaylist?
    // EXT-X-STREAM-INF
    open var programId: Int = 0
    open var bandwidth: Int = 0
    open var path: String?
    open var version: Int?
    open var targetDuration: Int?
    open var mediaSequence: Int?
    
    // EXT-X-MEDIA
    open var type: MediaType = .unknown // Valid strings are AUDIO, VIDEO, SUBTITLES, and CLOSED-CAPTIONS.  This attribute is REQUIRED.
    open var groupId: String?
    open var name: String?
    open var language: String?
    open var isDefault: Bool = false
    open var isAutoSelect: Bool = false
    
    var segments = [MediaSegment]()

    public init(type: MediaType) {
        self.type = type
    }
    
    public init() {
        
    }

    open func addSegment(_ segment: MediaSegment) {
        segments.append(segment)
    }

    open func getSegment(_ index: Int) -> MediaSegment? {
        if index >= segments.count {
            return nil
        }
        return segments[index]
    }

    open func getSegmentCount() -> Int {
        return segments.count
    }
    
    open func getAllSegments() -> [MediaSegment] {
        return segments
    }

    open func duration() -> Float {
        var dur: Float = 0.0
        for item in segments {
            dur += item.duration!
        }
        return dur
    }

    open func getMaster() -> MasterPlaylist? {
        return self.masterPlaylist
    }
}
