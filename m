Return-Path: <linux-mips+bounces-3457-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB678D81D1
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2024 14:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE8201C22710
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2024 12:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F8083A06;
	Mon,  3 Jun 2024 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="mhMRRLxr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7138910949
	for <linux-mips@vger.kernel.org>; Mon,  3 Jun 2024 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717416149; cv=none; b=suLh17DILyxcy2ZvTeN/bstK5EkdQZXqI8rR9knzKCqTBjmd1nIt5xiBLLXp28KokuSoTG7Ail94L39rc5ly34K4fgW2utpUqxQMT+g0tygIBabIyu8NrrQNU/OS9YbSoBqjrAhJMg/fFzJDb7Ay1wBk/B5tk8b8xcZy2U2jDc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717416149; c=relaxed/simple;
	bh=OSTW8r0HUTW5KRhY7Mown9CKgLCCkexuNlcWY+UWKUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsXbDOe6HLx2LVeGah6imcxt/i9EBlJ7MpJ3lAYIkkYsVSh9GofiPuQG1Bwhn7OPlAd265E7pwM4l+ynig8A+PhLb7biLtyxTuEF/AEVSEKVqlDj/DNJBkFRPHOLqTco9gXNHOwq7Mab+eC/VaA9bfH/asOZ9oqJWstzIO9B95A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=mhMRRLxr; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57a4ce82f30so1922521a12.0
        for <linux-mips@vger.kernel.org>; Mon, 03 Jun 2024 05:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717416146; x=1718020946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMOJmLS/Nn9J0SYKlSWYVE6j+qu58H+1OHJ/cgq+xrA=;
        b=mhMRRLxrSdUC9cH/Nquh01Jzc/vezquSQuEYbbonX6nkMjqBB4GjY/Ijhdoa8tLXZ5
         zgywrQilOarLmFMSneFIuCwuY9kYDMSKZTgUFPGJJAPMHuEP5lW5n/DgoN1lghq3x+dy
         hxhLcSBkJj+yE4Q+CeCu5QzAjPPvR/dimmCNj2gUaX/TC4UYNeFyrrBV7b4H1G5tv5Lf
         ekfdP0nWZKtnjkrbS+uC8mpIgaB5eiQ18i8TCnDdy1rR4lCPPgR/3TR8uVVTjkXIOBjd
         AlKkqwEVZNzYfK2rordOvq8S2lDSky1M6hFeIM/GncBVjWmFG537k6nXyb3vEnCANCaP
         UIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717416146; x=1718020946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMOJmLS/Nn9J0SYKlSWYVE6j+qu58H+1OHJ/cgq+xrA=;
        b=omk7CoT1m5njesFLqmdpbDSzYold3qkL4vkfL9Y/4/ykI/5tjSs0CBvvouWUOEnaM2
         UnaGmtwhJwb9NBxg1N78UJnvOJYV8twMpN/I3t5xYUQjn0hDJDAgWn+ueymgGSN/LWSh
         ewE/GKSrmhO6Q954XAEB2jPelMFxVvKAmAZrnoh/KlVFVOCCTaZbMUH4o8zBjL7jnJqt
         uy5b94d+zUpfypvIbw67lrutLy7SeMNxgq2fXX++vPLvqUAPtRoBl1zXMbSNE1LRAhqf
         7RFBsVTYJa8bIlSa8QpEMwro16EgWVarLXVF5Pdwo4cEmJpP/03zlNqWZGIV3tGTiEZx
         p+9g==
X-Forwarded-Encrypted: i=1; AJvYcCUBHulH4xiEdgkK7rrGO5fG9FECbH6UD9TFhAXIZ8+bU5NipSDzbBzSJH4jgTUbnA/42oD1R+U27zQ2AgjzSA8rUEdrcwAF8uZxpw==
X-Gm-Message-State: AOJu0Ywnte1PC/6qX3OrA5NkaSS2Pn4vIqgVSW5Wpb6jr1Ov5KME5yXh
	68JOLlofk7BP5xEvfZLekELo7iinL3hs+pT9981RaPvMJlafrjcYiqURKS/lYpKhKGSRepJc5sW
	ELpBzpY2WP3Nrn6K20muizKJNxI3at9MUZ4Gfig==
X-Google-Smtp-Source: AGHT+IEcNuSPY/6zmXkbJ2ykkTAVjgIdBcvRO/PSDLvgQzilSvNQKgMTHA7oFyKBa29xVYDm6MJBhlpDtDdGT6zZAIU=
X-Received: by 2002:a50:a414:0:b0:579:7b6c:5ab3 with SMTP id
 4fb4d7f45d1cf-57a364e3615mr7699348a12.22.1717416145533; Mon, 03 Jun 2024
 05:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-4-alexghiti@rivosinc.com> <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
In-Reply-To: <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 3 Jun 2024 14:02:14 +0200
Message-ID: <CAHVXubiKAY_L04ZwYSp-MpPPT5sPzxm4wB6HVFPzsMcB-3zq9w@mail.gmail.com>
Subject: Re: [External] [PATCH RFC/RFT v2 3/4] riscv: Stop emitting preventive
 sfence.vma for new vmalloc mappings
To: yunhui cui <cuiyunhui@bytedance.com>
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

Hi Yunhui,

On Mon, Jun 3, 2024 at 4:26=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.com>=
 wrote:
>
> Hi Alexandre,
>
> On Thu, Feb 1, 2024 at 12:03=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosi=
nc.com> wrote:
> >
> > In 6.5, we removed the vmalloc fault path because that can't work (see
> > [1] [2]). Then in order to make sure that new page table entries were
> > seen by the page table walker, we had to preventively emit a sfence.vma
> > on all harts [3] but this solution is very costly since it relies on IP=
I.
> >
> > And even there, we could end up in a loop of vmalloc faults if a vmallo=
c
> > allocation is done in the IPI path (for example if it is traced, see
> > [4]), which could result in a kernel stack overflow.
> >
> > Those preventive sfence.vma needed to be emitted because:
> >
> > - if the uarch caches invalid entries, the new mapping may not be
> >   observed by the page table walker and an invalidation may be needed.
> > - if the uarch does not cache invalid entries, a reordered access
> >   could "miss" the new mapping and traps: in that case, we would actual=
ly
> >   only need to retry the access, no sfence.vma is required.
> >
> > So this patch removes those preventive sfence.vma and actually handles
> > the possible (and unlikely) exceptions. And since the kernel stacks
> > mappings lie in the vmalloc area, this handling must be done very early
> > when the trap is taken, at the very beginning of handle_exception: this
> > also rules out the vmalloc allocations in the fault path.
> >
> > Link: https://lore.kernel.org/linux-riscv/20230531093817.665799-1-bjorn=
@kernel.org/ [1]
> > Link: https://lore.kernel.org/linux-riscv/20230801090927.2018653-1-dyla=
n@andestech.com [2]
> > Link: https://lore.kernel.org/linux-riscv/20230725132246.817726-1-alexg=
hiti@rivosinc.com/ [3]
> > Link: https://lore.kernel.org/lkml/20200508144043.13893-1-joro@8bytes.o=
rg/ [4]
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/cacheflush.h  | 18 +++++-
> >  arch/riscv/include/asm/thread_info.h |  5 ++
> >  arch/riscv/kernel/asm-offsets.c      |  5 ++
> >  arch/riscv/kernel/entry.S            | 84 ++++++++++++++++++++++++++++
> >  arch/riscv/mm/init.c                 |  2 +
> >  5 files changed, 113 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/a=
sm/cacheflush.h
> > index a129dac4521d..b0d631701757 100644
> > --- a/arch/riscv/include/asm/cacheflush.h
> > +++ b/arch/riscv/include/asm/cacheflush.h
> > @@ -37,7 +37,23 @@ static inline void flush_dcache_page(struct page *pa=
ge)
> >         flush_icache_mm(vma->vm_mm, 0)
> >
> >  #ifdef CONFIG_64BIT
> > -#define flush_cache_vmap(start, end)           flush_tlb_kernel_range(=
start, end)
> > +extern u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
> > +extern char _end[];
> > +#define flush_cache_vmap flush_cache_vmap
> > +static inline void flush_cache_vmap(unsigned long start, unsigned long=
 end)
> > +{
> > +       if (is_vmalloc_or_module_addr((void *)start)) {
> > +               int i;
> > +
> > +               /*
> > +                * We don't care if concurrently a cpu resets this valu=
e since
> > +                * the only place this can happen is in handle_exceptio=
n() where
> > +                * an sfence.vma is emitted.
> > +                */
> > +               for (i =3D 0; i < ARRAY_SIZE(new_vmalloc); ++i)
> > +                       new_vmalloc[i] =3D -1ULL;
> > +       }
> > +}
> >  #define flush_cache_vmap_early(start, end)     local_flush_tlb_kernel_=
range(start, end)
> >  #endif
> >
> > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/=
asm/thread_info.h
> > index 5d473343634b..32631acdcdd4 100644
> > --- a/arch/riscv/include/asm/thread_info.h
> > +++ b/arch/riscv/include/asm/thread_info.h
> > @@ -60,6 +60,11 @@ struct thread_info {
> >         void                    *scs_base;
> >         void                    *scs_sp;
> >  #endif
> > +       /*
> > +        * Used in handle_exception() to save a0, a1 and a2 before know=
ing if we
> > +        * can access the kernel stack.
> > +        */
> > +       unsigned long           a0, a1, a2;
> >  };
> >
> >  #ifdef CONFIG_SHADOW_CALL_STACK
> > diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-of=
fsets.c
> > index a03129f40c46..939ddc0e3c6e 100644
> > --- a/arch/riscv/kernel/asm-offsets.c
> > +++ b/arch/riscv/kernel/asm-offsets.c
> > @@ -35,6 +35,8 @@ void asm_offsets(void)
> >         OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
> >         OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
> >         OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
> > +
> > +       OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
> >         OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
> >         OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_=
count);
> >         OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
> > @@ -42,6 +44,9 @@ void asm_offsets(void)
> >  #ifdef CONFIG_SHADOW_CALL_STACK
> >         OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
> >  #endif
> > +       OFFSET(TASK_TI_A0, task_struct, thread_info.a0);
> > +       OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
> > +       OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
> >
> >         OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
> >         OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 9d1a305d5508..c1ffaeaba7aa 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -19,6 +19,78 @@
> >
> >         .section .irqentry.text, "ax"
> >
> > +.macro new_vmalloc_check
> > +       REG_S   a0, TASK_TI_A0(tp)
> > +       REG_S   a1, TASK_TI_A1(tp)
> > +       REG_S   a2, TASK_TI_A2(tp)
> > +
> > +       csrr    a0, CSR_CAUSE
> > +       /* Exclude IRQs */
> > +       blt     a0, zero, _new_vmalloc_restore_context
> > +       /* Only check new_vmalloc if we are in page/protection fault */
> > +       li      a1, EXC_LOAD_PAGE_FAULT
> > +       beq     a0, a1, _new_vmalloc_kernel_address
> > +       li      a1, EXC_STORE_PAGE_FAULT
> > +       beq     a0, a1, _new_vmalloc_kernel_address
> > +       li      a1, EXC_INST_PAGE_FAULT
> > +       bne     a0, a1, _new_vmalloc_restore_context
> > +
> > +_new_vmalloc_kernel_address:
> > +       /* Is it a kernel address? */
> > +       csrr    a0, CSR_TVAL
> > +       bge     a0, zero, _new_vmalloc_restore_context
> > +
> > +       /* Check if a new vmalloc mapping appeared that could explain t=
he trap */
> > +
> > +       /*
> > +        * Computes:
> > +        * a0 =3D &new_vmalloc[BIT_WORD(cpu)]
> > +        * a1 =3D BIT_MASK(cpu)
> > +        */
> > +       REG_L   a2, TASK_TI_CPU(tp)
> > +       /*
> > +        * Compute the new_vmalloc element position:
> > +        * (cpu / 64) * 8 =3D (cpu >> 6) << 3
> > +        */
> > +       srli    a1, a2, 6
> > +       slli    a1, a1, 3
> > +       la      a0, new_vmalloc
> > +       add     a0, a0, a1
> > +       /*
> > +        * Compute the bit position in the new_vmalloc element:
> > +        * bit_pos =3D cpu % 64 =3D cpu - (cpu / 64) * 64 =3D cpu - (cp=
u >> 6) << 6
> > +        *         =3D cpu - ((cpu >> 6) << 3) << 3
> > +        */
> > +       slli    a1, a1, 3
> > +       sub     a1, a2, a1
> > +       /* Compute the "get mask": 1 << bit_pos */
> > +       li      a2, 1
> > +       sll     a1, a2, a1
> > +
> > +       /* Check the value of new_vmalloc for this cpu */
> > +       REG_L   a2, 0(a0)
> > +       and     a2, a2, a1
> > +       beq     a2, zero, _new_vmalloc_restore_context
> > +
> > +       /* Atomically reset the current cpu bit in new_vmalloc */
> > +       amoxor.w        a0, a1, (a0)
> > +
> > +       /* Only emit a sfence.vma if the uarch caches invalid entries *=
/
> > +       ALTERNATIVE("sfence.vma", "nop", 0, RISCV_ISA_EXT_SVVPTC, 1)
> > +
> > +       REG_L   a0, TASK_TI_A0(tp)
> > +       REG_L   a1, TASK_TI_A1(tp)
> > +       REG_L   a2, TASK_TI_A2(tp)
> > +       csrw    CSR_SCRATCH, x0
> > +       sret
> > +
> > +_new_vmalloc_restore_context:
> > +       REG_L   a0, TASK_TI_A0(tp)
> > +       REG_L   a1, TASK_TI_A1(tp)
> > +       REG_L   a2, TASK_TI_A2(tp)
> > +.endm
> > +
> > +
> >  SYM_CODE_START(handle_exception)
> >         /*
> >          * If coming from userspace, preserve the user thread pointer a=
nd load
> > @@ -30,6 +102,18 @@ SYM_CODE_START(handle_exception)
> >
> >  .Lrestore_kernel_tpsp:
> >         csrr tp, CSR_SCRATCH
> > +
> > +       /*
> > +        * The RISC-V kernel does not eagerly emit a sfence.vma after e=
ach
> > +        * new vmalloc mapping, which may result in exceptions:
> > +        * - if the uarch caches invalid entries, the new mapping would=
 not be
> > +        *   observed by the page table walker and an invalidation is n=
eeded.
> > +        * - if the uarch does not cache invalid entries, a reordered a=
ccess
> > +        *   could "miss" the new mapping and traps: in that case, we o=
nly need
> > +        *   to retry the access, no sfence.vma is required.
> > +        */
> > +       new_vmalloc_check
> > +
> >         REG_S sp, TASK_TI_KERNEL_SP(tp)
> >
> >  #ifdef CONFIG_VMAP_STACK
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index eafc4c2200f2..54c9fdeda11e 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -36,6 +36,8 @@
> >
> >  #include "../kernel/head.h"
> >
> > +u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
> > +
> >  struct kernel_mapping kernel_map __ro_after_init;
> >  EXPORT_SYMBOL(kernel_map);
> >  #ifdef CONFIG_XIP_KERNEL
> > --
> > 2.39.2
> >
> >
>
> Can we consider using new_vmalloc as a percpu variable, so that we
> don't need to add a0/1/2 in thread_info?

At first, I used percpu variables. But then I realized that percpu
areas are allocated in the vmalloc area, so if somehow we take a trap
when accessing the new_vmalloc percpu variable, we could not recover
from this as we would trap forever in new_vmalloc_check. But
admittedly, not sure that can happen.

And how would that remove a0, a1 and a2 from thread_info? We'd still
need to save some registers somewhere to access the percpu variable
right?

> Also, try not to do too much
> calculation logic in new_vmalloc_check, after all, handle_exception is
> a high-frequency path. In this case, can we consider writing
> new_vmalloc_check in C language to increase readability?

If we write that in C, we don't have the control over the allocated
registers and then we can't correctly save the context.

Thanks for your interest in this patchset :)

Alex

>
> Thanks,
> Yunhui

