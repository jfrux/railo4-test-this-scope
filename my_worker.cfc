component name="my_worker" {
     public any function init() {
         variables.utils = new utilities();
         return this;
     }

     remote any function usesUtil() {
         var myArray = ["test1","test2","test3"];
         return utils.mapper(myArray,this.mapAction);
     }

     public any function beforeUsesUtil() {
        var myInfo = getComponentMetaData(this);

        writeOutput("Before usesUtil() I still have my THIS scope!<br />I am '#myInfo.name#'.<hr />");
     }

     public any function mapAction() {
        var myInfo = getComponentMetaData(this);

        //I need my this so I can call my own functions but I don't have them anymore!
        try {
        this.duringUsesUtil();
        } catch (any err) {
          writeOutput("Called during usesUtil()... oops, no scope :-\");
          writeDump(var=err.message);
        }
        writeOutput("Called from usesUtil() I've lost my identity!<br />I am '#myInfo.name#'.<hr />");
     }

     public any function duringUsesUtil() {
        var myInfo = getComponentMetaData(this);

     }

     public any function afterUsesUtil() {
        var myInfo = getComponentMetaData(this);

        writeOutput("After usesUtil() I no longer have my THIS scope<br />I am '#myInfo.name#'.<hr />");
     }
}