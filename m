Return-Path: <linux-mips+bounces-11579-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDF4BA73DD
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 17:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDE563ABD65
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 15:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716D3221294;
	Sun, 28 Sep 2025 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="CtT4iU2T";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="J0+KaShs"
X-Original-To: linux-mips@vger.kernel.org
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9B21A3164
	for <linux-mips@vger.kernel.org>; Sun, 28 Sep 2025 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759072836; cv=none; b=jBYlYo2VmwHhO5Egb6Xle0ONj0Muom4j8W/jRloQRs0+azUREotmGDBoTXaJM/Bzv1Qe/qUfqlsmDW+oFwMZcsrpOfZK0g0aB6P32fpS5b2cALYDwb6TgC77bkqqFVSSxsBgj+aLOwR4MhwZete9GL3GUYxrajdjCheuk66HOK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759072836; c=relaxed/simple;
	bh=nlgAinLCqYMESm7W18m91+Ld53eoJMfCRrOPc4ga7/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uw8QVOprkcK2bw3bd68Cy6QWAiTZeGBQMRDX8AF8LbG8ndJVcIOx8Jps8q/5B8wsshidSdVednRYSwWiUExUAiYwuAgrOq5N0etnXI+51jSWoLlm7j+CVVBEIJXakE5BiRiHG6pXQSStRYqEpPtkBQ7ygi1IvjP+FnpsejeSAlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=CtT4iU2T; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=J0+KaShs; arc=none smtp.client-ip=46.30.211.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ravnborg.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1759072832; x=1759677632;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Ghyryt2xK5vvnvf4Q2js9Uw55oy6LtaOfQDvQKr1uy0=;
	b=CtT4iU2T9YA3xTrD4cIA+BE+C15rUkNnZplc587YI58g+wt9Z/k8mKxjom62woRw7fEUsvfTw8Ego
	 OORUvh9fiJQumZdtSymONvY5MMtJ3KJXP3zsnj3KxJxk4Oiw+38jzutzIsRmg9a15NqXsODmCWj0BM
	 /EaEWRy/uNU7FXsutNnhv+ixhqzFL2HZhBJwBMscK6dVEUiiXxvphkGrAHhj1qC784KABlOh0D02mA
	 4cLaxB8a5GgAT75FDK3kfCkRHDAAi479jPbM5IFPQLlR8lLKW/rv/Z+yeGIJUaeXNjpvPYpXFP9UyV
	 lTS7L9y3fNmnKV3eKZ72pOl8CYKOBDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1759072832; x=1759677632;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Ghyryt2xK5vvnvf4Q2js9Uw55oy6LtaOfQDvQKr1uy0=;
	b=J0+KaShsfwnmVbs3PB0EalU1KScQKZ0oCMj0q/S47VSr8rYDdT1FCDrtDwmZlUzToU5sipbu8KD09
	 RgZbdwtBQ==
X-HalOne-ID: ab2e7cf9-9c7e-11f0-845a-494313b7f784
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net [2.105.16.150])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id ab2e7cf9-9c7e-11f0-845a-494313b7f784;
	Sun, 28 Sep 2025 15:20:31 +0000 (UTC)
Date: Sun, 28 Sep 2025 17:20:30 +0200
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
Message-ID: <20250928152030.GA136019@ravnborg.org>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
 <20250928151725.GA135708@ravnborg.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928151725.GA135708@ravnborg.org>

Hi Leon.

On Sun, Sep 28, 2025 at 05:17:25PM +0200, Sam Ravnborg wrote:
> Hi Leon.
> 
> On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > After conversion of arch code to use physical address mapping,
> > there are no users of .map_page() and .unmap_page() callbacks,
> > so let's remove them.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  include/linux/dma-map-ops.h |  7 -------
> >  kernel/dma/mapping.c        | 12 ------------
> >  kernel/dma/ops_helpers.c    |  8 +-------
> >  3 files changed, 1 insertion(+), 26 deletions(-)
> 
> It looks like you missed a few sparc32 bits:

They were included, but the patch is named sparc64,
which is why I missed it.

If you could rename the patch that would be nice.

	Sam

