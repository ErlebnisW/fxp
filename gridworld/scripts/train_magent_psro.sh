#!/bin/sh
algo="rmappo"
exp="psro_unif"
seed=0
wandb_name="${exp}-seed${seed}"
env="MAgent"
scenario="battle"
map_size=15
max_episode_length=200
num_agents=3
oppo_model_dir="random"
hidden_size=64
layer_N=1
num_env_steps=100000000
n_rollout_threads=1
episode_length=200
data_chunk_length=10
num_mini_batch=1
ppo_epoch=5
iter_min_steps=5000000
iter_max_steps=5000000
mean_threshold=0.99
std_threshold=0.003
meta_solver="uniform"
psro_eval_episodes=50
n_eval_rollout_threads=1
log_interval=100000
save_interval=1000000


CUDA_VISIBLE_DEVICES=1 python train/train_magent_psro.py \
--algorithm_name ${algo} --experiment_name ${exp} --seed ${seed} \
--env_name ${env} --scenario_name ${scenario} --map_size ${map_size} \
--one_side --use_population \
--oppo_model_dir "${oppo_model_dir}" \
--max_episode_length ${max_episode_length} --num_agents ${num_agents} \
--iter_min_steps ${iter_min_steps} --iter_max_steps ${iter_max_steps} \
--mean_threshold ${mean_threshold} --std_threshold ${std_threshold} \
--hidden_size ${hidden_size} --layer_N ${layer_N} \
--num_env_steps ${num_env_steps} --n_rollout_threads ${n_rollout_threads} \
--episode_length ${episode_length} --data_chunk_length ${data_chunk_length} \
--num_mini_batch ${num_mini_batch} --ppo_epoch ${ppo_epoch} \
--log_interval ${log_interval} --save_interval ${save_interval} \
--psro_eval_episodes ${psro_eval_episodes} --n_eval_rollout_threads ${n_eval_rollout_threads} \
--user_name "zelaix" --wandb_name ${wandb_name}
