<?xml version="1.0"?>
<globals>
    <global id="hasNoActionBar" type="boolean" value="false" />
    <global id="parentActivityClass" value="" />
    <global id="excludeMenu" type="boolean" value="true" />
    <global id="isLauncher" type="boolean" value="false" />
    <global id="generateActivityTitle" type="boolean" value="false" />
    <global id="relativePackage" value="${ativityPackageName}" />
    <global id="activityClass" value="${pageName}Activity" />
    <global id="muchAppProjectName" type="string" value="app" />
    <global id="muchAppOut" type="string" value="${escapeXmlAttribute('./' + (muchAppProjectName?default('app')))}" />
    <global id="topOut" value="." />
    <#include "../common/common_globals.xml.ftl" />
</globals>
