#Create windows 10 pro vm
$ResourceGroupName = "fabmedical-asharudin"
$Location = "southeastasia"
$VmLocalAdminUser = "admin-fabmedical"
$VmLocalAdminSecurePassword = ConvertTo-SecureString "admin123456!" -AsPlainText -Force

# $ComputerName = "VM2"
$VmName = "VM2"
# $VmSize = "Standard_DS3"

# $NetworkName = "fabmedicalnet2"
# $NICName = "fabmedicalnic2"
# $SubnetName = "fabmedicalsubnet2"
# $SubnetAddressPrefix = "10.0.0.0/24"
# $VNetAddressPrefix = "10.0.0.0/16"

# $SingleSubnet = New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressPrefix
# $VNet = New-AzVirtualNetwork -Name $NetworkName -ResourceGroupName $ResourceGroupName -Location $Location -AddressPrefix $VNetAddressPrefix -Subnet $SingleSubnet
# $NIC = New-AzNetworkInterface -Name $NICName -ResourceGroupName $ResourceGroupName -Location $Location -SubnetId $VNet.Subnets[0].Id

$Credential = New-Object System.Management.Automation.PSCredential ($VmLocalAdminUser, $VmLocalAdminSecurePassword);

# $VirtualMachine = New-AzVmConfig -VMName $VmName -VMSize $VMSize
# $VirtualMachine = Set-AzVMOperatingSystem -VM $VirtualMachine -Linux -ComputerName $ComputerName -Credential $Credential -ProvisionVMAgent -EnableAutoUpdate
# $VirtualMachine = Add-AzVMNetworkInterface -VM $VirtualMachine -Id $NIC.Id
# $VirtualMachine = Set-AzVMSourceImage -VM $VirtualMachine -Publisher "Canonical" -Offer "UbuntuServer" -Skus "18.04-LTS" -Version latest

New-AzVM -ResourceGroupName $ResourceGroupName -Location $Location -Name $VmName -Credential $Credential -Image UbuntuLTS -Verbose