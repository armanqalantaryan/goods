//
//  test.cpp
//  text_4
//
//  Created by Paruir on 13.08.17.
//  Copyright © 2017 Paruir. All rights reserved.
//
#include "iGood.h"

class iPhone : public iGood
{
    virtual std::string getModel() const
    {
        return "iphone 7";
    }
    virtual double getPrice() const
    {
        return 700;
    }
    virtual double getRealPrice() const
    {
        return 600;
    }
    
    void f()
    {
        
    }
};

std::unique_ptr<iGood> createIPhone()
{
    return std::unique_ptr<iGood>(new iPhone);
}
