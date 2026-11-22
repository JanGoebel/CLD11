<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="26008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">false</Property>
	<Property Name="NI.Project.Description" Type="Str">CLD sample exam 100928D-01: Automatic Teller Machine (ATM) controller.</Property>
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
		<Item Name="Controls" Type="Folder">
			<Item Name="ATM Account.ctl" Type="VI" URL="../Controls/ATM Account.ctl"/>
			<Item Name="ATM Data.ctl" Type="VI" URL="../Controls/ATM Data.ctl"/>
			<Item Name="ATM Input Mode.ctl" Type="VI" URL="../Controls/ATM Input Mode.ctl"/>
			<Item Name="ATM Menu Item.ctl" Type="VI" URL="../Controls/ATM Menu Item.ctl"/>
			<Item Name="ATM Menu Side.ctl" Type="VI" URL="../Controls/ATM Menu Side.ctl"/>
			<Item Name="ATM Menu.ctl" Type="VI" URL="../Controls/ATM Menu.ctl"/>
			<Item Name="ATM Message Type.ctl" Type="VI" URL="../Controls/ATM Message Type.ctl"/>
			<Item Name="ATM States.ctl" Type="VI" URL="../Controls/ATM States.ctl"/>
			<Item Name="ATM UI Mode.ctl" Type="VI" URL="../Controls/ATM UI Mode.ctl"/>
		</Item>
		<Item Name="SubVIs" Type="Folder">
			<Item Name="Set Session Controls.vi" Type="VI" URL="../SubVIs/Set Session Controls.vi"/>
			<Item Name="Clear and Focus Input.vi" Type="VI" URL="../SubVIs/Clear and Focus Input.vi"/>
			<Item Name="Build ATM Message.vi" Type="VI" URL="../SubVIs/Build ATM Message.vi"/>
			<Item Name="Deposit Funds.vi" Type="VI" URL="../SubVIs/Deposit Funds.vi"/>
			<Item Name="Find Account.vi" Type="VI" URL="../SubVIs/Find Account.vi"/>
			<Item Name="Get Account.vi" Type="VI" URL="../SubVIs/Get Account.vi"/>
			<Item Name="Get Accounts File Path.vi" Type="VI" URL="../SubVIs/Get Accounts File Path.vi"/>
			<Item Name="Get Main Menu.vi" Type="VI" URL="../SubVIs/Get Main Menu.vi"/>
			<Item Name="Get Menu Action.vi" Type="VI" URL="../SubVIs/Get Menu Action.vi"/>
			<Item Name="Get Menu Labels.vi" Type="VI" URL="../SubVIs/Get Menu Labels.vi"/>
			<Item Name="Get Pressed Button Index.vi" Type="VI" URL="../SubVIs/Get Pressed Button Index.vi"/>
			<Item Name="Parse Amount.vi" Type="VI" URL="../SubVIs/Parse Amount.vi"/>
			<Item Name="Read Accounts.vi" Type="VI" URL="../SubVIs/Read Accounts.vi"/>
			<Item Name="Update Account Balance.vi" Type="VI" URL="../SubVIs/Update Account Balance.vi"/>
			<Item Name="Withdraw Funds.vi" Type="VI" URL="../SubVIs/Withdraw Funds.vi"/>
		</Item>
		<Item Name="ATM accounts.txt" Type="Document" URL="../ATM accounts.txt"/>
		<Item Name="Automatic Teller Machine (ATM).vi" Type="VI" URL="../Automatic Teller Machine (ATM).vi"/>
		<Item Name="Tests" Type="Folder">
			<Item Name="Support" Type="Folder">
				<Item Name="Create Accounts Fixture.vi" Type="VI" URL="../Tests/Support/Create Accounts Fixture.vi"/>
				<Item Name="Prepare Report Path.vi" Type="VI" URL="../Tests/Support/Prepare Report Path.vi"/>
			</Item>
			<Item Name="Run Tests CLI.vi" Type="VI" URL="../Tests/Run Tests CLI.vi"/>
			<Item Name="Test Build ATM Message.vi" Type="VI" URL="../Tests/Test Build ATM Message.vi"/>
			<Item Name="Test Deposit Funds.vi" Type="VI" URL="../Tests/Test Deposit Funds.vi"/>
			<Item Name="Test Find Account.vi" Type="VI" URL="../Tests/Test Find Account.vi"/>
			<Item Name="Test Get Account.vi" Type="VI" URL="../Tests/Test Get Account.vi"/>
			<Item Name="Test Get Accounts File Path.vi" Type="VI" URL="../Tests/Test Get Accounts File Path.vi"/>
			<Item Name="Test Get Main Menu.vi" Type="VI" URL="../Tests/Test Get Main Menu.vi"/>
			<Item Name="Test Get Menu Action.vi" Type="VI" URL="../Tests/Test Get Menu Action.vi"/>
			<Item Name="Test Get Pressed Button Index.vi" Type="VI" URL="../Tests/Test Get Pressed Button Index.vi"/>
			<Item Name="Test Parse Amount.vi" Type="VI" URL="../Tests/Test Parse Amount.vi"/>
			<Item Name="Test Update Account Balance.vi" Type="VI" URL="../Tests/Test Update Account Balance.vi"/>
			<Item Name="Test Withdraw Funds.vi" Type="VI" URL="../Tests/Test Withdraw Funds.vi"/>
			<Item Name="Test Withdraw Funds Fast Cash 100.vi" Type="VI" URL="../Tests/Test Withdraw Funds Fast Cash 100.vi"/>
		</Item>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="ATM Application" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{E5946201-450D-4465-9602-A0CE127BD724}</Property>
				<Property Name="App_INI_GUID" Type="Str">{DF9A0042-BA75-49DE-962E-7C2846584A20}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="App_serverType" Type="Int">0</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{640CA215-DF18-4CC7-8D4B-9D51C1D4B2C7}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">ATM Application</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../../../../builds/ATM</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToProject</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{D879B083-2A86-4356-992A-9038DC3F5AC2}</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">ATM.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../../../../builds/ATM/ATM.exe</Property>
				<Property Name="Destination[0].path.type" Type="Str">relativeToProject</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../../../../builds/ATM</Property>
				<Property Name="Destination[1].path.type" Type="Str">relativeToProject</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{5D80362C-D403-4476-BA29-EEFEEF1FABFE}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Automatic Teller Machine (ATM).vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/ATM accounts.txt</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_fileDescription" Type="Str">ATM controller (CLD sample exam 100928D-01)</Property>
				<Property Name="TgtF_internalName" Type="Str">ATM Application</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2026</Property>
				<Property Name="TgtF_productName" Type="Str">ATM</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{0B7E5A2C-6F1D-4C3B-9A8E-2D4F6B8C1E3A}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">ATM.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>
