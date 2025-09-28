Return-Path: <linux-mips+bounces-11567-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 419E2BA702E
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 13:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B23C1898521
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 11:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EFE2DE702;
	Sun, 28 Sep 2025 11:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3I0kHgX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B801B423B;
	Sun, 28 Sep 2025 11:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759060724; cv=none; b=HYanwMMI7CKkx44ebsnMX+p4vUIVMn839imzl0x/IoJkVz56jaCg4EfRHbNGQsYi2oA4cLvgSSznBLOEBf+jAYVsr9UaiS98HSG9RdenIcr3W7pZAp2ILMzS47Sjn2mtPjxj3zXhFFzSMoTmDicvHVrptVeNAA5fd9My+LwHELE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759060724; c=relaxed/simple;
	bh=ckjBiIEK8WR9Yy3qbX0tVHWjgl/Q5LNywAArQuLUpqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4HcHOmeLPbMnXnvVuTG9SIKlZ1KFpkEEWnjuZ/kJXMJFdPfrw1TEpyerhyBl8a5I31uuCHF/FHihFdRULcl3bQXGVJI35eguhMbCKqqf6sGKnhu2AwlgUl7hF5ELlee8ek2h0XLPp6XyaEA7Sv6gtLlE55r/pSZS+2Tu5faisk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3I0kHgX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A70C4CEF0;
	Sun, 28 Sep 2025 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759060724;
	bh=ckjBiIEK8WR9Yy3qbX0tVHWjgl/Q5LNywAArQuLUpqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3I0kHgXcdhzV3J3cNm+QKWfB7QdY/mTy0ouL3HOv+J3sqJIvuS62SQl+z8PL8YWd
	 qfUAdkBs6D1YVhXVJ6bRrI78Xzyj0CsANEvMURlDviJn8dx5FGPrwxmhdVbcvknSpY
	 WdO4NFZz1RZzNrsKib9CkR4lkxgnoFLn75s77V+99fxEfk9i3VsSTBqugUgy80mDqz
	 s7XhyMEqmiXf1xj53ZxtEanbtM7nq83+tdm/Us5QkUfCxJcUjJXNQqj0gYs2gvwuDO
	 7AiJl/EpeN0s5CHrA/1lJBsV9nH+GOe/f6lIQ8rlBPFFhXVhSL5WKAz8toK1YCzvbK
	 VIIytYUCCbdng==
Date: Sun, 28 Sep 2025 14:58:38 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Message-ID: <20250928115838.GF12165@unreal>
References: <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal>
 <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com>
 <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
 <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
 <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com>
 <20250928105413.GE12165@unreal>
 <CA+=Fv5Rnk5RaGU9R_65izNOJOns9w_eEzetH9kBF_MaRgdhLAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+=Fv5Rnk5RaGU9R_65izNOJOns9w_eEzetH9kBF_MaRgdhLAA@mail.gmail.com>

On Sun, Sep 28, 2025 at 01:27:12PM +0200, Magnus Lindholm wrote:
> > Thanks for the effort.
> >
> > Can you please check the following change instead of reverting the patches?
> >
> 
> No problem, happy to assist. I think this did the trick! preliminary
> testing shows
> that this now works on alpha! I guess the offset information in paddr was lost
> by doing "paddr &= PAGE_MASK" before retrieving the offset, well spotted!
> 
> I'll keep running the system with some load to make sure there is nothing else
> we haven't spotted yet, but so far so good. I'll keep you posted.
> 
> Will you be putting out a v2 of this patchset with these updates?

Yes, will try to send today. 

Thanks again for your help.

> 
> Regards
> 
> Magnus Lindholm

