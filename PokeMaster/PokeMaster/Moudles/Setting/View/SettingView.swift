//
//  SettingView.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/7.
//  Copyright © 2020 huangjian. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    
    //@ObservedObject var settings = Settings()
    @EnvironmentObject var store: Store
    
    var settingsBinding: Binding<AppState.Settings> {
        $store.appState.settings
    }
    var settings: AppState.Settings {
        store.appState.settings
    }
    var body: some View {
        Form {
            accountSection
            optionSection
            actionSection
        }
            ///使用 .alert 来弹出一个 Alert 对话框。alert(item:content:) 接受 一个 Identifiable? 的绑定，当这个绑定值不为 nil 时，显示一个弹框。用户在点击弹 框按钮 dismiss 弹框时，绑定值将被置回 nil
        .alert(item: settingsBinding.loginError) { (error) -> Alert in
            Alert(title: Text(error.localizedDescription))
        }
    }

    var accountSection: some View {
        Section(header: Text("账户")) {
            if settings.loginUser == nil {
                Picker(selection: settingsBinding.checker.accountBehavior, label: Text("")) {
                    ForEach(AppState.Settings.AccountBehavior.allCases, id: \.self) {
                        Text($0.text)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                TextField("电子邮箱", text: settingsBinding.checker.email).foregroundColor(settings.isEmailValid ? .green : .red)
                SecureField("密码", text: settingsBinding.checker.password)
                if settings.checker.accountBehavior == .register {
                    SecureField("确认密码", text: settingsBinding.checker.verifyPassword)
                }
                
                if settings.loginRequesting {
                    ActivityIndicatorView()
                }else{
                    Button(settings.checker.accountBehavior.text) {
                        print("登录/注册")
                        self.store.dispatch(.login(email: self.settings.checker.email, password: self.settings.checker.password))
                    }
                }
            }else{
                Text(settings.loginUser!.email)
                Button("注销") {
                    print("注销")
                    self.store.dispatch(.logout)
                }
            }
        }
    }
    
    var optionSection: some View {
        Section(header: Text("选项")) {
            Toggle(isOn: settingsBinding.showEnglishName) {
                Text("显示英文名")
            }
            Picker(selection: settingsBinding.sorting, label: Text("排序方式")) {
                ForEach(AppState.Settings.Sorting.allCases, id: \.self) {
                    Text($0.text)
                }
            }
            Toggle(isOn: settingsBinding.showFavoriteOnly) {
                Text("只显示收藏")
            }
        }
    }
    
    var actionSection: some View {
        Section {
            Button(action:{
                print("清空缓存")
            }) {
                Text("清空缓存").foregroundColor(.red)
            }
        }
    }
    
    var activityIndicatorView: some UIView {
        UIActivityIndicatorView(style: .large)
    }
    
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store()
        store.appState.settings.sorting = .color
        return SettingView().environmentObject(store)
    }
}
