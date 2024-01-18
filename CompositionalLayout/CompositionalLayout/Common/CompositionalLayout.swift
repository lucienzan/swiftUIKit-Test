//
//  CompositionalLayout.swift
//  CompositionalLayout
//
//  Created by Daniel on 1/19/24.
//

import UIKit

enum CompositionalGroupAlignment {
    case vertical
    case horizontal
}

struct CompositionalLayout {
    // item
   static func item(
        width: NSCollectionLayoutDimension,
        height: NSCollectionLayoutDimension,
        spacing: (top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat))
       -> NSCollectionLayoutItem{
           let item = NSCollectionLayoutItem(layoutSize:NSCollectionLayoutSize(widthDimension: width, heightDimension: height))
           item.contentInsets = NSDirectionalEdgeInsets(top: spacing.top, leading: spacing.leading, bottom: spacing.bottom, trailing: spacing.trailing)
        return item
    }
    
    // group with array
   static func group(
        alignment: CompositionalGroupAlignment,
        width: NSCollectionLayoutDimension,
        height: NSCollectionLayoutDimension,
        items: [NSCollectionLayoutItem]
              ) -> NSCollectionLayoutGroup {
                  switch alignment {
                  case .vertical :
                      return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
                  case .horizontal :
                      return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
                  }
    }
    
    // group with count
    static func group(
         alignment: CompositionalGroupAlignment,
         width: NSCollectionLayoutDimension,
         height: NSCollectionLayoutDimension,
         item: NSCollectionLayoutItem,
         count: Int
               ) -> NSCollectionLayoutGroup {
                   switch alignment {
                   case .vertical :
                       return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitem: item, count: count)
                   case .horizontal :
                       return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitem: item, count: count)
                   }
     }
    
    // section
    static func section(group: NSCollectionLayoutGroup)-> NSCollectionLayoutSection {
        return NSCollectionLayoutSection(group: group)
    }
    
}
