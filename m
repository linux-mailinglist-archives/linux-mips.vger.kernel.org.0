Return-Path: <linux-mips+bounces-12236-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DE8C5B4FF
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 05:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 44634345884
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 04:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E715296BD1;
	Fri, 14 Nov 2025 04:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MChFGhE2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C22296BA9;
	Fri, 14 Nov 2025 04:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763094473; cv=none; b=doPgW7jN0n92aEgkcqeLecJOCR/6URe1bMio7cdvjxTWklmhC8wCQAEjxabVC9EOGeQ4c+DUEhsCEasUiNVR8ia0zivJ6HcZG/zbXAex10h3pHef4JZBrFUaevFewvDkhRbyIVnFwWpTdVnBeNe0qGAd3uncW7y8P7duUMvK4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763094473; c=relaxed/simple;
	bh=BElALngLN2nFhaInsP852/aGs6CMGw4etVXE34fZIjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZ6FLhtij9ai7hmlWVt/sdN5Dx6wm7HcEYi1zZVwoEcmDUH5/sjARWiWwt6AsWB+RlUIG7SE70DcAKywxay+VWT22+Bi7KPZIt30oNW2Qq06bpmCbGt5t9+VoMHe2VxR7q/kP3tNWlDq/vk+l6Uu9Xic6UswfvAsHn2oUp4tFn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MChFGhE2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDC3C113D0;
	Fri, 14 Nov 2025 04:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763094471;
	bh=BElALngLN2nFhaInsP852/aGs6CMGw4etVXE34fZIjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MChFGhE2l/mEBBnjKokUFr/WJR+V2WR/BNdIXlxZ7F4DWvd5LlA7WR+SbIsNd6T5p
	 XLohdaztk3jTypiLtJViRiMzBcBEj4n3u61lZ6DVKQTtmI2nc6sPXuyui+8eNcpWNN
	 z60MjTf+BRU/qYwxJnNFL50DT9aK3PSZWE+/UaN4vh2keuunX9DvbkE0d6uIt1rQMB
	 9xtjhrNA3YvSgTCuhcIYETlamknRCv8pQYWFIIS1hLgub5xGEWBnRrHhH8O0ZTPbG/
	 6xQOdNn34QRyl9zXUWZ0wi6BB2LZUX+YSZOVyfuQZfrBYX1Qz6BNc1cHvt3eCmgh/P
	 ND3ELNyp2KMPw==
Date: Thu, 13 Nov 2025 21:27:41 -0700
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
Subject: Re: [PATCH v2 01/10] kbuild: don't enable CC_CAN_LINK if the dummy
 program generates warnings
Message-ID: <20251114042741.GA3582402@ax162>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>

On Tue, Oct 14, 2025 at 03:05:16PM +0200, Thomas Weiﬂschuh wrote:
> It is possible that the kernel toolchain generates warnings when used
> together with the system toolchain. This happens for example when the
> older kernel toolchain does not handle new versions of sframe debug
> information. While these warnings where ignored during the evaluation
> of CC_CAN_LINK, together with CONFIG_WERROR the actual userprog build
> will later fail.
> 
> Example warning:
> 
> .../x86_64-linux/13.2.0/../../../../x86_64-linux/bin/ld:
> error in /lib/../lib64/crt1.o(.sframe); no .sframe will be created
> collect2: error: ld returned 1 exit status
> 
> Make sure that the very simple example program does not generate
> warnings already to avoid breaking the userprog compilations.
> 
> Fixes: ec4a3992bc0b ("kbuild: respect CONFIG_WERROR for linker and assembler")
> Fixes: 3f0ff4cc6ffb ("kbuild: respect CONFIG_WERROR for userprogs")
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

While this makes sense as a way to immediately fix the problem and align
cc-can-link.sh with the other test functions like cc-option and like, it
is rather unfortunate that this particular warning causes an error since
the rest of the userprogs infrastructure does not care about SFrame...
I wonder if there is a way to avoid it since I think this warning does
not point to a fundamental problem.

> ---
>  scripts/cc-can-link.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/cc-can-link.sh b/scripts/cc-can-link.sh
> index 6efcead3198989d2ab2ab6772c72d8bb61c89c4e..e67fd8d7b6841e53341045b28dc5196cc1327cbe 100755
> --- a/scripts/cc-can-link.sh
> +++ b/scripts/cc-can-link.sh
> @@ -1,7 +1,7 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0
>  
> -cat << "END" | $@ -x c - -o /dev/null >/dev/null 2>&1
> +cat << "END" | $@ -Werror -Wl,--fatal-warnings -x c - -o /dev/null >/dev/null 2>&1
>  #include <stdio.h>
>  int main(void)
>  {
> 
> -- 
> 2.51.0
> 

