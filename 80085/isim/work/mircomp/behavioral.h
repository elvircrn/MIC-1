////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_mircomp_behavioral_H
#define H_Work_mircomp_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_mircomp_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[18];

    HSim__s1 SA[2];
    Work_mircomp_behavioral(const char * name);
    ~Work_mircomp_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_mircomp_behavioral(const char *name);

#endif
