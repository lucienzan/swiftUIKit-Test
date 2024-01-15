//
//  NoteModel.swift
//  Todo
//
//  Created by Daniel on 1/14/24.
//

import UIKit
struct NoteModel {
    var id: String
    var title: String
    var note: String
    var isComplete: Bool
    
    init(id: String, title: String, note: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.note = note
        self.isComplete = isComplete
    }
}
