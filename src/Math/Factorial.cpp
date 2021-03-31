#include <stdexcept>
#include <string>

#include <Math/Factorial.hpp>

namespace math {

[[nodiscard]] unsigned int factorial(unsigned int n)
{
    constexpr unsigned int max_exp = 17;
    if (n >= max_exp) {
        throw std::overflow_error("factorial(" + std::to_string(n) + ") does not fit in an unsigned int");
    }
    unsigned int res = 1;
    for (unsigned int i = 2; i <= n; ++i) {
        res *= i;
    }
    return res;
}

} // namespace math