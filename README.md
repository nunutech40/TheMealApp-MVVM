# TheMealApp-MVVM

# How to Run this mini project MVVM - TheMealsApp

- install XCode
- Open terminal and directory on your macbook
- git clone: 
- pod install on terminal with directory for your project.
- open 


# About the code this mini project - TheMealsApp-MVVM
- I Use 3 layer in my structur project Data-Domain-Feature for approach my MVVM
- in Feature there is View and ViewModel from Model-View-ViewModel. in View there is ViewController(storyboard / XIB), View and Cell, (vc, view, cell) are View. Then on Features there is ViewModel too. This View and ViewModel is View layer.
- In Core there is Data and Domain, in Data there is data response from API and local data and repository for manage data from API or Local
- in Domain there is Model and UseCase
- Then ViewModel will access bisnis model from usecase.

#Dependency i use
- I use RxSwift and RxCocoa for make this mvvm can use reactive programming
- I use Alamofire for get data from API
