1. 下载工具jTessBoxEditor. http://sourceforge.net/projects/vietocr/files/jTessBoxEditor/，这个工具是用来训练样本用的，由于该工具是用JAVA开发的，需要安装JAVA虚拟机才能运行。

2. 获取样本图像。用画图工具绘制了5张0-9的文样本图像（当然样本越多越好），见data/training：

3 .合并样本图像。运行jTessBoxEditor工具，在点击菜单栏中Tools--->Merge TIFF。在弹出的对话框中选择样本图像（按Shift选择多张），合并成number.font.exp0.tif文件。PS:命名格式是按照官网格式来命名的，即：[lang].fontname].exp[num].tif）。

4.生成Box File文件。打开命令行，执行命令：

````
tesseract number.font.exp0.tif number.font.exp0 batch.nochop makebox  
````
生成的BOX文件为number.font.exp0.box，BOX文件为Tessercat识别出的文字和其坐标。

5. 文字校正 

运行jTessBoxEditor工具，打开number.font.exp0.tif文件（必须将上一步生成的.box和.tif样本文件放在同一目录），如下图所示。可以看出有些字符识别的不正确，可以通过该工具手动对每张图片中识别错误的字符进行校正。校正完成后保存即可。

6. 定义字体特征文件
Tesseract-OCR3.01以上的版本在训练之前需要创建一个名称为font_properties的字体特征文件。
font_properties不含有BOM头，在 training 目录下创建文件，文件内容格式如下：

````
<fontname> <italic> <bold> <fixed> <serif> <fraktur>  
````

其中fontname为字体名称，必须与[lang].[fontname].exp[num].box中的名称保持一致。<italic> 、<bold> 、<fixed> 、<serif>、 <fraktur>的取值为1或0，表示字体是否具有这些属性。
这里在样本图片所在目录下创建一个名称为font_properties的文件，用记事本打开，输入以下下内容：

````
font 0 0 0 0 0
````
这里全取值为0，表示字体不是粗体、斜体等等。

7. 生成语言文件
运行 training.sh. 修改其中的lang和 font 变量名称

需确认打印结果中的Offset 1、3、4、5、13这些项不是-1。这样，一个新的语言文件就生成了。
number.traineddata便是最终生成的语言文件，将生成的number.traineddata拷贝到Tesseract-OCR-->tessdata目录下。可以用它来进行字符识别了。

````
tesseract number.jpg result -l number #指定语言 
````
