//
//  watch.cpp
//  text_4
//
//  Created by Paruir on 13.08.17.
//  Copyright © 2017 Paruir. All rights reserved.
//
#include "iGood.h"

class Watch : public iGood
{
    virtual std::string getModel() const
    {
        return "Tag Heuer monaco";
    }
    virtual double getPrice() const
    {
        return 3500;
    }
    virtual double getRealPrice() const
    {
        return 3000;
    }
    
};

std::unique_ptr<iGood> createWatch()
{
    return std::unique_ptr<iGood>(new Watch);
}
