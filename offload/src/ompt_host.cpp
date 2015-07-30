#include "offload_util.h"
#include "ompt_target.h"

ompt_get_task_id_t ompt_get_task_id;
ompt_enabled_t ompt_enabled;
ompt_get_target_callback_t __ompt_get_target_callback;

void __ompt_target_initialize()
{
    static int ompt_target_initialized = 0;
    static mutex_t lock;

    mutex_locker_t locker(lock);
    if (ompt_target_initialized == 0) {
        ompt_target_initialized = 1;

        ompt_target_initialize(&ompt_get_task_id, &ompt_enabled,
                               &__ompt_get_target_callback);
    }
}


static inline uint64_t increment_id(uint64_t *ptr)
{
#ifndef TARGET_WINNT
    return __sync_fetch_and_add(ptr, 1);
#else // TARGET_WINNT
    return _InterlockedIncrement(ptr);
#endif // TARGET_WINNT
}

ompt_target_id_t __ompt_target_id_new()
{
    static uint64_t ompt_target_id = 1;
    return increment_id(&ompt_target_id);
}

ompt_data_map_id_t __ompt_data_map_id_new()
{
    static uint64_t ompt_data_map_id = 1;
    return increment_id(&ompt_data_map_id);
}
