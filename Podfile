# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

def test_pods
  pod 'Quick', '~> 6.0.0'
  pod 'Nimble'
end

target 'WallaMarvel' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for WallaMarvel
  pod 'Kingfisher', '~> 7.2.4'
  target 'WallaMarvelTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end

  target 'WallaMarvelUITests' do
    # Pods for testing
    test_pods
  end

end
