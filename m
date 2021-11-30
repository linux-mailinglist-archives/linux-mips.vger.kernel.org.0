Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C1B46311F
	for <lists+linux-mips@lfdr.de>; Tue, 30 Nov 2021 11:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233339AbhK3KiY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Nov 2021 05:38:24 -0500
Received: from elvis.franken.de ([193.175.24.41]:50871 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234136AbhK3KiU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Nov 2021 05:38:20 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ms0TT-0006Wd-00; Tue, 30 Nov 2021 11:34:59 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 793F5C4DE4; Tue, 30 Nov 2021 11:34:48 +0100 (CET)
Date:   Tue, 30 Nov 2021 11:34:48 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 4/4] MIPS: loongson64: fix FTLB configuration
Message-ID: <20211130103448.GA9643@alpha.franken.de>
References: <20211125105949.27147-1-huangpei@loongson.cn>
 <20211125105949.27147-5-huangpei@loongson.cn>
 <20211125155527.GC11524@alpha.franken.de>
 <20211126031319.kfhemh73dyq4rkra@loongson-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126031319.kfhemh73dyq4rkra@loongson-pc>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 26, 2021 at 11:13:19AM +0800, Huang Pei wrote:
> On Thu, Nov 25, 2021 at 04:55:28PM +0100, Thomas Bogendoerfer wrote:
> > On Thu, Nov 25, 2021 at 06:59:49PM +0800, Huang Pei wrote:
> > > It turns out that 'decode_configs' -> 'set_ftlb_enable' is called under
> > > c->cputype unset, which leaves FTLB disabled on BOTH 3A2000 and 3A3000
> > > 
> > > Fix it by calling "decode_configs" after c->cputype is initialized
> > > 
> > > Fixes: da1bd29742b1 ("MIPS: Loongson64: Probe CPU features via CPUCFG")
> > > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > > ---
> > >  arch/mips/kernel/cpu-probe.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> > > index ac0e2cfc6d57..24a529c6c4be 100644
> > > --- a/arch/mips/kernel/cpu-probe.c
> > > +++ b/arch/mips/kernel/cpu-probe.c
> > > @@ -1734,8 +1734,6 @@ static inline void decode_cpucfg(struct cpuinfo_mips *c)
> > >  
> > >  static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
> > >  {
> > > -	decode_configs(c);
> > > -
> > >  	/* All Loongson processors covered here define ExcCode 16 as GSExc. */
> > >  	c->options |= MIPS_CPU_GSEXCEX;
> > >  
> > > @@ -1796,6 +1794,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
> > >  		panic("Unknown Loongson Processor ID!");
> > >  		break;
> > >  	}
> > > +
> > > +	decode_configs(c);
> > >  }
> > >  #else
> > >  static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu) { }
> > > -- 
> > > 2.20.1
> > 
> > applied to mips-fixes.
> > 
> > Thomas.
> > 
> > -- 
> > Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> > good idea.                                                [ RFC1925, 2.3 ]
> Hi, Thomas,
> 
> What about PATCH 1/4, without it, kernel/trace/ring_buffer.i using
> local_add_return, like this 
> --------------------------------------------------------------------------------
>     __asm__ __volatile__(
> 	"     .set    push                                    \n"
> 	"     .set    ""arch=r4000""                  \n"
> 	".if (( 0x00 ) != -1) && ( (1 << 31) ); .set push; .set mips64r2;.rept 1; sync 
> 	0x00; .endr; .set pop; .else; ; .endif" "\n"
> 	"1:" "lld     " "%1, %2               # local_add_return\n"
> 	"     addu    %0, %1, %3				\n"
> 	"scd " "%0, %2						\n"
> 	"     beqz    %0, 1b					\n"
> 	"     addu    %0, %1, %3				\n"
> 	"     .set    pop
> 	\n"
> 	: "=&r" (result), "=&r" (temp), "=m" (l->a.counter)
> 	: "Ir" (i), "m" (l->a.counter)
> 	: "memory");
> } else if (1) {
>   unsigned long temp;
> 
>     __asm__ __volatile__(
> 	    "     .set    push                                    \n"
> 	    "     .set    ""arch=r4000""                  \n"
> 	    ".if (( 0x00 ) != -1) && ( (1 << 31) ); .set push; .set
> 	    mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ;
> 	    .endif" "                    \n"
> 	    "1:" "lld     " "%1, %2               # local_add_return
> 	    \n"
> 	    "     addu    %0, %1, %3                              \n"
> 	    "scd " "%0, %2
> 	    \n"
> 	    "     beqz    %0, 1b
> 	    \n"
> 	    "     addu    %0, %1, %3
> 	    \n"
> 	    "     .set    pop
> 	    \n"
> 	    : "=&r" (result), "=&r" (temp), "=m"
> 	    (l->a.counter)
> 	    : "Ir" (i), "m" (l->a.counter)
> 	    : "memory");
> 
> --------------------------------------------------------------------------------
> it is wrong here, "lld" + "addu"

it fixes something, but I didn't see the impact from the commit message.
Because there is no Fixes tag, I haven't applied it tomips-fixes.

And

+#elif MIPS_ISA_REV >= 6
+# define SC_BEQZ	beqzc

why are you doing this ?

> and PATCH 2, any comment?

parameter page already contains the virtual address of the page to
flush, so there is nothing to fix. I'm not 100% about the cache
nature of all TX39 core, so leaving the check for cpu_has_dc_aliases
in place is the safer bet. And this platform is nearly dead, so I'm
sure sure whether this sort of cosemtics is needed.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
