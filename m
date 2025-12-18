Return-Path: <linux-mips+bounces-12512-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD472CCAFEA
	for <lists+linux-mips@lfdr.de>; Thu, 18 Dec 2025 09:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3D093091921
	for <lists+linux-mips@lfdr.de>; Thu, 18 Dec 2025 08:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9A52DE1E0;
	Thu, 18 Dec 2025 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rmVVJePJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0A4264609;
	Thu, 18 Dec 2025 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766047210; cv=none; b=YoRgI7Z/PXtjQDBXHxc2xkGfC+Z+TueGnghR1BlPvvVtjW3fhUK7T9sEanTUiONLt6jn3edI9TBsWSCdJJIXDWW5BTi5B6Tcyt4hoD4TjdriBsz4TLIgfOZv34a7/c2D6qNLoo5wFaAS6uDzavuxO3iuXx2tbI0xzveNcqNpKig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766047210; c=relaxed/simple;
	bh=ofPz3WZxF0qhrxc5N6KO0WklVZWUMGP/4at4uzuCx5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptjLLpUFItEk+xK0npCML0hbiOPkJTJufL9lNjFq8ysJyVwlXnJlEflBtKEXz7X61eSbHxxC+ghWrCTB2q1qf3YcoRW2cKnOzPbap2WD4HSFlOHxz+JcZWU2xVfo8gUkeZRyMKJU2Ml6OfQLEIxwMk/VUYlDwXCc5eSDW524k2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rmVVJePJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4B5C4CEFB;
	Thu, 18 Dec 2025 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766047207;
	bh=ofPz3WZxF0qhrxc5N6KO0WklVZWUMGP/4at4uzuCx5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmVVJePJGXR+kQkm3+r1Kbt0GyikF3QfUnymI7CCZrHKsRgARfO2o2ba2kB+bpPCT
	 UHrvTWZoxuQAIRQXxc9I5NeoAcCrZBmmcrAlJnug5BaQTQvVwVqvaJjDuY33ZMzoy6
	 BAr6jLOIpi2I8WC82e6kp81I8nrCa8WqCHQlSBTqZwv7g1LhXawg+JG4WGZSyz9t7l
	 lUOt/NCn0KCw0dStvCGVQTawL+HWAy5Lrwn0Gx39IwmYRZLbytZdLLUDYSPzigtubq
	 ZxR25apmkkEWekeoA8W1U6GFN06j4Og1ARDAkIDWxQbraNlGOfxULa77Gl1qMs8cke
	 OZqPmHVBTqbAw==
Date: Thu, 18 Dec 2025 10:40:02 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
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
	Jason Gunthorpe <jgg@ziepe.ca>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v5 09/14] parisc: Convert DMA map_page to map_phys
 interface [qemu test failure]
Message-ID: <20251218084002.GD39046@unreal>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
 <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>

On Wed, Dec 17, 2025 at 04:17:38AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Wed, Oct 15, 2025 at 12:12:55PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Perform mechanical conversion from .map_page to .map_phys callback.
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> 
> This patch causes all my 32-bit parisc qemu tests with C3700 machine
> to fail. Network interface tests fail, and all boot attempts from
> any kind of hard drive (scsi, usb) fail with this patch in the tree.

Thanks for the report. I have a fix ready; I'll clean it up and send it out
by EOD.

> 
> Guenter

