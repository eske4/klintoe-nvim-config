;; cpp
#pragma once

#include <algorithm>
#include <iostream>
#include <memory>
#include <utility> // for std::move
#include <vector>

class {{_file_name_}}{{_cursor_}} 
{
public:
  // Default constructor
  {{_file_name_}}() = default;

  // For single argument constructor with  only 1 parameter
  explicit {{_file_name_}}(int initialValue);

  // Destructor
  ~{{_file_name_}}() = default;

  // Copy constructor
  {{_file_name_}}(const {{_file_name_}} &other) = default;

  // Move constructor
  {{_file_name_}}({{_file_name_}} &&other) noexcept = default;

  // Copy assignment operator
  {{_file_name_}} &operator=(const {{_file_name_}} &other) = default;

  // Move assignment operator
  {{_file_name_}} &operator=({{_file_name_}} &&other) noexcept = default;

protected:
  // Protected member functions

  // Protected member variables

private:
  // Private member functions

  // Private member variables
};
