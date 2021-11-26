Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD48145E672
	for <lists+linux-mips@lfdr.de>; Fri, 26 Nov 2021 04:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235461AbhKZDSo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Nov 2021 22:18:44 -0500
Received: from mail.loongson.cn ([114.242.206.163]:56978 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237669AbhKZDQo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Nov 2021 22:16:44 -0500
Received: from loongson-pc (unknown [111.9.175.10])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxmsnPUKBhTQQAAA--.2S2;
        Fri, 26 Nov 2021 11:13:25 +0800 (CST)
Date:   Fri, 26 Nov 2021 11:13:19 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 4/4] MIPS: loongson64: fix FTLB configuration
Message-ID: <20211126031319.kfhemh73dyq4rkra@loongson-pc>
References: <20211125105949.27147-1-huangpei@loongson.cn>
 <20211125105949.27147-5-huangpei@loongson.cn>
 <20211125155527.GC11524@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125155527.GC11524@alpha.franken.de>
User-Agent: NeoMutt/20180716
X-CM-TRANSID: AQAAf9AxmsnPUKBhTQQAAA--.2S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF47WF4ftFy5XFyxZryDGFg_yoW5tr43pr
        ySkwsFyr4jyrWUAas7Jr48Jry2qr1UJrn5Cr4qgry8A345Ar1UXr18Kw4fWry7ZryxX3W8
        tF929FyY9rnrXrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
        0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
        IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
        AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
        Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoO
        J5UUUUU
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 25, 2021 at 04:55:28PM +0100, Thomas Bogendoerfer wrote:
> On Thu, Nov 25, 2021 at 06:59:49PM +0800, Huang Pei wrote:
> > It turns out that 'decode_configs' -> 'set_ftlb_enable' is called under
> > c->cputype unset, which leaves FTLB disabled on BOTH 3A2000 and 3A3000
> > 
> > Fix it by calling "decode_configs" after c->cputype is initialized
> > 
> > Fixes: da1bd29742b1 ("MIPS: Loongson64: Probe CPU features via CPUCFG")
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> >  arch/mips/kernel/cpu-probe.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> > index ac0e2cfc6d57..24a529c6c4be 100644
> > --- a/arch/mips/kernel/cpu-probe.c
> > +++ b/arch/mips/kernel/cpu-probe.c
> > @@ -1734,8 +1734,6 @@ static inline void decode_cpucfg(struct cpuinfo_mips *c)
> >  
> >  static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
> >  {
> > -	decode_configs(c);
> > -
> >  	/* All Loongson processors covered here define ExcCode 16 as GSExc. */
> >  	c->options |= MIPS_CPU_GSEXCEX;
> >  
> > @@ -1796,6 +1794,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
> >  		panic("Unknown Loongson Processor ID!");
> >  		break;
> >  	}
> > +
> > +	decode_configs(c);
> >  }
> >  #else
> >  static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu) { }
> > -- 
> > 2.20.1
> 
> applied to mips-fixes.
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
Hi, Thomas,

What about PATCH 1/4, without it, kernel/trace/ring_buffer.i using
local_add_return, like this 
--------------------------------------------------------------------------------
    __asm__ __volatile__(
	"     .set    push                                    \n"
	"     .set    ""arch=r4000""                  \n"
	".if (( 0x00 ) != -1) && ( (1 << 31) ); .set push; .set mips64r2;.rept 1; sync 
	0x00; .endr; .set pop; .else; ; .endif" "\n"
	"1:" "lld     " "%1, %2               # local_add_return\n"
	"     addu    %0, %1, %3				\n"
	"scd " "%0, %2						\n"
	"     beqz    %0, 1b					\n"
	"     addu    %0, %1, %3				\n"
	"     .set    pop
	\n"
	: "=&r" (result), "=&r" (temp), "=m" (l->a.counter)
	: "Ir" (i), "m" (l->a.counter)
	: "memory");
} else if (1) {
  unsigned long temp;

    __asm__ __volatile__(
	    "     .set    push                                    \n"
	    "     .set    ""arch=r4000""                  \n"
	    ".if (( 0x00 ) != -1) && ( (1 << 31) ); .set push; .set
	    mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ;
	    .endif" "                    \n"
	    "1:" "lld     " "%1, %2               # local_add_return
	    \n"
	    "     addu    %0, %1, %3                              \n"
	    "scd " "%0, %2
	    \n"
	    "     beqz    %0, 1b
	    \n"
	    "     addu    %0, %1, %3
	    \n"
	    "     .set    pop
	    \n"
	    : "=&r" (result), "=&r" (temp), "=m"
	    (l->a.counter)
	    : "Ir" (i), "m" (l->a.counter)
	    : "memory");

--------------------------------------------------------------------------------
it is wrong here, "lld" + "addu"

with it, like this 
--------------------------------------------------------------------------------
 if (1) {
  unsigned long temp;

  __asm__ __volatile__(
	  "     .set    push                                    \n"
	  "     .set    ""arch=r4000""                  \n"
	   ".if (( 0x00 ) != -1) && ( (1 << 31) ); .set push; .set mips64r2;
	.rept 1; sync 0x00; .endr; .set pop; .else; ; .endif" "
	\n"
	  "1:" "lld" "  %1, %2          \n"
	  "     ""daddu" "      %0, %1, %3      \n"
	  "     ""scd" "        %0, %2          \n"
	  "     ""beqz" "       %0, 1b          \n"
	  "     ""daddu" "      %0, %1, %3      \n"
	  "     .set    pop                                     \n"
	  : "=&r" (result), "=&r" (temp), "=m" (l->a.counter)
	  : "Ir" (i), "m" (l->a.counter)
	  : "memory");
 } else {

MIPS64 needs "lld + daddu"

and PATCH 2, any comment?

 

