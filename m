Return-Path: <linux-mips+bounces-13893-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJlDErmywWkYUwQAu9opvQ
	(envelope-from <linux-mips+bounces-13893-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 22:38:01 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAFD2FDD48
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 22:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1CA4304437D
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 21:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5E037F75C;
	Mon, 23 Mar 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePRlnjLy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662CF37F013;
	Mon, 23 Mar 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774301783; cv=none; b=raUYHn3ebvbA9fpD1wahe3DuGXmamrg9sr7zmKoeOq3LN4+e/+B15hhKYiU4xDdMm9ZHiToJyi3xIIC3dD1K7ShBhrWJ7cnx4MTYFnLYNYFDeb0n+ziiAUHcv5xwE9bxAy1RmSqdAzroupyDwsO+VSgJZEh5QZLTl1roNUrhvrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774301783; c=relaxed/simple;
	bh=zJW8qy4WDz++YCo6QnKVYHEEygm4tZDVxXYzQ6hrIdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rFN8q7fXgCuCmsiKIyAxrcQyIJtMyHlVPb82sIzIzsx8dmnz3uv2tr71XYayccp/O2x1xTM7kZCTnvXBIZo3Xzx7bVu2xtmwlxHhLO9+XLQC05Jz0Yy6vU0pjFUSSC91PLFyOTfhBAZ5vDvkEOHdkUkWqOm+8JpjtlpQ9Pv7Xxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePRlnjLy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6622C4CEF7;
	Mon, 23 Mar 2026 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774301783;
	bh=zJW8qy4WDz++YCo6QnKVYHEEygm4tZDVxXYzQ6hrIdg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ePRlnjLy47oFFjgPkO3vOeJITxqsJ+vT1hVfmBsWYPfQJy8PrknO8qDDvgcT5piDc
	 aNqVXQViT6YRaXcgU5v1MMTaZIrRncuqTXLN6+M2mbeoY3os+LhYbMd56YYEK/hXu3
	 kkpJ5tC72y+1A/qOczgdrM5tpw6JdyF85fCV652o9xcGwJyW9fA/YjYu7VpFl4S9Wk
	 5FWhoWOy4TVWHY/4ZKI99jY9Oic8bZDCUtD4tKz+Ymm5sXRR56ZXlM2n+hleYiGD1u
	 xKtmXwX76iokwc15GDsyRffVlGY5f2ezlshEsNc69qFLtp0ofn2plHSzf3rErvWwbO
	 Fv4MvvTYFmsvw==
Date: Mon, 23 Mar 2026 16:36:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
Message-ID: <20260323213621.GA1080209@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320094212.696671-3-cjd@cjdns.fr>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13893-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,google.com,kernel.org,collabora.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ABAFD2FDD48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 09:42:12AM +0000, Caleb James DeLisle wrote:
> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
> 
> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
> require re-training after startup.
> ...

> +static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
> +{
> +	struct mtk_pcie *pcie = port->pcie;
> +	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
> +	struct resource *mem = NULL;
> +	struct resource_entry *entry;
> +	u32 val, link_mask;
> +	int err;
> +
> +	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
> +	if (entry)
> +		mem = entry->res;
> +	if (!mem)
> +		return -EINVAL;
> +
> +	if (!pcie->cfg) {
> +		dev_err(pcie->dev, "EN7528: pciecfg syscon not available\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Assert all reset signals */
> +	writel(0, port->base + PCIE_RST_CTRL);
> +
> +	/*
> +	 * Enable PCIe link down reset, if link status changed from link up to
> +	 * link down, this will reset MAC control registers and configuration
> +	 * space.
> +	 */
> +	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> +
> +	/*
> +	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
> +	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST#

Include spec rev; the section numbers are typically specific to a spec
revision.  E.g., CEM r1.0, sec 2.2, 2.2.1.

> +	 * should be delayed 100ms (TPVPERL) for the power and clock to become
> +	 * stable.
> +	 */
> +	msleep(100);

Isn't there a #define for this in drivers/pci/pci.h?

> +	/* De-assert PHY, PE, PIPE, MAC and configuration reset */
> +	val = readl(port->base + PCIE_RST_CTRL);
> +	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> +	       PCIE_MAC_SRSTB | PCIE_CRSTB;
> +	writel(val, port->base + PCIE_RST_CTRL);
> +
> +	writel(PCIE_CLASS_CODE | PCIE_REVISION_ID,
> +	       port->base + PCIE_CONF_REV_CLASS);
> +	writel(EN7528_HOST_MODE, port->base);
> +
> +	link_mask = (port->slot == 0) ? EN7528_RC0_LINKUP : EN7528_RC1_LINKUP;
> +
> +	/* 100ms timeout value should be enough for Gen1/2 training */
> +	err = regmap_read_poll_timeout(pcie->cfg, EN7528_LINKUP_REG, val,
> +				       !!(val & link_mask), 20,
> +				       100 * USEC_PER_MSEC);

Ditto.  Also take a look and see if this is relevant:
https://lore.kernel.org/all/20260320224821.2571373-1-thierry.reding@kernel.org

> +	if (err) {
> +		dev_err(pcie->dev, "EN7528: port%d link timeout\n", port->slot);
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* Set INTx mask */

Looks like this *clears* an INTx mask.  But the comment is probably
superfluous anyway.

> +	val = readl(port->base + PCIE_INT_MASK);
> +	val &= ~INTX_MASK;
> +	writel(val, port->base + PCIE_INT_MASK);
> +
> +	if (IS_ENABLED(CONFIG_PCI_MSI))
> +		mtk_pcie_enable_msi(port);
> +
> +	/* Set AHB to PCIe translation windows */
> +	val = lower_32_bits(mem->start) |
> +	      AHB2PCIE_SIZE(fls(resource_size(mem)));
> +	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
> +
> +	val = upper_32_bits(mem->start);
> +	writel(val, port->base + PCIE_AHB_TRANS_BASE0_H);
> +
> +	writel(WIN_ENABLE, port->base + PCIE_AXI_WINDOW0);
> +
> +	return 0;
> +}
> +
>  static void __iomem *mtk_pcie_map_bus(struct pci_bus *bus,
>  				      unsigned int devfn, int where)
>  {
> @@ -1149,6 +1236,30 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>  	if (err)
>  		goto put_resources;
>  
> +	/* Retrain Gen1 links to reach Gen2 where supported */
> +	if (pcie->soc->startup == mtk_pcie_startup_port_en7528) {

This looks like an ugly hack when placed here in mtk_pcie_probe(),
especially since it's after pci_host_probe() has already enumerated
the hierarchy.  Why can't this be inside
mtk_pcie_startup_port_en7528() itself?

> +		struct pci_bus *bus = host->bus;
> +		struct pci_dev *rc = NULL;
> +
> +		while ((rc = pci_get_class(PCI_CLASS_BRIDGE_PCI << 8, rc))) {
> +			int ret = -EOPNOTSUPP;

I don't get this.  pci_get_class() looks through the entire hierarchy,
but this driver should only care about the links directly attached to
Root Ports.

> +			if (rc->bus != bus)
> +				continue;
> +
> +			#if IS_BUILTIN(CONFIG_PCIE_MEDIATEK)
> +			ret = pcie_retrain_link(rc, true);
> +			#endif

Why is this specific to being builtin?  No other PCI controller
drivers do this.  Needs a comment about why this is special.
Typically such an #ifdef would be at the left margin.

> +			if (!ret)

Prefer the positive test ("if (ret)").

> +				dev_info(dev, "port%d link retrained\n",
> +					 PCI_SLOT(rc->devfn));
> +			else
> +				dev_info(dev, "port%d failed to retrain %pe\n",
> +					 PCI_SLOT(rc->devfn), ERR_PTR(ret));
> +		}
> +	}
> +
>  	return 0;
>  
>  put_resources:
> @@ -1264,8 +1375,15 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
>  	.quirks = MTK_PCIE_FIX_CLASS_ID | MTK_PCIE_FIX_DEVICE_ID,
>  };
>  
> +static const struct mtk_pcie_soc mtk_pcie_soc_en7528 = {
> +	.ops = &mtk_pcie_ops_v2,
> +	.startup = mtk_pcie_startup_port_en7528,
> +	.setup_irq = mtk_pcie_setup_irq,
> +};
> +
>  static const struct of_device_id mtk_pcie_ids[] = {
>  	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
> +	{ .compatible = "econet,en7528-pcie", .data = &mtk_pcie_soc_en7528 },
>  	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
>  	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
>  	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
> -- 
> 2.39.5
> 

