Return-Path: <linux-mips+bounces-14720-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKgmFXPcEGphewYAu9opvQ
	(envelope-from <linux-mips+bounces-14720-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2026 00:45:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFE25BB372
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2026 00:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32D8430048FD
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 22:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86803921C3;
	Fri, 22 May 2026 22:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdDfrQIg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2BC3921D0;
	Fri, 22 May 2026 22:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779489809; cv=none; b=XBy04xENJYN33vS1JEcTQK04pjajdYLOZtcvcwWWXikNRdlHtn66X9tMWxzsfmVZyvYlp6dO4t0Yh4Oeh7q+FCXdJRrgOwh8rursfYfVDmIAE81qELiM7vMaDNN0V+CC8uJ717iRCHmOdD3WEm3pye3k+tpAnVpiOqU5BtCHPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779489809; c=relaxed/simple;
	bh=mRtntZrAV+2jfR3TVChbt2cU6VWoavVtH+9JrPpWUrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OkC/0idCcnK7vgoqTK8Eu7Dk9TPrcMWTr153wyB6oPxq+0uPJWPQ1SWWJqq5bbc1cbUhp1LC84aUeNqXSijIFhQ7AjodugZWuD9i0+TDUrqCV4gA7a7/+a7yoIGhPz+NrPFcc1/vtshR/Q12ywT+GdW1hAlIPl1NlQxNrdo+FhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdDfrQIg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4C9E71F000E9;
	Fri, 22 May 2026 22:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779489806;
	bh=5PJOo0ni1XYQzQF6Rj7ozcEQoTTxGYPgOEd77Drbvg8=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=IdDfrQIg+fZetrCkoTY0IauSrN4pHDMvMCxGY6SoKkgD5tgrspCUzYZQpQzHAOqbT
	 QXQVrtWcPrQRkxosIwSpEtDfOS6rSrlACxGKW/PBv03KOsoX65Mdy9MA/+f6JUR9eR
	 ueexrCTVtPqe8ESjPDSBLkhBS9ILa5ej8UiYVIqanlW8ZSkA3LbEZgblgPNt+R9Bnu
	 7Gf+STLjWCmo6hB1EnAMIetldKDp0DZm4HMq7+j375HUETEZmukv7vdE2CZHXuoARU
	 PTcWt87VHL7K0liTAXhPMgXbUTxGR3EgigqlVeGe450cRjU4RGrzQmVqyAoFRi58vb
	 BFnpd67/wiXWw==
Date: Fri, 22 May 2026 17:43:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-pci@vger.kernel.org,
	linux-mips@vger.kernel.org, naseefkm@gmail.com,
	ryder.lee@mediatek.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/3] PCI: mediatek: Use actual physical address
 instead of virt_to_phys()
Message-ID: <20260522224325.GA195169@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7xfp5nbtd4qtonoqurfwoedsix7vondrnfeip53uwjintuvc6a@cg3ez6z3pii5>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14720-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[cjdns.fr,vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: ADFE25BB372
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 10:44:51AM +0530, Manivannan Sadhasivam wrote:
> On Wed, May 20, 2026 at 02:59:00PM -0500, Bjorn Helgaas wrote:
> > On Wed, May 20, 2026 at 09:17:35PM +0200, Caleb James DeLisle wrote:
> > > 
> > > On 20/05/2026 20:55, Bjorn Helgaas wrote:
> > > > On Wed, May 20, 2026 at 06:38:25PM +0000, Caleb James DeLisle wrote:
> > > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > > > 
> > > > > The driver previously used virt_to_phys() on the ioremapped register base
> > > > > (port->base) to compute the MSI message address. Using virt_to_phys() on an
> > > > > IO mapped address is incorrect because it expects a kernel virtual address.
> > > > > 
> > > > > To fix it, store the physical start of the I/O register region in
> > > > > mtk_pcie_port->phys_base and use it to build the MSI address. This replaces
> > > > > the incorrect virt_to_phys() usage and ensures MSI addresses are generated
> > > > > correctly.
> > > > > 
> > > > > Fixes: 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622")
> > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > > > Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
> > > > > ---
> > > > >   drivers/pci/controller/pcie-mediatek.c | 16 +++++++++++++---
> > > > >   1 file changed, 13 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > > > > index 75722524fe74..c503fbd774d0 100644
> > > > > --- a/drivers/pci/controller/pcie-mediatek.c
> > > > > +++ b/drivers/pci/controller/pcie-mediatek.c
> > > > > @@ -175,6 +175,7 @@ struct mtk_pcie_soc {
> > > > >   /**
> > > > >    * struct mtk_pcie_port - PCIe port information
> > > > >    * @base: IO mapped register base
> > > > > + * @phys_base: Physical address of the I/O register base region
> > > > >    * @list: port list
> > > > >    * @pcie: pointer to PCIe host info
> > > > >    * @reset: pointer to port reset control
> > > > > @@ -196,6 +197,7 @@ struct mtk_pcie_soc {
> > > > >    */
> > > > >   struct mtk_pcie_port {
> > > > >   	void __iomem *base;
> > > > > +	phys_addr_t phys_base;
> > > > >   	struct list_head list;
> > > > >   	struct mtk_pcie *pcie;
> > > > >   	struct reset_control *reset;
> > > > > @@ -405,7 +407,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
> > > > >   	phys_addr_t addr;
> > > > >   	/* MT2712/MT7622 only support 32-bit MSI addresses */
> > > > > -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> > > > > +	addr = port->phys_base + PCIE_MSI_VECTOR;
> > > >
> > > > This doesn't look right because the MSI address is a PCI bus address,
> > > > and port->phys_base is a CPU physical address.  Often a PCI bus
> > > > address is the same as the CPU physical address, but not always.
> > > > I think the DT 'ranges' property tells you the translation.
> > 
> > Oops, sorry, I muddied the waters here.
> > 
> > 'ranges' tells you the translation applied by a bridge, e.g., when
> > a CPU does a load/store, the PCI host bridge turns it into a PCI
> > read/write transaction.  The bridge might add an offset to the CPU
> > load/store physical address to get the PCI read/write bus address.
> > 
> > But that's not the issue here.  The MSI is basically a DMA write
> > performed by the PCI device, not a store done by a CPU, so I don't
> > think 'ranges' is the right thing to look at.
> 
> Yeah, it is so easy to confuse both. To summarise, 'ranges'
> describes the outbound translation and 'dma-ranges' describes the
> inbound translation from host perspective.
> 
> > Based on this:
> > https://elinux.org/Device_Tree_Usage#PCI_DMA_Address_Translation I
> > think 'dma-ranges' is the relevant property.  I don't think your
> > DT includes a 'dma-ranges' property, and in that case the default
> > is that the system bus (CPU) address is the same as the PCI
> > address.
> > 
> > So I think this patch works because it assumes DMA addresses like
> > the MSI address are mapped to identical system bus addresses.
> > 
> > It still seems to me that drivers should be prepared for the
> > presence of dma-ranges and use it when computing the MSI target
> > address.  But I don't think any drivers really do that, so for now
> > I think you should pretend that I never responded about this
> > patch.
> 
> Your observations are correct. This driver assumes that the
> identical mapping exists between CPU and PCI bus addresses. Usually,
> the drivers make use of phys_to_dma() to handle the translations.

What does this look like in the native host bridge drivers?  I don't
see any direct calls of phys_to_dma(), but there are some higher-level
interfaces that use it.

I don't really see a consistent style of constructing MSI addresses,
e.g., in *_compose_msi_msg() implementations.

> This API internally makes use of the 'dma_range_map' which gets
> populated by the OF core based on the 'dma-ranges' property (if
> present in DT).
> 
> But it makes sense to use it irrespective of whether the platform
> supports non-identical DMA/inbound translation or not. Since this
> API behaves like a no-op and returns the CPU physical address if
> there is an identical mapping, there is literally zero overhead in
> using it.

Thanks for rescuing me.

I wonder if there should be something in
Documentation/core-api/dma-api* about this.  I guess that is mostly
oriented toward things like PCI device drivers, not so much PCI host
bridge drivers.  But it would be nice to have a little intro to
dma-ranges and maybe even the restricted DMA usage.

Bjorn

