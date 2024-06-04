Return-Path: <linux-mips+bounces-3471-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D11328FABB0
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2024 09:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 349701F225BE
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2024 07:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2316613DDD8;
	Tue,  4 Jun 2024 07:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zbzxmMc+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C2A13790A
	for <linux-mips@vger.kernel.org>; Tue,  4 Jun 2024 07:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717485461; cv=none; b=EWAh0ynUlEkJlx0dK3g3xn5+mMfJcoVcIcaQSX+bBfRN7Qvlr/D9lNpd/GhfiRK0HoJX1PTbxoGWWeQlPY0gEkZHe81ZIr3hWeBvLWtPF/BUijc85K/97I+qsqxNVLt3FKM4phQ7Y19Na/fM4zgtAy/kzE3JaUtN8oA93pIb5qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717485461; c=relaxed/simple;
	bh=ihMqxRk/VtFI4udnTrs57boumk+i6JGSHKak5pghmZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdHs+v/IyOYlz9oimrlBqm2rZvw3lvpy1JU73+DL59rDJuDB0GUl7QJI+IyWw4d1S1PXCqy13MpUMnwbROreg2DWqOS/hsR5fy/F7DK/nNidVTUkKYlxo+Xoy8s1llxNR5kl2on0fb5KfPJSLlUHUfEVORi8A5Nvw5vNVRgAs98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zbzxmMc+; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57a3d21299aso4232493a12.2
        for <linux-mips@vger.kernel.org>; Tue, 04 Jun 2024 00:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717485457; x=1718090257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZh4GXyXthGySEh8Jh54bi/EEYQGahP59URhoB920JA=;
        b=zbzxmMc+XsSRWks2+6HB7e0Atik7atFQbDUblLITvibgAUcdtZ7dDKjzVlBXhVW+YL
         i2J0XR9c5YlpdjgAwjMBvGcCaXOTWxOgOxE3bMO/6/D3gV0t1FAyuHAijdG2icHO1Atz
         yRxxzi0nlXA4d7yx3XIJlJHqG6rtdpy3kNVefLyazMRJzkWX/C/nuwDF3Bst1ULkQlET
         BibAvbVPJGtBN7frVi1DWZWtjuKpF29dlcZk0dpGqieUByZb3CSVCbSCT2mNNcoRe5WH
         7yskndCBnj4JHjlZUnI6y7SgtvpgrHaiw2bfz/MVl8/XW9gPJ4irizlV2gf1enYfv0w+
         NdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717485457; x=1718090257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZh4GXyXthGySEh8Jh54bi/EEYQGahP59URhoB920JA=;
        b=YjESBupWbMLbJV3RPa90rah3BtS9K6pwA9mImHg63uxKlliNtptQQCHsf9QzQSFGR4
         AA5spu6nNj796mg5jpo5ISsi3zmJaN+hxpZk59B0I6k//GZcVmFFwitZjU6B/XWEazeT
         4USrwwzXvPqnEH4dOybdU4ZoQ1LUqGMSBHiIxvJ9K09czeLfFnYiCCsma0yA3zG3PAVd
         qPYVHhNNR+Bk5HA6Ez5/OMxm5bmAwa90oLAgurQGt2ia0Tpubw2FtUynGgLABiox2AlH
         UKdUBb2QTIvzdsVYBN4xoA/bSXEIk5ZKYoqx1uW6fI+4aAyCe2BHB6ntBnoSpjS6YnA+
         WQ0A==
X-Forwarded-Encrypted: i=1; AJvYcCXlZq0fsVtb5xVYuHUjcgzl+i0STTq5nPLADpIQ6xfX2l0+9Ye54otwr79vyU8j0WLmM72gdR2p+zARn1WrwBuTBGpVJ9BuFDD/6w==
X-Gm-Message-State: AOJu0Yy67tr18adhb0z41xwN7K4m11BLBkMpqQf5czRwQMTVuz/Ji7kM
	N1CL3DlAnEYouBPCRnrNvJ/Jy2SeTwRf2Z9krMZHHy9k1ywMC+NtzKLfBV3yqXMTvqoNC/BCFHQ
	0pkBpayMAEyHe9E+s5RSUdOOmdraCV+DGlEIW0w==
X-Google-Smtp-Source: AGHT+IG5nXzjvx8bXEv0WLhOTVNftsgmF2nMmtB6/RD6kKxJCZ3EAghyCVxmEN9671FbFB/+m8n5nxo3C2ICfabzPD4=
X-Received: by 2002:a50:d4d9:0:b0:573:5c18:c2d5 with SMTP id
 4fb4d7f45d1cf-57a36382781mr8548294a12.3.1717485457229; Tue, 04 Jun 2024
 00:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-4-alexghiti@rivosinc.com> <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
 <CAHVXubiKAY_L04ZwYSp-MpPPT5sPzxm4wB6HVFPzsMcB-3zq9w@mail.gmail.com>
 <CAEEQ3wkkNyrjVCDxprNP5Z=NzO=EYeKeWf3CDvVNJHY1uovmMQ@mail.gmail.com> <CAHVXubi+s2Q0y_xLbHpQJpz+yXvKWJ8e96wwAHP6A9C7U-He7g@mail.gmail.com>
In-Reply-To: <CAHVXubi+s2Q0y_xLbHpQJpz+yXvKWJ8e96wwAHP6A9C7U-He7g@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 4 Jun 2024 09:17:26 +0200
Message-ID: <CAHVXubg4vtfjSJ-w8-7suzZ9L5ZmTo8udUMaYjJ5veKBmikNjA@mail.gmail.com>
Subject: Re: [External] [PATCH RFC/RFT v2 3/4] riscv: Stop emitting preventive
 sfence.vma for new vmalloc mappings
To: yunhui cui <cuiyunhui@bytedance.com>, Conor Dooley <conor@kernel.org>
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

On Tue, Jun 4, 2024 at 9:15=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc.=
com> wrote:
>
> Hi Yunhui,
>
> On Tue, Jun 4, 2024 at 8:21=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.co=
m> wrote:
> >
> > Hi Alexandre,
> >
> > On Mon, Jun 3, 2024 at 8:02=E2=80=AFPM Alexandre Ghiti <alexghiti@rivos=
inc.com> wrote:
> > >
> > > Hi Yunhui,
> > >
> > > On Mon, Jun 3, 2024 at 4:26=E2=80=AFAM yunhui cui <cuiyunhui@bytedanc=
e.com> wrote:
> > > >
> > > > Hi Alexandre,
> > > >
> > > > On Thu, Feb 1, 2024 at 12:03=E2=80=AFAM Alexandre Ghiti <alexghiti@=
rivosinc.com> wrote:
> > > > >
> > > > > In 6.5, we removed the vmalloc fault path because that can't work=
 (see
> > > > > [1] [2]). Then in order to make sure that new page table entries =
were
> > > > > seen by the page table walker, we had to preventively emit a sfen=
ce.vma
> > > > > on all harts [3] but this solution is very costly since it relies=
 on IPI.
> > > > >
> > > > > And even there, we could end up in a loop of vmalloc faults if a =
vmalloc
> > > > > allocation is done in the IPI path (for example if it is traced, =
see
> > > > > [4]), which could result in a kernel stack overflow.
> > > > >
> > > > > Those preventive sfence.vma needed to be emitted because:
> > > > >
> > > > > - if the uarch caches invalid entries, the new mapping may not be
> > > > >   observed by the page table walker and an invalidation may be ne=
eded.
> > > > > - if the uarch does not cache invalid entries, a reordered access
> > > > >   could "miss" the new mapping and traps: in that case, we would =
actually
> > > > >   only need to retry the access, no sfence.vma is required.
> > > > >
> > > > > So this patch removes those preventive sfence.vma and actually ha=
ndles
> > > > > the possible (and unlikely) exceptions. And since the kernel stac=
ks
> > > > > mappings lie in the vmalloc area, this handling must be done very=
 early
> > > > > when the trap is taken, at the very beginning of handle_exception=
: this
> > > > > also rules out the vmalloc allocations in the fault path.
> > > > >
> > > > > Link: https://lore.kernel.org/linux-riscv/20230531093817.665799-1=
-bjorn@kernel.org/ [1]
> > > > > Link: https://lore.kernel.org/linux-riscv/20230801090927.2018653-=
1-dylan@andestech.com [2]
> > > > > Link: https://lore.kernel.org/linux-riscv/20230725132246.817726-1=
-alexghiti@rivosinc.com/ [3]
> > > > > Link: https://lore.kernel.org/lkml/20200508144043.13893-1-joro@8b=
ytes.org/ [4]
> > > > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > > > ---
> > > > >  arch/riscv/include/asm/cacheflush.h  | 18 +++++-
> > > > >  arch/riscv/include/asm/thread_info.h |  5 ++
> > > > >  arch/riscv/kernel/asm-offsets.c      |  5 ++
> > > > >  arch/riscv/kernel/entry.S            | 84 ++++++++++++++++++++++=
++++++
> > > > >  arch/riscv/mm/init.c                 |  2 +
> > > > >  5 files changed, 113 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/inc=
lude/asm/cacheflush.h
> > > > > index a129dac4521d..b0d631701757 100644
> > > > > --- a/arch/riscv/include/asm/cacheflush.h
> > > > > +++ b/arch/riscv/include/asm/cacheflush.h
> > > > > @@ -37,7 +37,23 @@ static inline void flush_dcache_page(struct pa=
ge *page)
> > > > >         flush_icache_mm(vma->vm_mm, 0)
> > > > >
> > > > >  #ifdef CONFIG_64BIT
> > > > > -#define flush_cache_vmap(start, end)           flush_tlb_kernel_=
range(start, end)
> > > > > +extern u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
> > > > > +extern char _end[];
> > > > > +#define flush_cache_vmap flush_cache_vmap
> > > > > +static inline void flush_cache_vmap(unsigned long start, unsigne=
d long end)
> > > > > +{
> > > > > +       if (is_vmalloc_or_module_addr((void *)start)) {
> > > > > +               int i;
> > > > > +
> > > > > +               /*
> > > > > +                * We don't care if concurrently a cpu resets thi=
s value since
> > > > > +                * the only place this can happen is in handle_ex=
ception() where
> > > > > +                * an sfence.vma is emitted.
> > > > > +                */
> > > > > +               for (i =3D 0; i < ARRAY_SIZE(new_vmalloc); ++i)
> > > > > +                       new_vmalloc[i] =3D -1ULL;
> > > > > +       }
> > > > > +}
> > > > >  #define flush_cache_vmap_early(start, end)     local_flush_tlb_k=
ernel_range(start, end)
> > > > >  #endif
> > > > >
> > > > > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/in=
clude/asm/thread_info.h
> > > > > index 5d473343634b..32631acdcdd4 100644
> > > > > --- a/arch/riscv/include/asm/thread_info.h
> > > > > +++ b/arch/riscv/include/asm/thread_info.h
> > > > > @@ -60,6 +60,11 @@ struct thread_info {
> > > > >         void                    *scs_base;
> > > > >         void                    *scs_sp;
> > > > >  #endif
> > > > > +       /*
> > > > > +        * Used in handle_exception() to save a0, a1 and a2 befor=
e knowing if we
> > > > > +        * can access the kernel stack.
> > > > > +        */
> > > > > +       unsigned long           a0, a1, a2;
> > > > >  };
> > > > >
> > > > >  #ifdef CONFIG_SHADOW_CALL_STACK
> > > > > diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/=
asm-offsets.c
> > > > > index a03129f40c46..939ddc0e3c6e 100644
> > > > > --- a/arch/riscv/kernel/asm-offsets.c
> > > > > +++ b/arch/riscv/kernel/asm-offsets.c
> > > > > @@ -35,6 +35,8 @@ void asm_offsets(void)
> > > > >         OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
> > > > >         OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
> > > > >         OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
> > > > > +
> > > > > +       OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
> > > > >         OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
> > > > >         OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.pr=
eempt_count);
> > > > >         OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel=
_sp);
> > > > > @@ -42,6 +44,9 @@ void asm_offsets(void)
> > > > >  #ifdef CONFIG_SHADOW_CALL_STACK
> > > > >         OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
> > > > >  #endif
> > > > > +       OFFSET(TASK_TI_A0, task_struct, thread_info.a0);
> > > > > +       OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
> > > > > +       OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
> > > > >
> > > > >         OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
> > > > >         OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
> > > > > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.=
S
> > > > > index 9d1a305d5508..c1ffaeaba7aa 100644
> > > > > --- a/arch/riscv/kernel/entry.S
> > > > > +++ b/arch/riscv/kernel/entry.S
> > > > > @@ -19,6 +19,78 @@
> > > > >
> > > > >         .section .irqentry.text, "ax"
> > > > >
> > > > > +.macro new_vmalloc_check
> > > > > +       REG_S   a0, TASK_TI_A0(tp)
> > > > > +       REG_S   a1, TASK_TI_A1(tp)
> > > > > +       REG_S   a2, TASK_TI_A2(tp)
> > > > > +
> > > > > +       csrr    a0, CSR_CAUSE
> > > > > +       /* Exclude IRQs */
> > > > > +       blt     a0, zero, _new_vmalloc_restore_context
> > > > > +       /* Only check new_vmalloc if we are in page/protection fa=
ult */
> > > > > +       li      a1, EXC_LOAD_PAGE_FAULT
> > > > > +       beq     a0, a1, _new_vmalloc_kernel_address
> > > > > +       li      a1, EXC_STORE_PAGE_FAULT
> > > > > +       beq     a0, a1, _new_vmalloc_kernel_address
> > > > > +       li      a1, EXC_INST_PAGE_FAULT
> > > > > +       bne     a0, a1, _new_vmalloc_restore_context
> > > > > +
> > > > > +_new_vmalloc_kernel_address:
> > > > > +       /* Is it a kernel address? */
> > > > > +       csrr    a0, CSR_TVAL
> > > > > +       bge     a0, zero, _new_vmalloc_restore_context
> > > > > +
> > > > > +       /* Check if a new vmalloc mapping appeared that could exp=
lain the trap */
> > > > > +
> > > > > +       /*
> > > > > +        * Computes:
> > > > > +        * a0 =3D &new_vmalloc[BIT_WORD(cpu)]
> > > > > +        * a1 =3D BIT_MASK(cpu)
> > > > > +        */
> > > > > +       REG_L   a2, TASK_TI_CPU(tp)
> > > > > +       /*
> > > > > +        * Compute the new_vmalloc element position:
> > > > > +        * (cpu / 64) * 8 =3D (cpu >> 6) << 3
> > > > > +        */
> > > > > +       srli    a1, a2, 6
> > > > > +       slli    a1, a1, 3
> > > > > +       la      a0, new_vmalloc
> > > > > +       add     a0, a0, a1
> > > > > +       /*
> > > > > +        * Compute the bit position in the new_vmalloc element:
> > > > > +        * bit_pos =3D cpu % 64 =3D cpu - (cpu / 64) * 64 =3D cpu=
 - (cpu >> 6) << 6
> > > > > +        *         =3D cpu - ((cpu >> 6) << 3) << 3
> > > > > +        */
> > > > > +       slli    a1, a1, 3
> > > > > +       sub     a1, a2, a1
> > > > > +       /* Compute the "get mask": 1 << bit_pos */
> > > > > +       li      a2, 1
> > > > > +       sll     a1, a2, a1
> > > > > +
> > > > > +       /* Check the value of new_vmalloc for this cpu */
> > > > > +       REG_L   a2, 0(a0)
> > > > > +       and     a2, a2, a1
> > > > > +       beq     a2, zero, _new_vmalloc_restore_context
> > > > > +
> > > > > +       /* Atomically reset the current cpu bit in new_vmalloc */
> > > > > +       amoxor.w        a0, a1, (a0)
> > > > > +
> > > > > +       /* Only emit a sfence.vma if the uarch caches invalid ent=
ries */
> > > > > +       ALTERNATIVE("sfence.vma", "nop", 0, RISCV_ISA_EXT_SVVPTC,=
 1)
> > > > > +
> > > > > +       REG_L   a0, TASK_TI_A0(tp)
> > > > > +       REG_L   a1, TASK_TI_A1(tp)
> > > > > +       REG_L   a2, TASK_TI_A2(tp)
> > > > > +       csrw    CSR_SCRATCH, x0
> > > > > +       sret
> > > > > +
> > > > > +_new_vmalloc_restore_context:
> > > > > +       REG_L   a0, TASK_TI_A0(tp)
> > > > > +       REG_L   a1, TASK_TI_A1(tp)
> > > > > +       REG_L   a2, TASK_TI_A2(tp)
> > > > > +.endm
> > > > > +
> > > > > +
> > > > >  SYM_CODE_START(handle_exception)
> > > > >         /*
> > > > >          * If coming from userspace, preserve the user thread poi=
nter and load
> > > > > @@ -30,6 +102,18 @@ SYM_CODE_START(handle_exception)
> > > > >
> > > > >  .Lrestore_kernel_tpsp:
> > > > >         csrr tp, CSR_SCRATCH
> > > > > +
> > > > > +       /*
> > > > > +        * The RISC-V kernel does not eagerly emit a sfence.vma a=
fter each
> > > > > +        * new vmalloc mapping, which may result in exceptions:
> > > > > +        * - if the uarch caches invalid entries, the new mapping=
 would not be
> > > > > +        *   observed by the page table walker and an invalidatio=
n is needed.
> > > > > +        * - if the uarch does not cache invalid entries, a reord=
ered access
> > > > > +        *   could "miss" the new mapping and traps: in that case=
, we only need
> > > > > +        *   to retry the access, no sfence.vma is required.
> > > > > +        */
> > > > > +       new_vmalloc_check
> > > > > +
> > > > >         REG_S sp, TASK_TI_KERNEL_SP(tp)
> > > > >
> > > > >  #ifdef CONFIG_VMAP_STACK
> > > > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > > > index eafc4c2200f2..54c9fdeda11e 100644
> > > > > --- a/arch/riscv/mm/init.c
> > > > > +++ b/arch/riscv/mm/init.c
> > > > > @@ -36,6 +36,8 @@
> > > > >
> > > > >  #include "../kernel/head.h"
> > > > >
> > > > > +u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
> > > > > +
> > > > >  struct kernel_mapping kernel_map __ro_after_init;
> > > > >  EXPORT_SYMBOL(kernel_map);
> > > > >  #ifdef CONFIG_XIP_KERNEL
> > > > > --
> > > > > 2.39.2
> > > > >
> > > > >
> > > >
> > > > Can we consider using new_vmalloc as a percpu variable, so that we
> > > > don't need to add a0/1/2 in thread_info?
> > >
> > > At first, I used percpu variables. But then I realized that percpu
> > > areas are allocated in the vmalloc area, so if somehow we take a trap
> > > when accessing the new_vmalloc percpu variable, we could not recover
> > > from this as we would trap forever in new_vmalloc_check. But
> > > admittedly, not sure that can happen.
> > >
> > > And how would that remove a0, a1 and a2 from thread_info? We'd still
> > > need to save some registers somewhere to access the percpu variable
> > > right?
> > >
> > > > Also, try not to do too much
> > > > calculation logic in new_vmalloc_check, after all, handle_exception=
 is
> > > > a high-frequency path. In this case, can we consider writing
> > > > new_vmalloc_check in C language to increase readability?
> > >
> > > If we write that in C, we don't have the control over the allocated
> > > registers and then we can't correctly save the context.
> >
> > If we use C language, new_vmalloc_check is written just like do_irq(),
> > then we need _save_context, but for new_vmalloc_check, it is not worth
> > the loss, because exceptions from user mode do not need
> > new_vmalloc_check, which also shows that it is reasonable to put
> > new_vmalloc_check after _restore_kernel_tpsp.
> >
> > Saving is necessary. We can save a0, a1, a2 without using thread_info.
> > We can choose to save on the kernel stack of the current tp, but we
> > need to add the following instructions:
> > REG_S sp, TASK_TI_USER_SP(tp)
> > REG_L sp, TASK_TI_KERNEL_SP(tp)
> > addi sp, sp, -(PT_SIZE_ON_STACK)
> > It seems that saving directly on thread_info is more direct, but
> > saving on the kernel stack is more logically consistent, and there is
> > no need to increase the size of thread_info.
>
> You can't save on the kernel stack since kernel stacks are allocated
> in the vmalloc area.
>
> >
> > As for the current status of the patch, there are two points that can
> > be optimized:
> > 1. Some chip hardware implementations may not cache TLB invalid
> > entries, so it doesn't matter whether svvptc is available or not. Can
> > we consider adding a CONFIG_RISCV_SVVPTC to control it?

That would produce a non-portable kernel. But I'm not opposed to that
at all, let me check how we handle other extensions. Maybe @Conor
Dooley has some feedback here?

> >
> > 2. .macro new_vmalloc_check
> > REG_S a0, TASK_TI_A0(tp)
> > REG_S a1, TASK_TI_A1(tp)
> > REG_S a2, TASK_TI_A2(tp)
> > When executing blt a0, zero, _new_vmalloc_restore_context, you can not
> > save a1, a2 first
>
> Ok, I can do that :)
>
> Thanks again for your inputs,
>
> Alex
>
> >
> > >
> > > Thanks for your interest in this patchset :)
> > >
> > > Alex
> > >
> > > >
> > > > Thanks,
> > > > Yunhui
> >
> > Thanks,
> > Yunhui

