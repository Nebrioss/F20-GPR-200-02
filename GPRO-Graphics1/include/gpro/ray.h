#pragma once
#ifndef RAY_H
#define RAY_H

#include "vec3.h"

//raycasting class
class ray {
public:
    ray() {}
    ray(const point3& origin, const vect3& direction)
        : orig(origin), dir(direction)
    {}

    point3 origin() const { return orig; }
    vect3 direction() const { return dir; }

    point3 at(double t) const {
        return orig + t * dir;
    }

public:
    point3 orig;
    vect3 dir;
};

#endif