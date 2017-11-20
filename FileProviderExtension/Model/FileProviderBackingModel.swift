//
//  FileProviderBackingModel.swift
//  FileProviderExtension
//
//  Created by Alexander Tkachenko on 11/16/17.
//  Copyright © 2017 Alexander Tkachenko. All rights reserved.
//

import Foundation

final class FileProviderBackingModel {
    let files: [TextFileModel]
    init(files: [TextFileModel]) {
        self.files = files
    }
}
