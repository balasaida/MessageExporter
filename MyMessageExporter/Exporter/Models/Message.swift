//
//  MessageManager.swift
//  MyMessageExporter
//
//  Created by Burri on 2021-03-13.
//  Copyright © 2021 burri. All rights reserved.
//

import Foundation

/// Message handles the all the message types such as comments, annotations.

/// And in future if we get a new message type then we will add a new case to Message object. This way can acheive the polymorphism with enums and also getting the compile time benefits.

/// We can also acheive the same with Protocols but in this case I believe this is better approach because there is less similariteis between the objects. For suppose, if we get the new case where we want to export the images only then we can simply create one more case image(data: Data) so that we do not change/modify the existing types to accomodate the new type.
public enum Message {
    
    case comment(userId: String, message: String)
    case annotation(userId: String, color: String, image: Data, message: String)
}
