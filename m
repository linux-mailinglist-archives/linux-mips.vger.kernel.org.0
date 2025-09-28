Return-Path: <linux-mips+bounces-11578-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 271C9BA73C6
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 17:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA77B3B9CC0
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 15:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A753C226CF9;
	Sun, 28 Sep 2025 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="XDrJz48O";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="2W7jKc5o"
X-Original-To: linux-mips@vger.kernel.org
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398B9223DE7
	for <linux-mips@vger.kernel.org>; Sun, 28 Sep 2025 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759072719; cv=none; b=YUHiulzjOqJldyaeqjGGEGHkAcEqAEUdhvimG5MitZzxLm64WDjGwLkUeDqmx22/hqGlIUTeq/SGhGLpXni/F2loKqjo7l9oIvXYhKjFLn8N0j4NYUYTIabJrnB9TR328VQyfPTLxjofET8SOWaL1+b5yHXARQjpLiwI7clRmhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759072719; c=relaxed/simple;
	bh=CcS6U7ffgxdTFuL3QHyJuLxKgMPZ2giKEOrKRmvUm88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D04VERIvPtyg+C9rnjS3YRWbV70099P4uls7pBBRImTKIxI5mqcj/ytBlBKK/d5K4v/iOeS3oY3ROinCnqf0Q+xWNqqkwAvEwuRtz7Fy/ItPolKSLGLZXJGmI2tm646Yr/AjeyMcvKanSbqgO5F1/CvZP6lUhRfWOVjPHsqU3mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=XDrJz48O; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=2W7jKc5o; arc=none smtp.client-ip=46.30.211.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ravnborg.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1759072648; x=1759677448;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=/Q5hJNgUVt5SsKvfCGB08N5MVmcUGqA0PZ6u8vFRIRA=;
	b=XDrJz48OIBYo3Q7svVdb5rADtr4uzPeBqjzvjdBidN0feLc/fG5FyC6+FiXnHOkn55ys5B7oUM9TU
	 wNSnamick0obcSvJhF96XXEZuoST1AXGIm/ETF3M+aEeXyHZD/Uy94xCWNukoXKrPvaVVSyuR/mSdp
	 KB96525b2afYqAiKmysXETY5dzfEWAwGX0eJNU7vM+m4GXoo64rXvhOnauh357csMR2l9engULsyz3
	 5PXk1+lrLbhu0QL4HC7CtjxC4UA5AqK0Qya1KK4CYFDrDKU3YZgpLD4h/rFGJ9D+9noDpVHH5zdKCH
	 rr1+z6bhES67FvuiiyDFZXKzWF0+L1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1759072648; x=1759677448;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=/Q5hJNgUVt5SsKvfCGB08N5MVmcUGqA0PZ6u8vFRIRA=;
	b=2W7jKc5o1qHQ2HRmyzqFqhAdPo7FUm8FqIPGGW/HvkJ0QqhXxxc9Hji379Sr1nafpwrNl2oS4qsP7
	 wU9ELx/Ag==
X-HalOne-ID: 3c50089e-9c7e-11f0-840e-494313b7f784
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net [2.105.16.150])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 3c50089e-9c7e-11f0-840e-494313b7f784;
	Sun, 28 Sep 2025 15:17:27 +0000 (UTC)
Date: Sun, 28 Sep 2025 17:17:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
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
Subject: Re: [PATCH v1 9/9] dma-mapping: remove unused map_page callback
Message-ID: <20250928151725.GA135708@ravnborg.org>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>

Hi Leon.

On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> After conversion of arch code to use physical address mapping,
> there are no users of .map_page() and .unmap_page() callbacks,
> so let's remove them.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  include/linux/dma-map-ops.h |  7 -------
>  kernel/dma/mapping.c        | 12 ------------
>  kernel/dma/ops_helpers.c    |  8 +-------
>  3 files changed, 1 insertion(+), 26 deletions(-)

It looks like you missed a few sparc32 bits:
mm/iommu.c:
static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
#ifdef CONFIG_SBUS
        .alloc                  = sbus_iommu_alloc,
        .free                   = sbus_iommu_free,
#endif
        .map_page               = sbus_iommu_map_page_gflush,
        .unmap_page             = sbus_iommu_unmap_page,
        .map_sg                 = sbus_iommu_map_sg_gflush,

mm/io-unit.c:
static const struct dma_map_ops iounit_dma_ops = {
#ifdef CONFIG_SBUS
        .alloc                  = iounit_alloc,
        .free                   = iounit_free,
#endif
        .map_page               = iounit_map_page,
        .unmap_page             = iounit_unmap_page,
        .map_sg                 = iounit_map_sg,

I did not compile test, but from a quick look they need to be updated.

	Sam

