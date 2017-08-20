//
//  igood.h
//  text_4
//
//  Created by Paruir on 13.08.17.
//  Copyright © 2017 Paruir. All rights reserved.
//

#ifndef igood_h
#define igood_h


#include <string>

struct iGood
{
    virtual std::string getModel() const = 0;
    virtual double getPrice() const = 0;
    virtual double getRealPrice() const = 0;
};



#endif /* igood_h */
