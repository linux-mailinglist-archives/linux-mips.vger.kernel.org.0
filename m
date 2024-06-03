Return-Path: <linux-mips+bounces-3456-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A38D7A12
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2024 04:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E1C22812EB
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2024 02:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B1E5244;
	Mon,  3 Jun 2024 02:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ONnfAoLU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA0F64F
	for <linux-mips@vger.kernel.org>; Mon,  3 Jun 2024 02:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717381583; cv=none; b=RSYvvDHDeqdNgFLIjzoQ/gxXVAhiw6ICNaVwjbg8XBz6Nr70DrklgdmvlVDC5sQ7XkrpEjt5kfgYNRTRUp3bmoQL35IvDK7Is56+zyEYFlC18fh+8H1vRHIGPFHIa0oE/6UXr7ccMm4oVGaxqYgiDObCPIPPdZX5mSkYxfGvG2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717381583; c=relaxed/simple;
	bh=VcBQiR2OYmf8AeOtnmZBDKa8g7k93RIcBCMCtIVYYZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaOzXkAt+9XeyHIeZofqxPBOPwaOYQIxDsxRq3e4rts2umPXZFLfIqhy+maH/tQpr092KntaOZWIvIgzvgUDjnsPyE7/ZygMQiAp17dPCztU9ly7Guv34Eo3fmy0iQFFATzlF8jTG7Yx7hhdlgELMZlhAwlVTicTi0vFP1XLLng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ONnfAoLU; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d1c1f4bbf5so2362942b6e.0
        for <linux-mips@vger.kernel.org>; Sun, 02 Jun 2024 19:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1717381580; x=1717986380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FVO8FfbvRSq3lInIu0BX0h7ckGi2C3dp5Cu4roUh7Y=;
        b=ONnfAoLUAna+tlcvCabFuk5FJdSLAIRV39Gs2VdjRM/D02ZwtBwE01dc023fP6+O6j
         ygEev0483vCxH73wj+xXkj3GSeI6Mbmj003RS62FECcAylsU0oQyWYmsSE1wqxxS22DR
         UCGhdtR74aGy7r6oqhfNJztqi2J8/T9ASorKPOkf6KWGPc2YtdigRTCuEvloltCe89SW
         y5XGv1USJeazDDBR0eBNSRpoLQOSGr15e4F+QGQF+DOiEtyBp/pZaFR+EZVzw7YIuW5D
         Cwld/OSWf5XDvJ58CA5cZCusXqb0Sv4sYpNMgFkDlo/J4/Jw4JqApmTm5tagZ41WWzS4
         vMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717381580; x=1717986380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FVO8FfbvRSq3lInIu0BX0h7ckGi2C3dp5Cu4roUh7Y=;
        b=axjO2Ybm8bvxy4YGN5FAHhbHXYVsA+OxWcfnLLl8XSYS7MKsHEmjFxjO/VysgdE6qP
         px+FqUbl9gTuwl9SMqxeoPsi9r2SKHMjiHGgiNbourC14h+iw1p6G/FiLSVwjRBRwHte
         s4ksp6gYGckjgOkXw2CepGNH4i2OL8LC2dUXE8EAM6VTZt3dnBoO2tkZHES7/uEUCdgw
         pSdkOzp/tSqFjfeHGlKmbz2qM0YMLI4FlR2N6STT6V/odBc7xP/aEllnN7tl7Y3jxZpo
         32nqg10bpasFiOSIKrPqqi9AcLS+/92OGJe5UCkiZIjsxV9CbZgwnSPFEkWcqUhKbJnQ
         Pmpg==
X-Forwarded-Encrypted: i=1; AJvYcCWX97znNVSh6SKLRzqDyUXsAeXFSCTkRNZIRRQ3bFS5JQJ6bAusO2ewPtQGCKA42twHzfXOWReUBr3gjBoT9eViuNQFzlnas5MCZw==
X-Gm-Message-State: AOJu0YzceZ71aaN3RxY0ZT5j4xtMA+x2OS2iH39IawM3NGExEXhvLH4X
	L9ed5CkcXkM2Y5BAyd6koWsIBp1C1v4PgVEWzYoUINaBH/G6rlxHaLEVKyqT/gASjTNCtomGDtc
	oO0Lvn5dbyRKQ3aBhYegl2XBQqZccb+ZYsqzzyQ==
X-Google-Smtp-Source: AGHT+IGCM0LMNQOovDp9kRtkZJlNH3sjfjIsZCkVxfHkVGktafrBKJCLQKJDpHSDg3IP3UkbyTARIWGa6hF9KT8otKE=
X-Received: by 2002:a05:6870:55ce:b0:24f:df31:9bbf with SMTP id
 586e51a60fabf-2508bcb8b9bmr9214174fac.39.1717381580128; Sun, 02 Jun 2024
 19:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com> <20240131155929.169961-4-alexghiti@rivosinc.com>
In-Reply-To: <20240131155929.169961-4-alexghiti@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 3 Jun 2024 10:26:09 +0800
Message-ID: <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
Subject: Re: [External] [PATCH RFC/RFT v2 3/4] riscv: Stop emitting preventive
 sfence.vma for new vmalloc mappings
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Ved Shanbhogue <ved@rivosinc.com>, Matt Evans <mev@rivosinc.com>, Dylan Jhong <dylan@andestech.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Thu, Feb 1, 2024 at 12:03=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> In 6.5, we removed the vmalloc fault path because that can't work (see
> [1] [2]). Then in order to make sure that new page table entries were
> seen by the page table walker, we had to preventively emit a sfence.vma
> on all harts [3] but this solution is very costly since it relies on IPI.
>
> And even there, we could end up in a loop of vmalloc faults if a vmalloc
> allocation is done in the IPI path (for example if it is traced, see
> [4]), which could result in a kernel stack overflow.
>
> Those preventive sfence.vma needed to be emitted because:
>
> - if the uarch caches invalid entries, the new mapping may not be
>   observed by the page table walker and an invalidation may be needed.
> - if the uarch does not cache invalid entries, a reordered access
>   could "miss" the new mapping and traps: in that case, we would actually
>   only need to retry the access, no sfence.vma is required.
>
> So this patch removes those preventive sfence.vma and actually handles
> the possible (and unlikely) exceptions. And since the kernel stacks
> mappings lie in the vmalloc area, this handling must be done very early
> when the trap is taken, at the very beginning of handle_exception: this
> also rules out the vmalloc allocations in the fault path.
>
> Link: https://lore.kernel.org/linux-riscv/20230531093817.665799-1-bjorn@k=
ernel.org/ [1]
> Link: https://lore.kernel.org/linux-riscv/20230801090927.2018653-1-dylan@=
andestech.com [2]
> Link: https://lore.kernel.org/linux-riscv/20230725132246.817726-1-alexghi=
ti@rivosinc.com/ [3]
> Link: https://lore.kernel.org/lkml/20200508144043.13893-1-joro@8bytes.org=
/ [4]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/cacheflush.h  | 18 +++++-
>  arch/riscv/include/asm/thread_info.h |  5 ++
>  arch/riscv/kernel/asm-offsets.c      |  5 ++
>  arch/riscv/kernel/entry.S            | 84 ++++++++++++++++++++++++++++
>  arch/riscv/mm/init.c                 |  2 +
>  5 files changed, 113 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm=
/cacheflush.h
> index a129dac4521d..b0d631701757 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -37,7 +37,23 @@ static inline void flush_dcache_page(struct page *page=
)
>         flush_icache_mm(vma->vm_mm, 0)
>
>  #ifdef CONFIG_64BIT
> -#define flush_cache_vmap(start, end)           flush_tlb_kernel_range(st=
art, end)
> +extern u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
> +extern char _end[];
> +#define flush_cache_vmap flush_cache_vmap
> +static inline void flush_cache_vmap(unsigned long start, unsigned long e=
nd)
> +{
> +       if (is_vmalloc_or_module_addr((void *)start)) {
> +               int i;
> +
> +               /*
> +                * We don't care if concurrently a cpu resets this value =
since
> +                * the only place this can happen is in handle_exception(=
) where
> +                * an sfence.vma is emitted.
> +                */
> +               for (i =3D 0; i < ARRAY_SIZE(new_vmalloc); ++i)
> +                       new_vmalloc[i] =3D -1ULL;
> +       }
> +}
>  #define flush_cache_vmap_early(start, end)     local_flush_tlb_kernel_ra=
nge(start, end)
>  #endif
>
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/as=
m/thread_info.h
> index 5d473343634b..32631acdcdd4 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -60,6 +60,11 @@ struct thread_info {
>         void                    *scs_base;
>         void                    *scs_sp;
>  #endif
> +       /*
> +        * Used in handle_exception() to save a0, a1 and a2 before knowin=
g if we
> +        * can access the kernel stack.
> +        */
> +       unsigned long           a0, a1, a2;
>  };
>
>  #ifdef CONFIG_SHADOW_CALL_STACK
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offs=
ets.c
> index a03129f40c46..939ddc0e3c6e 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -35,6 +35,8 @@ void asm_offsets(void)
>         OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>         OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>         OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
> +
> +       OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>         OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
>         OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_co=
unt);
>         OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
> @@ -42,6 +44,9 @@ void asm_offsets(void)
>  #ifdef CONFIG_SHADOW_CALL_STACK
>         OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
>  #endif
> +       OFFSET(TASK_TI_A0, task_struct, thread_info.a0);
> +       OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
> +       OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
>
>         OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
>         OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 9d1a305d5508..c1ffaeaba7aa 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -19,6 +19,78 @@
>
>         .section .irqentry.text, "ax"
>
> +.macro new_vmalloc_check
> +       REG_S   a0, TASK_TI_A0(tp)
> +       REG_S   a1, TASK_TI_A1(tp)
> +       REG_S   a2, TASK_TI_A2(tp)
> +
> +       csrr    a0, CSR_CAUSE
> +       /* Exclude IRQs */
> +       blt     a0, zero, _new_vmalloc_restore_context
> +       /* Only check new_vmalloc if we are in page/protection fault */
> +       li      a1, EXC_LOAD_PAGE_FAULT
> +       beq     a0, a1, _new_vmalloc_kernel_address
> +       li      a1, EXC_STORE_PAGE_FAULT
> +       beq     a0, a1, _new_vmalloc_kernel_address
> +       li      a1, EXC_INST_PAGE_FAULT
> +       bne     a0, a1, _new_vmalloc_restore_context
> +
> +_new_vmalloc_kernel_address:
> +       /* Is it a kernel address? */
> +       csrr    a0, CSR_TVAL
> +       bge     a0, zero, _new_vmalloc_restore_context
> +
> +       /* Check if a new vmalloc mapping appeared that could explain the=
 trap */
> +
> +       /*
> +        * Computes:
> +        * a0 =3D &new_vmalloc[BIT_WORD(cpu)]
> +        * a1 =3D BIT_MASK(cpu)
> +        */
> +       REG_L   a2, TASK_TI_CPU(tp)
> +       /*
> +        * Compute the new_vmalloc element position:
> +        * (cpu / 64) * 8 =3D (cpu >> 6) << 3
> +        */
> +       srli    a1, a2, 6
> +       slli    a1, a1, 3
> +       la      a0, new_vmalloc
> +       add     a0, a0, a1
> +       /*
> +        * Compute the bit position in the new_vmalloc element:
> +        * bit_pos =3D cpu % 64 =3D cpu - (cpu / 64) * 64 =3D cpu - (cpu =
>> 6) << 6
> +        *         =3D cpu - ((cpu >> 6) << 3) << 3
> +        */
> +       slli    a1, a1, 3
> +       sub     a1, a2, a1
> +       /* Compute the "get mask": 1 << bit_pos */
> +       li      a2, 1
> +       sll     a1, a2, a1
> +
> +       /* Check the value of new_vmalloc for this cpu */
> +       REG_L   a2, 0(a0)
> +       and     a2, a2, a1
> +       beq     a2, zero, _new_vmalloc_restore_context
> +
> +       /* Atomically reset the current cpu bit in new_vmalloc */
> +       amoxor.w        a0, a1, (a0)
> +
> +       /* Only emit a sfence.vma if the uarch caches invalid entries */
> +       ALTERNATIVE("sfence.vma", "nop", 0, RISCV_ISA_EXT_SVVPTC, 1)
> +
> +       REG_L   a0, TASK_TI_A0(tp)
> +       REG_L   a1, TASK_TI_A1(tp)
> +       REG_L   a2, TASK_TI_A2(tp)
> +       csrw    CSR_SCRATCH, x0
> +       sret
> +
> +_new_vmalloc_restore_context:
> +       REG_L   a0, TASK_TI_A0(tp)
> +       REG_L   a1, TASK_TI_A1(tp)
> +       REG_L   a2, TASK_TI_A2(tp)
> +.endm
> +
> +
>  SYM_CODE_START(handle_exception)
>         /*
>          * If coming from userspace, preserve the user thread pointer and=
 load
> @@ -30,6 +102,18 @@ SYM_CODE_START(handle_exception)
>
>  .Lrestore_kernel_tpsp:
>         csrr tp, CSR_SCRATCH
> +
> +       /*
> +        * The RISC-V kernel does not eagerly emit a sfence.vma after eac=
h
> +        * new vmalloc mapping, which may result in exceptions:
> +        * - if the uarch caches invalid entries, the new mapping would n=
ot be
> +        *   observed by the page table walker and an invalidation is nee=
ded.
> +        * - if the uarch does not cache invalid entries, a reordered acc=
ess
> +        *   could "miss" the new mapping and traps: in that case, we onl=
y need
> +        *   to retry the access, no sfence.vma is required.
> +        */
> +       new_vmalloc_check
> +
>         REG_S sp, TASK_TI_KERNEL_SP(tp)
>
>  #ifdef CONFIG_VMAP_STACK
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index eafc4c2200f2..54c9fdeda11e 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -36,6 +36,8 @@
>
>  #include "../kernel/head.h"
>
> +u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
> +
>  struct kernel_mapping kernel_map __ro_after_init;
>  EXPORT_SYMBOL(kernel_map);
>  #ifdef CONFIG_XIP_KERNEL
> --
> 2.39.2
>
>

Can we consider using new_vmalloc as a percpu variable, so that we
don't need to add a0/1/2 in thread_info? Also, try not to do too much
calculation logic in new_vmalloc_check, after all, handle_exception is
a high-frequency path. In this case, can we consider writing
new_vmalloc_check in C language to increase readability?

Thanks,
Yunhui

