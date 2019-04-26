#Create windows 10 pro vm
$ResourceGroupName = "fabmedical-asharudin"
$VmLocalAdminUser = "admin-fabmedical"
$VmLocalAdminSecurePassword = ConvertTo-SecureString "admin123456!" -AsPlainText -Force
$Location = "southeastasia"
$ComputerName = "VM1"
$VmName = "VM1"
$VmSize = "Standard_DS3"

# $NetworkName = "fabmedicalnet"
# $NICName = "fabmedicalnic1"
# $SubnetName = "fabmedicalsubnet1"
# $SubnetAddressPrefix = "10.0.0.0/24"
# $VNetAddressPrefix = "10.0.0.0/16"

# $SingleSubnet = New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressPrefix
# $VNet = New-AzVirtualNetwork -Name $NetworkName -ResourceGroupName $ResourceGroupName -Location $Location -AddressPrefix $VNetAddressPrefix -Subnet $SingleSubnet
# $NIC = New-AzNetworkInterface -Name $NICName -ResourceGroupName $ResourceGroupName -Location $Location -SubnetId $VNet.Subnets[0].Id

$Credential = New-Object System.Management.Automation.PSCredential ($VmLocalAdminUser, $VmLocalAdminSecurePassword);

# $VirtualMachine = New-AzVmConfig -VMName $VmName -VMSize $VMSize
# $VirtualMachine = Set-AzVMOperatingSystem -VM $VirtualMachine -Windows -ComputerName $ComputerName -Credential $Credential -ProvisionVMAgent -EnableAutoUpdate
# $VirtualMachine = Add-AzVMNetworkInterface -VM $VirtualMachine -Id $NIC.Id
# $VirtualMachine = Set-AzVMSourceImage -VM $VirtualMachine -Publisher "MicrosoftWindowsDesktop" -Offer "Windows-10" -Skus "RS3-Pro" -Version latest

New-AzVM -ResourceGroupName $ResourceGroupName -Location $Location -Image Win10 -Name VM1 -Credential $Credential -Verbose