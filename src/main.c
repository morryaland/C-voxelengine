#include <stdlib.h>
#include <stdio.h>
#include <math.h>
//
#include "include/point_cloud.h"

#define POINT_C 10000

int main() {
  POINT_CLOUD cloud;
  point_cloud_init(&cloud, POINT_C, LOL);
  for (int i = 0; i < POINT_C; i++) {
    cloud.points[i].pos.x = rand()%100000;
    cloud.points[i].pos.y = rand()%100000;
    cloud.points[i].pos.z = rand()%100000;
  }
  point_cloud_update(&cloud);
  point_cloud_destroy(&cloud);
}
