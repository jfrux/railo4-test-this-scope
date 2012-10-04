<cfscript>
work = new my_worker();

work.beforeUsesUtil();
work.usesUtil();
work.afterUsesUtil();
</cfscript>