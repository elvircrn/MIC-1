#include <iostream>
#include <string>
#include <cstring>
#include <vector>
#include <sstream>
#include <algorithm>
#include <regex>
#include <map>
#include <bitset>
#include <iomanip>

std::string to_bin_str(int x, int width = -1)
{
    std::string ret = "";

    while (x)
    {
        ret += (x & 1) ? "1" : "0";
        x >>= 1;
    }

    int diff = 0;
    if (width > ret.length())
        diff = width - ret.length();

    for (int i = 0; i < diff; i++)
        ret += "0";

    std::reverse(ret.begin(), ret.end());

    return ret;
}

std::string remove_whitespace(const std::string &str)
{
    std::string ret;
    for (auto &x : str)
        if (x != ' ' )
            ret += x;
    return ret;
}

std::vector<std::string> registers = {
    "pc"     ,
    "ac"     ,
    "sp"     ,
    "ir"     ,
    "tir"    ,
    "(0)"   ,
    "(1)"  ,
    "(-1)"  ,
    "amask"  ,
    "smask"  ,
    "a"      ,
    "b"      ,
    "c"      ,
    "d"      ,
    "e"      ,
    "f" };

std::map<std::string, std::string> alu_op;
std::map<std::string, std::string> reg_addr;

std::string interpret(std::string command)
{
    return "";
}

void init()
{
    for (int i = 0; i < registers.size(); i++)
        reg_addr[registers[i]] = to_bin_str(i, 4);
    alu_op["+"] = "00";
    alu_op["band"] = "10";
    alu_op["inv"] = "11";
}

std::string parse_amux(const std::string &instr)
{
    // \s*inv\s*\(\s*mbr\s*\) e.g inv(mbr);
    if (std::regex_search(instr, std::regex("\\S*inv\\s*\\(\\s*mbr\\s*\\)")))
        return "1";
    // mbr + something
    else if (std::regex_search(instr, std::regex("\\s*mbr\\s*\\+")))
        return "1";
    // something + mbr
    else if (std::regex_search(instr, std::regex("\\+\\s*mbr\\s*")))
        return "1";
    // lshift(mbr)
    else if (std::regex_search(instr, std::regex("\\S*lshift\\s*\\(\\s*mbr\\s*\\)")))
        return "1";
    // rshift(mbr)
    else if (std::regex_search(instr, std::regex("\\S*rshift\\s*\\(\\s*mbr\\s*\\)")))
        return "1";
    // := mbr
    else if (std::regex_search(instr, std::regex(":=\\s*mbr")))
        return "1";
    else
        return "0";
}

std::string parse_cond(std::string instr)
{
    //  asdasdasdsd  if   n
    if (std::regex_search(instr, std::regex(".*\\sif+\\ +n\\s*")))
        return "01";
    else if (std::regex_search(instr, std::regex(".*\\sif+\\ +z\\s*")))
        return "10";
    else if (std::regex_search(instr, std::regex(".*goto.*")))
        return "11";
    else
        return "00";
}

std::string parse_alu(const std::string &instr)
{
    if (instr.find("+") != std::string::npos)
        return "00";
    else if (instr.find("^") != std::string::npos)
        return "01";
    else if (instr.find("inv") != std::string::npos)
        return "11";
    else
        return "10";
}

std::string parse_shf(const std::string &instr)
{
    if (instr.find("lshift") != std::string::npos)
        return "10";
    else if (instr.find("rshift") != std::string::npos)
        return "01";
    else
        return "00";
}

std::string parse_rd(const std::string &instr)
{
    if (instr.find("rd") != std::string::npos)
        return "1";
    else
        return "0";
}

std::string parse_wd(const std::string &instr)
{
    if (instr.find("wd") != std::string::npos)
        return "1";
    else
        return "0";
}

std::string parse_mar(const std::string &instr)
{
    if (std::regex_search(instr, std::regex("mar\\s*:=")))
        return "1";
    else
        return "0";
}
std::string parse_mbr(const std::string &instr)
{
    if (std::regex_search(instr, std::regex("mbr\\s*:=")))
        return "1";
    else
        return "0";
}

std::string parse_addr(const std::string &instr)
{
    auto pattern = std::regex("\\S*goto\\S* [0-9]+");
    if (std::regex_search(instr, pattern))
    {
        std::stringstream ss;
        auto match = std::sregex_iterator(instr.begin(), instr.end(), pattern);
        std::string buff;
        ss << match->str();
        ss >> buff;
        if (buff.back() == '+' || buff.back() == '^')
            buff.pop_back();
        int num;
        ss >> num;
        return to_bin_str(num, 8);
    }

    return "00000000";
}

std::string parse_a(const std::string &instr)
{
    // lhs of + or ^
    auto pattern = std::regex("\\S*([a-z|A-z]+|\\(\\+1\\)|\\(\\-1\\)|0)\\s*[+|^]");

    if (std::regex_search(instr, pattern))
    {
        std::stringstream ss;
        auto match = std::sregex_iterator(instr.begin(), instr.end(), pattern);
        std::string buff;
        ss << match->str();
        ss >> buff;
        return reg_addr[buff];
    }

    // inv(x)
    pattern = std::regex("\\S*(inv|lshift|rshift)\\s*\\(\\s*([a-z|A-z]+|\\(\\+1\\)|\\(\\-1\\)|0)\\s*\\)");

    if (std::regex_search(instr, pattern))
    {
        std::stringstream ss;
        auto match = std::sregex_iterator(instr.begin(), instr.end(), pattern);
        std::string buff;
        ss << match->str();

        char c;
        ss.get(c);
        ss.get(c);
        ss.get(c);

        for (;;)
        {
            ss.get(c);
            if (c == '(')
                break;
        }
        ss >> buff;
        if (buff.back() == ')')
            buff.pop_back();

        if (buff == "mbr")
            return "0000";
        else
            return reg_addr[buff];
    }




    // mbr := xxxx

    std::string regset = "(";
    for (auto & x : registers)
        if (x != "(1)" && x != "(-1)" && x != "(0)")
            regset += x + "|";
    regset.pop_back();
    regset += ")";

    pattern = std::regex("mbr\\s*:=\\s*" + regset);
    if (std::regex_search(instr, pattern))
    {
        std::stringstream ss;
        auto match = std::sregex_iterator(instr.begin(), instr.end(), pattern);
        std::string buff;
        char c;

        std::string str = match->str();
        while (isalpha(str.back()))
        {
            buff += str.back();
            str.pop_back();
        }


        std::reverse(buff.begin(), buff.end());

        return reg_addr[buff];
    }

    pattern = std::regex("\\s*:=\\s*" + regset);
    if (std::regex_search(instr, pattern))
    {
        std::stringstream ss;
        auto match = std::sregex_iterator(instr.begin(), instr.end(), pattern);
        std::string buff;
        ss << match->str();

        char c;
        ss.get(c);
        ss.get(c);

        for (;;)
        {
            ss.get(c);
            if (isalpha(c))
                break;
        }
        ss >> buff;
        buff = c + buff;
        while (!isalpha(buff.back()))
            buff.pop_back();

        return reg_addr[buff];
    }


    return "0000";
}


std::string parse_b(const std::string &instr)
{
    // mar := nesto
    std::string regset = "(";
    for (auto & x : registers)
        if (x != "(1)" && x != "(-1)" && x != "(0)")
            regset += x + "|";
    regset.pop_back();
    regset += ")";

    auto pattern = std::regex("mar\\s*:=\\s*" + regset);
    if (std::regex_search(instr, pattern))
    {
        std::stringstream ss;
        auto match = std::sregex_iterator(instr.begin(), instr.end(), pattern);
        std::string buff;
        char c;

        std::string str = match->str();
        while (isalpha(str.back()))
        {
            buff += str.back();
            str.pop_back();
        }
        std::reverse(buff.begin(), buff.end());

        return reg_addr[buff];
    }


    // + asdasd
    pattern = std::regex("\\S*[+|^]\\s*([a-z|A-z]+|\\(\\+1\\)|\\(\\-1\\)|0)");

    if (std::regex_search(instr, pattern))
    {
        std::stringstream ss;
        auto match = std::sregex_iterator(instr.begin(), instr.end(), pattern);
        std::string buff;
        ss << match->str();
        char c;
        ss.get(c);
        ss >> buff;
        return reg_addr[buff];
    }
    return "0000";
}


std::string parse_c(const std::string &instr)
{
    auto pattern = std::regex("\\S*[a-z|A-Z]\\s*:=");
    if (std::regex_search(instr, pattern))
    {
        std::stringstream ss;
        auto match = std::sregex_iterator(instr.begin(), instr.end(), pattern);
        std::string buff;
        ss << match->str();

        ss >> buff;

        if (buff != "alu" && buff != "mar" && buff != "mbr")
            return reg_addr[buff];
    }

    return "0000";

}

std::string parse_enc(const std::string &instr)
{
    std::string regset;
    for (auto & x : registers)
        if (x != "(1)" && x != "(-1)" && x != "(0)")
            regset += x + "|";
    regset.pop_back();
    return std::regex_search(instr, std::regex("\\S*(" + regset + ")\\s*:=")) ? "1" : "0";
}

unsigned int bintohex(char *digits){
  unsigned int res=0;
  while(*digits)
    res = (res<<1)|(*digits++ -'0');
  return res;
}

void tolow(std::string &str)
{
    for (int i = 0; i < str.length(); i++)
        str[i] = std::tolower(str[i]);
}

std::string parse(const std::string &in)
{
    std::string instr = in;

    tolow(instr);

    std::string bin_instr = "";

    std::vector<std::string> instrs;

    instrs.push_back(parse_amux(instr));
    instrs.push_back(parse_cond(instr));
    instrs.push_back(parse_alu(instr));
    instrs.push_back(parse_shf(instr));
    instrs.push_back(parse_mbr(instr));
    instrs.push_back(parse_mar(instr));
    instrs.push_back(parse_rd(instr));
    instrs.push_back(parse_wd(instr));
    instrs.push_back(parse_enc(instr));
    instrs.push_back(parse_c(instr));
    instrs.push_back(parse_b(instr));
    instrs.push_back(parse_a(instr));
    instrs.push_back(parse_addr(instr));

    for (auto &x : instrs)
    {
        #ifdef DEBUG
        std::bitset<8> bset(x);
        std::stringstream res;
        res << std::hex << bset.to_ulong();
        x = res.str() + "|";
        #endif
        bin_instr += x;
    }
    return bin_instr;
}

int main()
{
    init(); // Mora se pozvati!!!

    std::vector<std::pair<int, std::string>> rets =
    {
        { 1, "ac := ac + (1);" },
        { 2, "ac := ac + (1);" },
        { 3, "ac := ac + (1);" },
        { 4, "rd; goto 82" },
        { 80, "mar := ir; rd;" },
        { 81, "b := (0); rd;" },
        { 82, "a := mbr;" },
        { 83, "alu := a; if z then goto 88;" },
        { 84, "alu := a ^ (1); if z then goto 86" },
        { 85, "b := b + ac;" },
        { 86, "ac := ac + ac;" },
        { 87, "a := rshift ( a ); goto 83;" },
        { 88, "ac := b;" }
    };

    for (auto &instr : rets)
        std::cout << std::setw(5) << instr.first << " => \"" <<  parse(instr.second) << "\",\n";

    return 0;
}

















