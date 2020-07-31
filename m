Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E99B2348D1
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 18:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387635AbgGaP6W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 11:58:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:56740 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387491AbgGaP6V (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 31 Jul 2020 11:58:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k1XQH-0000Ng-02; Fri, 31 Jul 2020 17:58:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CFF18C0B3C; Fri, 31 Jul 2020 17:57:27 +0200 (CEST)
Date:   Fri, 31 Jul 2020 17:57:27 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     WANG Xuerui <git@xen0n.name>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Refactor FTLBPar exception handling and add GSExc
 handler
Message-ID: <20200731155727.GC16683@alpha.franken.de>
References: <20200729131417.4000213-1-git@xen0n.name>
 <20200729131417.4000213-2-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729131417.4000213-2-git@xen0n.name>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 29, 2020 at 09:14:14PM +0800, WANG Xuerui wrote:
> It was found that some undocumented unprivileged instructions could
> crash the kernel with a "FTLB parity error" on Loongson-3A4000, but the
> error registers were garbage:
> 
> [  896.970419] FTLB error exception, cp0_ecc=0x00000002:
> [  896.975446] cp0_errorepc == ffffffffffffffff
> [  896.979755] c0_cacheerr == 00000000
> [  896.983277] Decoded c0_cacheerr: primary cache fault in insn reference.
> [  896.989963] Cache error exception:
> [  896.993396] cp0_errorepc == ffffffffffffffff
> [  896.997707] c0_cacheerr == 00000000
> [  897.001228] Decoded c0_cacheerr: primary cache fault in insn reference.
> [  897.007916] Error bits: 
> [  897.010467] IDX: 0x00000000
> [  897.013284] Kernel panic - not syncing: Can't handle the cache error!
> [  897.019807] ---[ end Kernel panic - not syncing: Can't handle the cache error! ]---
> 
> Turns out the FTLBPar exception code is actually implementation-specific.
> On Loongson cores the exception is "GSExc" instead, and is non-fatal in
> Loongson's linux-3.10 fork. So we dynamically register the correct handler
> for the exception, and do not panic on the specific undocumented case.
> 
> P.S. There is not much space left in the cpuinfo_mips.options flag. We
> should consider moving to something like x86's feature flags that is
> extensible.
> 
> v5:
> - Fixed broken build on pre-MIPS32 configs where mfc0 can't have
>   selector, pointed out by Thomas. Build-tested ip22_defconfig.
> - Added more description in the commit message of the 2nd patch
> 
> v4:
> - Added Reviewed-by tags from Huacai
> - Dropped bouncing Cc addresses from the first patch
> - Fixed "MFC0" -> "mfc0" in genex.S, as that CP0 register is 32-bit
>   according to Loongson's manuals
> 
> v3:
> - Simplified declaration of cpu_has_gsexcex, as suggested by Huacai
> 
> v2:
> - Removed stray GSExc logic in cpu_probe_legacy, pointed out by Huacai
> 
> WANG Xuerui (3):
>   MIPS: only register FTLBPar exception handler for supported models
>   MIPS: add definitions for Loongson-specific CP0.Diag1 register
>   MIPS: handle Loongson-specific GSExc exception
> 
>  arch/mips/include/asm/cpu-features.h |  8 ++++++
>  arch/mips/include/asm/cpu.h          |  2 ++
>  arch/mips/include/asm/mipsregs.h     | 11 ++++++++
>  arch/mips/kernel/cpu-probe.c         | 16 ++++++++++++
>  arch/mips/kernel/genex.S             | 14 ++++++++++
>  arch/mips/kernel/traps.c             | 38 +++++++++++++++++++++++++++-
>  6 files changed, 88 insertions(+), 1 deletion(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
