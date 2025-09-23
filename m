Return-Path: <linux-mips+bounces-11545-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3730CB96FB6
	for <lists+linux-mips@lfdr.de>; Tue, 23 Sep 2025 19:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E0A418A64B3
	for <lists+linux-mips@lfdr.de>; Tue, 23 Sep 2025 17:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5CE27A44A;
	Tue, 23 Sep 2025 17:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5Jqi9yu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E6BE5E;
	Tue, 23 Sep 2025 17:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758647903; cv=none; b=GepWLqRIOiy4pfD252FPIfhUZpylCtHadQYQHb0PEEb70Hd+UzpX15O640rC076KURcMxnXIH7bivrPbRxUyX+QrbP5l7bWHkBJPnrtgQivA2Qtd2R0bDBbLNAM4WehG+1YRhstMzcAj6lW14wqJ0lI7oy39nB6sOFMyGXVpdcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758647903; c=relaxed/simple;
	bh=1ANX/1Q+c1YQm6ycMdbCkLhJt5M0dGUVsHIE7DPPmR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLP4+x3ozS2iaSJimCFmxQilZMCS5nzB3JAO/wePOS5MdtQQeAbjsNPiJ1piQJ32YeUeGIsgPA7STfTYVqbIMXLfD1lS0LzEewjgkfKaUjQuTONs2tSBTmKMmIvGU1ioMR8/jclhBG7e8tzpFY9bR9egzaSqesWPyP+cW60sqVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5Jqi9yu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76194C4CEF5;
	Tue, 23 Sep 2025 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758647903;
	bh=1ANX/1Q+c1YQm6ycMdbCkLhJt5M0dGUVsHIE7DPPmR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5Jqi9yueMAnnH73toGC0xOJKxvg0qa4gga/SeRhYNDlfhLJMDwAYoyYF5OeZMllT
	 4wGYFwIT9tNhvxI7Fwmxeam4DFzzKoOpEvYF6KzT3sugNB9IZN5QFtnFbWNJKdyahQ
	 njhRkpS4V2fDEMCIbaKPb5Fvro/sH2PrgzN3QArdRquI6/hD8MqkvT+BpL3TaOekdf
	 ivzyZBCGcNieZxwvItwvCdr8sC9432gSLRdJ+Qt9NVztv9FJs9EoyOLvflbrcT7TLo
	 fCDKOXnJOo3pz8pFrFpZX02l/lSsNuJ1YSx2nfsXC1cIkAfhePf3pibh9dO8eHGKV8
	 GZaMzjVv7a/9Q==
Date: Tue, 23 Sep 2025 20:18:19 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
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
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical
 address
Message-ID: <20250923171819.GM10800@unreal>
References: <cover.1758219786.git.leon@kernel.org>
 <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>

On Mon, Sep 22, 2025 at 11:04:06PM +0200, Magnus Lindholm wrote:
> On Thu, Sep 18, 2025 at 8:45 PM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > From: Leon Romanovsky <leonro@nvidia.com>
> >
> > Alpha doesn't need struct *page and can perform mapping based on
> > physical addresses. So convert it to implement new .map_phys callback.
> 
> 
> Hi,
> 
> SInce this patch affects the Alpha platform I got curious and decided to
> try it out. The patch series requires some preparatory patches. Leon
> provided me with links to his dmabuf-vfio branch, which had the
> patches (and some prerequisite stuff) applied already.
> 
> Based on the dmabuf-vfio branch,  I've built a kernel and tested it on
> my ES40 Alphaserver, the kernel booted fine but after a while of
> moderate filesystem load I started seeing some ext3/4 related error
> messages in the system logs. Rebooting with my old kernel into
> single user mode, I was able to recover the filesystem using fsck.
> Clearly this set of patches breaks things (at least on Alpha).

I will try to setup Alpha architecture in QEMU in following days, but
would like to ask first. Did you test alpha on clean v6.17-rc5 (without
my patches) as a reference?

Thanks

