Return-Path: <linux-mips+bounces-12238-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79936C5B51A
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 05:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 25374347758
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 04:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F8824886A;
	Fri, 14 Nov 2025 04:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdpqxCxO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED2E7E0E4;
	Fri, 14 Nov 2025 04:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763094691; cv=none; b=L98p6K8Nesd1dPq2C1MOvOQaXGypAuAE+l9z8Ql7wL05vcHB4Tl83b+A8iMLxfwVpWrfs+p1xpIaseMaCIirEAaNg/Qj3uVQhcY9906CZoSd27C5ENQq2eiTPUyLQRve0f9n+bbTP9cB0WFEm0ac/kjocsdYxdrL9b8gAqhI3+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763094691; c=relaxed/simple;
	bh=uLMghE7ydDQjNwo+3JIijtmU11kVbvrP2zjXCZJb08c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cklWP+2qknCW9JBlAitlYqJ7ZhZVbLrQ8L+4cTkLYHr7rckpXgWauAwy5sQTP4SWJCNaXm+UOkoXaDueLEcA0x9fKLvWhKK69f0efNiDqJ5537qG/OqpeZ6ItxYU0K6zEDIm0cC8BSPNSCwBf/p/azhfk95/dzQIz+J5WkGbge4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdpqxCxO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FCCC116B1;
	Fri, 14 Nov 2025 04:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763094690;
	bh=uLMghE7ydDQjNwo+3JIijtmU11kVbvrP2zjXCZJb08c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdpqxCxOi3xQvATJP2BCYK6hrOnP9R5cYiNjQHQBPz9oSNHH7ro5W0uD4gZ+648jL
	 tj/JiY+prRTx+D1vt7Nz03pusbf3dGGKQ/6fz8PjKc2IFtrPGR8LiFBHwCQAry7Qxw
	 mUlnsbsazRxcrQsUDznTlpORXe/+nncE/B8pCnioxZdSgbJxELm6QrmNLgwF7zE6JN
	 Pxrux4Sfz0nwhoWSODtDr5mAaxx5p3/gYBHabHsDigfml2sd+mb2qnOTPK1knulMUy
	 ZZsk2NqRLRvBZUvbtbYTeA0D2tZvVb31byZFt1gt6cvBxxiIOcPjfEdc4KCJuIPl/q
	 ZHNAlCJu1LZsg==
Date: Thu, 13 Nov 2025 21:31:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>,
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
Subject: Re: [PATCH v2 03/10] kbuild: allow architectures to override
 CC_CAN_LINK
Message-ID: <20251114043122.GC3582402@ax162>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>

On Tue, Oct 14, 2025 at 03:05:18PM +0200, Thomas Weiﬂschuh wrote:
> The generic test for CC_CAN_LINK assumes that all architectures use -m32
> and -m64 to switch between 32-bit and 64-bit compilation. This is overly
> simplistic. Architectures may use other flags (-mabi, -m31, etc.) or may
> also require byte order handling (-mlittle-endian, -EL). Expressing all
> of the different possibilities will be very complicated and brittle.
> Instead allow architectures to supply their own logic which will be
> easy to understand and evolve.
> 
> Both the boolean ARCH_HAS_CC_CAN_LINK and the string ARCH_USERFLAGS need
> to be implemented as kconfig does not allow the reuse of string options.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Modulo Nicolas's existing comment about CONFIG_ARCH_USERPROGS_CFLAGS:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile     | 13 +++++++++++--
>  init/Kconfig |  4 ++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 17cfa11ca7163aa3297101ceb3c9e85f4878f12d..26e5bca534e27034c355939bca4c90db435ecdbd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1134,8 +1134,17 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
>  LDFLAGS_vmlinux	+= --emit-relocs --discard-none
>  endif
>  
> -# Align the bit size of userspace programs with the kernel
> -USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
> +# Align the architecture of userspace programs with the kernel
> +USERFLAGS_FROM_KERNEL := --target=%
> +
> +ifdef CONFIG_ARCH_USERPROGS_CFLAGS
> +KBUILD_USERCFLAGS += $(CONFIG_ARCH_USERFLAGS)
> +KBUILD_USERLDFLAGS += $(CONFIG_ARCH_USERFLAGS)
> +else
> +# If not overridden also inherit the bit size
> +USERFLAGS_FROM_KERNEL += -m32 -m64
> +endif
> +
>  KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  
> diff --git a/init/Kconfig b/init/Kconfig
> index 7b722e714d5c5a0580467914b226dc0700ec0797..4a2ae3cfbf26525a60936d9b29a74ef4319ba3a5 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -82,8 +82,12 @@ config RUSTC_LLVM_VERSION
>  	int
>  	default $(rustc-llvm-version)
>  
> +config ARCH_HAS_CC_CAN_LINK
> +	bool
> +
>  config CC_CAN_LINK
>  	bool
> +	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
>  	default $(cc_can_link_user,$(m64-flag)) if 64BIT
>  	default $(cc_can_link_user,$(m32-flag))
>  
> 
> -- 
> 2.51.0
> 

