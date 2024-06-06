import ray
import time

import utils


def hello_world(conf, unique_name):
    print(conf)
    for i in range(50):
        time.sleep(1)
        print(i)
    return "hello world"


if __name__ == "__main__":
    runner = utils.create_wandb_wrapper(hello_world)
    runner = utils.create_ray_wrapper(runner, num_cpus=10, num_gpus=1)
    runner = utils.create_hydra_wrapper(runner, path_to_conf_dir='conf', conf_name='config_sft')
    runner()

