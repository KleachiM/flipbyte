#include <iostream>
#include "ByteReverse.h"

using namespace std;

bool IsOnlyDigits(string arg) {
    for(int i = 0; i < arg.size(); i++)
    {
        int charNum = static_cast<int>(arg.at(i));
        if ((charNum < 48) || (charNum > 57))
        {
            return false;
        }
    }

    return true;
}

int main(int argc, char* argv[])
{
    if (argc != 2)
    {
        cout << "Invalid arguments count\n"
             << "Usage: flipbyte.exe <integer in range 0 - 255 in decimal system>\n";
        return 1;
    }

    if (!IsOnlyDigits(argv[1]))
    {
        cout << "Argument must be integer in range 0 - 255 in decimal system\n";
        return 1;
    }

    try
    {
        if (stoi(argv[1]) > 255)
        {
            cout << "Argument must be integer in range 0 - 255 in decimal system\n";
            return 1;
        }
    }
    catch (const out_of_range& err)
    {
        cout << "Argument must be integer in range 0 - 255 in decimal system\n";
        return 1;
    }


    u_int8_t num = static_cast<u_int8_t>(stoi(argv[1]));
    u_int8_t reversedNum = FlipByte(num);

    cout << static_cast<int>(reversedNum) << "\n";
    return 0;
}