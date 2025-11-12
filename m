Return-Path: <linux-mips+bounces-12212-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7D0C545BE
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 21:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E2CA3A64DE
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 20:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1002C0F91;
	Wed, 12 Nov 2025 20:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRShmlGO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938592C0F65;
	Wed, 12 Nov 2025 20:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762977824; cv=none; b=cszlBlelrQdwqBmc0hxg4nMPyUh33AZbnECtStfYnMS8EkUO92dbrcV3rEQqJPQTvBY83W/pAfV5/WJ+CRTLHk1gQAJ3ZiHxgBwAzeai2HZIdvfFKyEWKABrUl9ATV7F9kf/P2QcEQF9uAQ5sEhQkhRPCq1wuXlkE2+ST0giUrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762977824; c=relaxed/simple;
	bh=5XGz0hlFo8UZGbHju91BH5eFiKMsQoRSZ/aU1mUCqXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VszN/zVk0TGe+G0+XqNzdG1A/XpiuIWMmHtXtSBJ1HguqfnIY4K85dkUDEcq74If+jQpDoQ/qFxvMynwgBA8XovJIU5Z6Sn/e8PneOSA8T1o6aTzUPXAEiLl2vuYoJT00HuCa3ZZSLzrnIicrq5aruxbX3jduEma07/Fht/c1DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRShmlGO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2030C4CEF7;
	Wed, 12 Nov 2025 20:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977824;
	bh=5XGz0hlFo8UZGbHju91BH5eFiKMsQoRSZ/aU1mUCqXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRShmlGO4OOUEpCIywZ0LyFsNqkWdpHeqkdZ0lgEtfkK82ZFTvPZdRcg6RsBEyHHW
	 EG3blHG/DfGSKdXv+Nh8IFDvUtYTfeOU5dErfiBACZ4MhVabQi+OVv6txDptfOuJX+
	 JHc/fPobgnIOiau5sP0QWHnUIdTQEuUTP97QT/Pmutyjeileznh2IkyNofbsAJxpOK
	 kX9dy3TTJQnavtmWNj70vAwe4KUExZ+gGnm/rMIBIglSfCIlNYXzymsGsLiOhvhhdt
	 Xt/bqmAzZX4ehH4QviVQCXhxU5JFWzhEVtskSohomDNdd7rgIG+zmBCafEUAdBzBCd
	 vfAb2Btlz1Q1Q==
Date: Wed, 12 Nov 2025 20:56:12 +0100
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
Subject: Re: [PATCH v2 03/10] kbuild: allow architectures to override
 CC_CAN_LINK
Message-ID: <aRTmXJVXlbkF2rI4@derry.ads.avm.de>
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

Is this some left-over from a previous version?

s/CONFIG_ARCH_USERPROGS_CFLAGS/CONFIG_ARCH_USERFLAGS/

Kind regards,
Nicolas

