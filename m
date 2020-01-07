Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5058D131D6A
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jan 2020 03:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgAGCFc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Jan 2020 21:05:32 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38625 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727250AbgAGCFc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 6 Jan 2020 21:05:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47sG1K0wb1z9sPK;
        Tue,  7 Jan 2020 13:05:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1578362729;
        bh=pY6TIy9SR4tEyAS0HbPqGRNPZ2UwwqiyR4Kh28zeFFI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Tfyl7hLYmcqDio6TzmoNX4eEpU/VH1XedfybafyjFJyg/jxoC61dMnx7t5GnDfrfJ
         Gr7//aHjlvnqj55C8bvTjCcqWFo+aSO1NPh7AsQPq5aFEIKTLm7yKV6qDAcnALHt8h
         A7VXpu10GywS0S7g2Qj47S6T+C/eV1wQThf24GFD1DUv7X4l/x0a3RumaFeZnoadMp
         qF7E7AAViYFuxl4ze6gkiOSgHcYuV3D520w4SgqTIh/zS3g1JU6Nt9kTdkUmsq7nrn
         jzPazOZziHv4zPXU98iZXPnck+e4y7P+Z84onVCXahK4jbpT70RvV1V6lSPbpikXa9
         V694qnRtkDCZA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Arnd Bergmann <arnd@arndb.de>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Robert Richter <rric@kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        oprofile-list@lists.sf.net, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 02/22] compat: provide compat_ptr() on all architectures
In-Reply-To: <20200102145552.1853992-3-arnd@arndb.de>
References: <20200102145552.1853992-1-arnd@arndb.de> <20200102145552.1853992-3-arnd@arndb.de>
Date:   Tue, 07 Jan 2020 13:05:22 +1100
Message-ID: <87woa410nx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:
> In order to avoid needless #ifdef CONFIG_COMPAT checks,
> move the compat_ptr() definition to linux/compat.h
> where it can be seen by any file regardless of the
> architecture.
>
> Only s390 needs a special definition, this can use the
> self-#define trick we have elsewhere.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/include/asm/compat.h   | 17 -----------------
>  arch/mips/include/asm/compat.h    | 18 ------------------
>  arch/parisc/include/asm/compat.h  | 17 -----------------
>  arch/powerpc/include/asm/compat.h | 17 -----------------
>  arch/powerpc/oprofile/backtrace.c |  2 +-

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

One minor comment:

> diff --git a/include/linux/compat.h b/include/linux/compat.h
> index 68f79d855c3d..11083d84eb23 100644
> --- a/include/linux/compat.h
> +++ b/include/linux/compat.h
> @@ -958,4 +958,22 @@ static inline bool in_compat_syscall(void) { return false; }
>  
>  #endif /* CONFIG_COMPAT */
>  
> +/*
> + * A pointer passed in from user mode. This should not
> + * be used for syscall parameters, just declare them
> + * as pointers because the syscall entry code will have
> + * appropriately converted them already.
> + */
> +#ifndef compat_ptr
> +static inline void __user *compat_ptr(compat_uptr_t uptr)
> +{
> +	return (void __user *)(unsigned long)uptr;
> +}
> +#endif
> +
> +static inline compat_uptr_t ptr_to_compat(void __user *uptr)
> +{
> +	return (u32)(unsigned long)uptr;
> +}

Is there a reason we cast to u32 directly instead of using compat_uptr_t?

cheers
