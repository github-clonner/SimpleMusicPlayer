//
//  MPMediaManager.swift
//  SimpleMusicPlayer
//
//  Created by Yuji Sugiura on 2016/07/11.
//  Copyright © 2016年 Facebook. All rights reserved.
//
import Foundation
import MediaPlayer


@objc(MPMediaManager) class MPMediaManager: NSObject {

  @objc func getSongs(resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
    let songsQuery: MPMediaQuery = MPMediaQuery.songsQuery()

    var songs = [[String: String]]()
    if let songCollection: [MPMediaItemCollection] = songsQuery.collections {
      for song in songCollection {
        guard let title = song.representativeItem!.title else {
          continue
        }
        guard let artist = song.representativeItem!.artist else {
          continue
        }
        guard let albumTitle = song.representativeItem!.albumTitle else {
          continue
        }
        
        songs.append([
          "title":      title      ?? "No title",
          "artist":     artist     ?? "V.A.",
          "albumTitle": albumTitle ?? ""
        ])
      }
    }
    
    resolve(songs)
  }
  
  @objc func getAlbums(resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
    let albumsQuery: MPMediaQuery = MPMediaQuery.albumsQuery()
    
    var albums = [[String: String]]()
    if let albumCollection: [MPMediaItemCollection] = albumsQuery.collections {
      for album in albumCollection {
        guard let title = album.representativeItem!.albumTitle else {
          continue
        }
        guard let artist = album.representativeItem!.albumArtist else {
          continue
        }
        
        albums.append([
          "title":  title  ?? "No title",
          "artist": artist ?? "V.A."
        ])
      }
    }
    
    resolve(albums)
  }

}
