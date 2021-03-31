#include <Math/Factorial.hpp>

#include <gtest/gtest.h>

// NOLINTNEXTLINE
TEST(MyProject, Factorial)
{
    EXPECT_EQ(math::factorial(1U), 1U);
    EXPECT_EQ(math::factorial(2U), 2U);
    EXPECT_EQ(math::factorial(3U), 6U);
    EXPECT_EQ(math::factorial(10U), 3628800U);
}

int main(int argc, char** argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
