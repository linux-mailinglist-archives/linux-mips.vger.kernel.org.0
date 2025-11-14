Return-Path: <linux-mips+bounces-12237-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B26C5B4F3
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 05:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 66F784E91F0
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 04:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F4F29D266;
	Fri, 14 Nov 2025 04:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5ruQ2Mt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D66F296159;
	Fri, 14 Nov 2025 04:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763094546; cv=none; b=NsmTyPNttGrdGeySMsXZ7NzDvlcHIVlFF5HaAgDfvKxEHDEQKgJ0t+zyG4+MziOs3meTQtnNbIg4/jqg/jguVk8ljphHliDMyyWM+wYyqYFy1MEVGkDtwRWMShk+Z2WxuccCr9/PQh3Rx6ogoTDa0oPSAL5RhV94fGLKWbv5Urs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763094546; c=relaxed/simple;
	bh=pNnQKFMOXRv/8psHWwl6fS+z0lU+MW1Zt3XGUGS81hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWdYnxB/MStjjbgznm/vkyWMjnxCCe+YeY2nWiPRY03dEgH8s4Gouiw9wxMqxzEpxN4ft1Nup9eHWFlDL3uJbr0m/qhY+1uspJ6WDd6EG3Z0pm/MMYAHJjMSmu6GRMcMAemSpep+Ynx3e4biEeLqyO6EYckAg7NzKlp00X8Crl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5ruQ2Mt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3C0C16AAE;
	Fri, 14 Nov 2025 04:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763094545;
	bh=pNnQKFMOXRv/8psHWwl6fS+z0lU+MW1Zt3XGUGS81hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5ruQ2MtWCS6I6U+6vV1Z+0TCZU6f+9X82zJurev+eP9mNn3Gh1vAhiv0QiwoIgDg
	 zObjRFsSETG+fc2lcJT/61HwvIHiOgslQGjxQspUtVRm6JBsrvcGQBfsAjVpoHgTeV
	 kipy8eHjNGe6zaKCO7/sCwj9xEVqvu9C3WlQlKiE25AwY5zeCaucNEuQCeBqHUy+Jy
	 k6/FaVMxodHyCWO6HT7dwztd6e/5oJfmcPp5qfHfrsWJ4si05H1uZfaFCbzoAJG3TI
	 f7WRio/5YJEIzHBD6QhspVqEWtVVeKZBGJrXqqIXnyJO2sQoHHj+9LuPyZ95opyZTl
	 p9xMfxseUX/8Q==
Date: Thu, 13 Nov 2025 21:28:56 -0700
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
Subject: Re: [PATCH v2 02/10] init: deduplicate cc-can-link.sh invocations
Message-ID: <20251114042856.GB3582402@ax162>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-2-faeec46e887a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-2-faeec46e887a@linutronix.de>

On Tue, Oct 14, 2025 at 03:05:17PM +0200, Thomas Weiﬂschuh wrote:
> The command to invoke scripts/cc-can-link.sh is very long and new usages
> are about to be added.
> 
> Add a helper variable to make the code easier to read and maintain.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  init/Kconfig            | 4 ++--
>  scripts/Kconfig.include | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index cab3ad28ca49e7ac930207c9cde8d431d55dc7af..7b722e714d5c5a0580467914b226dc0700ec0797 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -84,8 +84,8 @@ config RUSTC_LLVM_VERSION
>  
>  config CC_CAN_LINK
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag))
> +	default $(cc_can_link_user,$(m64-flag)) if 64BIT
> +	default $(cc_can_link_user,$(m32-flag))
>  
>  # Fixed in GCC 14, 13.3, 12.4 and 11.5
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 33193ca6e8030e659d6b321acaea1acd42c387a4..d42042b6c9e243b46d1626d892c0c986621ce462 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -65,6 +65,9 @@ cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$
>  m32-flag := $(cc-option-bit,-m32)
>  m64-flag := $(cc-option-bit,-m64)
>  
> +# Test whether the compiler can link userspace applications
> +cc_can_link_user = $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(1))
> +
>  rustc-version := $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
>  rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
>  
> 
> -- 
> 2.51.0
> 

