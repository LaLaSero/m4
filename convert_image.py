import os
from PIL import Image
import numpy as np

folder_name = r'tegaki'

filelist = os.listdir(folder_name)

for filename in filelist:
    if filename.lower().endswith('.jpg'):
        file_name = os.path.join(folder_name, filename)
        # 画像を読み込む
        img = Image.open(file_name)
        # グレースケールに変換
        img = img.convert('L')
        data = np.array(img)
        # 二値化（しきい値は127.5）
        data = data < 255/2
        # ファイル名の拡張子を.txtに変更
        base_name = os.path.splitext(filename)[0]
        txt_file_name = os.path.join(folder_name, base_name + '.txt')
        # データをフラット化して文字列に変換
        data_flat = data.astype(int).flatten()
        data_str = ''.join(str(val) for val in data_flat)
        # テキストファイルに書き込む
        with open(txt_file_name, 'w') as fid:
            fid.write(data_str)
