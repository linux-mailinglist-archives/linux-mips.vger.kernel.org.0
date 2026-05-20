Return-Path: <linux-mips+bounces-14656-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB4YJxUkDmr26QUAu9opvQ
	(envelope-from <linux-mips+bounces-14656-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 23:13:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 997DB59A920
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 23:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F07893064C9B
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 19:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267CA33F8D9;
	Wed, 20 May 2026 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="RB3WV9zk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2F133EB1B;
	Wed, 20 May 2026 19:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304670; cv=none; b=CIFRErwqTOJq6T0s4y2ruQ/wjbxE29wCt7j+Q92SOExgxjog06RdwqTLta2eLjUbXxnYMavEoi9epP0dU/MKlHtKOTfddQxKv2ILibqUqQ5KUkhJMCfPuofsML71YaPZBXOza3QXayxrudqnpyGMCxxO6cZ4upQu3RWvK/spiZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304670; c=relaxed/simple;
	bh=RtgRUzZZHxu4PmTMk54J6cdnfQUwHkSJi5CLymbqwCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LL/S39Uq33ozeGYfg2lfyT5i6GbaoTXUkcjkXyJkTLlGWlBYsFC9cTg3TJNxdvYYZfNUx02RCU6CD9HwrCuiMncq2nW1DXgga2NfKmSuGybahg+WoE0VHX4YtSnQ+1IKSJO+zCzd82VhR89V2i/o+a30P5Ru6DwLjCciVmGAkpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=RB3WV9zk; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 216A243E3CF;
	Wed, 20 May 2026 21:17:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779304663; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Od3JjqsxO5DW0D/LfjwnDigdaqm7px/QiBLhicHEbLU=;
	b=RB3WV9zk8G5mp0x8BMy1t8a6gkk9BQRxFupC2dtg/XF6QQu9c/bWxSo7fQt2hKSDAyF/Ua
	Z/qwz5kGmUcxNhaPCiXT/BYhpDlrdzw+5+836EYyJiqEnRO8xgtJSti0AklsZEu88fBKjh
	jq9Y1veXT5iGetpbMeN3ys8T+hE/s8AmlUqT3lAWr0kxCn7mYxrUH2wpbgZHlszsmCJb35
	7Yxt473IGeTUYIec8EKrXb7G0uAPY8z1zYhuEjdYDhRQJM8c47H6QBITU5O1pF1OqzuIUO
	OqwP7KI6dN11APmdhbPRS2Bm+leh2TQvpeqjeWdWfAWd0Hy0bwUNm1up7s0b8g==
Message-ID: <afd47d4b-8309-4025-a40b-29606fed3c50@cjdns.fr>
Date: Wed, 20 May 2026 21:17:35 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v8 1/3] PCI: mediatek: Use actual physical address instead
 of virt_to_phys()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260520185534.GA72799@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260520185534.GA72799@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14656-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org,oss.qualcomm.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,cjdns.fr:email,cjdns.fr:mid,cjdns.fr:dkim]
X-Rspamd-Queue-Id: 997DB59A920
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 20/05/2026 20:55, Bjorn Helgaas wrote:
> On Wed, May 20, 2026 at 06:38:25PM +0000, Caleb James DeLisle wrote:
>> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>
>> The driver previously used virt_to_phys() on the ioremapped register base
>> (port->base) to compute the MSI message address. Using virt_to_phys() on an
>> IO mapped address is incorrect because it expects a kernel virtual address.
>>
>> To fix it, store the physical start of the I/O register region in
>> mtk_pcie_port->phys_base and use it to build the MSI address. This replaces
>> the incorrect virt_to_phys() usage and ensures MSI addresses are generated
>> correctly.
>>
>> Fixes: 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622")
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   drivers/pci/controller/pcie-mediatek.c | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
>> index 75722524fe74..c503fbd774d0 100644
>> --- a/drivers/pci/controller/pcie-mediatek.c
>> +++ b/drivers/pci/controller/pcie-mediatek.c
>> @@ -175,6 +175,7 @@ struct mtk_pcie_soc {
>>   /**
>>    * struct mtk_pcie_port - PCIe port information
>>    * @base: IO mapped register base
>> + * @phys_base: Physical address of the I/O register base region
>>    * @list: port list
>>    * @pcie: pointer to PCIe host info
>>    * @reset: pointer to port reset control
>> @@ -196,6 +197,7 @@ struct mtk_pcie_soc {
>>    */
>>   struct mtk_pcie_port {
>>   	void __iomem *base;
>> +	phys_addr_t phys_base;
>>   	struct list_head list;
>>   	struct mtk_pcie *pcie;
>>   	struct reset_control *reset;
>> @@ -405,7 +407,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>>   	phys_addr_t addr;
>>   
>>   	/* MT2712/MT7622 only support 32-bit MSI addresses */
>> -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
>> +	addr = port->phys_base + PCIE_MSI_VECTOR;
> This doesn't look right because the MSI address is a PCI bus address,
> and port->phys_base is a CPU physical address.  Often a PCI bus
> address is the same as the CPU physical address, but not always.
> I think the DT 'ranges' property tells you the translation.


This is all still a little over my head here, but my understanding was 
that this is in the middle of the device's register map because the DT 
has the following:

reg = <0x1fb83000 0x1000>;
reg-names = "port1";

Per the manual, that offset (base + 0xc0) is in undocumented area but 
it's in the registers.


The PCI memory is 0x20000000 - 0x2fffffff and we split it between the 
two devices. Here's the one using the upper half:

         ranges = <0x81000000 0 0x00000000 0x1f608000 0 0x00008000>,  (IO)

              <0x82000000 0 0x28000000 0x28000000 0 0x08000000>;      (MEM)


Hope I'm adding something useful here... Let me know if you want me to 
get or test anything else.

Thanks,

Caleb


>>   	msg->address_hi = 0;
>>   	msg->address_lo = lower_32_bits(addr);
>>   
>> @@ -520,7 +522,7 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
>>   	u32 val;
>>   	phys_addr_t msg_addr;
>>   
>> -	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
>> +	msg_addr = port->phys_base + PCIE_MSI_VECTOR;
>>   	val = lower_32_bits(msg_addr);
>>   	writel(val, port->base + PCIE_IMSI_ADDR);
>>   
>> @@ -953,6 +955,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>>   	struct mtk_pcie_port *port;
>>   	struct device *dev = pcie->dev;
>>   	struct platform_device *pdev = to_platform_device(dev);
>> +	struct resource *res;
>>   	char name[20];
>>   	int err;
>>   
>> @@ -961,7 +964,14 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>>   		return -ENOMEM;
>>   
>>   	snprintf(name, sizeof(name), "port%d", slot);
>> -	port->base = devm_platform_ioremap_resource_byname(pdev, name);
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
>> +	if (!res) {
>> +		dev_err(dev, "failed to get port%d base\n", slot);
>> +		return -EINVAL;
>> +	}
>> +
>> +	port->phys_base = res->start;
>> +	port->base = devm_ioremap_resource(&pdev->dev, res);
>>   	if (IS_ERR(port->base)) {
>>   		dev_err(dev, "failed to map port%d base\n", slot);
>>   		return PTR_ERR(port->base);
>> -- 
>> 2.39.5
>>

