Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B5823EDEF
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 15:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgHGNO2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 09:14:28 -0400
Received: from elvis.franken.de ([193.175.24.41]:37647 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbgHGNON (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 7 Aug 2020 09:14:13 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k42CJ-0004e1-00; Fri, 07 Aug 2020 15:14:11 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 710E7C0C82; Fri,  7 Aug 2020 15:13:57 +0200 (CEST)
Date:   Fri, 7 Aug 2020 15:13:57 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Huacai Chen <chenhc@lemote.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
Message-ID: <20200807131357.GA11979@alpha.franken.de>
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
 <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
 <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
 <20200805121021.GA12598@alpha.franken.de>
 <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 05, 2020 at 09:51:44PM +0800, Jiaxun Yang wrote:
> >yes there is. Since this COP2 is a total black box to me, it would be
> >really helpfull to get some docs for it or at least some information what
> >it exactly does and how you want to use it in kernel code.
> 
> FYI:
> Loongson doesn't have any CU2 register. It just reused LWC2 & LDC2 opcode
> to define some load & store instructions (e.g. 128bit load to two GPRs).
> 
> I have a collection of these instructions here[1].
> 
> From GS464E (3A2000+), execuating these instruction won't produce COP2
> unusable
> exception. But older Loongson cores (GS464) will still produce COP2
> exception, thus
> we should have CU2 enabled in kernel. That would allow us use to these
> instructions
> to optimize kernel.

thank you that makes things a little bit clearer.

How will this be used in kernel code ? Special assembler routines or
by enabling gcc options ?

> >And finally what I stil don't like is the splittering of more
> >#ifdef LOONGSON into common code. I'd prefer a more generic way
> >to enable COPx for in kernel usage. Maybe a more generic config option
> >or a dynamic solution like the one for user land.
> Agreed. some Kconfig options or cpuinfo_mips.options can be helpful.

let's see whether this really is needed.

To me it looks like the COP2 exception support for loongson makes
thing worse than it helps. How about the patch below ? There is still
a gap between starting the kernel and COP2 enabled for which I'm not
sure, if we are hitting COP2 instructions.

Thomas.

diff --git a/arch/mips/include/asm/cop2.h b/arch/mips/include/asm/cop2.h
index 6b7396a6a115..dfa72e9be64a 100644
--- a/arch/mips/include/asm/cop2.h
+++ b/arch/mips/include/asm/cop2.h
@@ -33,13 +33,6 @@ extern void nlm_cop2_restore(struct nlm_cop2_state *);
 #define cop2_present		1
 #define cop2_lazy_restore	0
 
-#elif defined(CONFIG_CPU_LOONGSON64)
-
-#define cop2_present		1
-#define cop2_lazy_restore	1
-#define cop2_save(r)		do { (void)(r); } while (0)
-#define cop2_restore(r)		do { (void)(r); } while (0)
-
 #else
 
 #define cop2_present		0
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index b95ef98fc847..f0a8ef5a8605 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2194,6 +2194,11 @@ static void configure_status(void)
 #ifdef CONFIG_64BIT
 	status_set |= ST0_FR|ST0_KX|ST0_SX|ST0_UX;
 #endif
+#ifdef CONFIG_CPU_LOONGSON64
+	/* enable 16-bytes load/store instructions */
+	status_set |= ST0_CU2;
+#endif
+
 	if (current_cpu_data.isa_level & MIPS_CPU_ISA_IV)
 		status_set |= ST0_XX;
 	if (cpu_has_dsp)



-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
