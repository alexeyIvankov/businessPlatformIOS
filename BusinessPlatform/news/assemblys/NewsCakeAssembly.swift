//
//  NewsCakeAssembly.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import Cocaine

@objc(NewsCakeAssembly)
public class NewsCakeAssembly : AssemblyProviderImpl {
    
    public override func assembly() -> I_Assembly? {
        
        return Assembly.init(buildType:INewsCake.self, memoryPolicy: MemoryPolicy.Strong, instanceScope: InstanceScope.Singleton, buildBlock: { (injector:I_Injector) -> AnyObject in
            
            let router:INewsRouter = NewsRouter()
            let director:INewsDirector = NewsDirector()
            
            let cake:INewsCake = NewsCake(director: director, router: router)
            
            return cake
        })
    }
    
    public override static func buildType() -> Any {
        return INewsCake.self
    }
}
