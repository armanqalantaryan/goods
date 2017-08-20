//
//  ViewController.m
//  text_4
//
//  Created by Paruir on 13.08.17.
//  Copyright © 2017 Paruir. All rights reserved.
//

#import "ViewController.h"

#include <iostream>
#include "iGood.h"
#include <vector>
#include <sstream>
#include <map>

using namespace std;

unique_ptr<iGood> createIPhone();
unique_ptr<iGood> createTV();
unique_ptr<iGood> createWatch();

class Store
{
public:
    
    enum GoodTypes {IPHONE, TV, Watch};
    
private:
    
    typedef unique_ptr<iGood> (*GoodCreator)();
    map<GoodTypes, GoodCreator> _type2goods;
    vector<unique_ptr<iGood>> _goods;
    
public:
    
    Store()
    {
        _type2goods[IPHONE] = createIPhone;
        _type2goods[TV] = createTV;
        _type2goods[Watch]= createWatch;
    }
    
    void addGood(GoodTypes good, int count)
    {
        for (int i = 0; i < count; ++i)
        {
            auto creator = _type2goods[good];
            
            _goods.push_back(creator());
        }
    }
    void print()
    {
        map<string,int> m;
        for(auto& x : _goods)
        {
            m[x->getModel()]++;
            
        }
        for(auto x: m)
        {
            //cout<<x.first<<" "<<x.second<<" hat"<<endl;
        }
    }
    
    int getGoodCount(const string& model)
    {
        map<string,int> m;
        for(auto& x : _goods)
        {
            m[x->getModel()]++;
            
            
        }
        return m[model];
    }
    
    std::string find(std::string s)
    {
        string m = "";
        for(auto& x: _goods)
        {
            if(x->getModel()==s)
            {
                stringstream ss;
                ss << x->getPrice();
                m += "Price: ";
                m += ss.str();
                m += " count -";
                
                ss.str("");
                ss << getGoodCount(s);
                m += ss.str();
                break;
            }
        }
        return m;
    }
    
};

@interface ViewController ()

@end

@implementation ViewController

Store _store;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _store.addGood(Store::IPHONE, 4);
    _store.addGood(Store::TV, 3);
    _store.addGood(Store::Watch, 2);
 
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)onEnter:(id)sender {
    NSLog(@"onEnter event");
}
- (IBAction)EditingEnd:(id)sender {
    
}

- (IBAction)OnTuchDownTExt:(id)sender {
    NSLog(@"OnTuchDownText event");

    
    auto str = _mytext.text;
    std::string ss = std::string([str UTF8String]);
    
    auto sss = _store.find(ss);
    
    NSString *errorMessage = [NSString stringWithCString:sss.c_str()
                                                encoding:[NSString defaultCStringEncoding]];
    _mylabel.text = errorMessage;
    
}

- (IBAction)onpush:(id)sender {

    
    auto str = _mytext.text;
    std::string ss = std::string([str UTF8String]);
    
    auto sss = _store.find(ss);
    
    NSString *errorMessage = [NSString stringWithCString:sss.c_str()
                                                encoding:[NSString defaultCStringEncoding]];
    _mylabel.text = errorMessage;
    
   // std::cout << sss << std::endl;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
