Return-Path: <linux-mips+bounces-11624-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6873FBBD05E
	for <lists+linux-mips@lfdr.de>; Mon, 06 Oct 2025 06:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 103624E1FFF
	for <lists+linux-mips@lfdr.de>; Mon,  6 Oct 2025 04:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2111C3C1F;
	Mon,  6 Oct 2025 04:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dx6gZOcR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56AA139E;
	Mon,  6 Oct 2025 04:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759723453; cv=none; b=KyOPWCAtELPi8NV7IlOaAEesdJQ/3HF6uWMhAZh0BK92EGYvRCiIkppHi1fDCOK3N0qU5Xya4TJh1LysI0ulPus/qFIeAcTLSBHJPuTbuiN/65yFxQ7jQHdA0nO+76Yd7pR0RME02eqmFHWqJzYM3P7VpLABvB2o+ys7xqxG62A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759723453; c=relaxed/simple;
	bh=84injLzOLRzdmbDYcF7g7essdb0dt9odOMPRFgL8OhA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Cv5qb6OASYygslA8cn+gdaLEwVd26MjPfzu1jgu9DeiKBQzPvuCwh3m0Pkx0VjXVtCdAnC3h6Qzsg218RZpCtbm7XQlmoJIL+STOvYmYNPjCX7gPJGHmJa45VZQXGRmYOnC63OwLqxoZnKFXHHJYliGzbwabIlvhkL+HR1LG2+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dx6gZOcR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939FAC4CEF5;
	Mon,  6 Oct 2025 04:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759723452;
	bh=84injLzOLRzdmbDYcF7g7essdb0dt9odOMPRFgL8OhA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=dx6gZOcRbqZU+4kUH56naw+qthiBcZkT1qtIonANRtUnPXGgZSzKl9WgCt0SFdIhm
	 UbVwoHC4Vs5XWd+JXXmA7hVHDHHcljPxzABSrPU51Ilo+qPPKD4b50iM60t7KVVjsb
	 SMzmXH2mA9VXny2uTwbYaN5+nstbvZoog7xyFS4WtMcvFaxYJ3i1X4/aK2vr9AVBnQ
	 f0YfFDMNeIIwcHvnhWFJp9a2t2UhTULfUIaQQ+5l6+IR5madltMoqZysTSG0SPagkr
	 ukbTi0OjnBiX86Vpr47x0xqWuIEElCfBCKo/rFvEhZv8rGQQRLNt3XkZDanjZzNwxN
	 maoDHGG6tUMAQ==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6D24EF40066;
	Mon,  6 Oct 2025 00:04:10 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Mon, 06 Oct 2025 00:04:10 -0400
X-ME-Sender: <xms:uj_jaP_ofC9a_l28ntKx_gy42AQmYCP8lb4C2SR10mCLtk9SsRoVMA>
    <xme:uj_jaGgiJzpY8OBGdAHO0Sug4_6m8jP9b99pQfrT4W6TnMBKVOLM7R8GEtxUIBrad
    -kpFskrRXUFhspIfBqdrOdo09KkfLKr2F4CPRVd9JM75FUTPegu8VYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelieehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnvghonhcu
    tfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeejvefflefgledvgfevvdetleehhfdvffehgeffkeevleeiveefjeetieel
    ueeuvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hlvghonhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvfedtheefleek
    gedqvdejjeeljeejvdekqdhlvghonheppehkvghrnhgvlhdrohhrgheslhgvohhnrdhnuh
    dpnhgspghrtghpthhtohepfedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegs
    phesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfh
    hrrghnkhgvnhdruggvpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgv
    thdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhope
    grnhgurhgvrghssehgrghishhlvghrrdgtohhmpdhrtghpthhtoheplhhinhhmrghgjees
    ghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilhdrtghomh
    dprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpdhrtghpthhtohepjhgrmhgvshdr
    sghothhtohhmlhgvhieshhgrnhhsvghnphgrrhhtnhgvrhhshhhiphdrtghomh
X-ME-Proxy: <xmx:uj_jaLVfDv-gcu_8eG8KMmCcu_lqD-hKSTkIpQVlhGsqYjX-BjSkAg>
    <xmx:uj_jaB0W371EPdKaI_VHwQcrPhlDBdzMVGXgBoeat-lOPO7F0-eoBA>
    <xmx:uj_jaEj5JbL-yJ3t6Tejadmxf5_fK5DIiQgEqWTLJ9rYb1M0S8qU4w>
    <xmx:uj_jaJIeYEGT-skfES59I8zK2h3dLuh_CCWKnOpBJzKNKgbBNwzpFQ>
    <xmx:uj_jaFVMUbmcoU_NyQKMtnVnad6DjfKDRYBqvXnd_1VVAyrxFpX1Mb4b>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 14BDB2CE0072; Mon,  6 Oct 2025 00:04:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AYer2uYmcW7k
Date: Mon, 06 Oct 2025 07:03:49 +0300
From: "Leon Romanovsky" <leon@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "David Miller" <davem@davemloft.net>,
 "Geoff Levand" <geoff@infradead.org>, "Helge Deller" <deller@gmx.de>,
 "Ingo Molnar" <mingo@redhat.com>, iommu@lists.linux.dev,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Jason Wang" <jasowang@redhat.com>, "Juergen Gross" <jgross@suse.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Matt Turner" <mattst88@gmail.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 sparclinux@vger.kernel.org,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>, virtualization@lists.linux.dev,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 "Magnus Lindholm" <linmag7@gmail.com>
Message-Id: <d8c1e548-ebc5-4a07-8bf5-d98e9f2e6587@app.fastmail.com>
In-Reply-To: <20251005233133.GL3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
 <20251003150144.GC3360665@nvidia.com> <20251005132259.GA21221@unreal>
 <20251005233133.GL3360665@nvidia.com>
Subject: Re: [PATCH v1 3/9] parisc: Convert DMA map_page to map_phys interface
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, Oct 6, 2025, at 02:31, Jason Gunthorpe wrote:
> On Sun, Oct 05, 2025 at 04:22:59PM +0300, Leon Romanovsky wrote:
>> @@ -582,7 +582,7 @@ ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
>>         ** Grab virtual index [0:11]
>>         ** Deposit virt_idx bits into I/O PDIR word
>>         */
>> -       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (vba));
>> +       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (pba));
>
> Don't know how I missed this, but this is the virtual address for the
> cache invalidate James mentioned
>
> So the optimal is to drop the lpa() and to use phys_to_virt() to get
> vba for this instruction.

The optimal is to keep parisc arch code as I did in v1 and don't change it too much.

>
> Jason

