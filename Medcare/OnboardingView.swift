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
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(.purple)
                                .transition(.scale)
                                .animation(.easeInOut(duration: 0.3), value: currentStep)
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                                .transition(.scale)
                                .animation(.easeInOut(duration: 0.3), value: currentStep)
                        }
                    }
                }
                .padding(.top, 20)
                
                if self.currentStep < onboardingSteps.count - 1 {
                    Button(action: {
                        withAnimation {
                            self.currentStep += 1
                        }
                    }) {
                        Text("Next")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
                    .padding(.bottom, 30)
                    .animation(.easeInOut(duration: 0.5), value: currentStep)
                } else {
                    NavigationLink(destination: GetStartedView()) {
                        Text("Start")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
                    .padding(.bottom, 30)
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
