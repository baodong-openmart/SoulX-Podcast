#input_file=/workspace/SoulX-Podcast/example/podcast_script/script_english.json
input_file=/workspace/rhythm-emulation/assets/output/podcast_script.json
echo ${input_file}

uv run cli/podcast.py \
        --json_path ${input_file} \
        --model_path "pretrained_models/SoulX-Podcast-1.7B" \
        --output_path /workspace/rhythm-emulation/assets/output/podcast-with-pi.wav \
        --seed 7
