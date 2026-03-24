Return-Path: <linux-mips+bounces-13928-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCxAJ2ntwmkdnQQAu9opvQ
	(envelope-from <linux-mips+bounces-13928-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 21:00:41 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CED31C008
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 21:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16DD831198F9
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 19:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB8D3451AF;
	Tue, 24 Mar 2026 19:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="kfBdJtAy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951F338759C;
	Tue, 24 Mar 2026 19:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382074; cv=none; b=Jw3I7GY3rbYF61WChz/OE5R0LHFc6VIalahM50OJSiunT54k0OjxmYeTtEHdE0tvNf0bTxN+oXGozEEtve+J3yI3YPt5VPpNoWRc526nno+czjqPBhylSqHmbdacHEdT99VbLRK15u5SWb3fPDn1GCy65PshoudMNQpl3vv99zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382074; c=relaxed/simple;
	bh=ApIuGxUsBH0FGWE/JOEVFx31vfBoX/FOKHBKCdS3TH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVb5TAR4jKMI3nchQ6Ircd/sfkLWzIgonTJBZEKK2Fx/tmu1hbh87xrP32r+fztylBahlWw6xsmJy0MNos0aA5Z6wRLPbpG8MAazsnM15JG4WuQhqNFFI5KpvxM0HMQlyLw9a34qgIlusM8ulE+F+CKfWjirZCl7pVqczftLp3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=kfBdJtAy; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B40973AA8E6;
	Tue, 24 Mar 2026 20:54:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1774382069; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4iWKEbRSat36IV94lLy0So9Efd8lQ9YMr7+bYVKEn3s=;
	b=kfBdJtAyZlEcBfjeYglEZSwbElrc+UyvohpZ6uFd5LanoHHK3huog9XW3nd40ux2SAc2Qi
	/LxqbkLe0q74+0Rtg6UzmTBOlPHA75pfvWpUgxLomOV07eI+p4eF/0KYovc6G14ZhozK1w
	B/cF/waaVbM6x52hkwVTnE5P+s1oiIjnEkJBw1z6+UAcmzSwprj204OsEbOQIg45R6NLI+
	7VVlUNOk62tz+UWOU53VW7r0W90981hEyTMBtz2d5dWuLEBzsiDOoHQMZ25w3RUlAw/ybF
	0lnc6FGCtDcbbuqdndmVNpuV/PrxUBN7oJSgl44cehMSsjumEv+AWlnuBzcP5A==
Message-ID: <291d896e-838a-437e-8525-5896f3c957b6@cjdns.fr>
Date: Tue, 24 Mar 2026 20:54:24 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323213621.GA1080209@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260323213621.GA1080209@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13928-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,google.com,kernel.org,collabora.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11CED31C008
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 23/03/2026 22:36, Bjorn Helgaas wrote:
> On Fri, Mar 20, 2026 at 09:42:12AM +0000, Caleb James DeLisle wrote:
>> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
>>
>> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
>> require re-training after startup.
>> ...
>> +static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
>> +{
>> +	struct mtk_pcie *pcie = port->pcie;
>> +	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
>> +	struct resource *mem = NULL;
>> +	struct resource_entry *entry;
>> +	u32 val, link_mask;
>> +	int err;
>> +
>> +	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
>> +	if (entry)
>> +		mem = entry->res;
>> +	if (!mem)
>> +		return -EINVAL;
>> +
>> +	if (!pcie->cfg) {
>> +		dev_err(pcie->dev, "EN7528: pciecfg syscon not available\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Assert all reset signals */
>> +	writel(0, port->base + PCIE_RST_CTRL);
>> +
>> +	/*
>> +	 * Enable PCIe link down reset, if link status changed from link up to
>> +	 * link down, this will reset MAC control registers and configuration
>> +	 * space.
>> +	 */
>> +	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
>> +
>> +	/*
>> +	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
>> +	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST#
> Include spec rev; the section numbers are typically specific to a spec
> revision.  E.g., CEM r1.0, sec 2.2, 2.2.1.
>
>> +	 * should be delayed 100ms (TPVPERL) for the power and clock to become
>> +	 * stable.
>> +	 */
>> +	msleep(100);
> Isn't there a #define for this in drivers/pci/pci.h?

Indeed, and it has the proper reference to the spec revision. This hard 
coded 100 and the spec comment trickled down from vendor code. Will 
replace with the symbol.

>> +	/* De-assert PHY, PE, PIPE, MAC and configuration reset */
>> +	val = readl(port->base + PCIE_RST_CTRL);
>> +	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
>> +	       PCIE_MAC_SRSTB | PCIE_CRSTB;
>> +	writel(val, port->base + PCIE_RST_CTRL);
>> +
>> +	writel(PCIE_CLASS_CODE | PCIE_REVISION_ID,
>> +	       port->base + PCIE_CONF_REV_CLASS);
>> +	writel(EN7528_HOST_MODE, port->base);
>> +
>> +	link_mask = (port->slot == 0) ? EN7528_RC0_LINKUP : EN7528_RC1_LINKUP;
>> +
>> +	/* 100ms timeout value should be enough for Gen1/2 training */
>> +	err = regmap_read_poll_timeout(pcie->cfg, EN7528_LINKUP_REG, val,
>> +				       !!(val & link_mask), 20,
>> +				       100 * USEC_PER_MSEC);
> Ditto.  Also take a look and see if this is relevant:
> https://lore.kernel.org/all/20260320224821.2571373-1-thierry.reding@kernel.org
Okay, the hardcoded 100ms follows what is done in pcie-mediatek.c but 
from pcie-mediatek-gen3.c it appears the appropriate symbol is 
PCI_PM_D3COLD_WAIT so I'll substitute this.
>
>> +	if (err) {
>> +		dev_err(pcie->dev, "EN7528: port%d link timeout\n", port->slot);
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	/* Set INTx mask */
> Looks like this *clears* an INTx mask.  But the comment is probably
> superfluous anyway.
Indeed. "clear" -> "unmask" -> "activate" -> "set", I'll use the word 
"activate" since that's what we're doing.
>> +	val = readl(port->base + PCIE_INT_MASK);
>> +	val &= ~INTX_MASK;
>> +	writel(val, port->base + PCIE_INT_MASK);
>> +
>> +	if (IS_ENABLED(CONFIG_PCI_MSI))
>> +		mtk_pcie_enable_msi(port);
>> +
>> +	/* Set AHB to PCIe translation windows */
>> +	val = lower_32_bits(mem->start) |
>> +	      AHB2PCIE_SIZE(fls(resource_size(mem)));
>> +	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
>> +
>> +	val = upper_32_bits(mem->start);
>> +	writel(val, port->base + PCIE_AHB_TRANS_BASE0_H);
>> +
>> +	writel(WIN_ENABLE, port->base + PCIE_AXI_WINDOW0);
>> +
>> +	return 0;
>> +}
>> +
>>   static void __iomem *mtk_pcie_map_bus(struct pci_bus *bus,
>>   				      unsigned int devfn, int where)
>>   {
>> @@ -1149,6 +1236,30 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>>   	if (err)
>>   		goto put_resources;
>>   
>> +	/* Retrain Gen1 links to reach Gen2 where supported */
>> +	if (pcie->soc->startup == mtk_pcie_startup_port_en7528) {
> This looks like an ugly hack when placed here in mtk_pcie_probe(),
> especially since it's after pci_host_probe() has already enumerated
> the hierarchy.  Why can't this be inside
> mtk_pcie_startup_port_en7528() itself?

This is indeed frustrating. This little ritual has trickled down through 
2 or 3 generations of rewritten vendor code. What we know is that the 
Gen2 links come up as Gen1 on startup, but if you retrain them they 
upgrade to Gen2. Technically this could be done in 
mtk_pcie_startup_port_en7528(), but it won't be using 
pcie_retrain_link() because we don't yet have the pci_dev struct. Doing 
it manually is kind of ugly because we have to get the config offset of 
the bridge device which we're retraining - vendor code for this is a bit 
of a mess.

I think probably the least bad solution here is to stick with this, 
perhaps with a more descriptive / apologetic comment. WDYT?

>> +		struct pci_bus *bus = host->bus;
>> +		struct pci_dev *rc = NULL;
>> +
>> +		while ((rc = pci_get_class(PCI_CLASS_BRIDGE_PCI << 8, rc))) {
>> +			int ret = -EOPNOTSUPP;
> I don't get this.  pci_get_class() looks through the entire hierarchy,
> but this driver should only care about the links directly attached to
> Root Ports.
Good point, I'll switch this out for something more specific.
>> +			if (rc->bus != bus)
>> +				continue;
>> +
>> +			#if IS_BUILTIN(CONFIG_PCIE_MEDIATEK)
>> +			ret = pcie_retrain_link(rc, true);
>> +			#endif
> Why is this specific to being builtin?  No other PCI controller
> drivers do this.  Needs a comment about why this is special.
> Typically such an #ifdef would be at the left margin.

Okay yes, good point. The reason for this is because pcie_retrain_link() 
is not exported and trying to re-implement the logic is the mess I 
alluded to earlier. Since this driver supports multiple devices and 
allows being compiled as a module, I opted to soft-fail in this case and 
it will log that it didn't retrain with reason -EOPNOTSUPP. In that case 
it would continue to run as a Gen1, and since this is an embedded 
application, I think we can rely on the integrator to make it a builtin 
if they're targeting the EN7528. But I can re-send with nicer 
documentation around this.

>
>> +			if (!ret)
> Prefer the positive test ("if (ret)").

Okay.


Thank you very much for the review.

Caleb


>
>> +				dev_info(dev, "port%d link retrained\n",
>> +					 PCI_SLOT(rc->devfn));
>> +			else
>> +				dev_info(dev, "port%d failed to retrain %pe\n",
>> +					 PCI_SLOT(rc->devfn), ERR_PTR(ret));
>> +		}
>> +	}
>> +
>>   	return 0;
>>   
>>   put_resources:
>> @@ -1264,8 +1375,15 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
>>   	.quirks = MTK_PCIE_FIX_CLASS_ID | MTK_PCIE_FIX_DEVICE_ID,
>>   };
>>   
>> +static const struct mtk_pcie_soc mtk_pcie_soc_en7528 = {
>> +	.ops = &mtk_pcie_ops_v2,
>> +	.startup = mtk_pcie_startup_port_en7528,
>> +	.setup_irq = mtk_pcie_setup_irq,
>> +};
>> +
>>   static const struct of_device_id mtk_pcie_ids[] = {
>>   	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
>> +	{ .compatible = "econet,en7528-pcie", .data = &mtk_pcie_soc_en7528 },
>>   	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
>>   	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
>>   	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
>> -- 
>> 2.39.5
>>

