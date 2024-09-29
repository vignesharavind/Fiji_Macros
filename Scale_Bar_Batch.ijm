path = File.openDialog("Select a File");
input = File.getParent(path);
list = getFileList(input)

for (i = 0; i < list.length; i++) {
        open(input + File.separator + list[i]);
        //svpath = input + File.separator + "Image_ScaleBar"+i+".tif"
        //Uncomment below if you need to set scale
        //run("Set Scale...", "distance=3.520 known=1 pixel=1 unit=micron");
        run("Scale Bar...", "width=20 height=5 font=14 color=White background=None location=[Lower Right] bold overlay");
        run("Flatten");
        tt=i+1;
        //change name if needed below: (Replace 'Image_ScaleBar' with name of your choice)
        saveAs("Tiff", input + File.separator + "Image_ScaleBar"+tt+".tif");
        close();
}
run("Close All");