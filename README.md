这是清华大学电子工程系 2024 夏季学期课程《MATLAB高级编程与工程应用》。



共有两组综合实验：

第一组：音乐合成，语音合成。

第二组：图像处理，连连看。

本实验为第二组实验中的**“图像处理”**。



文件结构如下：

```
.
|-- README.md
|-- doc
|   `-- Guide.pdf
|-- report
|   |-- debug.png
|   |-- fig1_1.jpg
|   |-- fig1_2.jpg
|   |-- fig2_1.png
|   |-- fig2_10.png
|   |-- fig2_11.png
|   |-- fig2_12.png
|   |-- fig2_13.png
|   |-- fig2_2.png
|   |-- fig2_3_1.png
|   |-- fig2_3_2.png
|   |-- fig2_4_1.png
|   |-- fig2_4_2.png
|   |-- fig2_5.png
|   |-- fig2_7.png
|   |-- fig3_2.png
|   |-- fig3_2_1.png
|   |-- fig3_2_2.png
|   |-- fig3_2_3.png
|   |-- fig4_1.png
|   |-- fig4_2_1.png
|   |-- fig4_2_2.png
|   |-- fig4_2_3.png
|   |-- fig4_3_a.png
|   |-- fig4_3_b.png
|   |-- fig4_3_c.png
|   |-- report.md
|   `-- report.pdf
`-- src
    |-- exp1_1.m
    |-- exp1_2.m
    |-- exp2_1.m
    |-- exp2_10.m
    |-- exp2_11.m
    |-- exp2_12.m
    |-- exp2_13.m
    |-- exp2_2.m
    |-- exp2_3.m
    |-- exp2_4.m
    |-- exp2_5.m
    |-- exp2_7.m
    |-- exp2_8.m
    |-- exp2_9.m
    |-- exp3_1.m
    |-- exp3_2.m
    |-- exp3_2_1.m
    |-- exp3_2_2.m
    |-- exp3_2_3.m
    |-- exp4_1.m
    |-- exp4_2_1.m
    |-- exp4_2_2.m
    |-- exp4_2_3.m
    |-- exp4_3_a.m
    |-- exp4_3_b.m
    |-- exp4_3_c.m
    |-- jpegcodes.mat
    |-- myFunc
    |   |-- RGBtoN.m
    |   |-- ZigZag_8.m
    |   |-- decodeJPEG.m
    |   |-- encodeJPEG.m
    |   |-- genACStream.m
    |   |-- genDCStream.m
    |   |-- getACHuffman.m
    |   |-- getColorDensity.m
    |   |-- getComplementCode.m
    |   |-- getDCHuffman.m
    |   |-- getDmat.m
    |   |-- getPSNR.m
    |   |-- getTrueForm.m
    |   |-- iZigZag_8.m
    |   |-- myDCT.m
    |   |-- myIDCT.m
    |   |-- recACCoeff.m
    |   `-- recDCCoeff.m
    `-- resources
        |-- Faces/
        |-- JpegCoeff.mat
        |-- hall.mat
        |-- snow.mat
        `-- test.bmp

```



**仅供参考，请独立完成，禁止抄袭等学术不端行为**