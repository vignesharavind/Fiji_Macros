path = File.openDialog("Select a File");
input = File.getParent(path);
list = getFileList(input)

for (i = 0; i < list.length; i++) {
	    open(input + File.separator + list[i]);
	    selectWindow(list[i]);
        run("Z Project...", "projection=[Max Intensity]");
        run("Split Channels");
        selectWindow(list[i]);
        close();
        // Use '//' before channels which you don't want 
        c1name = "C1-MAX_"+list[i];
        c2name = "C2-MAX_"+list[i];
        c3name = "C3-MAX_"+list[i];
        tt=i+1;
        File.makeDirectory(input + File.separator + list[i]+tt);
        // To change names replace the last portion in quotes in the saveAs command: Ex "IFT.tif"
        // Use '//' before channels which you don't want both before selectWindow and SaveAs
        selectWindow(c1name);
        saveAs("Tiff", input + File.separator +  list[i] + tt+ File.separator +"IFT.tif");
        selectWindow(c2name);
        saveAs("Tiff", input + File.separator +  list[i] + tt+ File.separator +"Acyt.tif");
        selectWindow(c3name);
        saveAs("Tiff", input + File.separator +  list[i] + tt+ File.separator +"Centrin.tif");
        run("Close All");
}