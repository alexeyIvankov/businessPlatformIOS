//
//  EventSender.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 18.11.16.
//  Copyright © 2016 Alexey Ivankov. All rights reserved.
//

import Foundation

public class EventSender<T>
{
    fileprivate let subscribers:NSMapTable<NSString,AnyObject>;
    fileprivate let lock:NSRecursiveLock
    
    init()
    {
        subscribers = NSMapTable<NSString,AnyObject>(keyOptions:NSPointerFunctions.Options.copyIn, valueOptions:NSPointerFunctions.Options.strongMemory);
        lock = NSRecursiveLock();
    }
    
    
    func subscribe(subscriber: AnyObject, typeEvent:String)
    {
        self.threadSaveOperation
        {
            var container:NSHashTable<AnyObject>? = self.subscribers.object(forKey: NSString(string:typeEvent)) as! NSHashTable<AnyObject>?
            
            if container == nil
            {
                container = self.createWeakContainer();
                self.subscribers.setObject(container, forKey: NSString(string:typeEvent));
            }
            container?.add(subscriber)
        }
    }
    
    func unsubscribe(subscriber: AnyObject, typeEvent:String)
    {
        self.threadSaveOperation
        {
            let container:NSHashTable<AnyObject>? = self.subscribers.object(forKey: NSString(string:typeEvent)) as! NSHashTable<AnyObject>?;
            container?.remove(subscriber);
        }
    }
    
    func subscribers(typeEvent:String) -> [AnyObject]?
    {
        var subscribers:[AnyObject]  = [];
        
        self.threadSaveOperation
        {
            let container:NSHashTable<AnyObject>? = self.subscribers.object(forKey: NSString(string:typeEvent)) as! NSHashTable<AnyObject>?;
            
            if container != nil
            {
                for item in container!.allObjects {
                    subscribers.append(item);
                }
            }
        }
        
        return subscribers;
    }
    
    
    fileprivate func threadSaveOperation(block:()->Void)
    {
        self.lock.lock();
        block();
        self.lock.unlock();
    }
    
    fileprivate func createWeakContainer<T>() -> NSHashTable<T> {
        return NSHashTable(options: NSPointerFunctions.Options.weakMemory);
    }
}
