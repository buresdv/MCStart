//
//  ContentView.swift
//  MCStart
//
//  Created by David Bureš on 25.11.2022.
//

import SwiftUI
import MSAL

struct ContentView: View {
    
    @StateObject var instanceCategories = InstanceCategories()
    @StateObject var appState: AppState
    
    @AppStorage("showOnboarding") var showOnboarding: Bool = false
    
    @AppStorage("MSLoginToken") var MSLoginToken: String = ""
    @AppStorage("MSAccountIdentifier") var MSAccountIdentifier: String = ""
    
    var body: some View {
        NavigationView {
            SidebarView(appState: appState, instanceCategories: instanceCategories)
            Text("No Category Selected")
            Text("No Instance Selected")
        }
        .environmentObject(instanceCategories)
        .environmentObject(appState)
        .onAppear {
            #if DEBUG
            print(AppGlobals.categoriesDirectoryPath)
            #endif
            
            initializeFolders(categoryTracker: instanceCategories)
            
            /*if let url: URL = URL(string: "https://login.microsoftonline.com/consumers/oauth2/v2.0/authorize?client_id=\(AppGlobals.clientID)&response_type=code&redirect_uri=\(AppGlobals.redirectURL)&response_mode=query&scope=offline_access%20user.read%20mail.read") {
                NSWorkspace.shared.open(url)
            }*/
            
            Task {
                //let loginPrerequisites: [String] = await getLoginPrerequisites()
                
                #if DEBUG
                //print("sFTTag: \(loginPrerequisites[0])")
                //print("urlPost: \(loginPrerequisites[1])")
                #endif
                
                //await print("Request Microsoft authorization result: \(requestMicrosoftAuthorization())")
            }
            
            #if DEBUG
            print(instanceCategories.categories)
            #endif
            
            #if DEBUG
            print("Here's what the file reading funtion found:")
            do {
                print(try getContentsOfFolder(at: URL(filePath: "/Users/david/Library/Application Support/MCStart/Categories/CB63C5F8-6F53-410A-AE3B-5CEFDA9F0932/7FC61A08-5FF1-4731-8158-4A4BD3EE7C55/mods"), returns: .files))
            } catch let error as NSError {
                print("Error reading contents of folder: \(error)")
            }
            #endif
            
            DispatchQueue.main.async {
                print("Client ID: \(AppGlobals.clientID)")
                let MSConfig = MSALPublicClientApplicationConfig(clientId: AppGlobals.clientID)
                let MSApplication = try? MSALPublicClientApplication(configuration: MSConfig)
                let MSScopes = ["User.Read"]
                
                let MSWebviewParameters = MSALWebviewParameters()
                
                let MSInteractiveParameters = MSALInteractiveTokenParameters(scopes: MSScopes, webviewParameters: MSWebviewParameters)
                MSApplication?.acquireToken(with: MSInteractiveParameters, completionBlock: { (result, error) in
                    guard let MSAuthResult = result, error == nil else {
                        print("Error while authing: \(error!.localizedDescription)")
                        print(error)
                        return
                    }
                    let receivedMSAccessToken = MSAuthResult.accessToken
                    let receivedMSAccountIdentifier = MSAuthResult.account.identifier
                    print("Scopes: \(MSAuthResult.scopes)")
                    
                    /*
                    if MSLoginToken != receivedMSAccessToken {
                        MSLoginToken = receivedMSAccessToken
                    }
                    if MSAccountIdentifier != receivedMSAccountIdentifier {
                        MSAccountIdentifier = receivedMSAccountIdentifier!
                    }
                    */
                    print("Received Token: \(receivedMSAccessToken)")
                    print("Received Account Identifier: \(receivedMSAccountIdentifier)")
                    print("-----")
                    print("Stored Token: \(MSLoginToken)")
                    print("Stored Account Identifier: \(MSAccountIdentifier)")
                })
                
                /*Task {
                    do {
                        print("Will use \(MSLoginToken) as token")
                        print("Identifier: \(MSAccountIdentifier)")
                        
                        let result = try await NetworkingManager().sendRequest(endpointURL: "https://user.auth.xboxlive.com/user/authenticate", httpMethod: .post, headers: [HTTPHeader(headerField: "Content-Type", fieldContents: "application/json"), HTTPHeader(headerField: "Accept", fieldContents: "application/json")], requestBody:"{\"Properties\":{\"AuthMethod\":\"RPS\",\"SiteName\":\"user.auth.xboxlive.com\",\"RpsTicket\":\"d=\(MSLoginToken)\"},\"RelyingParty\":\"https:\\/\\/auth.xboxlive.com\",\"TokenType\": \"JWT\"}")
                        
                        print("Result of XBox authentication: \(result)")
                    } catch let error as NSError {
                        print("Error while authenticating with XBox: \(error)")
                    }
                    
                }*/
            }
            
            /// Microsoft Authentication stuff
            
            /// End of Micosoft Authentication stuff
        }
        .sheet(isPresented: $showOnboarding) {
            OnboardingView(isShowingSheet: $showOnboarding)
        }

    }
}
