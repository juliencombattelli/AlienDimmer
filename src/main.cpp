#include <spdlog/spdlog.h>

#include <iostream>

int main(int /*argc*/, const char** /*argv*/)
{
    //Use the default logger (stdout, multi-threaded, colored)
    spdlog::info("Hello, {}!", "World");

    fmt::print("Hello, from {}\n", "{fmt}");
}
