Return-Path: <linux-mips+bounces-11893-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E2AC0A427
	for <lists+linux-mips@lfdr.de>; Sun, 26 Oct 2025 08:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 867BF3AA7C1
	for <lists+linux-mips@lfdr.de>; Sun, 26 Oct 2025 07:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B2625B2FA;
	Sun, 26 Oct 2025 07:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+Fmvy/T"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044A118DF9D;
	Sun, 26 Oct 2025 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761464314; cv=none; b=CJkObRie3z4ysHH/9PJt5Wf9qNe6r2CWDHECjKCblqvLBZoFUkEFBwH0+7oSiQgnzov+TZnUPKpNxQosyVxJN7uW4Vn4pK/09ndQCsb8tFcGdKejXmebGDNs8zZKdEckfujmQufNbE6zDMcfgZmtCV/CsYNwjsN5wGKJxuPFtvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761464314; c=relaxed/simple;
	bh=tE6duDWkMhf/izPfcVJAu0QGF5RniuWMZJNurHMPV4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pvjo59lmC7L3AhzoknXbtAwzHpgg02LaZ5Bws7X3EvFzR+3dy0wpTEQcxibNokSGx0NoqqRDtjL+SK9+jYrkO2GMhZpKcFnJf5lRNItgfh0UC7CM5Goc+1xPlGkqngL6+SbIrIJQR5bA2+3I7PiEDytX+AEAIuTTC3JyRj4ZSNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+Fmvy/T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEC0C4CEE7;
	Sun, 26 Oct 2025 07:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761464312;
	bh=tE6duDWkMhf/izPfcVJAu0QGF5RniuWMZJNurHMPV4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+Fmvy/TkbKsHE/ly3nNuV5cMvplX6wPfLQ8hDaDmyX3wLacnUE7JOG/nZvuUxvmv
	 CczVISfw5M2fl/jL4dxMpQZjR+1heTwgUYiFF7wTs743d7UeCv0GILFXzjGlxgVBC0
	 oE76qdMbU/6QmYSolZLhh/1ehXnuAH4Wfx1TxENucSoXAohh6TFciSEQZaKMP7NYm1
	 JNqz8+TYhassoC4ST69Mi5FA0Qr+hRmr+2UhbjR5EKFyOegX19oAs4ZZ/0v57u0VQ0
	 /l9R6yk8RlGVj+rmA/30TcaUiEVUwLELSxYEgJrK1wn3ZV8WITcnHNlOkzodvgsSHW
	 uuxeQvWuJFb7A==
Date: Sun, 26 Oct 2025 09:38:28 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v5 00/14] Remove DMA map_page/map_resource and their
 unmap callbacks
Message-ID: <20251026073828.GC12554@unreal>
References: <CGME20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d@eucas1p2.samsung.com>
 <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <4a47088d-6542-45f2-917b-c91f7dd1eb1a@samsung.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a47088d-6542-45f2-917b-c91f7dd1eb1a@samsung.com>

On Mon, Oct 20, 2025 at 06:27:32PM +0200, Marek Szyprowski wrote:
> Dear All,
> 
> On 15.10.2025 11:12, Leon Romanovsky wrote:
> > This series is a combination of previous two steps [1, 2] to reduce
> > number of accesses to struct page in the code "below" DMA layer.
> >
> > In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
> > callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.
> 
> I would like to have some acks from respective arch maintainers before 
> applying this patchset.

If to judge by git log and lore for some of these arch (didn't check all),
you won't get any response and will need to make a call by yourself.

Thanks

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

