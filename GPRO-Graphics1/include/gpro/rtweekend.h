#pragma once
#ifndef RTWEEKEND_H
#define RTWEEKEND_H

#include <cmath>
#include <cstdlib>
#include <limits>
#include <memory>

//different namespaces required by the book

using std::shared_ptr;
using std::make_shared;
using std::sqrt;

//constants, neither of these values can be change due to their nature

const double infinity = std::numeric_limits<double>::infinity();
const double pi = 3.1415926535897932385;

//converts degrees to radians for raytracing

inline double degrees_to_radians(double degrees) {
    return degrees * pi / 180.0;
}

//headers for other files

#include "ray.h"
#include "vec3.h"

#endif