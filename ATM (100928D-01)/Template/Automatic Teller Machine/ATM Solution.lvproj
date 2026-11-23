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
		</Item>
		<Item Name="SubVIs" Type="Folder">
			<Item Name="Parse Amount.vi" Type="VI" URL="../SubVIs/Parse Amount.vi"/>
			<Item Name="Get Account.vi" Type="VI" URL="../SubVIs/Get Account.vi"/>
			<Item Name="Deposit Funds.vi" Type="VI" URL="../SubVIs/Deposit Funds.vi"/>
			<Item Name="Withdraw Funds.vi" Type="VI" URL="../SubVIs/Withdraw Funds.vi"/>
			<Item Name="Build ATM Message.vi" Type="VI" URL="../SubVIs/Build ATM Message.vi"/>
			<Item Name="Find Account.vi" Type="VI" URL="../SubVIs/Find Account.vi"/>
			<Item Name="Get Accounts File Path.vi" Type="VI" URL="../SubVIs/Get Accounts File Path.vi"/>
			<Item Name="Get Main Menu.vi" Type="VI" URL="../SubVIs/Get Main Menu.vi"/>
			<Item Name="Get Menu Action.vi" Type="VI" URL="../SubVIs/Get Menu Action.vi"/>
			<Item Name="Get Menu Labels.vi" Type="VI" URL="../SubVIs/Get Menu Labels.vi"/>
			<Item Name="Get Pressed Button Index.vi" Type="VI" URL="../SubVIs/Get Pressed Button Index.vi"/>
			<Item Name="Read Accounts.vi" Type="VI" URL="../SubVIs/Read Accounts.vi"/>
			<Item Name="Update Account Balance.vi" Type="VI" URL="../SubVIs/Update Account Balance.vi"/>
		</Item>
		<Item Name="ATM accounts.txt" Type="Document" URL="../ATM accounts.txt"/>
		<Item Name="Automatic Teller Machine (ATM).vi" Type="VI" URL="../Automatic Teller Machine (ATM).vi"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
