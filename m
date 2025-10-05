Return-Path: <linux-mips+bounces-11619-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D2DBB976A
	for <lists+linux-mips@lfdr.de>; Sun, 05 Oct 2025 15:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 720C118804A2
	for <lists+linux-mips@lfdr.de>; Sun,  5 Oct 2025 13:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897111DB34C;
	Sun,  5 Oct 2025 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQI8MBWM"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5E334BA35;
	Sun,  5 Oct 2025 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759670586; cv=none; b=hCep0FJiOfUjf2Ukt9Ah0BSpI8BF47eGXSudvYmsPTANQlXBSfxDnWDNLIDSXeSTpJw/RdQK1WRX97+QPZBZNfD2SZxRz61LB2bTnNz9wrs2n/u5m+U4MGSXiMcFxD8zc2X+jPiymH/jvEj/CizzNAufh+46mbPXUq5YJ+ke3Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759670586; c=relaxed/simple;
	bh=6+uRFKM+xw8rM4uHQwSSsX/I531L8PAvk6zEHoLHg8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjX2dePHUCn99j8Oj/MDEbLtrho8Xuic2IuQGey7wzzAyKi4nM40VoG6qz1NWYrRZur7/2M9lgeiVaA+bX53raNz3kG/6q/dBexmIMh0H5GZtAue1NE6K71OkViUj16yY39wKLsyUP/OPkUpJCBD+utD1s29Qbi+XW3GMTrVs3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQI8MBWM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0842BC4CEF4;
	Sun,  5 Oct 2025 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759670585;
	bh=6+uRFKM+xw8rM4uHQwSSsX/I531L8PAvk6zEHoLHg8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQI8MBWMG4tLc46rpbyggEqPm4RA0GD3UaTk7eYqkbWnOP1BLMQA8Bd0FFRadaCjl
	 rAIwUkukGk1MYrK6xzB125V9hLaAp82BATfNmpxYK900245SXx6HbOfKm5BRC0dbrv
	 5QIWkPRwZti2En9ftBy6nIGiRtg+huCzDNWJ5bjY2f8oES07rhnV70hSDpOBxrTa9X
	 YnSL7jBydSFF3hFNjyz3N+OAncXZLI72rMKNLj2nG6j611VESyMRDTNgD+W7pQflQI
	 0zasEU6xrBWNYwhvzi4ZbeidMKDY3niw7/pdc6/NWMpg9zZU2H3pgYKg6oaItVMxpH
	 /iMYZdttll/xg==
Date: Sun, 5 Oct 2025 16:22:59 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 3/9] parisc: Convert DMA map_page to map_phys interface
Message-ID: <20251005132259.GA21221@unreal>
References: <cover.1759071169.git.leon@kernel.org>
 <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
 <20251003150144.GC3360665@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003150144.GC3360665@nvidia.com>

On Fri, Oct 03, 2025 at 12:01:44PM -0300, Jason Gunthorpe wrote:
> On Sun, Sep 28, 2025 at 06:02:23PM +0300, Leon Romanovsky wrote:
> > +ccio_map_phys(struct device *dev, phys_addr_t phys, size_t size,
> > +	      enum dma_data_direction direction, unsigned long attrs)
> >  {
> > -	return ccio_map_single(dev, page_address(page) + offset, size,
> > -			direction);
> > +	if (attrs & DMA_ATTR_MMIO)
> > +		return DMA_MAPPING_ERROR;
> > +
> > +	return ccio_map_single(dev, phys_to_virt(phys), size, direction);
> 
> This doesn't actually use the virt at all:
> 
> 	offset = ((unsigned long) addr) & ~IOVP_MASK;
> 	if((size % L1_CACHE_BYTES) || ((unsigned long)addr % L1_CACHE_BYTES))
> 		ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, (unsigned long)addr, hint);
> 
> And ccio_io_pdir_entry():
> 	pa = lpa(vba);
> 
> Is a special instruction that uses virt but AI tells me that special
> LPA instruction is returning phys. Not sure if that is a different
> value than virt_to_phys()..
> 
> IDK, I'm not feeling brave enough to drop the LPA but maybe include
> this note in the commit message.
> 
It looks like I was chosen as a volunteer to do so. WDYT?

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index b00f6fc49063..4d73e67fbd54 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -517,10 +517,10 @@ static u32 hint_lookup[] = {
  * ccio_io_pdir_entry - Initialize an I/O Pdir.
  * @pdir_ptr: A pointer into I/O Pdir.
  * @sid: The Space Identifier.
- * @vba: The virtual address.
+ * @pba: The physical address.
  * @hints: The DMA Hint.
  *
- * Given a virtual address (vba, arg2) and space id, (sid, arg1),
+ * Given a physical address (pba, arg2) and space id, (sid, arg1),
  * load the I/O PDIR entry pointed to by pdir_ptr (arg0). Each IO Pdir
  * entry consists of 8 bytes as shown below (MSB == bit 0):
  *
@@ -543,7 +543,7 @@ static u32 hint_lookup[] = {
  * index are bits 12:19 of the value returned by LCI.
  */
 static void
-ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
+ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, phys_addr_t pba,
                   unsigned long hints)
 {
        register unsigned long pa;
@@ -557,7 +557,7 @@ ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
        ** "hints" parm includes the VALID bit!
        ** "dep" clobbers the physical address offset bits as well.
        */
-       pa = lpa(vba);
+       pa = pba;
        asm volatile("depw  %1,31,12,%0" : "+r" (pa) : "r" (hints));
        ((u32 *)pdir_ptr)[1] = (u32) pa;

@@ -582,7 +582,7 @@ ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
        ** Grab virtual index [0:11]
        ** Deposit virt_idx bits into I/O PDIR word
        */
-       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (vba));
+       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (pba));
        asm volatile ("extru %1,19,12,%0" : "+r" (ci) : "r" (ci));
        asm volatile ("depw  %1,15,12,%0" : "+r" (pa) : "r" (ci));

@@ -704,14 +704,14 @@ ccio_dma_supported(struct device *dev, u64 mask)
 /**
  * ccio_map_single - Map an address range into the IOMMU.
  * @dev: The PCI device.
- * @addr: The start address of the DMA region.
+ * @addr: The physical address of the DMA region.
  * @size: The length of the DMA region.
  * @direction: The direction of the DMA transaction (to/from device).
  *
  * This function implements the pci_map_single function.
  */
 static dma_addr_t 
-ccio_map_single(struct device *dev, void *addr, size_t size,
+ccio_map_single(struct device *dev, phys_addr_t addr, size_t size,
                enum dma_data_direction direction)
 {
        int idx;
@@ -730,7 +730,7 @@ ccio_map_single(struct device *dev, void *addr, size_t size,
        BUG_ON(size <= 0);
 
        /* save offset bits */
-       offset = ((unsigned long) addr) & ~IOVP_MASK;
+       offset = offset_in_page(addr);
 
        /* round up to nearest IOVP_SIZE */
        size = ALIGN(size + offset, IOVP_SIZE);
@@ -746,15 +746,15 @@ ccio_map_single(struct device *dev, void *addr, size_t size,
 
        pdir_start = &(ioc->pdir_base[idx]);
 
-       DBG_RUN("%s() %px -> %#lx size: %zu\n",
-               __func__, addr, (long)(iovp | offset), size);
+       DBG_RUN("%s() %pa -> %#lx size: %zu\n",
+               __func__, &addr, (long)(iovp | offset), size);
 
        /* If not cacheline aligned, force SAFE_DMA on the whole mess */
-       if((size % L1_CACHE_BYTES) || ((unsigned long)addr % L1_CACHE_BYTES))
+       if((size % L1_CACHE_BYTES) || (addr % L1_CACHE_BYTES))
                hint |= HINT_SAFE_DMA;
 
        while(size > 0) {
-               ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, (unsigned long)addr, hint);
+               ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, addr, hint);
 
                DBG_RUN(" pdir %p %08x%08x\n",
                        pdir_start,
@@ -779,7 +779,7 @@ ccio_map_phys(struct device *dev, phys_addr_t phys, size_t size,
        if (unlikely(attrs & DMA_ATTR_MMIO))
                return DMA_MAPPING_ERROR;
 
-       return ccio_map_single(dev, phys_to_virt(phys), size, direction);
+       return ccio_map_single(dev, phys, size, direction);
 }
 
 
@@ -854,7 +854,8 @@ ccio_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle, gfp_t flag,
 
        if (ret) {
                memset(ret, 0, size);
-               *dma_handle = ccio_map_single(dev, ret, size, DMA_BIDIRECTIONAL);
+               *dma_handle = ccio_map_single(dev, virt_to_phys(ret), size,
+                                             DMA_BIDIRECTIONAL);
        }
 
        return ret;
@@ -921,7 +922,7 @@ ccio_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
        /* Fast path single entry scatterlists. */
        if (nents == 1) {
                sg_dma_address(sglist) = ccio_map_single(dev,
-                               sg_virt(sglist), sglist->length,
+                               sg_phys(sglist), sglist->length,
                                direction);
                sg_dma_len(sglist) = sglist->length;
                return 1;

> 
> Jason
> 

