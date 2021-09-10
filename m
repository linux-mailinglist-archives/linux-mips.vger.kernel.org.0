Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406C14067BE
	for <lists+linux-mips@lfdr.de>; Fri, 10 Sep 2021 09:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhIJHgM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Sep 2021 03:36:12 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:32775 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231445AbhIJHgL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 10 Sep 2021 03:36:11 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 0D81C2B01326;
        Fri, 10 Sep 2021 03:34:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 10 Sep 2021 03:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        message-id:date:mime-version:from:subject:to:cc:references
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=M
        odyqHsRD5odC2MnUgazzd8672JDURm69F6s3isu0GQ=; b=XOZ3eGWEH5gBbxUZ0
        ehAsJ8BWHhHtO4dW/TSJ3i8V+5YGWvJnT4Cy2uEVQHB4gqKmjgO8Iz6QBGslj0Yj
        PTeUJP1NRx2ySPS76vFdGWkY+XxpGH6C756Q7H9rKA86E6NJAfo6PETcTY3PCqqT
        7E4z9MzlqhJpA7EbJrAiTKa7RZ9jeTMVAUwa/N6xM4h3J/sJqeoG+oj74YxclrpR
        fh2DisD3qD+MOYv1bxEFipwFHpuRc+ogajyuMTO1zCx0YUa/FdAXkWi1psyCOt9I
        fMxMehcGnZjD16RGduFJMDYEU6Lj3SQ3xcgXvQqdMX1++K9ykR72Rbnhm0x5Iqu+
        sRVFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=ModyqHsRD5odC2MnUgazzd8672JDURm69F6s3isu0
        GQ=; b=Ts9T9PoP6lXiQH11gb6aCUg5VUQQvrYwXov+pB5sVRC6Orv+ejRp8cKj6
        sGp9Z+x7gMZvoUSIu4yVJov9mCQJk0AcfTd5bzWi9PRQy26FW6nknMLkrhoDMDyM
        LS4cK/y+qcOnBgmd+9I952rDtunEy/FZSM76m94/HcsmmE7n39CB8Wgd6Knimln1
        qhJoDmr7V80ILkD1rnTDvpEHtS4j3tfKPaXoIxJoIk+umBhYM2MZOegSvcTlcniz
        8LCcWrtuBmdziF/kQQtkhNLbb4fdU0qs+BHN/lKaLp2M8i7QZtl9VqNVhQcg6jEY
        d7Pb0HIQ+PjfNpFkpT7dX0yYrJ3iA==
X-ME-Sender: <xms:mAo7YfumEnqvyDKO85c_YwXOnvAzID96oOsVXfrwSmHQ1rIrcn9Cmw>
    <xme:mAo7YQe3UJ3CNyMJS6M8fESYN7Bcx0NtN8_rXlqONT8rWd7Hlbi-iFoXACNOdPfIK
    tSbUI7DepDlSeBi3wE>
X-ME-Received: <xmr:mAo7YSyQokMh7Kf3bJ7Ds3vVo0xzSzcAsqWL5nLK4miJs1V11WKSrnkwsKgxrOToH1zihg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegtddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfhuffvfhgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepgeefgfduieevuddvvdfgkedthffgveekteevleekjeeuhfei
    jeevudefkeduvdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:mAo7YeNWMi-tGnqe7fUHsR5FWIwZGdlo3N0KW5prMZMCRXPWJ8wrPg>
    <xmx:mAo7Yf-0BoKywi8EHnY3ShMGk9gDK4e9WW1OULsP7UlB-Rvr0VGDYg>
    <xmx:mAo7YeXGcuHoEvKmGCoK2oDRhcIm6w0-Vgt_NT9wD0yrKkxrWCVvjQ>
    <xmx:ogo7YX-2OJBPr-RMWSPqkDOVpQIOgx-jRnx6O1PoM75G6nKfhocOHqUTielT0D01>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 03:34:40 -0400 (EDT)
Message-ID: <cf32762f-888a-b50b-9685-89b830049f6d@flygoat.com>
Date:   Fri, 10 Sep 2021 15:34:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] clocksource: Loongson constant timer support
To:     zhengd <zhengd@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Paul Cercueil <paul@crapouillou.net>,
        Lauri Kasanen <cand@gmx.com>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Romain Naour <romain.naour@gmail.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Thomas Richter <tmricht@linux.ibm.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Hector Martin <marcan@marcan.st>,
        Tom Zanussi <tom.zanussi@linux.intel.com>,
        Mel Gorman <mgorman@techsingularity.net>,
        Andrew Jones <drjones@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.com>, tanj@lemote.com,
        huangll@lemote.com
References: <20210910071835.21801-1-zhengd@lemote.com>
In-Reply-To: <20210910071835.21801-1-zhengd@lemote.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2021/9/10 15:18, zhengd 写道:
> Loongson constant timer is found in Loongson-3A4000 processor.
> It has a counter which is globally accessiable via rdhwr instruction,
> also each core has a clock event generator connected to this clock
> source sharing interrupt with MIPS cont & comapre cevt.
>
> We add cevt, csrc, vdso, sched_clock support for this timer.
>
> Signed-off-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Huacai Chen<chenhuacai@loongson.com>
> Signed-off-by: zhengd<zhengd@lemote.com>

Hi Zheng D

(I think you should provide your full name for sign-off purpose)

It seems like you are repasting my patch, it's appreciated as I don't 
have capacity to care it presently.

I noticed that you had squashed my patches together, it is discoraged as 
it will makes reviewing much more harder.

Also, I do have a personal request, could you please mark your 
modifications from my original set so I can ensure all concerns around 
the original issue are addressed?

Thanks.

- Jiaxun


> ---
>   arch/mips/include/asm/cpu-features.h          |   4 +
>   arch/mips/include/asm/cpu.h                   |   1 +
>   .../include/asm/mach-loongson64/loongson.h    |   9 +
>   .../asm/mach-loongson64/loongson_regs.h       |   7 +
>   arch/mips/include/asm/mipsregs.h              |   2 +
>   arch/mips/include/asm/time.h                  |   3 +
>   arch/mips/include/asm/vdso/clocksource.h      |   3 +-
>   arch/mips/include/asm/vdso/gettimeofday.h     |  25 +-
>   arch/mips/kernel/cevt-r4k.c                   |  25 ++
>   arch/mips/kernel/cpu-probe.c                  |   6 +-
>   arch/mips/kernel/csrc-r4k.c                   |   5 +-
>   arch/mips/kernel/time.c                       |   3 +
>   drivers/clocksource/Kconfig                   |  10 +
>   drivers/clocksource/Makefile                  |   1 +
>   drivers/clocksource/loongson_const_timer.c    | 249 ++++++++++++++++++
>   include/linux/cpuhotplug.h                    |   1 +
>   16 files changed, 348 insertions(+), 6 deletions(-)
>   create mode 100644 drivers/clocksource/loongson_const_timer.c
>
> diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
> index 3d71081afc55..787bd53be900 100644
> --- a/arch/mips/include/asm/cpu-features.h
> +++ b/arch/mips/include/asm/cpu-features.h
> @@ -573,6 +573,10 @@
>   # define cpu_has_gsexcex	__opt(MIPS_CPU_GSEXCEX)
>   #endif
>   
> +#ifndef cpu_has_extimer
> +# define cpu_has_extimer	__opt(MIPS_CPU_EXTIMER)
> +#endif
> +
>   #ifdef CONFIG_SMP
>   /*
>    * Some systems share FTLB RAMs between threads within a core (siblings in
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index d45a52f65b7a..8d221b4c3fa3 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -428,6 +428,7 @@ enum cpu_type_enum {
>   #define MIPS_CPU_MAC_2008_ONLY	BIT_ULL(60)	/* CPU Only support MAC2008 Fused multiply-add instruction */
>   #define MIPS_CPU_FTLBPAREX	BIT_ULL(61)	/* CPU has FTLB parity exception */
>   #define MIPS_CPU_GSEXCEX	BIT_ULL(62)	/* CPU has GSExc exception */
> +#define MIPS_CPU_EXTIMER	BIT_ULL(63)	/* CPU has External Timer (Loongson) */
>   
>   /*
>    * CPU ASE encodings
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
> index f7c3ab6d724e..8c7a85bce539 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson.h
> +++ b/arch/mips/include/asm/mach-loongson64/loongson.h
> @@ -56,6 +56,15 @@ extern void *loongson_fdt_blob;
>   extern void mach_irq_dispatch(unsigned int pending);
>   extern int mach_i8259_irq(void);
>   
> +#ifdef CONFIG_LOONGSON_CONST_TIMER
> +extern int __init constant_timer_init(void);
> +#else
> +static inline int constant_timer_init(void)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +
>   /* We need this in some places... */
>   #define delay() ({		\
>   	int x;				\
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> index 165993514762..229465060be2 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> +++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> @@ -88,6 +88,7 @@ static inline u32 read_cpucfg(u32 reg)
>   #define LOONGSON_CFG2_LGFTP	BIT(19)
>   #define LOONGSON_CFG2_LGFTPREV	GENMASK(22, 20)
>   #define LOONGSON_CFG2_LLFTP	BIT(23)
> +#define LOONGSON_CFG2_LLFTPREVB	24
>   #define LOONGSON_CFG2_LLFTPREV	GENMASK(26, 24)
>   #define LOONGSON_CFG2_LCSRP	BIT(27)
>   #define LOONGSON_CFG2_LDISBLIKELY	BIT(28)
> @@ -237,6 +238,12 @@ static inline void csr_writeq(u64 val, u32 reg)
>   #define CSR_MAIL_SEND_BUF_SHIFT		32
>   #define CSR_MAIL_SEND_H32_MASK		0xFFFFFFFF00000000ULL
>   
> +#define LOONGSON_CSR_TIMER_CFG		0x1060
> +#define LOONGSON_CSR_TIMER_TICK		0x1070
> +#define CONSTANT_TIMER_CFG_PERIODIC	(_ULCAST_(1) << 62)
> +#define CONSTANT_TIMER_CFG_EN		(_ULCAST_(1) << 61)
> +#define CONSTANT_TIMER_INITVAL_RESET	(_ULCAST_(0xffff) << 48)
> +
>   static inline u64 drdtime(void)
>   {
>   	int rID = 0;
> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> index acdf8c69220b..c16580a15336 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -699,6 +699,8 @@
>   
>   /* Config6 feature bits for proAptiv/P5600 */
>   
> +#define LOONGSON_CONF6_INTIMER	(_ULCAST_(1) << 6)
> +#define LOONGSON_CONF6_EXTIMER	(_ULCAST_(1) << 7)
>   /* Jump register cache prediction disable */
>   #define MTI_CONF6_JRCD		(_ULCAST_(1) << 0)
>   /* MIPSr6 extensions enable */
> diff --git a/arch/mips/include/asm/time.h b/arch/mips/include/asm/time.h
> index e855a3611d92..e235b8a27768 100644
> --- a/arch/mips/include/asm/time.h
> +++ b/arch/mips/include/asm/time.h
> @@ -28,6 +28,9 @@ extern void plat_time_init(void);
>    */
>   extern unsigned int mips_hpt_frequency;
>   
> +/* True if platform registered sched_clock by itself */
> +extern bool plat_have_sched_clock __initdata;
> +
>   /*
>    * The performance counter IRQ on MIPS is a close relative to the timer IRQ
>    * so it lives here.
> diff --git a/arch/mips/include/asm/vdso/clocksource.h b/arch/mips/include/asm/vdso/clocksource.h
> index 510e1671d898..7fd43ca06eb1 100644
> --- a/arch/mips/include/asm/vdso/clocksource.h
> +++ b/arch/mips/include/asm/vdso/clocksource.h
> @@ -4,6 +4,7 @@
>   
>   #define VDSO_ARCH_CLOCKMODES	\
>   	VDSO_CLOCKMODE_R4K,	\
> -	VDSO_CLOCKMODE_GIC
> +	VDSO_CLOCKMODE_GIC,	\
> +	VDSO_CLOCKMODE_CONST
>   
>   #endif /* __ASM_VDSOCLOCKSOURCE_H */
> diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
> index 44a45f3fa4b0..2f860c1e3aa5 100644
> --- a/arch/mips/include/asm/vdso/gettimeofday.h
> +++ b/arch/mips/include/asm/vdso/gettimeofday.h
> @@ -183,6 +183,24 @@ static __always_inline u64 read_gic_count(const struct vdso_data *data)
>   
>   #endif
>   
> +#ifdef CONFIG_LOONGSON_CONST_TIMER
> +
> +static __always_inline u64 read_const_timer(void)
> +{
> +	u64 count;
> +
> +	__asm__ __volatile__(
> +	"	.set push\n"
> +	"	.set mips32r2\n"
> +	"	rdhwr %0, $30\n"
> +	"	.set pop\n"
> +	: "=r" (count));
> +
> +	return count;
> +}
> +
> +#endif
> +
>   static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
>   						 const struct vdso_data *vd)
>   {
> @@ -193,6 +211,10 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
>   #ifdef CONFIG_CLKSRC_MIPS_GIC
>   	if (clock_mode == VDSO_CLOCKMODE_GIC)
>   		return read_gic_count(vd);
> +#endif
> +#ifdef CONFIG_LOONGSON_CONST_TIMER
> +	if (clock_mode == VDSO_CLOCKMODE_CONST)
> +		return read_const_timer();
>   #endif
>   	/*
>   	 * Core checks mode already. So this raced against a concurrent
> @@ -205,7 +227,8 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
>   static inline bool mips_vdso_hres_capable(void)
>   {
>   	return IS_ENABLED(CONFIG_CSRC_R4K) ||
> -	       IS_ENABLED(CONFIG_CLKSRC_MIPS_GIC);
> +	       IS_ENABLED(CONFIG_CLKSRC_MIPS_GIC) ||
> +	       IS_ENABLED(CONFIG_LOONGSON_CONST_TIMER);
>   }
>   #define __arch_vdso_hres_capable mips_vdso_hres_capable
>   
> diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
> index 32ec67c9ab67..91fc62001149 100644
> --- a/arch/mips/kernel/cevt-r4k.c
> +++ b/arch/mips/kernel/cevt-r4k.c
> @@ -15,6 +15,8 @@
>   
>   #include <asm/time.h>
>   #include <asm/cevt-r4k.h>
> +#include <asm/cpu-features.h>
> +#include <asm/mipsregs.h>
>   
>   static int mips_next_event(unsigned long delta,
>   			   struct clock_event_device *evt)
> @@ -290,6 +292,24 @@ core_initcall(r4k_register_cpufreq_notifier);
>   
>   #endif /* !CONFIG_CPU_FREQ */
>   
> +#ifdef CONFIG_CPU_LOONGSON64
> +static int c0_compare_int_enable(struct clock_event_device *cd)
> +{
> +	if (cpu_has_extimer)
> +		set_c0_config6(LOONGSON_CONF6_INTIMER);
> +
> +	return 0;
> +}
> +
> +static int c0_compare_int_disable(struct clock_event_device *cd)
> +{
> +	if (cpu_has_extimer)
> +		clear_c0_config6(LOONGSON_CONF6_INTIMER);
> +
> +	return 0;
> +}
> +#endif
> +
>   int r4k_clockevent_init(void)
>   {
>   	unsigned long flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED;
> @@ -325,6 +345,11 @@ int r4k_clockevent_init(void)
>   	cd->set_next_event	= mips_next_event;
>   	cd->event_handler	= mips_event_handler;
>   
> +#ifdef CONFIG_CPU_LOONGSON64
> +	cd->set_state_oneshot	= c0_compare_int_enable;
> +	cd->set_state_shutdown	= c0_compare_int_disable;
> +#endif
> +
>   	clockevents_config_and_register(cd, mips_hpt_frequency, min_delta, 0x7fffffff);
>   
>   	if (cp0_timer_irq_installed)
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 630fcb4cb30e..8a9b028a1df7 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1723,6 +1723,9 @@ static inline void decode_cpucfg(struct cpuinfo_mips *c)
>   	if (cfg2 & LOONGSON_CFG2_LEXT2)
>   		c->ases |= MIPS_ASE_LOONGSON_EXT2;
>   
> +	if (cfg2 & LOONGSON_CFG2_LLFTP)
> +		c->options |= MIPS_CPU_EXTIMER;
> +
>   	if (cfg2 & LOONGSON_CFG2_LSPW) {
>   		c->options |= MIPS_CPU_LDPTE;
>   		c->guest.options |= MIPS_CPU_LDPTE;
> @@ -1780,7 +1783,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>   		 * Also some early Loongson-3A2000 had wrong TLB type in Config
>   		 * register, we correct it here.
>   		 */
> -		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
> +		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE |
> +			      MIPS_CPU_EXTIMER;
>   		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
>   			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
>   		c->ases &= ~MIPS_ASE_VZ; /* VZ of Loongson-3A2000/3000 is incomplete */
> diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
> index edc4afc080fa..b50a24da6528 100644
> --- a/arch/mips/kernel/csrc-r4k.c
> +++ b/arch/mips/kernel/csrc-r4k.c
> @@ -122,9 +122,8 @@ int __init init_r4k_clocksource(void)
>   
>   	clocksource_register_hz(&clocksource_mips, mips_hpt_frequency);
>   
> -#ifndef CONFIG_CPU_FREQ
> -	sched_clock_register(r4k_read_sched_clock, 32, mips_hpt_frequency);
> -#endif
> +	if (!IS_ENABLED(CONFIG_CPU_FREQ) && !plat_have_sched_clock)
> +		sched_clock_register(r4k_read_sched_clock, 32, mips_hpt_frequency);
>   
>   	return 0;
>   }
> diff --git a/arch/mips/kernel/time.c b/arch/mips/kernel/time.c
> index caa01457dce6..baf33da8c79d 100644
> --- a/arch/mips/kernel/time.c
> +++ b/arch/mips/kernel/time.c
> @@ -123,6 +123,9 @@ EXPORT_SYMBOL(perf_irq);
>   unsigned int mips_hpt_frequency;
>   EXPORT_SYMBOL_GPL(mips_hpt_frequency);
>   
> +/* True if platform registered sched_clock by itself */
> +bool plat_have_sched_clock __initdata;
> +
>   static __init int cpu_has_mfc0_count_bug(void)
>   {
>   	switch (current_cpu_type()) {
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 0f5e3983951a..d12e3e4bedd1 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -708,4 +708,14 @@ config MICROCHIP_PIT64B
>   	  modes and high resolution. It is used as a clocksource
>   	  and a clockevent.
>   
> +config LOONGSON_CONST_TIMER
> +	bool "Loongson Constant Timer"
> +	depends on MACH_LOONGSON64
> +	default MACH_LOONGSON64
> +	help
> +	  This option enables Loongson constant timer for Loongson64
> +	  systems. It supports the oneshot, the periodic modes and high
> +	  resolution. It is used as a clocksource and a clockevent, it is
> +	  also accessible in VDSO.
> +
>   endmenu
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index c17ee32a7151..f717a1e06900 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -88,3 +88,4 @@ obj-$(CONFIG_CSKY_MP_TIMER)		+= timer-mp-csky.o
>   obj-$(CONFIG_GX6605S_TIMER)		+= timer-gx6605s.o
>   obj-$(CONFIG_HYPERV_TIMER)		+= hyperv_timer.o
>   obj-$(CONFIG_MICROCHIP_PIT64B)		+= timer-microchip-pit64b.o
> +obj-$(CONFIG_LOONGSON_CONST_TIMER)	+= loongson_const_timer.o
> diff --git a/drivers/clocksource/loongson_const_timer.c b/drivers/clocksource/loongson_const_timer.c
> new file mode 100644
> index 000000000000..3921b8c37092
> --- /dev/null
> +++ b/drivers/clocksource/loongson_const_timer.c
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Loongson64 constant timer driver
> + *
> + * Copyright (C) 2020 Huacai Chen<chenhuacai@loongson.com>
> + * Copyright (C) 2020 Jiaxun Yang<jiaxun.yang@fluygoat.com>
> + */
> +
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/clockchips.h>
> +#include <linux/cpuhotplug.h>
> +#include <linux/sched_clock.h>
> +#include <asm/time.h>
> +#include <asm/mipsregs.h>
> +#include <asm/cevt-r4k.h>
> +#include <loongson.h>
> +#include <loongson_regs.h>
> +
> +static unsigned int constant_timer_irq = -1;
> +
> +static DEFINE_PER_CPU(struct clock_event_device, constant_clockevent_device);
> +
> +static inline unsigned int calc_const_freq(void)
> +{
> +	unsigned int res;
> +	unsigned int base_freq;
> +	unsigned int cfm, cfd;
> +
> +	res = read_cpucfg(LOONGSON_CFG2);
> +	if (!(res & LOONGSON_CFG2_LLFTP))
> +		return 0;
> +
> +	res = read_cpucfg(LOONGSON_CFG5);
> +	cfm = res & 0xffff;
> +	cfd = (res >> 16) & 0xffff;
> +	base_freq = read_cpucfg(LOONGSON_CFG4);
> +
> +	if (!base_freq || !cfm || !cfd)
> +		return 0;
> +	else
> +		return (base_freq * cfm / cfd);
> +}
> +
> +static irqreturn_t handle_constant_timer(int irq, void *data)
> +{
> +	int cpu = smp_processor_id();
> +	struct clock_event_device *cd;
> +
> +	if ((cp0_perfcount_irq < 0) && perf_irq() == IRQ_HANDLED)
> +		return IRQ_HANDLED;
> +
> +	cd = &per_cpu(mips_clockevent_device, cpu);
> +
> +
> +	if (clockevent_state_detached(cd) || clockevent_state_shutdown(cd))
> +		return IRQ_NONE;
> +
> +	if (read_c0_cause() & CAUSEF_TI) {
> +		/* Clear Count/Compare Interrupt */
> +		write_c0_compare(read_c0_compare());
> +		cd = &per_cpu(constant_clockevent_device, cpu);
> +		cd->event_handler(cd);
> +
> +		return IRQ_HANDLED;
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
> +static int constant_set_state_oneshot(struct clock_event_device *evt)
> +{
> +	u64 cfg;
> +
> +	cfg = csr_readq(LOONGSON_CSR_TIMER_CFG);
> +
> +	cfg |= CONSTANT_TIMER_CFG_EN;
> +	cfg &= ~CONSTANT_TIMER_CFG_PERIODIC;
> +
> +	csr_writeq(cfg, LOONGSON_CSR_TIMER_CFG);
> +
> +	set_c0_config6(LOONGSON_CONF6_EXTIMER);
> +
> +	return 0;
> +}
> +
> +static int constant_set_state_periodic(struct clock_event_device *evt)
> +{
> +	unsigned int period;
> +	u64 cfg;
> +
> +	cfg = csr_readq(LOONGSON_CSR_TIMER_CFG);
> +
> +	cfg &= CONSTANT_TIMER_INITVAL_RESET;
> +	cfg |= (CONSTANT_TIMER_CFG_PERIODIC | CONSTANT_TIMER_CFG_EN);
> +
> +	period = calc_const_freq() / HZ;
> +
> +	csr_writeq(cfg | period, LOONGSON_CSR_TIMER_CFG);
> +
> +	set_c0_config6(LOONGSON_CONF6_EXTIMER);
> +
> +	return 0;
> +}
> +
> +static int constant_set_state_shutdown(struct clock_event_device *evt)
> +{
> +	u64 cfg;
> +
> +	clear_c0_config6(LOONGSON_CONF6_EXTIMER);
> +	cfg = csr_readq(LOONGSON_CSR_TIMER_CFG);
> +	cfg &= ~CONSTANT_TIMER_CFG_EN;
> +	csr_writeq(cfg, LOONGSON_CSR_TIMER_CFG);
> +
> +	return 0;
> +}
> +
> +static int constant_next_event(unsigned long delta,
> +				struct clock_event_device *evt)
> +{
> +	csr_writeq(delta | CONSTANT_TIMER_CFG_EN, LOONGSON_CSR_TIMER_CFG);
> +	return 0;
> +}
> +
> +static int constant_init_percpu(unsigned int cpu)
> +{
> +	unsigned int const_freq;
> +	struct clock_event_device *cd;
> +	unsigned long min_delta = 0x600;
> +	unsigned long max_delta = (1UL << 48) - 1;
> +
> +	cd = &per_cpu(constant_clockevent_device, cpu);
> +
> +	const_freq = calc_const_freq();
> +
> +	cd->name = "constant";
> +	cd->features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PERIODIC |
> +		       CLOCK_EVT_FEAT_PERCPU;
> +
> +	cd->rating = 500; /* Higher than cevt-r4k */
> +	cd->irq = constant_timer_irq;
> +	cd->cpumask = cpumask_of(cpu);
> +	cd->set_state_oneshot = constant_set_state_oneshot;
> +	cd->set_state_periodic = constant_set_state_periodic;
> +	cd->set_state_shutdown = constant_set_state_shutdown;
> +	cd->set_next_event = constant_next_event;
> +
> +	clockevents_config_and_register(cd, const_freq, min_delta, max_delta);
> +
> +	return 0;
> +}
> +
> +static int __init constant_clockevent_init(void)
> +{
> +	unsigned long long flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED;
> +
> +	constant_timer_irq = get_c0_compare_int();
> +	if (constant_timer_irq <= 0)
> +		return -ENXIO;
> +
> +	/* Init on CPU0 firstly to keep away from IRQ storm */
> +	constant_init_percpu(0);
> +
> +	if (request_irq(constant_timer_irq, handle_constant_timer, flags,
> +			"constant_timer", handle_constant_timer)) {
> +		pr_err("Failed to request irq %d (constant_timer)\n", constant_timer_irq);
> +		return -ENXIO;
> +	}
> +
> +	cpuhp_setup_state_nocalls(CPUHP_AP_MIPS_CONST_TIMER_STARTING,
> +			  "clockevents/mips/constant/timer:starting",
> +			   constant_init_percpu, NULL);
> +
> +	return 0;
> +}
> +
> +static u64 read_const_counter(void)
> +{
> +	u64 count;
> +
> +	__asm__ __volatile__(
> +		" .set push\n"
> +		" .set mips64r2\n"
> +		" rdhwr   %0, $30\n"
> +		" .set pop\n"
> +		: "=r" (count));
> +
> +	return count;
> +}
> +
> +static u64 csrc_read_const_counter(struct clocksource *clk)
> +{
> +	return read_const_counter();
> +}
> +
> +static struct clocksource clocksource_const = {
> +	.name = "constant",
> +	.rating = 8000,
> +	.read = csrc_read_const_counter,
> +	.mask = CLOCKSOURCE_MASK(64),
> +	.flags = CLOCK_SOURCE_IS_CONTINUOUS,
> +	.vdso_clock_mode = VDSO_CLOCKMODE_CONST,
> +	.mult = 0,
> +	.shift = 10,
> +};
> +
> +static int __init constant_clocksource_init(unsigned long freq)
> +{
> +
> +	clocksource_const.mult =
> +		clocksource_hz2mult(freq, clocksource_const.shift);
> +
> +	return clocksource_register_hz(&clocksource_const, freq);
> +}
> +
> +static void __init constant_sched_clock_init(unsigned long freq)
> +{
> +	plat_have_sched_clock = true;
> +	sched_clock_register(read_const_counter, 64, freq);
> +}
> +
> +int __init constant_timer_init(void)
> +{
> +	u32 ver;
> +	unsigned long freq;
> +
> +	if (!cpu_has_extimer)
> +		return -ENODEV;
> +
> +	if (!cpu_has_csr())
> +		return -ENODEV;
> +
> +	ver = read_cpucfg(LOONGSON_CFG2);
> +	ver &= LOONGSON_CFG2_LLFTPREV;
> +	ver >>= LOONGSON_CFG2_LLFTPREVB;
> +
> +	if (ver < 2)
> +		return -ENODEV;
> +
> +	freq = calc_const_freq();
> +	if (!freq)
> +		return -ENODEV;
> +
> +	constant_clockevent_init();
> +	constant_clocksource_init(freq);
> +	constant_sched_clock_init(freq);
> +
> +	return 0;
> +}
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index ef3f48def8be..0230d13481c8 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -136,6 +136,7 @@ enum cpuhp_state {
>   	CPUHP_AP_ARMADA_TIMER_STARTING,
>   	CPUHP_AP_MARCO_TIMER_STARTING,
>   	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
> +	CPUHP_AP_MIPS_CONST_TIMER_STARTING,
>   	CPUHP_AP_ARC_TIMER_STARTING,
>   	CPUHP_AP_RISCV_TIMER_STARTING,
>   	CPUHP_AP_CLINT_TIMER_STARTING,
