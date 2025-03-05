# Download data

wget https://image-net.org/data/ILSVRC/2012/ILSVRC2012_img_train.tar --no-check-certificate
wget https://image-net.org/data/ILSVRC/2012/ILSVRC2012_img_val.tar --no-check-certificate

# Extract validation data
mkdir -p ILSVRC2012/val/
tar xf ILSVRC2012_img_val.tar -C ILSVRC2012/val/
cd ILSVRC2012/val
wget -qO- https://raw.githubusercontent.com/soumith/imagenetloader.torch/master/valprep.sh | bash
cd ../../

# Extract training data
mkdir -p ILSVRC2012/train/
cp ILSVRC2012_img_train.tar ILSVRC2012/train/ && cd ILSVRC2012/train/
tar -xvf ILSVRC2012_img_train.tar && rm -f ILSVRC2012_img_train.tar 
find . -name "*.tar" | while read NAE ; 
    do mkdir -p "${NAE%.tar}"; 
    tar -xvf "${NAE}" -C "${NAE%.tar}"; 
    rm -f "${NAE}"; 
done 

cd ../../