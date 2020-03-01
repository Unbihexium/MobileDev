//
//  FormView.swift
//  MobileDev
//
//  Created by Egor Nalobin on 01.03.2020.
//  Copyright © 2020 Egor Nalobin. All rights reserved.
//

import SwiftUI

struct FormView: View {
    
    @State private var birthDate = Date()
    
    @State private var family: String = ""
    @State private var name: String = ""
    @State private var patronymic: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        Form{
            Section(header: Text("Личные данные")) {
                TextField("Фамилия", text: $family)
                TextField("Имя", text: $name)
                TextField("Отчество", text: $patronymic)
                DatePicker(selection: $birthDate, displayedComponents: .date ,label: {
                    Text("Дата рождения")
                })
            }
            Section(header: Text("Контактные данные")) {
                TextField("Телефон", text: $phone)
                TextField("Email", text: $email)
                
            }
            Section{
                HStack{
                    Button(action: {
                        let personalData = PersonalData(family: self.family, name: self.name, patronymic: self.patronymic, date: self.birthDate, email: self.email, phone: self.phone)
                        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(personalData, toFile: PersonalData.ArchiveURL.path)
                        if isSuccessfulSave {
                            debugPrint("Success")
                        } else {
                            debugPrint("Failure")
                        }
                    }){
                        Text("OK")
                    }
                    Spacer()
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }){
                        Text("Cancel")
                    }
                }
            }
        }.navigationBarTitle(Text("Задание 2"))
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

//(ФИО, год рождения, телефон, email)
