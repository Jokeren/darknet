hpcrun -o hpctoolkit-darknet-measurements -e gpu=nvidia ./darknet detector test ./cfg/coco.data ./cfg/yolov3-tiny.cfg ./yolov3-tiny.weights ./data/dog.jpg -ext_output -dont_show -out result.json
cp -rf structs hpctoolkit-darknet-measurements/
hpcrun -o hpctoolkit-darknet-measurements -e gpu=nvidia,sanitizer@100 -ck HPCRUN_SANITIZER_MEM_VIEWS=10 -ck HPCRUN_SANITIZER_BUFFER_POOL_SIZE=1000 ./darknet detector test ./cfg/coco.data ./cfg/yolov3-tiny.cfg ./yolov3-tiny.weights ./data/dog.jpg -ext_output -dont_show -out result.json
hpcstruct ./darknet
hpcprof -S ./darknet.hpcstruct hpctoolkit-darknet-measurements
