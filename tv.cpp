//
//  tv.cpp
//  text_4
//
//  Created by Paruir on 13.08.17.
//  Copyright © 2017 Paruir. All rights reserved.
//


#include "iGood.h"

class TV : public iGood
{
    virtual std::string getModel() const
    {
        return "Sony Bravia";
    }
    virtual double getPrice() const
    {
        return 750;
    }
    virtual double getRealPrice() const
    {
        return 650;
    }
};

std::unique_ptr<iGood> createTV()
{
    return std::unique_ptr<iGood>(new TV);
}
