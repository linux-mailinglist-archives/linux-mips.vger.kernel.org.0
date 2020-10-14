Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B626B28E8DC
	for <lists+linux-mips@lfdr.de>; Thu, 15 Oct 2020 00:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgJNWol (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 18:44:41 -0400
Received: from elvis.franken.de ([193.175.24.41]:33853 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727387AbgJNWol (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Oct 2020 18:44:41 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kSpVf-00072R-00; Thu, 15 Oct 2020 00:44:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 263B0C0503; Thu, 15 Oct 2020 00:10:02 +0200 (CEST)
Date:   Thu, 15 Oct 2020 00:10:02 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: DEC: Restore bootmem reservation for firmware
 working memory area
Message-ID: <20201014221002.GA5820@alpha.franken.de>
References: <alpine.LFD.2.21.2010142230090.866917@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2010142230090.866917@eddie.linux-mips.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 14, 2020 at 10:34:56PM +0100, Maciej W. Rozycki wrote:
> Fix a crash on DEC platforms starting with:
> 
> VFS: Mounted root (nfs filesystem) on device 0:11.
> Freeing unused PROM memory: 124k freed
> BUG: Bad page state in process swapper  pfn:00001
> page:(ptrval) refcount:0 mapcount:-128 mapping:00000000 index:0x1 pfn:0x1
> flags: 0x0()
> raw: 00000000 00000100 00000122 00000000 00000001 00000000 ffffff7f 00000000
> page dumped because: nonzero mapcount
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Not tainted 5.9.0-00858-g865c50e1d279 #1
> Stack : 8065dc48 0000000b 8065d2b8 9bc27dcc 80645bfc 9bc259a4 806a1b97 80703124
>         80710000 8064a900 00000001 80099574 806b116c 1000ec00 9bc27d88 806a6f30
>         00000000 00000000 80645bfc 00000000 31232039 80706ba4 2e392e35 8039f348
>         2d383538 00000070 0000000a 35363867 00000000 806c2830 80710000 806b0000
>         80710000 8064a900 00000001 81000000 00000000 00000000 8035af2c 80700000
>         ...
> Call Trace:
> [<8004bc5c>] show_stack+0x34/0x104
> [<8015675c>] bad_page+0xfc/0x128
> [<80157714>] free_pcppages_bulk+0x1f4/0x5dc
> [<801591cc>] free_unref_page+0xc0/0x130
> [<8015cb04>] free_reserved_area+0x144/0x1d8
> [<805abd78>] kernel_init+0x20/0x100
> [<80046070>] ret_from_kernel_thread+0x14/0x1c
> Disabling lock debugging due to kernel taint
> 
> caused by an attempt to free bootmem space that as from commit 
> b93ddc4f9156 ("mips: Reserve memory for the kernel image resources") has 
> not been anymore reserved due to the removal of generic MIPS arch code 
> that used to reserve all the memory from the beginning of RAM up to the 
> kernel load address.
> 
> This memory does need to be reserved on DEC platforms however as it is 
> used by REX firmware as working area, as per the TURBOchannel firmware 
> specification[1]:
> 
> Table 2-2  REX Memory Regions
> -------------------------------------------------------------------------
>         Starting        Ending
> Region  Address         Address         Use
> -------------------------------------------------------------------------
> 0       0xa0000000      0xa000ffff      Restart block, exception vectors,
>                                         REX stack and bss
> 1       0xa0010000      0xa0017fff      Keyboard or tty drivers
> 
> 2       0xa0018000      0xa001f3ff 1)   CRT driver
> 
> 3       0xa0020000      0xa002ffff      boot, cnfg, init and t objects
> 
> 4       0xa0020000      0xa002ffff      64KB scratch space
> -------------------------------------------------------------------------
> 1) Note that the last 3 Kbytes of region 2 are reserved for backward
> compatibility with previous system software.
> -------------------------------------------------------------------------
> 
> (this table uses KSEG2 unmapped virtual addresses, which in the MIPS 
> architecture are offset from physical addresses by a fixed value of 
> 0xa0000000 and therefore the regions referred do correspond to the 
> beginning of the physical address space) and we call into the firmware 
> on several occasions throughout the bootstrap process.  It is believed 
> that pre-REX firmware used with non-TURBOchannel DEC platforms has the 
> same requirements, as hinted by note #1 cited.
> 
> Recreate the discarded reservation then, in DEC platform code, removing 
> the crash.
> 
> References:
> 
> [1] "TURBOchannel Firmware Specification", On-line version,
>     EK-TCAAD-FS-004, Digital Equipment Corporation, January 1993, 
>     Chapter 2 "System Module Firmware", p. 2-5
> 
> Signed-off-by: Maciej W. Rozycki <macro@linux-mips.org>
> Fixes: b93ddc4f9156 ("mips: Reserve memory for the kernel image resources")
> Cc: stable@vger.kernel.org # v5.2+
> ---
> Changes from v1:
> 
> - Fix 2nd argument of the call to `memblock_reserve' (thanks Serge!).
> ---
>  arch/mips/dec/setup.c |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
