Return-Path: <linux-mips+bounces-14655-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI8VHLEwDmoK7wUAu9opvQ
	(envelope-from <linux-mips+bounces-14655-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 00:07:45 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D84E59BC40
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 00:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8C8A39FF94C
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 18:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAEF402BB4;
	Wed, 20 May 2026 18:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBYFiAXx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D774028F9;
	Wed, 20 May 2026 18:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303337; cv=none; b=r+21NpjPOyzhfokzBfcVHbO9BLpzlCI7H9M4sPQ6a2okdZA9dfbm7PWbbzTeOCMeZ2UdJyCr3JGKFKA1En7zrhWEcchadXzRgZxMQ45RAkkdWlWmm0sBOH0qSDtazEdKaB1g+tgquNFs98KGB/mhJA1yj6SaD+w3eYrCkoCTeho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303337; c=relaxed/simple;
	bh=aormWLo69fhvzHrVWnIs6E0MHnDckE150hcpfR5D78s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IyuTxem2mf3G3ipkdogg14wIl4IqeuCAPcNLN+384c3X1j0mcBoeW8wAy0YbT7J8soJBD6ocFbGTGSLEfz050r5E2pr4+96QVCG+nfWMPLp9qJM7ENUS5MyYVMeOTf7oobEihtKBHcbpWhaRHKWtV07brk7Nm1awLzcJ9d/Kkk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBYFiAXx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9BAF21F00894;
	Wed, 20 May 2026 18:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779303335;
	bh=39UG6z3xSkfALd7iFK2MrFvSVeHM27TADIbMrVcBmWU=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=EBYFiAXx0OCVsyM1J/eRY73szIoOfP85uCJFVPjKqdm7S5vsfcLScQOznPRxobUsW
	 7vGl9qe439P94ZDvGqu9osOzTC551N/8TGC7knUso1/HPgeIJvTj+5BJ3KZvt7TgbM
	 fbkwnHaReeN0NSWcnOddQVxkpbAzmE8LJH+iZFTO9y9JhqAg3q4rYxoUKq4wOVeztb
	 pTzB8xcNOyttKs0MpMYCGm0TM7o0uH/LgTeXFCXCad7zrhVIJfMjziIQQhPYf0wo3y
	 LwrL32e5PFnokVZoytxFkN+ht1ApxcP+nZMUSIkqYQd2b4GKg/C0JDywlr0BcHW25J
	 eCrpZw+foDy7w==
Date: Wed, 20 May 2026 13:55:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/3] PCI: mediatek: Use actual physical address
 instead of virt_to_phys()
Message-ID: <20260520185534.GA72799@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520183827.908243-2-cjd@cjdns.fr>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14655-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:email,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1D84E59BC40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 06:38:25PM +0000, Caleb James DeLisle wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The driver previously used virt_to_phys() on the ioremapped register base
> (port->base) to compute the MSI message address. Using virt_to_phys() on an
> IO mapped address is incorrect because it expects a kernel virtual address.
> 
> To fix it, store the physical start of the I/O register region in
> mtk_pcie_port->phys_base and use it to build the MSI address. This replaces
> the incorrect virt_to_phys() usage and ensures MSI addresses are generated
> correctly.
> 
> Fixes: 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 75722524fe74..c503fbd774d0 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -175,6 +175,7 @@ struct mtk_pcie_soc {
>  /**
>   * struct mtk_pcie_port - PCIe port information
>   * @base: IO mapped register base
> + * @phys_base: Physical address of the I/O register base region
>   * @list: port list
>   * @pcie: pointer to PCIe host info
>   * @reset: pointer to port reset control
> @@ -196,6 +197,7 @@ struct mtk_pcie_soc {
>   */
>  struct mtk_pcie_port {
>  	void __iomem *base;
> +	phys_addr_t phys_base;
>  	struct list_head list;
>  	struct mtk_pcie *pcie;
>  	struct reset_control *reset;
> @@ -405,7 +407,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  	phys_addr_t addr;
>  
>  	/* MT2712/MT7622 only support 32-bit MSI addresses */
> -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> +	addr = port->phys_base + PCIE_MSI_VECTOR;

This doesn't look right because the MSI address is a PCI bus address,
and port->phys_base is a CPU physical address.  Often a PCI bus
address is the same as the CPU physical address, but not always.
I think the DT 'ranges' property tells you the translation.

>  	msg->address_hi = 0;
>  	msg->address_lo = lower_32_bits(addr);
>  
> @@ -520,7 +522,7 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
>  	u32 val;
>  	phys_addr_t msg_addr;
>  
> -	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> +	msg_addr = port->phys_base + PCIE_MSI_VECTOR;
>  	val = lower_32_bits(msg_addr);
>  	writel(val, port->base + PCIE_IMSI_ADDR);
>  
> @@ -953,6 +955,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>  	struct mtk_pcie_port *port;
>  	struct device *dev = pcie->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
> +	struct resource *res;
>  	char name[20];
>  	int err;
>  
> @@ -961,7 +964,14 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>  		return -ENOMEM;
>  
>  	snprintf(name, sizeof(name), "port%d", slot);
> -	port->base = devm_platform_ioremap_resource_byname(pdev, name);
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +	if (!res) {
> +		dev_err(dev, "failed to get port%d base\n", slot);
> +		return -EINVAL;
> +	}
> +
> +	port->phys_base = res->start;
> +	port->base = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(port->base)) {
>  		dev_err(dev, "failed to map port%d base\n", slot);
>  		return PTR_ERR(port->base);
> -- 
> 2.39.5
> 

