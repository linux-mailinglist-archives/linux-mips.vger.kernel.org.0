Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58FD4632A2
	for <lists+linux-mips@lfdr.de>; Tue, 30 Nov 2021 12:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240878AbhK3Lpg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Nov 2021 06:45:36 -0500
Received: from mail.loongson.cn ([114.242.206.163]:56456 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238396AbhK3Lpg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Nov 2021 06:45:36 -0500
Received: from loongson-pc (unknown [111.9.175.10])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_8oNDqZh_sABAA--.1548S2;
        Tue, 30 Nov 2021 19:42:06 +0800 (CST)
Date:   Tue, 30 Nov 2021 19:42:05 +0800
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
Message-ID: <20211130114204.l2vvn7de337mznp3@loongson-pc>
References: <20211125105949.27147-1-huangpei@loongson.cn>
 <20211125105949.27147-5-huangpei@loongson.cn>
 <20211125155527.GC11524@alpha.franken.de>
 <20211126031319.kfhemh73dyq4rkra@loongson-pc>
 <20211130103448.GA9643@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130103448.GA9643@alpha.franken.de>
User-Agent: NeoMutt/20180716
X-CM-TRANSID: AQAAf9Dx_8oNDqZh_sABAA--.1548S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrW5Zry3Xw4UZF45CFykZrb_yoW7Jw13pr
        y3Ka12yr4DZryUC34qqr18Jryjk347JFWkWr1DXry8AF90vF15XryrGws5ury7Z34ftw18
        tF4IgFy3ur1DA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
        0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
        AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
        rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
        v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWU
        JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoO
        J5UUUUU
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 30, 2021 at 11:34:48AM +0100, Thomas Bogendoerfer wrote:
> On Fri, Nov 26, 2021 at 11:13:19AM +0800, Huang Pei wrote:
> > On Thu, Nov 25, 2021 at 04:55:28PM +0100, Thomas Bogendoerfer wrote:
> > > On Thu, Nov 25, 2021 at 06:59:49PM +0800, Huang Pei wrote:
> > > > It turns out that 'decode_configs' -> 'set_ftlb_enable' is called under
> > > > c->cputype unset, which leaves FTLB disabled on BOTH 3A2000 and 3A3000
> > > > 
> > > > Fix it by calling "decode_configs" after c->cputype is initialized
> > > > 
> > > > Fixes: da1bd29742b1 ("MIPS: Loongson64: Probe CPU features via CPUCFG")
> > > > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > > > ---
> > > >  arch/mips/kernel/cpu-probe.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> > > > index ac0e2cfc6d57..24a529c6c4be 100644
> > > > --- a/arch/mips/kernel/cpu-probe.c
> > > > +++ b/arch/mips/kernel/cpu-probe.c
> > > > @@ -1734,8 +1734,6 @@ static inline void decode_cpucfg(struct cpuinfo_mips *c)
> > > >  
> > > >  static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
> > > >  {
> > > > -	decode_configs(c);
> > > > -
> > > >  	/* All Loongson processors covered here define ExcCode 16 as GSExc. */
> > > >  	c->options |= MIPS_CPU_GSEXCEX;
> > > >  
> > > > @@ -1796,6 +1794,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
> > > >  		panic("Unknown Loongson Processor ID!");
> > > >  		break;
> > > >  	}
> > > > +
> > > > +	decode_configs(c);
> > > >  }
> > > >  #else
> > > >  static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu) { }
> > > > -- 
> > > > 2.20.1
> > > 
> > > applied to mips-fixes.
> > > 
> > > Thomas.
> > > 
> > > -- 
> > > Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> > > good idea.                                                [ RFC1925, 2.3 ]
> > Hi, Thomas,
> > 
> > What about PATCH 1/4, without it, kernel/trace/ring_buffer.i using
> > local_add_return, like this 
> > --------------------------------------------------------------------------------
> >     __asm__ __volatile__(
> > 	"     .set    push                                    \n"
> > 	"     .set    ""arch=r4000""                  \n"
> > 	".if (( 0x00 ) != -1) && ( (1 << 31) ); .set push; .set mips64r2;.rept 1; sync 
> > 	0x00; .endr; .set pop; .else; ; .endif" "\n"
> > 	"1:" "lld     " "%1, %2               # local_add_return\n"
> > 	"     addu    %0, %1, %3				\n"
> > 	"scd " "%0, %2						\n"
> > 	"     beqz    %0, 1b					\n"
> > 	"     addu    %0, %1, %3				\n"
> > 	"     .set    pop
> > 	\n"
> > 	: "=&r" (result), "=&r" (temp), "=m" (l->a.counter)
> > 	: "Ir" (i), "m" (l->a.counter)
> > 	: "memory");
> > } else if (1) {
> >   unsigned long temp;
> > 
> >     __asm__ __volatile__(
> > 	    "     .set    push                                    \n"
> > 	    "     .set    ""arch=r4000""                  \n"
> > 	    ".if (( 0x00 ) != -1) && ( (1 << 31) ); .set push; .set
> > 	    mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ;
> > 	    .endif" "                    \n"
> > 	    "1:" "lld     " "%1, %2               # local_add_return
> > 	    \n"
> > 	    "     addu    %0, %1, %3                              \n"
> > 	    "scd " "%0, %2
> > 	    \n"
> > 	    "     beqz    %0, 1b
> > 	    \n"
> > 	    "     addu    %0, %1, %3
> > 	    \n"
> > 	    "     .set    pop
> > 	    \n"
> > 	    : "=&r" (result), "=&r" (temp), "=m"
> > 	    (l->a.counter)
> > 	    : "Ir" (i), "m" (l->a.counter)
> > 	    : "memory");
> > 
> > --------------------------------------------------------------------------------
> > it is wrong here, "lld" + "addu"
> 
> it fixes something, but I didn't see the impact from the commit message.
> Because there is no Fixes tag, I haven't applied it tomips-fixes.
> 
Sorry, this bug is introduced by 7232311ef14c274d88871212a07557f18f4140d1
> And
> 
> +#elif MIPS_ISA_REV >= 6
> +# define SC_BEQZ	beqzc
> 
> why are you doing this ?
This copies from arch/mips/include/asm/llsc.h, I had another patch which
remove llsc.h. I do not want add that patch into bugfix;

> > and PATCH 2, any comment?
> 
> parameter page already contains the virtual address of the page to
> flush, so there is nothing to fix. I'm not 100% about the cache
> nature of all TX39 core, so leaving the check for cpu_has_dc_aliases
> in place is the safer bet. And this platform is nearly dead, so I'm
> sure sure whether this sort of cosemtics is needed.
> 
Based on the comment, I can see TX39 want to bypass TLB by Indexed Cache
Operation,  because with KSEG0 address, Indexed Cache Operation does not 
pass through TLB; But there are two limitation:

+. KSEG0 only cover first 512MB physical address, so do not support 
High Memory, if not using KSEG0 address ,then it passes through TLB, which
is not intended;

+. Indexed Cache Operation can overkill cache line with same cache index
from different way, but it can not kill Cache Alias, since Cache Alias
actually has different cache index;

From datasheet of TX39xx, I know the R3900 core of TX39 series has only
4KB direct-mapped Icache and 2KB two-way Dcache, so it has no Cache 
Alias under 4KB page size, and I can assume it does not support memory
beyond 512MB based on Kconfig of TX39, AKA no High Memory;

Above all, I think it is OK to both use KSEG0 address and remove cpu_has_dc_alias 

> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

