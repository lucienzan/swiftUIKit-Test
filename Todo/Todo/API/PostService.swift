//
//  PostService.swift
//  Todo
//
//  Created by Daniel on 1/14/24.
//

import UIKit
import Firebase

struct PostService {

    static let share = PostService()
    let DB_REF = Database.database().reference()
    
    func fetchAllItems(completion: @escaping ([NoteModel]) -> Void) {
        var allNotes = [NoteModel]()
        
        DB_REF.child("Lists").queryOrdered(byChild: "isComplete").observe(.childAdded) {
            (snapshot) in
            fetchGetItem(id: snapshot.key) {
                (item) in
                allNotes.append(item)
                completion(allNotes)
            }
        }
    }
    
    func fetchGetItem(id:String, completion: @escaping (NoteModel) -> Void) {
        DB_REF.child("Lists").child(id).observeSingleEvent(of: .value) { (snapshot, error) in
            guard let dictionary = snapshot.value as? [String: Any] else {return}
            let id = dictionary["id"] as? String
            let title = dictionary["title"] as? String
            let note = dictionary["note"] as? String
            let status = dictionary["isComplete"] as? Bool
            let noteModel = NoteModel(id: id ?? "", title: title ?? "", note: note ?? "", isComplete: status ?? false)
            completion(noteModel)
        }
    }
    
    func insertItem(ttl: String, note: String, completion: @escaping (Error?, DatabaseReference)-> Void) {
        let id = UUID().uuidString
        let insertValue = ["id":id,"title": ttl, "note": note, "isComplete": false] as [String : Any];
        DB_REF.child("Lists").childByAutoId().updateChildValues(insertValue, withCompletionBlock: completion)
    }
    
    func updateItem(status: Bool, id: String, completion: @escaping (Error?, DatabaseReference) -> Void ) {
        let updateValue = ["isComplete": status]
        // Query to find the item with the matching id
            let query = DB_REF.child("Lists").queryOrdered(byChild: "id").queryEqual(toValue: id)
            
            // Perform the query
        query.observeSingleEvent(of: .value) { snapshot in
            guard let itemSnapshot = snapshot.children.allObjects.first as? DataSnapshot else { return }
            
            // Construct the reference to the specific item using its ID
            let itemReference = DB_REF.child("Lists").child(itemSnapshot.key)
            
            // Update the values
            itemReference.updateChildValues(updateValue) { (error, ref) in
                completion(error, ref)
            }
        }
    }
}
