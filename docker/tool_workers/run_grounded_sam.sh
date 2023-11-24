cd /code
python3 -m pip install -r ./docker/tool_workers/requirements.txt
cd /GSA
ls /models
python3 /code/serve/grounding_dino_worker.py --host="0.0.0.0" --port=41000 --controller="http://controller:10000" --worker="http://grounding_dino_worker:41000" --model-path="/models/groundingdino_swint_ogc.pth"