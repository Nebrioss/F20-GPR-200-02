#pragma once
#ifndef HITTABLE_H
#define HITTABLE_H

#include "ray.h"


//records what direction the sphere was hit form
struct hit_record {
    point3 p;
    vect3 normal;
    double t;
    bool front_face;

    inline void set_face_normal(const ray& r, const vect3& outward_normal) {
        front_face = dot(r.direction(), outward_normal) < 0;
        normal = front_face ? outward_normal : -outward_normal;
    }
};

//yes or no boolean checking for contact
class hittable {
public:
    virtual bool hit(const ray& r, double t_min, double t_max, hit_record& rec) const = 0;
};

#endif