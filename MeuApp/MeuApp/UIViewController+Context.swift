//
//  UIViewController+Context.swift
//  MeuApp
//
//  Created by Erica Veiga on 22/02/23.
//


import UIKit
import CoreData

extension UIViewController{
    var context : NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
