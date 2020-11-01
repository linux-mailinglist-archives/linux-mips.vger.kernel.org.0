Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDE52A1D91
	for <lists+linux-mips@lfdr.de>; Sun,  1 Nov 2020 12:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgKALSr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Nov 2020 06:18:47 -0500
Received: from [78.8.192.131] ([78.8.192.131]:11785 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726282AbgKALSq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 1 Nov 2020 06:18:46 -0500
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Nov 2020 06:18:46 EST
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
        by orcam.me.uk (Postfix) with ESMTPS id C974D2BE086;
        Sun,  1 Nov 2020 11:12:40 +0000 (GMT)
Date:   Sun, 1 Nov 2020 11:12:36 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
cc:     linux-mips@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [BUG] Crash during futex initialization with gcc 10
In-Reply-To: <878sbqd4fp.fsf@BL-laptop>
Message-ID: <alpine.LFD.2.21.2011010925230.3100725@eddie.linux-mips.org>
References: <878sbqd4fp.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 28 Oct 2020, Gregory CLEMENT wrote:

> I saw a regression when building a MIPS kernel with gcc 10:
> 
> futex hash table entries: 256 (order: 3, 32768 bytes, linear)
> CPU 0 Unable to handle kernel paging request at virtual address 00000000, epc == 801be4f0, ra == 80993778
> Oops[#1]:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc8-00006-g6185221cb805 #3
> $ 0   : 00000000 00000001 00000000 00000000
> $ 4   : 87831e28 00000000 00000000 00000000
> $ 8   : 8782c000 87888000 00000100 00000051
> $12   : 09dcd4c5 87831c69 00000000 00000010
> $16   : 80960000 00000001 80960000 8095bc90
> $20   : 809d0000 809b3fc4 80987094 00000002
> $24   : 00000000 00000000
> $28   : 87830000 87831df8 809b3fe4 80993778
> Hi    : 00000010
> Lo    : 8a3d70e6
> epc   : 801be4f0 cmpxchg_futex_value_locked+0x2c/0x78
> ra    : 80993778 futex_init+0xb4/0x124
> Status: 11008403 KERNEL EXL IE
> Cause : 00800008 (ExcCode 02)
> BadVA : 00000000
> PrId  : 02019654 (MIPS 24KEc)
> Modules linked in:
> Process swapper/0 (pid: 1, threadinfo=(ptrval), task=(ptrval), tls=00000000)
> Stack : ffe4d6e0 001b291f 80963e60 80964fe0 00000000 87831e24 00000000 00000100
>         00000100 80a00000 00000000 00000008 809b3fe4 0a27934f 87878880 809936c4
>         87878880 80960000 00000000 80100120 00000000 00000000 00000000 87831e54
>         87831e54 87878895 8094cecc 80900000 00000000 00000001 80960000 00000001
>         809629c4 80908380 808ff7ec 80900000 0000007f 87878895 00000000 0a27934f
>         ...
> Call Trace:
> [<801be4f0>] cmpxchg_futex_value_locked+0x2c/0x78
> Code: 1440000f  00000000  0000000f <c0a30000> 14660005  00000000  00e00825  e0a10000  1020fff9
> 
> ---[ end trace e34236d22d7ecc0e ]---
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> 
> 
> If I use gcc 9.3 or if I disable the futex in the kernel configuration
> there is no crash anymore.
> 
> The crash occurs after that the pagefault was disabled and yet we see a
> page fault. The exact part where it occurs is here:
> https://elixir.bootlin.com/linux/latest/source/arch/mips/include/asm/futex.h#L167
> 
> But it is too much MIPS assembly for me !

 I doubt there is anything wrong with the assembly snippet.  There's a 
missing clobber for "$1", but it has always been a fixed register, so GCC 
won't allocate it anyway.

> Does someone has an idea to fix it ?

 Well, the instruction that trapped is:

	c0a30000 	ll	v1,0(a1)

and the problem is a null pointer passed in $a1, so clearly the issue is 
in the caller.

 We have this:

	if (cmpxchg_futex_value_locked(&curval, NULL, 0, 0) == -EFAULT)
		futex_cmpxchg_enabled = 1;

in `futex_detect_cmpxchg', and then there is this arrangement:

	pagefault_disable();
	ret = futex_atomic_cmpxchg_inatomic(curval, uaddr, uval, newval);
	pagefault_enable();

in `cmpxchg_futex_value_locked', so I'd check what `pagefault_disable' is
supposed to do and why it does not with GCC 10.

 NB I haven't seen the issue with:

Linux version 5.9.0-00858-g865c50e1d279-dirty (macro@angie) (mipsel-linux-gnu-gcc (GCC) 11.0.0 20200919 (experimental), GNU ld (GNU Binutils) 2.35.50.20201006) #2 Wed Oct 14 04:01:29 CEST 2020

so all I can do is to guide you to find the culprit yourself since you 
have a reproducer.

  Maciej
