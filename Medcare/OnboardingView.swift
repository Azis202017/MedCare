import SwiftUI

struct OnboardingStep {
    let image: String
    let title: String
    let description: String
}

private let onboardingSteps = [
    OnboardingStep(image: "Onboarding1", title: "Online Consultation", description: "Connect with healthcare professionals virtually for convenient medical advice and support."),
    OnboardingStep(image: "Onboarding2", title: "24 Hours Ready to Serve", description: "Instant access to expert medical assistance. Get the care you need, when you need it, with our app."),
    OnboardingStep(image: "Onboarding3", title: "Medical Record Data Patient", description: "Instant access to expert medical assistance. Get the care you need, when you need it, with our app.")
]

struct OnboardingView: View {
    @State private var currentStep = 0
    @State private var animate = false
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentStep) {
                    ForEach(0..<onboardingSteps.count) { index in
                        OnboardingPageView(
                            imageName: onboardingSteps[index].image,
                            title: onboardingSteps[index].title,
                            description: onboardingSteps[index].description
                        )
                        .tag(index)
                        .opacity(currentStep == index ? 1 : 0)
                        .scaleEffect(currentStep == index ? 1 : 0.8)
                        .animation(.easeInOut(duration: 0.5), value: currentStep)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onAppear {
                    animate = true
                }
                
                HStack {
                    ForEach(0..<onboardingSteps.count) { index in
                        if index == currentStep {
                            Circle()
                                .frame(width: 8, height: 8)
                                .cornerRadius(8)
                                .foregroundColor(Color("PrimaryColor"))
                                .transition(.scale)
                                .animation(.easeInOut(duration: 0.3), value: currentStep)
                        } else {
                            Circle()
                                .frame(width: 8, height: 8)
                                .cornerRadius(8)
                                .foregroundColor(Color("ThirdColor"))
                                .transition(.scale)
                                .animation(.easeInOut(duration: 0.3), value: currentStep)
                        }
                    }
                }
           
                
                if self.currentStep < onboardingSteps.count - 1 {
                    Button(action: {
                        withAnimation {
                            self.currentStep += 1
                        }
                    }) {
                        Spacer()
                        Text("Next")
                            .fontWeight(.bold)
                            .padding()
                        
                        
                        
                        Spacer()
                    }   .frame(maxWidth: .infinity)
                        .background(Color("PrimaryColor"))
                        .foregroundColor(.white)
                    
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                        .animation(.easeInOut(duration: 0.5), value: currentStep)    .padding(.horizontal, 28).padding(.top,50)
                } else {
                    NavigationLink(destination: GetStartedView()) {
                        Text("Start")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("PrimaryColor"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 28)
                    }
                    .padding(.bottom, 30)
                    .padding(.top,50)
                    .animation(.easeInOut(duration: 0.5), value: currentStep)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct OnboardingPageView: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            Spacer().frame(height:30)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
    }
}



#Preview {
    OnboardingView()
}
