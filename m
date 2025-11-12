Return-Path: <linux-mips+bounces-12214-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6BFC5458E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 21:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 38C7334527F
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 20:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3302D0C99;
	Wed, 12 Nov 2025 20:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/ZMvnzn"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266052D0610;
	Wed, 12 Nov 2025 20:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762977831; cv=none; b=CWXf95NeFKtesymo4keo/bdB2YxJ5WTLBZ1C3dbC7JhfAIu1NrV9p64PkbDYBznk6q7Yzxg3Am6PDmZu4hC5zNkUEP4AeGJYT7OS/Vg3rn5uqs6OvNQ8tIN/tHyeG6hOtvqIHrCxpxXRm839aPOfFnJmWCWW+eQJROuQwNqi80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762977831; c=relaxed/simple;
	bh=nUO9ROu0gW7/ns/uQ28gcX3yc+GW0w13a9/X2aAT8jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ves+Y/oskLKuhBUbh7SFqv3Q1+FoSCUzhUoaRXbwiFOpxZjl9A0uzHLotbrxpd5AzFAQGqEu9cLKXD1jxJ8+K42uKyUrAeuUrE6FU4jGD9Sf3PZTyvqmDeWlME0iy/0yT47EI3gSJtX87/IEwa/NlcX+L6u6rjzsFBL1F6DvzB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/ZMvnzn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5E0C19422;
	Wed, 12 Nov 2025 20:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977830;
	bh=nUO9ROu0gW7/ns/uQ28gcX3yc+GW0w13a9/X2aAT8jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/ZMvnzn2CADtOmnEK8oxSBL8h+W0p5Nn5UpsvsKruwJSHxVcUeR4XM3Xql0nKdus
	 bSqKhs+uMkYIkIZuUXwM0okWDFlbTc1b3GFwaLc0i8MS0mArq4SZjPqyfw0pTxylrb
	 kDcACs6NyCZrwCjMXmWAun5aPbx2tyCNun6nsiYlfBKzyIIndQtIzMFJnjIFqLp5W7
	 U7cJIK3dUA8BdBGXaq6srPbi1okyViOeP9mxuL9ACCcf5VmurrX4ECVYI2S9Yt8Co2
	 wGu2c5Zt7YjzPlTh1Ym0osiGu8n7TbyhwjUGx6vHaiztJkPuyn821csRFMNgYBEt1M
	 bcQaFk/gjrsng==
Date: Wed, 12 Nov 2025 21:03:23 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
Message-ID: <aRToC77bNUy2sKAK@derry.ads.avm.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>

On Tue, Oct 14, 2025 at 03:05:15PM +0200, Thomas Weiﬂschuh wrote:
> The current logic to inherit -m32/-m64 from the kernel build only works
> for a few architectures. It does not handle byte order differences,
> architectures using different compiler flags or different kinds of ABIs.
> 
> Introduce a per-architecture override mechanism to set CC_CAN_LINK and
> the flags used for userprogs.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Rebase and drop already applied patch
> - Disable CC_CAN_LINK if the test program generates warnings
> - Move to architecture-specific logic
> - Link to v1: https://lore.kernel.org/r/20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de
> 
> ---
> Thomas Weiﬂschuh (10):
>       kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings
>       init: deduplicate cc-can-link.sh invocations
>       kbuild: allow architectures to override CC_CAN_LINK
>       riscv: Implement custom CC_CAN_LINK
>       s390: Implement custom CC_CAN_LINK
>       powerpc: Implement custom CC_CAN_LINK
>       MIPS: Implement custom CC_CAN_LINK
>       x86/Kconfig: Implement custom CC_CAN_LINK
>       sparc: Implement custom CC_CAN_LINK
>       kbuild: simplify CC_CAN_LINK
> 
>  Makefile                |  8 ++++++--
>  arch/mips/Kconfig       | 15 +++++++++++++++
>  arch/powerpc/Kconfig    | 15 +++++++++++++++
>  arch/riscv/Kconfig      | 11 +++++++++++
>  arch/s390/Kconfig       | 11 +++++++++++
>  arch/sparc/Kconfig      | 11 +++++++++++
>  arch/x86/Kconfig        | 11 +++++++++++
>  init/Kconfig            |  7 +++++--
>  scripts/Kconfig.include |  3 +++
>  scripts/cc-can-link.sh  |  2 +-
>  10 files changed, 89 insertions(+), 5 deletions(-)
> ---
> base-commit: 10f8210c7a7098897fcee5ca70236167b39eb797
> change-id: 20250813-kbuild-userprogs-bits-03c117da4d50
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 

Thanks for the patch set and all the work behind!  I found only one
issue in patch 3, the rest looks good to me as they are.

I haven't reviewed the compiler flags for the archs, but from the formal
point of view they look good to me, too.

How shall we proceed with here?  I think, easiest would be if we get
appropriate acks from the architecture maintainers, so we could take
this via kbuild.

Other opinions?

Kind regards,
Nicolas

