Return-Path: <linux-mips+bounces-14657-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OxDJ6ISDmoJ6AUAu9opvQ
	(envelope-from <linux-mips+bounces-14657-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 21:59:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 407CF598F90
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 21:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2B23300F5FE
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2026 19:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B175361DB8;
	Wed, 20 May 2026 19:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkG0h3HZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD696361670;
	Wed, 20 May 2026 19:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779307143; cv=none; b=lHfX/KNtrJ+7tg3S3v65m47DW8BTO8GRe8DL2RtCvII+44iivQXsoMMigoYw4AeF9ADPhEkcg2uE+r/C+GnHGJAbOQVTY01PVF7qN8uthw5mPDXA1edNFpr+IVifI5a+cdfHQHBDG+WtUMm95jdFatRK47LNJmGfYEswRfFlCuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779307143; c=relaxed/simple;
	bh=Bz05hZqUiRaxeMa30drXVtsWG8NAqGrcAzLb8JM+ddA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PXVsusHd8b0D1nGl2FPhFp8FpNf3T26vvdL48y6h/IYBVL6pAXoTIGZKxnQrUYJj6k9utOiFD9pqZWv6SyCZAsClqa6xTuwMB4D7SZnoeVqRTo34emRsCymgZdogl0SP0NpDlXwkwXLP9SIpPn+r6F68MbZeU101GVl3yVYLc4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkG0h3HZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 47DCB1F00893;
	Wed, 20 May 2026 19:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779307141;
	bh=cBYu2GQc6MoTLCxtxKTqbYy4E2npoA7fcMHsRIGQpuM=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=KkG0h3HZCk2u4rbRBRv1CRod6SfsAyCcBeaNM8cXJDiOoqTVrKR15PLdmEaPWSnNl
	 pxPerPBzkwH1UCir9Njn+6W9nb5LQP/AZ7ySB5sXMV/LDLVfjYjyTUZy2ilvSocas8
	 IQjfxSBYl31SiQ4AKTPF/MweXa5NRZpbOQhaF0knIXM2IXpJ7nFVh9qMppxMCP25mP
	 xWzwu8YiYpH39K8q5reCKndbBuvClS30jWNCOKawY0diQkct9rl3NlbRtwfzmreS9V
	 nrKAcd0S1yjwPdZolN+5R7KHUrhT73680UQIEiOfBBcDozpi7OE+vxVN625y0knHD1
	 BzVOFOEIe1Y/g==
Date: Wed, 20 May 2026 14:59:00 -0500
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
Message-ID: <20260520195900.GA86018@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afd47d4b-8309-4025-a40b-29606fed3c50@cjdns.fr>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14657-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,elinux.org:url]
X-Rspamd-Queue-Id: 407CF598F90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 09:17:35PM +0200, Caleb James DeLisle wrote:
> 
> On 20/05/2026 20:55, Bjorn Helgaas wrote:
> > On Wed, May 20, 2026 at 06:38:25PM +0000, Caleb James DeLisle wrote:
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > 
> > > The driver previously used virt_to_phys() on the ioremapped register base
> > > (port->base) to compute the MSI message address. Using virt_to_phys() on an
> > > IO mapped address is incorrect because it expects a kernel virtual address.
> > > 
> > > To fix it, store the physical start of the I/O register region in
> > > mtk_pcie_port->phys_base and use it to build the MSI address. This replaces
> > > the incorrect virt_to_phys() usage and ensures MSI addresses are generated
> > > correctly.
> > > 
> > > Fixes: 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622")
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
> > > ---
> > >   drivers/pci/controller/pcie-mediatek.c | 16 +++++++++++++---
> > >   1 file changed, 13 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > > index 75722524fe74..c503fbd774d0 100644
> > > --- a/drivers/pci/controller/pcie-mediatek.c
> > > +++ b/drivers/pci/controller/pcie-mediatek.c
> > > @@ -175,6 +175,7 @@ struct mtk_pcie_soc {
> > >   /**
> > >    * struct mtk_pcie_port - PCIe port information
> > >    * @base: IO mapped register base
> > > + * @phys_base: Physical address of the I/O register base region
> > >    * @list: port list
> > >    * @pcie: pointer to PCIe host info
> > >    * @reset: pointer to port reset control
> > > @@ -196,6 +197,7 @@ struct mtk_pcie_soc {
> > >    */
> > >   struct mtk_pcie_port {
> > >   	void __iomem *base;
> > > +	phys_addr_t phys_base;
> > >   	struct list_head list;
> > >   	struct mtk_pcie *pcie;
> > >   	struct reset_control *reset;
> > > @@ -405,7 +407,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
> > >   	phys_addr_t addr;
> > >   	/* MT2712/MT7622 only support 32-bit MSI addresses */
> > > -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> > > +	addr = port->phys_base + PCIE_MSI_VECTOR;
> >
> > This doesn't look right because the MSI address is a PCI bus address,
> > and port->phys_base is a CPU physical address.  Often a PCI bus
> > address is the same as the CPU physical address, but not always.
> > I think the DT 'ranges' property tells you the translation.

Oops, sorry, I muddied the waters here.

'ranges' tells you the translation applied by a bridge, e.g., when a
CPU does a load/store, the PCI host bridge turns it into a PCI
read/write transaction.  The bridge might add an offset to the CPU
load/store physical address to get the PCI read/write bus address.

But that's not the issue here.  The MSI is basically a DMA write
performed by the PCI device, not a store done by a CPU, so I don't
think 'ranges' is the right thing to look at.

Based on this:
https://elinux.org/Device_Tree_Usage#PCI_DMA_Address_Translation
I think 'dma-ranges' is the relevant property.  I don't think your DT
includes a 'dma-ranges' property, and in that case the default is that 
the system bus (CPU) address is the same as the PCI address.

So I think this patch works because it assumes DMA addresses like the
MSI address are mapped to identical system bus addresses.

It still seems to me that drivers should be prepared for the presence
of dma-ranges and use it when computing the MSI target address.  But I
don't think any drivers really do that, so for now I think you should
pretend that I never responded about this patch.

> This is all still a little over my head here, but my understanding was that
> this is in the middle of the device's register map because the DT has the
> following:
> 
> reg = <0x1fb83000 0x1000>;
> reg-names = "port1";
> 
> Per the manual, that offset (base + 0xc0) is in undocumented area but it's
> in the registers.
> 
> The PCI memory is 0x20000000 - 0x2fffffff and we split it between the two
> devices. Here's the one using the upper half:
> 
>         ranges = <0x81000000 0 0x00000000 0x1f608000 0 0x00008000>,  (IO)
> 
>              <0x82000000 0 0x28000000 0x28000000 0 0x08000000>;      (MEM)
> 
> Hope I'm adding something useful here... Let me know if you want me to get
> or test anything else.

Obviously it's over my head too, so I'm sorry I confused the
situation.

> > >   	msg->address_hi = 0;
> > >   	msg->address_lo = lower_32_bits(addr);
> > > @@ -520,7 +522,7 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
> > >   	u32 val;
> > >   	phys_addr_t msg_addr;
> > > -	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> > > +	msg_addr = port->phys_base + PCIE_MSI_VECTOR;
> > >   	val = lower_32_bits(msg_addr);
> > >   	writel(val, port->base + PCIE_IMSI_ADDR);
> > > @@ -953,6 +955,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
> > >   	struct mtk_pcie_port *port;
> > >   	struct device *dev = pcie->dev;
> > >   	struct platform_device *pdev = to_platform_device(dev);
> > > +	struct resource *res;
> > >   	char name[20];
> > >   	int err;
> > > @@ -961,7 +964,14 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
> > >   		return -ENOMEM;
> > >   	snprintf(name, sizeof(name), "port%d", slot);
> > > -	port->base = devm_platform_ioremap_resource_byname(pdev, name);
> > > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> > > +	if (!res) {
> > > +		dev_err(dev, "failed to get port%d base\n", slot);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	port->phys_base = res->start;
> > > +	port->base = devm_ioremap_resource(&pdev->dev, res);
> > >   	if (IS_ERR(port->base)) {
> > >   		dev_err(dev, "failed to map port%d base\n", slot);
> > >   		return PTR_ERR(port->base);
> > > -- 
> > > 2.39.5
> > > 

