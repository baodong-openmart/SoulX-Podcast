#!/bin/bash

export PYTHONPATH="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
echo "PYTHONPATH set to: $PYTHONPATH"


text=${1:-"hmm"}
prompt_text=${2:-"喜欢攀岩、徒步、滑雪的语言爱好者，以及过两天要带着全部家当去景德镇做陶瓷的白日梦想家。"}
prompt_audio=${3:-"example/audios/female_mandarin.wav"}
output_path=${4:-"outputs/mandarin_tts.wav"}


python cli/tts.py \
        --text "${text}" \
        --prompt_text "${prompt_text}" \
        --prompt_audio "${prompt_audio}" \
        --output_path "${output_path}" \
        --seed 7 \
        --dialect_prompt "" \
        --model_path "pretrained_models/SoulX-Podcast-1.7B"


text=${1:-"hmm"}
voice_id=${2:-"1"}
output_path=${3:-"outputs/infer_tts.wav"}

# 根据 voice_id 设置 prompt_text 和 prompt_audio
case "${voice_id}" in
    "1")
        prompt_text="So, streaming surpasses combined broadcast and cable viewing for the first time ever."
        prompt_audio="example/audios/S1.wav"
        ;;
    "2")
        prompt_text="I had somebody spend over 7 million against me in that race, it was tough."
        prompt_audio="example/audios/S2.wav"
        ;;
    "3")
        prompt_text="喜欢攀岩、徒步、滑雪的语言爱好者，以及过两天要带着全部家当去景德镇做陶瓷的白日梦想家。"
        prompt_audio="example/audios/female_mandarin.wav"
        ;;
    "4")
        prompt_text="呃，还有一个就是要跟大家纠正一点，就是我们在看电影的时候，尤其是游戏玩家，看电影的时候，在看到那个到西北那边的这个陕北民谣，嗯，这个可能在想，哎，是不是他是受到了黑神话的启发？"
        prompt_audio="example/audios/male_mandarin.wav"
        ;;
    *)
        # 默认使用第一组
        prompt_text="喜欢攀岩、徒步、滑雪的语言爱好者，以及过两天要带着全部家当去景德镇做陶瓷的白日梦想家。"
        prompt_audio="example/audios/female_mandarin.wav"
        ;;
esac

echo "Using voice_id: ${voice_id}"
echo "Prompt text: ${prompt_text}"
echo "Prompt audio: ${prompt_audio}"

python cli/tts.py \
        --text "${text}" \
        --prompt_text "${prompt_text}" \
        --prompt_audio "${prompt_audio}" \
        --output_path "${output_path}" \
        --seed 7 \
        --dialect_prompt "" \
        --model_path "pretrained_models/SoulX-Podcast-1.7B"

# How to use:
# /workspace/SoulX-Podcast/example/infer_tts.sh "All prompt audio samples used in the following generations are in Mandarin" "2"
