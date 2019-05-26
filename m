Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 645AF2A92C
	for <lists+linux-mips@lfdr.de>; Sun, 26 May 2019 11:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727640AbfEZJ23 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 26 May 2019 05:28:29 -0400
Received: from linux-libre.fsfla.org ([209.51.188.54]:49130 "EHLO
        linux-libre.fsfla.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727639AbfEZJ23 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 May 2019 05:28:29 -0400
X-Greylist: delayed 466 seconds by postgrey-1.27 at vger.kernel.org; Sun, 26 May 2019 05:28:28 EDT
Received: from free.home (home.lxoliva.fsfla.org [172.31.160.164])
        by linux-libre.fsfla.org (8.15.2/8.15.2/Debian-3) with ESMTP id x4Q9JdKg031188;
        Sun, 26 May 2019 09:19:41 GMT
Received: from livre (livre.home [172.31.160.2])
        by free.home (8.15.2/8.15.2) with ESMTP id x4Q9J058102102;
        Sun, 26 May 2019 06:19:01 -0300
From:   Alexandre Oliva <lxoliva@fsfla.org>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>, Tom Li <tomli@tomli.me>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC] On the Current Troubles of Mainlining Loongson Platform Drivers
Organization: Free thinker, not speaking for FSF Latin America
References: <20190208083038.GA1433@localhost.localdomain>
        <orbm3i5xrn.fsf@lxoliva.fsfla.org>
        <20190211125506.GA21280@localhost.localdomain>
        <orimxq3q9j.fsf@lxoliva.fsfla.org>
        <20190211230614.GB22242@darkstar.musicnaut.iki.fi>
        <orva1jj9ht.fsf@lxoliva.fsfla.org>
        <20190217235951.GA20700@darkstar.musicnaut.iki.fi>
        <orpnrpj2rk.fsf@lxoliva.fsfla.org>
        <alpine.LFD.2.21.1902180227090.15915@eddie.linux-mips.org>
        <orlg1ryyo2.fsf@lxoliva.fsfla.org>
        <alpine.LFD.2.21.1903071744560.7728@eddie.linux-mips.org>
        <orwolaw5u1.fsf@lxoliva.fsfla.org>
        <alpine.LFD.2.21.1903082347330.31648@eddie.linux-mips.org>
Date:   Sun, 26 May 2019 06:19:00 -0300
In-Reply-To: <alpine.LFD.2.21.1903082347330.31648@eddie.linux-mips.org>
        (Maciej W. Rozycki's message of "Fri, 8 Mar 2019 23:56:03 +0000
        (GMT)")
Message-ID: <or7ead4lq3.fsf@lxoliva.fsfla.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Scanned-By: MIMEDefang 2.84
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mar  8, 2019, "Maciej W. Rozycki" <macro@linux-mips.org> wrote:

>  Anyway I meant: does `war_io_reorder_wmb' expand to `wmb' on your system?

No, it expands to `barrier' on the yeeloong:

CONFIG_CPU_LOONGSON2F=y
CONFIG_CPU_LOONGSON2F_WORKAROUNDS=y
CONFIG_CPU_LOONGSON2=y
CONFIG_SYS_HAS_CPU_LOONGSON2F=y


I've finally managed to do the bisection on object files I mentioned I'd
do to try to pinpoint where __BUILT_IOPORT_PFX with barrier rather than
!barrier regressed.

I found that forcing barrier off for drivers/irqchip/irq-i8259 was
enough to avoid the problem.

(I further narrowed it down to byte I/O, which is no surprise
considering irq-i8259 doesn't seem to use any non-byte I/O.)

Then I narrowed it down to output only.

A Loongson2F kernel built with the patch below works at normal speed.
I've also keyed the -1 barrier selector to compiling the irq-i8259
driver only, and that got me a functional kernel, but I'm not confident
that the same issues that affect the interrupt controller, preventing it
from initializing correctly, is not also affecting other drivers, just
in less visible ways, so the patch conservatively reverts to the older
barriers for all I/O (i.e., non-mem) out primitives.

I've tested this on a yeeloong on top of v5.1.5.

I'm tempted to start using this patch in my Freeloong builds of GNU
Linux-libre for gnewsense/yeeloong of 5.0 and 5.1 stable releases, to
try to make them usable.  Can anyone suggest any reason why it might be
risky to do so, moving on as much as I could to the new barriers,
sticking to the 4.19-one only for non-mem out?  As in, could mixing the
barriers be riskier than reverting to the 4.19 barriers everywhere?

Thanks in advance for any insights and recommendations,


diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 845fbbc7a2e3..04be4758d4ff 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -416,7 +416,7 @@ static inline void pfx##out##bwlq##p(type val, unsigned long port)	\
 	volatile type *__addr;						\
 	type __val;							\
 									\
-	if (barrier)							\
+	if (barrier > 0)						\
 		iobarrier_rw();						\
 	else								\
 		war_io_reorder_wmb();					\
@@ -467,13 +467,22 @@ BUILDIO_MEM(w, u16)
 BUILDIO_MEM(l, u32)
 BUILDIO_MEM(q, u64)
 
-#define __BUILD_IOPORT_PFX(bus, bwlq, type)				\
-	__BUILD_IOPORT_SINGLE(bus, bwlq, type, 1, 0,)			\
-	__BUILD_IOPORT_SINGLE(bus, bwlq, type, 1, 0, _p)
+#define __BUILD_IOPORT_PFX(bus, bwlq, type, barrier)			\
+	__BUILD_IOPORT_SINGLE(bus, bwlq, type, barrier, 0,)		\
+	__BUILD_IOPORT_SINGLE(bus, bwlq, type, barrier, 0, _p)
+
+/* Choose the kind of barrier used for out in __BUILD_IOPORT_SINGLE in
+   non-__mem_ variants.  On Loongson2F, irq-i8259 fails to initialize
+   when this is defined to 1.  */
+#if defined(CONFIG_CPU_LOONGSON2)
+#define USE_IO_BARRIER_FOR_NON_MEM_OUT -1
+#else
+#define USE_IO_BARRIER_FOR_NON_MEM_OUT 1
+#endif
 
 #define BUILDIO_IOPORT(bwlq, type)					\
-	__BUILD_IOPORT_PFX(, bwlq, type)				\
-	__BUILD_IOPORT_PFX(__mem_, bwlq, type)
+	__BUILD_IOPORT_PFX(, bwlq, type, USE_IO_BARRIER_FOR_NON_MEM_OUT) \
+	__BUILD_IOPORT_PFX(__mem_, bwlq, type, 2)
 
 BUILDIO_IOPORT(b, u8)
 BUILDIO_IOPORT(w, u16)


-- 
Alexandre Oliva, freedom fighter  he/him   https://FSFLA.org/blogs/lxo
Be the change, be Free!                 FSF Latin America board member
GNU Toolchain Engineer                        Free Software Evangelist
Hay que enGNUrecerse, pero sin perder la terGNUra jamás - Che GNUevara
