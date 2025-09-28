Return-Path: <linux-mips+bounces-11581-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7465EBA7428
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 17:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9E2B18976B2
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 15:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C943821FF23;
	Sun, 28 Sep 2025 15:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o16pSV0P"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4F91EEE6;
	Sun, 28 Sep 2025 15:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759073467; cv=none; b=abKRqb7xS/CXNkqjOOfRyi2Ct5j9i9pMDJND4BYk+Phw2HvWPhN8Qr7KIfTVxHf/IB7BFKuVKVQWxRzICyPwhu+0CgefT9IMc773U73atWM2yjK1R6rXZ2nvkgoctAaaK6R29CbWZcxX0RbOlX3duAj8LwWi4F9JX52oJuoyYUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759073467; c=relaxed/simple;
	bh=lGCIsTrsyWZ8QOPIKq8I5fg/cOuQCrmM7ZcLWOcdn9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOaB3TlAJzTSdB1LfRCqXOm8zL6/IF2NJYSqDJJYP2s59pgVdRkKlEAbT5oNw9ZLVGBLjt6dmxwfu4aC8XqHvJPTeuQM3WpVNixSyWMzayM1U1Y3A/69ylpPxduJR1H4qLLnJh4AOxhN4YySc++Xar5F9HWgMRirr3B2DU2TJwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o16pSV0P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FAEC4CEF5;
	Sun, 28 Sep 2025 15:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759073467;
	bh=lGCIsTrsyWZ8QOPIKq8I5fg/cOuQCrmM7ZcLWOcdn9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o16pSV0PpKM0QT5VYemmYPv3rNvw+gxL11Fj3yidIo2Gut35r6WcPhG9ZUyHgf10N
	 HDoUvAriBjQKKzLaUqSq/NvZQviTbP6Clkx6YJlm8tmGye4n+XchUKfL6k9zPTRZMV
	 TDipWjxyMkDPns3af7oj7M+e1Jre+95S/Gx9tN+Vm4PlrusP/lU9slnofDh6/ZsSSX
	 kT5XAqaDTqgR+UVNQA8g7H75XmRpBDadQzy2MAo6TwB1QXQn4VdvPL1TspAL2PuX9a
	 zblg3faGha9PBO5W1YWwMCeUXrGEmQnur9K8XOOjy19L+pJZmPK1bf0y+sm4i/+kU3
	 fsu9L2JRJahmg==
Date: Sun, 28 Sep 2025 18:31:03 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
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
Message-ID: <20250928153103.GB324804@unreal>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
 <20250928151725.GA135708@ravnborg.org>
 <20250928152030.GA136019@ravnborg.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928152030.GA136019@ravnborg.org>

On Sun, Sep 28, 2025 at 05:20:30PM +0200, Sam Ravnborg wrote:
> Hi Leon.
> 
> On Sun, Sep 28, 2025 at 05:17:25PM +0200, Sam Ravnborg wrote:
> > Hi Leon.
> > 
> > On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > After conversion of arch code to use physical address mapping,
> > > there are no users of .map_page() and .unmap_page() callbacks,
> > > so let's remove them.
> > > 
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > ---
> > >  include/linux/dma-map-ops.h |  7 -------
> > >  kernel/dma/mapping.c        | 12 ------------
> > >  kernel/dma/ops_helpers.c    |  8 +-------
> > >  3 files changed, 1 insertion(+), 26 deletions(-)
> > 
> > It looks like you missed a few sparc32 bits:
> 
> They were included, but the patch is named sparc64,
> which is why I missed it.
> 
> If you could rename the patch that would be nice.

Let's see if new version is required.

Thanks

> 
> 	Sam
> 

