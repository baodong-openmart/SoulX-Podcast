export PYTHONPATH="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
echo "PYTHONPATH set to: $PYTHONPATH"

# Note: To infer Chinese dialects, set model_dir to "pretrained_models/SoulX-Podcast-1.7B-dialect
model_dir=pretrained_models/SoulX-Podcast-1.7B
#input_file=/workspace/SoulX-Podcast/example/podcast_script/script_english.json
input_file=/workspace/rhythm-emulation/assets/output/podcast_script.json
echo ${input_file}

/usr/bin/python /workspace/SoulX-Podcast/cli/podcast.py \
        --json_path ${input_file} \
        --model_path ${model_dir} \
        --output_path /workspace/rhythm-emulation/assets/output/podcast-with-pi.wav \
        --seed 7