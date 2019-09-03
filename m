Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83CA6A61A4
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2019 08:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfICGlA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 02:41:00 -0400
Received: from forward102j.mail.yandex.net ([5.45.198.243]:33221 "EHLO
        forward102j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726200AbfICGk7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Sep 2019 02:40:59 -0400
Received: from mxback26j.mail.yandex.net (mxback26j.mail.yandex.net [IPv6:2a02:6b8:0:1619::226])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id 888A9F21838;
        Tue,  3 Sep 2019 09:40:57 +0300 (MSK)
Received: from smtp1o.mail.yandex.net (smtp1o.mail.yandex.net [2a02:6b8:0:1a2d::25])
        by mxback26j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id fhxiKFb5wn-euISMYKP;
        Tue, 03 Sep 2019 09:40:57 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567492857;
        bh=5vL3AzmdJ013a9uGD+A132J1A5mrbRaDgBAaJx/ambY=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=JdvsHT33KsEM2Z2OrF9Mu5XXmNgJw7YR8hJpVIwsw5DguDNWdaPqytv3O0hDa5WCT
         ezWxx6culnFmnPPTo3YjQKR4h+tmxxnGOf3OUUIlAT29wCc2nTrypGKoeo1nfqIvm4
         h4Rk+2iFxPFfKCPb9BYW+/lha+wUoRdL8EHG6brQ=
Authentication-Results: mxback26j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id e317fgvXkd-emvqVNS1;
        Tue, 03 Sep 2019 09:40:52 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH 2/3] MIPS: Loongson: Add Loongson-3A R4 basic support
To:     Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@linux-mips.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
References: <1567324193-7340-1-git-send-email-chenhc@lemote.com>
 <1567324193-7340-2-git-send-email-chenhc@lemote.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <01fba58c-48bf-7418-e9dc-850636860f91@flygoat.com>
Date:   Tue, 3 Sep 2019 14:39:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1567324193-7340-2-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


ÔÚ 2019/9/1 15:49, Huacai Chen Ð´µÀ:
> All Loongson-3 CPU family:
>
> Code-name         Brand-name       PRId
> Loongson-3A R1    Loongson-3A1000  0x6305
> Loongson-3A R2    Loongson-3A2000  0x6308
> Loongson-3A R2.1  Loongson-3A2000  0x630c
> Loongson-3A R3    Loongson-3A3000  0x6309
> Loongson-3A R3.1  Loongson-3A3000  0x630d
> Loongson-3A R4    Loongson-3A4000  0xc000
> Loongson-3B R1    Loongson-3B1000  0x6306
> Loongson-3B R2    Loongson-3B1500  0x6307
>
> Features of R4 revision of Loongson-3A:
>
>    - All R2/R3 features, including SFB, V-Cache, FTLB, RIXI, DSP, etc.
>    - Support variable ASID bits.
>    - Support MSA and VZ extensions.
>    - Support CPUCFG (CPU config) and CSR (Control and Status Register)
>        extensions.
>    - 64 entries of VTLB (classic TLB), 2048 entries of FTLB (8-way
>        set-associative).
>
> Now 64-bit Loongson processors has three types of PRID.IMP: 0x6300 is
> the classic one so we call it PRID_IMP_LOONGSON_64C (e.g., Loongson-2E/
> 2F/3A1000/3B1000/3B1500/3A2000/3A3000), 0x6100 is for some processors
> which has reduced capabilities so we call it PRID_IMP_LOONGSON_64R
> (e.g., Loongson-2K), 0xc000 is supposed to cover all new processors in
> general (e.g., Loongson-3A4000+) so we call it PRID_IMP_LOONGSON_64G.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/Kconfig                                  |  2 +
>   arch/mips/include/asm/cpu.h                        |  4 +-
>   .../asm/mach-loongson64/kernel-entry-init.h        | 28 +++++--
>   arch/mips/kernel/cpu-probe.c                       | 15 +++-
>   arch/mips/kernel/idle.c                            |  3 +-
>   arch/mips/loongson64/loongson-3/smp.c              | 90 ++++++++++++----------
>   arch/mips/mm/c-r4k.c                               |  3 +-
>   drivers/platform/mips/cpu_hwmon.c                  | 14 +++-
>   8 files changed, 107 insertions(+), 52 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 31c7044..3afcbce 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1378,9 +1378,11 @@ config CPU_LOONGSON3
>   	select CPU_SUPPORTS_64BIT_KERNEL
>   	select CPU_SUPPORTS_HIGHMEM
>   	select CPU_SUPPORTS_HUGEPAGES
> +	select CPU_SUPPORTS_MSA
>   	select CPU_HAS_LOAD_STORE_LR
>   	select WEAK_ORDERING
>   	select WEAK_REORDERING_BEYOND_LLSC
> +	select MIPS_ASID_BITS_VARIABLE
>   	select MIPS_PGD_C0_CONTEXT
>   	select MIPS_L1_CACHE_SHIFT_6
>   	select GPIOLIB
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index 7fddcb8..81ddb57 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -91,7 +91,9 @@
>   #define PRID_IMP_LOONGSON_32	0x4200  /* Loongson-1 */
>   #define PRID_IMP_R5432		0x5400
>   #define PRID_IMP_R5500		0x5500
> -#define PRID_IMP_LOONGSON_64	0x6300  /* Loongson-2/3 */
> +#define PRID_IMP_LOONGSON_64R	0x6100  /* Reduced Loongson-2 */
> +#define PRID_IMP_LOONGSON_64C	0x6300  /* Classic Loongson-2 and Loongson-3 */
> +#define PRID_IMP_LOONGSON_64G	0xc000  /* Generic Loongson-2 and Loongson-3 */
>   
>   #define PRID_IMP_UNKNOWN	0xff00
>   
> diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
> index b5e288a..b968732 100644
> --- a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
> +++ b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
> @@ -30,13 +30,21 @@
>   	mtc0	t0, CP0_PAGEGRAIN
>   	/* Enable STFill Buffer */
>   	mfc0	t0, CP0_PRID
> +	/* Loongson-3A R4+ */

Hi Huacai,

For 3A R4+, Firmware will take care of SFB switch according tu Ruiyang 
Wu, the chief architect's words, are we still going to do that?

> +	andi	t1, t0, PRID_IMP_MASK
> +	li	t2, PRID_IMP_LOONGSON_64G
> +	beq     t1, t2, 1f
> +	nop
> +	/* Loongson-3A R2/R3 */
>   	andi	t0, (PRID_IMP_MASK | PRID_REV_MASK)
> -	slti	t0, (PRID_IMP_LOONGSON_64 | PRID_REV_LOONGSON3A_R2_0)
> -	bnez	t0, 1f
> +	slti	t0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0)
> +	bnez	t0, 2f
> +	nop
> +1:
>   	mfc0	t0, CP0_CONFIG6
>   	or	t0, 0x100
>   	mtc0	t0, CP0_CONFIG6
> -1:
> +2:
>   	_ehb
>   	.set	pop
>   #endif
> @@ -59,13 +67,21 @@
>   	mtc0	t0, CP0_PAGEGRAIN
>   	/* Enable STFill Buffer */
>   	mfc0	t0, CP0_PRID
> +	/* Loongson-3A R4+ */
> +	andi	t1, t0, PRID_IMP_MASK
> +	li	t2, PRID_IMP_LOONGSON_64G
> +	beq     t1, t2, 1f
> +	nop
The same.
> +	/* Loongson-3A R2/R3 */
>   	andi	t0, (PRID_IMP_MASK | PRID_REV_MASK)
> -	slti	t0, (PRID_IMP_LOONGSON_64 | PRID_REV_LOONGSON3A_R2_0)
> -	bnez	t0, 1f
> +	slti	t0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0)
> +	bnez	t0, 2f
> +	nop
> +1:
>   	mfc0	t0, CP0_CONFIG6
>   	or	t0, 0x100
>   	mtc0	t0, CP0_CONFIG6
> -1:
> +2:
>   	_ehb
>   	.set	pop
>   #endif
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index c2eb392..09b2c67 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1526,7 +1526,7 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
>   			     MIPS_CPU_LLSC | MIPS_CPU_BP_GHIST;
>   		c->tlbsize = 64;
>   		break;
> -	case PRID_IMP_LOONGSON_64:  /* Loongson-2/3 */
> +	case PRID_IMP_LOONGSON_64C:  /* Loongson-2/3 */
>   		switch (c->processor_id & PRID_REV_MASK) {
>   		case PRID_REV_LOONGSON2E:
>   			c->cputype = CPU_LOONGSON2;
> @@ -1903,7 +1903,7 @@ static inline void cpu_probe_cavium(struct cpuinfo_mips *c, unsigned int cpu)
>   static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>   {
>   	switch (c->processor_id & PRID_IMP_MASK) {
> -	case PRID_IMP_LOONGSON_64:  /* Loongson-2/3 */
> +	case PRID_IMP_LOONGSON_64C:  /* Loongson-2/3 */
>   		switch (c->processor_id & PRID_REV_MASK) {
>   		case PRID_REV_LOONGSON3A_R2_0:
>   		case PRID_REV_LOONGSON3A_R2_1:
> @@ -1927,6 +1927,17 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>   		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
>   			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
>   		break;
> +	case PRID_IMP_LOONGSON_64G:
> +		c->cputype = CPU_LOONGSON3;
> +		__cpu_name[cpu] = "ICT Loongson-3";
> +		set_elf_platform(cpu, "loongson3a");
> +		set_isa(c, MIPS_CPU_ISA_M64R2);
> +		decode_configs(c);
> +		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
CPUCFG Register have bits to mark these features (ASEs, UCA). As we 
would never know what features would next Loongson product have, we'd 
better probe features by CPUCFG rather than PRID.
> +		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
> +		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
> +			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
> +		break;
>   	default:
>   		panic("Unknown Loongson Processor ID!");
>   		break;
> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index eb2afc0..980d6c3 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -179,7 +179,8 @@ void __init check_wait(void)
>   		cpu_wait = r4k_wait;
>   		break;
>   	case CPU_LOONGSON3:
> -		if ((c->processor_id & PRID_REV_MASK) >= PRID_REV_LOONGSON3A_R2_0)
> +		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
> +				(PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0))
>   			cpu_wait = r4k_wait;
The same. Probably we can have a Loongson feature flag in kernel to help 
with determining these features as PRID would never be a reliable way. 
As Yunqiang said, "I blame these Loongson guys here. Some Loongson guys 
is not so normal people. Anyway they are a little more normal now, and 
anyway again, still abnormal." You can never predict what will they do 
next. But the thing we can do is just reduce the cost of covering their 
next abnormal action in kernel.
>   		break;
>   
> diff --git a/arch/mips/loongson64/loongson-3/smp.c b/arch/mips/loongson64/loongson-3/smp.c
> index ce68cda..e999bb1 100644
> --- a/arch/mips/loongson64/loongson-3/smp.c
> +++ b/arch/mips/loongson64/loongson-3/smp.c
> @@ -450,7 +450,7 @@ static void loongson3_cpu_die(unsigned int cpu)
>    * flush all L1 entries at first. Then, another core (usually Core 0) can
>    * safely disable the clock of the target core. loongson3_play_dead() is
>    * called via CKSEG1 (uncached and unmmaped) */
> -static void loongson3a_r1_play_dead(int *state_addr)
> +static void loongson3_type1_play_dead(int *state_addr)
>   {
>   	register int val;
>   	register long cpuid, core, node, count;
> @@ -512,7 +512,7 @@ static void loongson3a_r1_play_dead(int *state_addr)
>   		: "a1");
>   }
>   
> -static void loongson3a_r2r3_play_dead(int *state_addr)
> +static void loongson3_type2_play_dead(int *state_addr)
>   {
>   	register int val;
>   	register long cpuid, core, node, count;
> @@ -532,27 +532,7 @@ static void loongson3a_r2r3_play_dead(int *state_addr)
>   		"   cache 1, 3(%[addr])           \n"
>   		"   addiu %[sets], %[sets], -1    \n"
>   		"   bnez  %[sets], 1b             \n"
> -		"   addiu %[addr], %[addr], 0x40  \n"
> -		"   li %[addr], 0x80000000        \n" /* KSEG0 */
> -		"2: cache 2, 0(%[addr])           \n" /* flush L1 VCache */
> -		"   cache 2, 1(%[addr])           \n"
> -		"   cache 2, 2(%[addr])           \n"
> -		"   cache 2, 3(%[addr])           \n"
> -		"   cache 2, 4(%[addr])           \n"
> -		"   cache 2, 5(%[addr])           \n"
> -		"   cache 2, 6(%[addr])           \n"
> -		"   cache 2, 7(%[addr])           \n"
> -		"   cache 2, 8(%[addr])           \n"
> -		"   cache 2, 9(%[addr])           \n"
> -		"   cache 2, 10(%[addr])          \n"
> -		"   cache 2, 11(%[addr])          \n"
> -		"   cache 2, 12(%[addr])          \n"
> -		"   cache 2, 13(%[addr])          \n"
> -		"   cache 2, 14(%[addr])          \n"
> -		"   cache 2, 15(%[addr])          \n"
> -		"   addiu %[vsets], %[vsets], -1  \n"
> -		"   bnez  %[vsets], 2b            \n"
> -		"   addiu %[addr], %[addr], 0x40  \n"
> +		"   addiu %[addr], %[addr], 0x20  \n"
>   		"   li    %[val], 0x7             \n" /* *state_addr = CPU_DEAD; */
>   		"   sw    %[val], (%[state_addr]) \n"
>   		"   sync                          \n"
> @@ -560,8 +540,7 @@ static void loongson3a_r2r3_play_dead(int *state_addr)
>   		"   .set pop                      \n"
>   		: [addr] "=&r" (addr), [val] "=&r" (val)
>   		: [state_addr] "r" (state_addr),
> -		  [sets] "r" (cpu_data[smp_processor_id()].dcache.sets),
> -		  [vsets] "r" (cpu_data[smp_processor_id()].vcache.sets));
> +		  [sets] "r" (cpu_data[smp_processor_id()].dcache.sets));
>   
>   	__asm__ __volatile__(
>   		"   .set push                         \n"
> @@ -576,6 +555,8 @@ static void loongson3a_r2r3_play_dead(int *state_addr)
>   		"   andi  %[node], %[cpuid], 0xc      \n"
>   		"   dsll  %[node], 42                 \n" /* get node id */
>   		"   or    %[base], %[base], %[node]   \n"
> +		"   dsrl  %[node], 30                 \n" /* 15:14 */
> +		"   or    %[base], %[base], %[node]   \n"
>   		"1: li    %[count], 0x100             \n" /* wait for init loop */
>   		"2: bnez  %[count], 2b                \n" /* limit mailbox access */
>   		"   addiu %[count], -1                \n"
> @@ -595,7 +576,7 @@ static void loongson3a_r2r3_play_dead(int *state_addr)
>   		: "a1");
>   }
>   
> -static void loongson3b_play_dead(int *state_addr)
> +static void loongson3_type3_play_dead(int *state_addr)
>   {
>   	register int val;
>   	register long cpuid, core, node, count;
> @@ -615,7 +596,27 @@ static void loongson3b_play_dead(int *state_addr)
>   		"   cache 1, 3(%[addr])           \n"
>   		"   addiu %[sets], %[sets], -1    \n"
>   		"   bnez  %[sets], 1b             \n"
> -		"   addiu %[addr], %[addr], 0x20  \n"
> +		"   addiu %[addr], %[addr], 0x40  \n"
> +		"   li %[addr], 0x80000000        \n" /* KSEG0 */
> +		"2: cache 2, 0(%[addr])           \n" /* flush L1 VCache */
> +		"   cache 2, 1(%[addr])           \n"
> +		"   cache 2, 2(%[addr])           \n"
> +		"   cache 2, 3(%[addr])           \n"
> +		"   cache 2, 4(%[addr])           \n"
> +		"   cache 2, 5(%[addr])           \n"
> +		"   cache 2, 6(%[addr])           \n"
> +		"   cache 2, 7(%[addr])           \n"
> +		"   cache 2, 8(%[addr])           \n"
> +		"   cache 2, 9(%[addr])           \n"
> +		"   cache 2, 10(%[addr])          \n"
> +		"   cache 2, 11(%[addr])          \n"
> +		"   cache 2, 12(%[addr])          \n"
> +		"   cache 2, 13(%[addr])          \n"
> +		"   cache 2, 14(%[addr])          \n"
> +		"   cache 2, 15(%[addr])          \n"
> +		"   addiu %[vsets], %[vsets], -1  \n"
> +		"   bnez  %[vsets], 2b            \n"
> +		"   addiu %[addr], %[addr], 0x40  \n"
>   		"   li    %[val], 0x7             \n" /* *state_addr = CPU_DEAD; */
>   		"   sw    %[val], (%[state_addr]) \n"
>   		"   sync                          \n"
> @@ -623,7 +624,8 @@ static void loongson3b_play_dead(int *state_addr)
>   		"   .set pop                      \n"
>   		: [addr] "=&r" (addr), [val] "=&r" (val)
>   		: [state_addr] "r" (state_addr),
> -		  [sets] "r" (cpu_data[smp_processor_id()].dcache.sets));
> +		  [sets] "r" (cpu_data[smp_processor_id()].dcache.sets),
> +		  [vsets] "r" (cpu_data[smp_processor_id()].vcache.sets));
>   
>   	__asm__ __volatile__(
>   		"   .set push                         \n"
> @@ -638,8 +640,6 @@ static void loongson3b_play_dead(int *state_addr)
>   		"   andi  %[node], %[cpuid], 0xc      \n"
>   		"   dsll  %[node], 42                 \n" /* get node id */
>   		"   or    %[base], %[base], %[node]   \n"
> -		"   dsrl  %[node], 30                 \n" /* 15:14 */
> -		"   or    %[base], %[base], %[node]   \n"
>   		"1: li    %[count], 0x100             \n" /* wait for init loop */
>   		"2: bnez  %[count], 2b                \n" /* limit mailbox access */
>   		"   addiu %[count], -1                \n"
> @@ -661,30 +661,42 @@ static void loongson3b_play_dead(int *state_addr)
>   
>   void play_dead(void)
>   {
> -	int *state_addr;
> +	int prid_imp, prid_rev, *state_addr;
>   	unsigned int cpu = smp_processor_id();
>   	void (*play_dead_at_ckseg1)(int *);
>   
>   	idle_task_exit();
> -	switch (read_c0_prid() & PRID_REV_MASK) {
> +
> +	prid_imp = read_c0_prid() & PRID_IMP_MASK;
> +	prid_rev = read_c0_prid() & PRID_REV_MASK;
> +
> +	if (prid_imp == PRID_IMP_LOONGSON_64G) {
> +		play_dead_at_ckseg1 =
> +			(void *)CKSEG1ADDR((unsigned long)loongson3_type3_play_dead);
> +		goto out;
> +	}
> +
> +	switch (prid_rev) {
>   	case PRID_REV_LOONGSON3A_R1:
>   	default:
>   		play_dead_at_ckseg1 =
> -			(void *)CKSEG1ADDR((unsigned long)loongson3a_r1_play_dead);
> +			(void *)CKSEG1ADDR((unsigned long)loongson3_type1_play_dead);
> +		break;
> +	case PRID_REV_LOONGSON3B_R1:
> +	case PRID_REV_LOONGSON3B_R2:
> +		play_dead_at_ckseg1 =
> +			(void *)CKSEG1ADDR((unsigned long)loongson3_type2_play_dead);
>   		break;
>   	case PRID_REV_LOONGSON3A_R2_0:
>   	case PRID_REV_LOONGSON3A_R2_1:
>   	case PRID_REV_LOONGSON3A_R3_0:
>   	case PRID_REV_LOONGSON3A_R3_1:
>   		play_dead_at_ckseg1 =
> -			(void *)CKSEG1ADDR((unsigned long)loongson3a_r2r3_play_dead);
> -		break;
> -	case PRID_REV_LOONGSON3B_R1:
> -	case PRID_REV_LOONGSON3B_R2:
> -		play_dead_at_ckseg1 =
> -			(void *)CKSEG1ADDR((unsigned long)loongson3b_play_dead);
> +			(void *)CKSEG1ADDR((unsigned long)loongson3_type3_play_dead);
>   		break;
>   	}
> +
> +out:
>   	state_addr = &per_cpu(cpu_state, cpu);
>   	mb();
>   	play_dead_at_ckseg1(state_addr);

Things we're doing in playdead are mostly duplicated. Flushing cache, 
broadcasting CPU state, then doing loops to wait a mailbox PC. Probably 
we can reuse r4k cache ops here to avoid too much assembly. And reuse 
Mailbox loop code as they're almost the same.

--

Jiaxun Yang

> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> index 89b9c85..4bf9906 100644
> --- a/arch/mips/mm/c-r4k.c
> +++ b/arch/mips/mm/c-r4k.c
> @@ -1267,7 +1267,8 @@ static void probe_pcache(void)
>   					  c->dcache.ways *
>   					  c->dcache.linesz;
>   		c->dcache.waybit = 0;
> -		if ((prid & PRID_REV_MASK) >= PRID_REV_LOONGSON3A_R2_0)
> +		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
> +				(PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0))
>   			c->options |= MIPS_CPU_PREFETCH;
>   		break;
>   
> diff --git a/drivers/platform/mips/cpu_hwmon.c b/drivers/platform/mips/cpu_hwmon.c
> index a7f184b..15ca8bf 100644
> --- a/drivers/platform/mips/cpu_hwmon.c
> +++ b/drivers/platform/mips/cpu_hwmon.c
> @@ -9,6 +9,7 @@
>   #include <loongson.h>
>   #include <boot_param.h>
>   #include <loongson_hwmon.h>
> +#include <loongson_regs.h>
>   
>   /*
>    * Loongson-3 series cpu has two sensors inside,
> @@ -18,10 +19,17 @@
>    */
>   int loongson3_cpu_temp(int cpu)
>   {
> -	u32 reg, prid_rev;
> +	u32 reg, prid_imp, prid_rev;
>   
> -	reg = LOONGSON_CHIPTEMP(cpu);
> +	prid_imp = read_c0_prid() & PRID_IMP_MASK;
>   	prid_rev = read_c0_prid() & PRID_REV_MASK;
> +
> +	if(prid_imp == PRID_IMP_LOONGSON_64G) {
> +		reg = (csr_readl(LOONGSON_CSR_CPUTEMP) & 0xff);
> +		goto out;
> +	}
> +
> +	reg = LOONGSON_CHIPTEMP(cpu);
>   	switch (prid_rev) {
>   	case PRID_REV_LOONGSON3A_R1:
>   		reg = (reg >> 8) & 0xff;
> @@ -37,6 +45,8 @@ int loongson3_cpu_temp(int cpu)
>   		reg = (reg & 0xffff)*731/0x4000 - 273;
>   		break;
>   	}
> +
> +out:
>   	return (int)reg * 1000;
>   }
>   
