#!/usr/bin/env ruby

require 'pathname'

require 'rmagick'
include Magick

granite=Image.new(7056,1132)

newWidth=0
newHeight=0

puts granite

directoryPath="../Note.app/2021.6.21.consult.mover/files.ble/salary.data.manual.sort.2021.6.22/"

directoryPathName=Pathname.new(directoryPath) #构造路径名字对象。

directoryPathName.children.sort.each do |subFile| #一个个文件地处理。
    realPath=subFile.expand_path #获取绝对路径。
    
    puts realPath
    
    currentNewImage=Image.read(realPath)[0] #读取图片
    
    columsn=currentNewImage.columns
    rows=currentNewImage.rows
    
    compY=newHeight #
    puts compY
    
    newHeight=newHeight+rows #计算新的尺寸
    
    granite.composite!(currentNewImage, 0, compY, OverCompositeOp)
end #directoryPathName.each_child do |subFile| #一个个文件地处理。

granite.write('salary.tile.png') #输出图片
