#include <gtest/gtest.h>

#include "hello.hpp"

TEST(Hello, Assert) {
  int a = add(1, 1);
  EXPECT_EQ(a, 2);
}
