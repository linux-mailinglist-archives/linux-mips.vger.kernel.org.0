Return-Path: <linux-mips+bounces-14661-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EOQNeiUDmrJAQYAu9opvQ
	(envelope-from <linux-mips+bounces-14661-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 07:15:20 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1A559EFB5
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 07:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C01E3017093
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 05:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA34361675;
	Thu, 21 May 2026 05:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnIlBWIj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0F360EFD;
	Thu, 21 May 2026 05:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340518; cv=none; b=K5XSEOFJc5nOtkKgJD26qj9Ls8Hd8+0kPeQprU67Xlne40wIjXKlNcLMomeiAfC+0vKALzflny6QJAKoxNCllE3gDSKpEdFVNvMQz+1KoTcLHcb+Ho9F/wcM8XB1uMD3FqoJWHzvee32fjCfS9Ir5bLojcwmTrde6FUAXdXWrhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340518; c=relaxed/simple;
	bh=x4gHjh2Rrqz3/Xt2WX8QhIAyVlA62HeFdhWSubChrRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1dbtrutDSU6fkTzTRWlvndIy/1NL5ugMvEjThR74yX/fGbGHsKYaBEIda03szYn78MJcHiygpH/IL3LIXGEgtOW/8rxL8GLTELBbQgWkGqwCfj1G4Jo0d2R2IJyw5KfFm+uQ8pKxQnx5g8kU588v82HAA+GUKbMNdvLFIv82sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnIlBWIj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797A91F000E9;
	Thu, 21 May 2026 05:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779340516;
	bh=z4KfFRjOYPoi5yAlTLcAC9uTr5/8FAckLXTA3F0vtgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fnIlBWIjjxk06AKwz13Ck1J7TKAPYJ+7/IibDB12moICXO+WTs37IRziBx9yI/xvk
	 hpbeggw0H+8m5OjOjqr9kak5WWOW5x/0nyZAcsvpwnlvhyDo+8IHy5vmv6RNNPr3TH
	 Kv29+KI4ZhFCpTtgLgXVSjtoF9Jvd5UPJTINWBMhv/Upmtrcd0bJeYFGKjr5szc0J6
	 POf1msKsTZ7Tz9y8bKvQnf6Bpez4m9zTUMzENBW3XS4DvLhIqvzIGtG9KGCnfQ0Fu6
	 JBudbJM4A3Q7/F9MtUQnEwEuDXU65zhNDorqJNBG63zwhlGNBQrF88jNpGniePcUY0
	 0cXSUtnw6eMcA==
Date: Thu, 21 May 2026 10:44:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-pci@vger.kernel.org, 
	linux-mips@vger.kernel.org, naseefkm@gmail.com, ryder.lee@mediatek.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/3] PCI: mediatek: Use actual physical address
 instead of virt_to_phys()
Message-ID: <7xfp5nbtd4qtonoqurfwoedsix7vondrnfeip53uwjintuvc6a@cg3ez6z3pii5>
References: <afd47d4b-8309-4025-a40b-29606fed3c50@cjdns.fr>
 <20260520195900.GA86018@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520195900.GA86018@bhelgaas>
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
	TAGGED_FROM(0.00)[bounces-14661-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[cjdns.fr,vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4D1A559EFB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 02:59:00PM -0500, Bjorn Helgaas wrote:
> On Wed, May 20, 2026 at 09:17:35PM +0200, Caleb James DeLisle wrote:
> > 
> > On 20/05/2026 20:55, Bjorn Helgaas wrote:
> > > On Wed, May 20, 2026 at 06:38:25PM +0000, Caleb James DeLisle wrote:
> > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > > 
> > > > The driver previously used virt_to_phys() on the ioremapped register base
> > > > (port->base) to compute the MSI message address. Using virt_to_phys() on an
> > > > IO mapped address is incorrect because it expects a kernel virtual address.
> > > > 
> > > > To fix it, store the physical start of the I/O register region in
> > > > mtk_pcie_port->phys_base and use it to build the MSI address. This replaces
> > > > the incorrect virt_to_phys() usage and ensures MSI addresses are generated
> > > > correctly.
> > > > 
> > > > Fixes: 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622")
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > > Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
> > > > ---
> > > >   drivers/pci/controller/pcie-mediatek.c | 16 +++++++++++++---
> > > >   1 file changed, 13 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > > > index 75722524fe74..c503fbd774d0 100644
> > > > --- a/drivers/pci/controller/pcie-mediatek.c
> > > > +++ b/drivers/pci/controller/pcie-mediatek.c
> > > > @@ -175,6 +175,7 @@ struct mtk_pcie_soc {
> > > >   /**
> > > >    * struct mtk_pcie_port - PCIe port information
> > > >    * @base: IO mapped register base
> > > > + * @phys_base: Physical address of the I/O register base region
> > > >    * @list: port list
> > > >    * @pcie: pointer to PCIe host info
> > > >    * @reset: pointer to port reset control
> > > > @@ -196,6 +197,7 @@ struct mtk_pcie_soc {
> > > >    */
> > > >   struct mtk_pcie_port {
> > > >   	void __iomem *base;
> > > > +	phys_addr_t phys_base;
> > > >   	struct list_head list;
> > > >   	struct mtk_pcie *pcie;
> > > >   	struct reset_control *reset;
> > > > @@ -405,7 +407,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
> > > >   	phys_addr_t addr;
> > > >   	/* MT2712/MT7622 only support 32-bit MSI addresses */
> > > > -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> > > > +	addr = port->phys_base + PCIE_MSI_VECTOR;
> > >
> > > This doesn't look right because the MSI address is a PCI bus address,
> > > and port->phys_base is a CPU physical address.  Often a PCI bus
> > > address is the same as the CPU physical address, but not always.
> > > I think the DT 'ranges' property tells you the translation.
> 
> Oops, sorry, I muddied the waters here.
> 
> 'ranges' tells you the translation applied by a bridge, e.g., when a
> CPU does a load/store, the PCI host bridge turns it into a PCI
> read/write transaction.  The bridge might add an offset to the CPU
> load/store physical address to get the PCI read/write bus address.
> 
> But that's not the issue here.  The MSI is basically a DMA write
> performed by the PCI device, not a store done by a CPU, so I don't
> think 'ranges' is the right thing to look at.
> 

Yeah, it is so easy to confuse both. To summarise, 'ranges' describes the
outbound translation and 'dma-ranges' describes the inbound translation from
host perspective.

> Based on this:
> https://elinux.org/Device_Tree_Usage#PCI_DMA_Address_Translation
> I think 'dma-ranges' is the relevant property.  I don't think your DT
> includes a 'dma-ranges' property, and in that case the default is that 
> the system bus (CPU) address is the same as the PCI address.
> 
> So I think this patch works because it assumes DMA addresses like the
> MSI address are mapped to identical system bus addresses.
> 
> It still seems to me that drivers should be prepared for the presence
> of dma-ranges and use it when computing the MSI target address.  But I
> don't think any drivers really do that, so for now I think you should
> pretend that I never responded about this patch.
> 

Your observations are correct. This driver assumes that the identical mapping
exists between CPU and PCI bus addresses. Usually, the drivers make use of
phys_to_dma() to handle the translations. This API internally makes use of the
'dma_range_map' which gets populated by the OF core based on the 'dma-ranges'
property (if present in DT).

But it makes sense to use it irrespective of whether the platform supports
non-identical DMA/inbound translation or not. Since this API behaves like a
no-op and returns the CPU physical address if there is an identical mapping,
there is literally zero overhead in using it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

