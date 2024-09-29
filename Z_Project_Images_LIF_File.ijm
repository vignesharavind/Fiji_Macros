input = getDirectory("Choose folder with lif files ");
list = getFileList(input);
run("Bio-Formats Macro Extensions");
list = getFileList(input);   
for (j=0; j<list.length; j++) {
	if (endsWith(list[j],".lif")){
		inputPath= input +  File.separator + list[j];
		//how many series in this lif file?
		Ext.setId(inputPath);
		Ext.getSeriesCount(seriesCount); //-- Gets the number of image series in the active dataset.
		for (i=1; i<=seriesCount; i++) {
            // open an image with Bio-Format
			run("Bio-Formats", "open=inputPath autoscale color_mode=Default view=Hyperstack stack_order=XYCZT series_"+i);
		    //selectWindow(list[i]);
            run("Z Project...", "projection=[Max Intensity]");
            run("Split Channels");
            // Use '//' before channels which you don't want
            //tt=i+1;
            File.makeDirectory(input + File.separator + list[j]+i); 
            c1name = getTitle();
            // To change names replace the last portion in quotes in the saveAs command: Ex "IFT.tif"
            // Use '//' before channels which you don't want both before selectWindow and SaveAs
            selectWindow(c1name);
            saveAs("Tiff", input + File.separator +  list[j] + i+ File.separator +"Mem.tif");
            close();
            c2name = getTitle();
            //c3name = "C3-MAX_"+list[i];          
            selectWindow(c2name);
            saveAs("Tiff", input + File.separator +  list[j] + i+ File.separator +"Acyt.tif");
            //selectWindow(c3name);
            //saveAs("Tiff", input + File.separator +  list[i] + tt+ File.separator +"Centrin.tif");
            run("Close All");
		}
	}
}