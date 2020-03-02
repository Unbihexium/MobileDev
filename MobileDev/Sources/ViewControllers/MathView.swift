//
//  MathView.swift
//  MobileDev
//
//  Created by Egor Nalobin on 02.03.2020.
//  Copyright © 2020 Egor Nalobin. All rights reserved.
//

import SwiftUI

struct MathView: View {
    
    var delegate: ShowResultDelegate?
    
    init(){
    }
    
    init(_ delegate: ShowResultDelegate){
        self.delegate = delegate
    }
    
    @State var cos: String = "" {
        didSet {
            self.delegate?.showResult(self.cos)
        }
    }
    
    var body: some View {
        HStack {
            TextField("Cos", text: $cos, onEditingChanged: {_ in 
                self.delegate?.showResult(self.cos)
            })
                .padding(.leading, 10)
        }
        
    }
}

struct MathView_Previews: PreviewProvider {
    static var previews: some View {
        MathView()
    }
}



