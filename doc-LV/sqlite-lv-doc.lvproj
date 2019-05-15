<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="14008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="doc-LV" Type="Folder" URL="..">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="SQLite3LV.lvlibp" Type="LVLibp" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp">
			<Item Name="util" Type="Folder">
				<Item Name="format SQLite3 error.vi" Type="VI" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp/Utility/format SQLite3 error.vi"/>
				<Item Name="SQLite3 Error Cluster From Error Code.vi" Type="VI" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp/Utility/SQLite3 Error Cluster From Error Code.vi"/>
				<Item Name="sqlite3_errmsg.vi" Type="VI" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp/Utility/sqlite3_errmsg.vi"/>
				<Item Name="sqlite3_extended_errcode.vi" Type="VI" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp/Utility/sqlite3_extended_errcode.vi"/>
				<Item Name="sqlite3_trim_whitespace.vi" Type="VI" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp/Utility/sqlite3_trim_whitespace.vi"/>
				<Item Name="struct_table_info.ctl" Type="VI" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp/SQLite3 Class/struct_table_info.ctl"/>
				<Item Name="Text to UTF-8.vi" Type="VI" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp/Utility/Text to UTF-8.vi"/>
				<Item Name="UTF-8 to Text.vi" Type="VI" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp/Utility/UTF-8 to Text.vi"/>
			</Item>
			<Item Name="cursor.lvclass" Type="LVClass" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp/Cursor Class/cursor.lvclass"/>
			<Item Name="sqlite3.lvclass" Type="LVClass" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp/SQLite3 Class/sqlite3.lvclass"/>
			<Item Name="license.txt" Type="Document" URL="../../../builds/LVTables/SQLite Packed/license.txt"/>
			<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp/1abvi3w/vi.lib/Utility/error.llb/Error Cluster From Error Code.vi"/>
			<Item Name="whitespace.ctl" Type="VI" URL="../../../builds/LVTables/SQLite Packed/SQLite3LV.lvlibp/1abvi3w/vi.lib/Utility/error.llb/whitespace.ctl"/>
		</Item>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="msvcrt.dll" Type="Document" URL="msvcrt.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="sqlite3_64.dll" Type="Document" URL="../../../builds/LVTables/SQLite Packed/sqlite3_64.dll"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
