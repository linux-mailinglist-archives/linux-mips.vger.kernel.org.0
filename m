Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C976911DE8
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 17:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbfEBPff (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 11:35:35 -0400
Received: from ozlabs.org ([203.11.71.1]:53831 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728963AbfEBPbV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 2 May 2019 11:31:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 44vzkR0Xvsz9sPk;
        Fri,  3 May 2019 01:31:11 +1000 (AEST)
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Richard Kuo <rkuo@codeaurora.org>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Eric Biederman <ebiederm@xmission.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-mm@kvack.org, kexec@lists.infradead.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] memblock: make keeping memblock memory opt-in rather than opt-out
In-Reply-To: <1556102150-32517-1-git-send-email-rppt@linux.ibm.com>
References: <1556102150-32517-1-git-send-email-rppt@linux.ibm.com>
Date:   Fri, 03 May 2019 01:31:10 +1000
Message-ID: <87h8acyitd.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Mike Rapoport <rppt@linux.ibm.com> writes:
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 2d0be82..39877b9 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -143,6 +143,7 @@ config PPC
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARCH_HAS_ZONE_DEVICE		if PPC_BOOK3S_64
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> +	select ARCH_KEEP_MEMBLOCK

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
