#ifndef OMPT_TARGET_H
#define OMPT_TARGET_H

#include "ompt-internal.h"

ompt_task_id_t __ompt_get_task_id_internal(int depth);


ompt_target_id_t __ompt_target_id_new();

ompt_data_map_id_t __ompt_data_map_id_new();

void __ompt_initialize_openmp_runtime();

ompt_target_info_t* __ompt_get_target_info();

#endif
