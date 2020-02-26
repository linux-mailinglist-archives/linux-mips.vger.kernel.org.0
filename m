Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B600516F5AF
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 03:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgBZCiS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Feb 2020 21:38:18 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:49704 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728989AbgBZCiR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Feb 2020 21:38:17 -0500
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23993114AbgBZCiNQSZht (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 26 Feb 2020 03:38:13 +0100
Date:   Wed, 26 Feb 2020 02:38:13 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     Huacai Chen <chenhc@lemote.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH 1/3] MIPS: Loongson: Remove Loongson-2E/2F support
In-Reply-To: <0279E7A7-197D-4D6B-9A4B-26E6791372E0@flygoat.com>
Message-ID: <alpine.LFD.2.21.1911130315010.367459@eddie.linux-mips.org>
References: <1572758417-29265-1-git-send-email-chenhc@lemote.com> <alpine.LFD.2.21.1911032301160.367459@eddie.linux-mips.org> <0279E7A7-197D-4D6B-9A4B-26E6791372E0@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

On Tue, 5 Nov 2019, Jiaxun Yang wrote:

> >BTW, there used to be a patch somewhere to support more than 512MiB of 
> >DRAM with the 2E, but I can't find it -- can you help me tracking it
> 
> Hi Maciej
> 
> It seems like DRAM size issue is a firmware issue rather than kernel 
> issue, some early versions of PMON don't pass highmem size correctly to 
> the Kernel.
> Probably you can manually set it in loongson-2ef/common/mem.c？

 Not really, the size was passed correctly, but something was set wrong in 
the chipset that caused the kernel to crash if access to upper 512MiB was 
allowed with a 1GiB SODIMM.  I had to strap memory regions manually to 
keep the system working, as follows:

      karg = "console=tty root=/dev/hda2 mem=256M@0 mem=256M@512M"

 Yeah, I knew upgrading the firmware was the right way, but I was being a 
coward about flashing, fearing I could brick the machine.

> Currently I can't find any working Fuloong-2E to test but the newest 
> known PMON can be found here[1].
> 
> Thanks
> 
> [1] https://mirrors4.tuna.tsinghua.edu.cn/loongson/pmon/pmon_2e.bin
> https://mirrors4.tuna.tsinghua.edu.cn/loongson/pmon/pmon_2e.bin.md5

 So I went ahead and I have now actually flashed the newer firmware.  My 
cowardice still told me not to take it lightly, so I waited until I 
travelled to my other site where I could power the machine via a UPS.

 Results have been good and the extra RAM let me upgrade the 32-bit Debian 
system installed to Debian 7 "Wheezy" without making the system swap to 
death.  This is actually the final Debian release to support Fuloong-2E, 
as the MIPS port was skipped with Debian 8 "Jessie" and Debian 9 "Stretch" 
requires a MIPS R2 processor to run, and Fuloong-2E only supports the MIPS 
III ISA (plus vendor extensions).  It would have saved me a lot of hassle, 
if it was more clearly stated at: <https://www.debian.org/ports/mips/>.

 A further issue that caused me some pain was with Firefox, which did not 
run and crashed with SIGILL right away.  Eventually I figured out it was 
on a MIPS IV FPU instruction (MOVT IIRC) despite Firefox having been built 
for MIPS II.  After a further research I realised a JIT compiler had been 
added to the browser at one point for JavaScript execution, and it must 
have been incorrectly set to produce code for an ISA beyond one Firefox 
has been built for.

 As I think it's unlikely anyone will backport a fix let alone build a 
MIPS Firefox binary for Debian 7, I went for a workaround instead and 
disabled JIT compilation with a:

user_pref("javascript.options.baselinejit", false);

entry added to `prefs.js'.  That let Firefox run normally.

 I guess these bits of information may still be useful to someone, so I 
decided to post them; after so many years I still find Fuloong-2E a great 
machine and still very usable.  I'll try to find some time to polish this 
a little and include with <https://www.linux-mips.org/wiki/Fuloong_2E>.  
I think it would make sense to have a copy of the firmware image there 
too.

 Thanks for encouraging me to upgrade the firmware and providing a link!

  Maciej
