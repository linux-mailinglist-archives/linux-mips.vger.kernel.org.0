Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 249FB2E8EE
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2019 01:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfE2XSB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 May 2019 19:18:01 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:49285 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfE2XSB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 May 2019 19:18:01 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1A10D8365B
        for <linux-mips@vger.kernel.org>; Thu, 30 May 2019 11:17:56 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1559171876;
        bh=Dy7uOt76j9SP8JSYx3ykKHAeQOK2/EECk16ZRlar8mc=;
        h=From:To:CC:Subject:Date:References;
        b=bMbKQN81RXvLUiUaOPCu8YbCwAvdsUG3fz4+rPmgZUQdb6qdQJVqQ2px7Dh3a0tws
         6MdG+l3HyJHe07dj94U9mIgWUZQDczwOlFeJdZ+7xmaLm2+ippt/qwpRNzLW1keN48
         W6B+rOSJ+0CVV0DpputBjYlhowLkmgxeYadyu7czDoxNC72+cjbzUVWF/xa/0LEpnA
         vvhN6p425NqKjgLyKX6SvLHBhmjQQNDKMLRO1Y789JZx1X3B0zoBQjwKwgipc+J5Do
         cy6sYGOcFgvS4xCwrzosr6dKbNTFXnei5x4w8h5d0gdXc1NjtK6cDQUAFXY1uYYYyG
         yIDv8sQzDjXAg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5cef13220000>; Thu, 30 May 2019 11:17:54 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Thu, 30 May 2019 11:17:50 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Thu, 30 May 2019 11:17:50 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: Re: [PATCH] MIPS: mm: Implement flush_cache_v(un)map using
 __flush_kernel_vmap_range
Thread-Topic: [PATCH] MIPS: mm: Implement flush_cache_v(un)map using
 __flush_kernel_vmap_range
Thread-Index: AQHVFnB5YovAim0EQkayK4UYoyN+Zw==
Date:   Wed, 29 May 2019 23:17:50 +0000
Message-ID: <27d08fadfad14988a1f289fd2a0219f0@svr-chch-ex1.atlnz.lc>
References: <20190528221255.22460-1-chris.packham@alliedtelesis.co.nz>
 <20190529224659.27614-1-paul.burton@mips.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,=0A=
=0A=
On 30/05/19 10:47 AM, Paul Burton wrote:=0A=
> Our flush_cache_vmap() & flush_cache_vunmap() implementations for R4k=0A=
> style systems simply call r4k_blast_dcache() to wipe out the whole L1=0A=
> dcache if it suffers from aliases. This is unsafe on SMP for 2 reasons:=
=0A=
> =0A=
> 1) r4k_blast_dcache() relies upon preemption being disabled so that it=0A=
>     can use current_cpu_data/smp_processor_id() to discover the=0A=
>     properties of the current CPU's dcache & ensure the whole flush=0A=
>     operation happens on one CPU. This may not be the case when=0A=
>     flush_cache_vmap() or flush_cache_vunmap() are called.=0A=
> =0A=
> 2) It only flushes caches on one CPU, which means the caches for other=0A=
>     CPUs may still contain stale data.=0A=
> =0A=
> We already have an implementation of flush_kernel_vmap_range() which=0A=
> does exactly what we need - it invalidates dcache entries on all CPUs=0A=
> safely, and is better optimized to avoid wiping out the entire cache for=
=0A=
> small flushes.=0A=
> =0A=
> Reimplement flush_cache_vmap() & flush_cache_vunmap() using=0A=
> __flush_kernel_vmap_range() which does what we need already.=0A=
> =0A=
> For tx39 __flush_kernel_vmap_range() will simply BUG(), but so far as I=
=0A=
> can see tx39 systems don't suffer from dcache aliasing so this should be=
=0A=
> fine since it should never be called.=0A=
> =0A=
> Signed-off-by: Paul Burton <paul.burton@mips.com>=0A=
> Reported-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
> ---=0A=
> Chris, would you mind giving this a try?=0A=
=0A=
This doesn't quite seem to work. It avoids the BUG() but I get other bad =
=0A=
behavior. I can't discount it being something odd about my half finished =
=0A=
port but I can replicate the badness without this patch.=0A=
=0A=
One is a kernel panic in response to activity on the console (output =0A=
below). The other seems to be a result of receiving garbage on the =0A=
console. I wonder if the range needs to be rounded up to a cacheline =0A=
boundary?=0A=
=0A=
Run /sbin/init as init process=0A=
overlayfs: upper fs does not support xattr, falling back to index=3Doff =0A=
and metacopy=3Doff.=0A=
overlayfs: upper fs does not support xattr, falling back to index=3Doff =0A=
and metacopy=3Doff.=0A=
overlayfs: upper fs does not support xattr, falling back to index=3Doff =0A=
and metacopy=3Doff.=0A=
random: crng init done=0A=
CPU 0 Unable to handle kernel paging request at virtual address =0A=
00000000, epc =3D=3D 80652e00, ra =3D=3D 80652dc4=0A=
Oops[#1]:=0A=
CPU: 0 PID: 7 Comm: kworker/u4:0 Not tainted 5.1.0-at1 #15=0A=
Workqueue: events_unbound flush_to_ldisc=0A=
$ 0   : 00000000 00000001 00000000 00000000=0A=
$ 4   : 8f82aa00 fffffff8 fffffffd 00000001=0A=
$ 8   : 8da08818 00000000 00000001 00000018=0A=
$12   : fefefeff 7f7f7f7f 00000001 00000001=0A=
$16   : c00e1268 c00e126c 00000002 8f84bd18=0A=
$20   : 8da08819 83fa6e00 00000001 c00e1270=0A=
$24   : 0000c3b6 80336694=0A=
$28   : 8f84a000 8f84bcf0 0000000d 80652dc4=0A=
Hi    : d49c5168=0A=
Lo    : 7f29931c=0A=
epc   : 80652e00 __mutex_lock.isra.1+0xa8/0x464=0A=
ra    : 80652dc4 __mutex_lock.isra.1+0x6c/0x464=0A=
Status: 10008f03        KERNEL EXL IE=0A=
Cause : 0080000c (ExcCode 03)=0A=
BadVA : 00000000=0A=
PrId  : 0002a080 (Broadcom BMIPS4350)=0A=
Modules linked in:=0A=
Process kworker/u4:0 (pid: 7, threadinfo=3Df89f9771, task=3Da0a456a2, =0A=
tls=3D00000000)=0A=
Stack : 00000002 8064f534 8f82aa80 8f82aa80 6b2dc12d 8006b2c8 8090fc78 =0A=
83fa6e6c=0A=
         83fa6e6c 8064f4a4 c00e1270 00000000 83fa6e6c 8064f534 c00df000 =0A=
83fa6e00=0A=
         c00e1268 00000000 8da08819 83fa6e00 00000001 c00df018 0000000d =0A=
80334b50=0A=
         83fa6e6c 80654aa0 fffb8a00 80790000 83fa6e00 0000000a c00df000 =0A=
803358a0=0A=
         8f84bd70 00000000 00000000 8da08818 00000000 00000000 8da08818 =0A=
80336520=0A=
         ...=0A=
Call Trace:=0A=
[<80652e00>] __mutex_lock.isra.1+0xa8/0x464=0A=
[<80334b50>] commit_echoes+0x28/0xc4=0A=
[<803358a0>] n_tty_receive_char_special+0xa20/0xc04=0A=
[<80336520>] n_tty_receive_buf_common+0xa9c/0xc10=0A=
[<803366ac>] n_tty_receive_buf2+0x18/0x24=0A=
[<8033a6b8>] tty_port_default_receive_buf+0x50/0xa4=0A=
[<80339fc4>] flush_to_ldisc+0xb8/0x12c=0A=
[<80052098>] process_one_work+0x224/0x424=0A=
[<80052400>] worker_thread+0x168/0x5a0=0A=
[<8005882c>] kthread+0x13c/0x144=0A=
[<80015e6c>] ret_from_kernel_thread+0x14/0x1c=0A=
Code: afa2002c  ae13000c  afb70028 <ac530000> 8e020008  105300b6 =0A=
00000000  8f820000  afa20030=0A=
=0A=
=0A=
=0A=
> ---=0A=
>   arch/mips/include/asm/cacheflush.h | 28 ++++++++++++----------------=0A=
>   arch/mips/mm/c-r4k.c               | 15 ---------------=0A=
>   arch/mips/mm/c-tx39.c              | 16 ----------------=0A=
>   arch/mips/mm/cache.c               |  3 ---=0A=
>   4 files changed, 12 insertions(+), 50 deletions(-)=0A=
> =0A=
> diff --git a/arch/mips/include/asm/cacheflush.h b/arch/mips/include/asm/c=
acheflush.h=0A=
> index d687b40b9fbb..6285c830c9f2 100644=0A=
> --- a/arch/mips/include/asm/cacheflush.h=0A=
> +++ b/arch/mips/include/asm/cacheflush.h=0A=
> @@ -85,22 +85,6 @@ extern void (*__flush_icache_user_range)(unsigned long=
 start,=0A=
>   extern void (*__local_flush_icache_user_range)(unsigned long start,=0A=
>   					       unsigned long end);=0A=
>   =0A=
> -extern void (*__flush_cache_vmap)(void);=0A=
> -=0A=
> -static inline void flush_cache_vmap(unsigned long start, unsigned long e=
nd)=0A=
> -{=0A=
> -	if (cpu_has_dc_aliases)=0A=
> -		__flush_cache_vmap();=0A=
> -}=0A=
> -=0A=
> -extern void (*__flush_cache_vunmap)(void);=0A=
> -=0A=
> -static inline void flush_cache_vunmap(unsigned long start, unsigned long=
 end)=0A=
> -{=0A=
> -	if (cpu_has_dc_aliases)=0A=
> -		__flush_cache_vunmap();=0A=
> -}=0A=
> -=0A=
>   extern void copy_to_user_page(struct vm_area_struct *vma,=0A=
>   	struct page *page, unsigned long vaddr, void *dst, const void *src,=0A=
>   	unsigned long len);=0A=
> @@ -150,4 +134,16 @@ static inline void invalidate_kernel_vmap_range(void=
 *vaddr, int size)=0A=
>   		__flush_kernel_vmap_range((unsigned long) vaddr, size);=0A=
>   }=0A=
>   =0A=
> +static inline void flush_cache_vmap(unsigned long start, unsigned long e=
nd)=0A=
> +{=0A=
> +	if (cpu_has_dc_aliases)=0A=
> +		__flush_kernel_vmap_range(start, end - start);=0A=
> +}=0A=
> +=0A=
> +static inline void flush_cache_vunmap(unsigned long start, unsigned long=
 end)=0A=
> +{=0A=
> +	if (cpu_has_dc_aliases)=0A=
> +		__flush_kernel_vmap_range(start, end - start);=0A=
> +}=0A=
> +=0A=
>   #endif /* _ASM_CACHEFLUSH_H */=0A=
> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c=0A=
> index 5166e38cd1c6..2b2953d3949d 100644=0A=
> --- a/arch/mips/mm/c-r4k.c=0A=
> +++ b/arch/mips/mm/c-r4k.c=0A=
> @@ -559,16 +559,6 @@ static inline int has_valid_asid(const struct mm_str=
uct *mm, unsigned int type)=0A=
>   	return 0;=0A=
>   }=0A=
>   =0A=
> -static void r4k__flush_cache_vmap(void)=0A=
> -{=0A=
> -	r4k_blast_dcache();=0A=
> -}=0A=
> -=0A=
> -static void r4k__flush_cache_vunmap(void)=0A=
> -{=0A=
> -	r4k_blast_dcache();=0A=
> -}=0A=
> -=0A=
>   /*=0A=
>    * Note: flush_tlb_range() assumes flush_cache_range() sufficiently flu=
shes=0A=
>    * whole caches when vma is executable.=0A=
> @@ -1854,9 +1844,6 @@ void r4k_cache_init(void)=0A=
>   	else=0A=
>   		shm_align_mask =3D PAGE_SIZE-1;=0A=
>   =0A=
> -	__flush_cache_vmap	=3D r4k__flush_cache_vmap;=0A=
> -	__flush_cache_vunmap	=3D r4k__flush_cache_vunmap;=0A=
> -=0A=
>   	flush_cache_all		=3D cache_noop;=0A=
>   	__flush_cache_all	=3D r4k___flush_cache_all;=0A=
>   	flush_cache_mm		=3D r4k_flush_cache_mm;=0A=
> @@ -1931,8 +1918,6 @@ void r4k_cache_init(void)=0A=
>   	case CPU_LOONGSON3:=0A=
>   		/* Loongson-3 maintains cache coherency by hardware */=0A=
>   		__flush_cache_all	=3D cache_noop;=0A=
> -		__flush_cache_vmap	=3D cache_noop;=0A=
> -		__flush_cache_vunmap	=3D cache_noop;=0A=
>   		__flush_kernel_vmap_range =3D (void *)cache_noop;=0A=
>   		flush_cache_mm		=3D (void *)cache_noop;=0A=
>   		flush_cache_page	=3D (void *)cache_noop;=0A=
> diff --git a/arch/mips/mm/c-tx39.c b/arch/mips/mm/c-tx39.c=0A=
> index b7c8a9d79c35..6bf13a7db485 100644=0A=
> --- a/arch/mips/mm/c-tx39.c=0A=
> +++ b/arch/mips/mm/c-tx39.c=0A=
> @@ -121,16 +121,6 @@ static inline void tx39_blast_icache(void)=0A=
>   	local_irq_restore(flags);=0A=
>   }=0A=
>   =0A=
> -static void tx39__flush_cache_vmap(void)=0A=
> -{=0A=
> -	tx39_blast_dcache();=0A=
> -}=0A=
> -=0A=
> -static void tx39__flush_cache_vunmap(void)=0A=
> -{=0A=
> -	tx39_blast_dcache();=0A=
> -}=0A=
> -=0A=
>   static inline void tx39_flush_cache_all(void)=0A=
>   {=0A=
>   	if (!cpu_has_dc_aliases)=0A=
> @@ -339,8 +329,6 @@ void tx39_cache_init(void)=0A=
>   	switch (current_cpu_type()) {=0A=
>   	case CPU_TX3912:=0A=
>   		/* TX39/H core (writethru direct-map cache) */=0A=
> -		__flush_cache_vmap	=3D tx39__flush_cache_vmap;=0A=
> -		__flush_cache_vunmap	=3D tx39__flush_cache_vunmap;=0A=
>   		flush_cache_all =3D tx39h_flush_icache_all;=0A=
>   		__flush_cache_all	=3D tx39h_flush_icache_all;=0A=
>   		flush_cache_mm		=3D (void *) tx39h_flush_icache_all;=0A=
> @@ -363,10 +351,6 @@ void tx39_cache_init(void)=0A=
>   	default:=0A=
>   		/* TX39/H2,H3 core (writeback 2way-set-associative cache) */=0A=
>   		/* board-dependent init code may set WBON */=0A=
> -=0A=
> -		__flush_cache_vmap	=3D tx39__flush_cache_vmap;=0A=
> -		__flush_cache_vunmap	=3D tx39__flush_cache_vunmap;=0A=
> -=0A=
>   		flush_cache_all =3D tx39_flush_cache_all;=0A=
>   		__flush_cache_all =3D tx39___flush_cache_all;=0A=
>   		flush_cache_mm =3D tx39_flush_cache_mm;=0A=
> diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c=0A=
> index 3da216988672..c6c0ef539d3a 100644=0A=
> --- a/arch/mips/mm/cache.c=0A=
> +++ b/arch/mips/mm/cache.c=0A=
> @@ -40,9 +40,6 @@ EXPORT_SYMBOL_GPL(__flush_icache_user_range);=0A=
>   void (*__local_flush_icache_user_range)(unsigned long start, unsigned l=
ong end);=0A=
>   EXPORT_SYMBOL_GPL(__local_flush_icache_user_range);=0A=
>   =0A=
> -void (*__flush_cache_vmap)(void);=0A=
> -void (*__flush_cache_vunmap)(void);=0A=
> -=0A=
>   void (*__flush_kernel_vmap_range)(unsigned long vaddr, int size);=0A=
>   EXPORT_SYMBOL_GPL(__flush_kernel_vmap_range);=0A=
>   =0A=
> =0A=
=0A=
