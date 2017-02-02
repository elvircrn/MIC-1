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

#ifndef H_Work_alu_behavioral_H
#define H_Work_alu_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_alu_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[7];

    HSim__s1 SA[1];
  char t2;
HSimConstraints *c3;
  char *t4;
  char t5;
HSimConstraints *c6;
  char t7;
  char t8;
HSimConstraints *c9;
  char t10;
  char t11;
  char t12;
  char t13;
  char t14;
  char t15;
  char t16;
  char t17;
  char t18;
  char t19;
  char t20;
    Work_alu_behavioral(const char * name);
    ~Work_alu_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_alu_behavioral(const char *name);

#endif
