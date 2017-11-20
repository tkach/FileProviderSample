//
//  FileProviderEnumerator.swift
//  FileProviderExtension
//
//  Created by Alexander Tkachenko on 11/16/17.
//  Copyright © 2017 Alexander Tkachenko. All rights reserved.
//

import FileProvider

class FileProviderEnumerator: NSObject, NSFileProviderEnumerator {
    
    var enumeratedItemIdentifier: NSFileProviderItemIdentifier
    
    init(enumeratedItemIdentifier: NSFileProviderItemIdentifier) {
        self.enumeratedItemIdentifier = enumeratedItemIdentifier
        super.init()
    }

    func invalidate() {
        // TODO: perform invalidation of server connection if necessary
    }

    func enumerateItems(for observer: NSFileProviderEnumerationObserver, startingAt page: NSFileProviderPage) {
        /* TODO:
         - inspect the page to determine whether this is an initial or a follow-up request
         
         If this is an enumerator for a directory, the root container or all directories:
         - perform a server request to fetch directory contents
         If this is an enumerator for the active set:
         - perform a server request to update your local database
         - fetch the active set from your local database
         
         - inform the observer about the items returned by the server (possibly multiple times)
         - inform the observer that you are finished with this page
         */
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let id1 = NSFileProviderItemIdentifier("item1")
            let id2 = NSFileProviderItemIdentifier("item2")
            
            let items: [FileProviderItem] = [
                FileProviderItem(itemIdentifier: id1,
                                 parentIdentifier: self.enumeratedItemIdentifier,
                                 filename: "File 1",
                                 typeIdentifier: "public.text"),
                FileProviderItem(itemIdentifier: id2,
                                 parentIdentifier: self.enumeratedItemIdentifier,
                                 filename: "File 2",
                                 typeIdentifier: "public.text")
                ]
            observer.didEnumerate(items)
            observer.finishEnumerating(upTo: nil)
        }
    }
    
    func enumerateChanges(for observer: NSFileProviderChangeObserver, from anchor: NSFileProviderSyncAnchor) {
        /* TODO:
         - query the server for updates since the passed-in sync anchor
         
         If this is an enumerator for the active set:
         - note the changes in your local database
         
         - inform the observer about item deletions and updates (modifications + insertions)
         - inform the observer when you have finished enumerating up to a subsequent sync anchor
         */
    }

}
