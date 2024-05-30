Return-Path: <linux-mips+bounces-3412-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C108D48AD
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 11:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 388CAB26AEF
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 09:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7346F30E;
	Thu, 30 May 2024 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OKwOr0OP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8776F315
	for <linux-mips@vger.kernel.org>; Thu, 30 May 2024 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717061730; cv=none; b=nOQeNjBlU3baGRZs0mc7T0Ck6dJgJVcqnulAyEtzx/gurcq3+K9w6uF7HaWKn2qyHjz6xk/ia5jSytFRdduRZJYc9lvzjBk8gtLSFIRZBZEx8ZUiBtZMw8eOOk7M/dIpV5HnlxHhC2xAyqhWDO3DKMGspf0ZVd9EeYh4jotsPp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717061730; c=relaxed/simple;
	bh=fjkXIremmoZmlou8OGomK4d7XuR+f9e1/ohh3sWxQWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nd/3wbrEVd7ILHat6Ch0lJj/zdHks2asoUH3lvPtFwQvwqrICoNV/CR6hCHGycBGS4c1x9XDD8fTcVm7IzGs49I9GXgaCo5TMwgVp080S0lJ+htQL+lFneQLA9r370PBDnbJFi6bocOHkcS34lRWg/q0gLSUxETz1otGtg3Z1AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OKwOr0OP; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-24ca079af98so393214fac.3
        for <linux-mips@vger.kernel.org>; Thu, 30 May 2024 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1717061727; x=1717666527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIKK60Me9RhDM5LPzOVIbg3hAvv72+j6Tp3QihasYZ0=;
        b=OKwOr0OPhgIovH6ETpTz4mJfPB19eY2jLtiFdOh1RQVmqNHOMVqoM7UMGVC39Fy1m9
         Mlw1QZF6fG1OayhLymZyu6PGY2vpzas8LrsWfnvUwYw/8oN6OBueJCHYTR1dYeybBSjp
         ++ugn405rm1bDlPletv2oLVXjl/I2GB69KrRW+qv+imMfQlh/pDdq7Siwxi3y/vTp4IM
         3f64Cj7/Kphj/s/6E+UO/wVq0BZepc+cpHmaTbyl6PxfkgnhuIHeCkvSnmCsrNy9XbIl
         8fCZfM+6Du8TfdwvazLd1qC8VYA0yViDz+MjPtDxWAv0p0BYzLabjZToD7JsqqcN+K2K
         +ZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717061727; x=1717666527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIKK60Me9RhDM5LPzOVIbg3hAvv72+j6Tp3QihasYZ0=;
        b=qdWVt62OYzcmVp5XLIw/ov7fu6zeVhwnich6Uuyg5VJNgg6TMuxD3fvIR0Jmd17bJQ
         MoTW/k6nm99/bjFFa5HI8oScb/ampm9yJ71Uwa0WwDp/73qFAHnLJ69R6zFZgtxDPYN/
         /hwoHCA78whO4w2YB69vJPaektgHuOhpC219WjPvE5C+N3jVTUE7a8opBYn5YzalKLxV
         6+o676S3tlfnJ9mWsUCbNfdP9dmbHdtIFm1yVAhZcYgDyNOmAlJ64ye30805mqp8sfX6
         qhJ+j/3K1+hB8jHrjITKP/jn7kqmpnXnwPSt8NeCatgpbzSEAV43DN+036qlJMZAW7uH
         kZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCLP12radEEvy4VXdDjqLhSuY3EYjmiodW7el4tFOjGFi/W05u2NohpNEoxVH27Mpttrjgu/lNIA4S/7QMW2MPxj/Bk3zi7wpoLA==
X-Gm-Message-State: AOJu0Yz/PemVfLN2MZz5hVa4noM/3Tsmouc6EGapd2wQd7h53TPzqdAD
	3MDYTaFkZoTcBkrGII+9YCirhMbBLSYZRQjEncv1Eskrq0sYzX3u6baJ9Ird2gOgdxbTwmYQEvB
	0Z6CZxQrZarOCrV9BLbC3WwtQVY0sSjzZG1/VuA==
X-Google-Smtp-Source: AGHT+IGQo/4+Bcec7GR4w4t9VuGgDnfgRuIzi4gbmVB9EXNZxFk4++tYC42KZVEUtna/+lcQBmHO84N93cneyoHhbbs=
X-Received: by 2002:a05:6871:3329:b0:24c:ac96:ac78 with SMTP id
 586e51a60fabf-25060de9e8amr1722957fac.44.1717061727430; Thu, 30 May 2024
 02:35:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com> <20240131155929.169961-5-alexghiti@rivosinc.com>
In-Reply-To: <20240131155929.169961-5-alexghiti@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 30 May 2024 17:35:16 +0800
Message-ID: <CAEEQ3wnmCr5NTEFo3wTN_zWse2DPkE6ieVUk_=Vv7A-UzDCCvQ@mail.gmail.com>
Subject: Re: [External] [PATCH RFC/RFT v2 4/4] riscv: Stop emitting preventive
 sfence.vma for new userspace mappings with Svvptc
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

Hi Alex,

On Thu, Feb 1, 2024 at 12:04=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> The preventive sfence.vma were emitted because new mappings must be made
> visible to the page table walker but Svvptc guarantees that xRET act as
> a fence, so no need to sfence.vma for the uarchs that implement this
> extension.
>
> This allows to drastically reduce the number of sfence.vma emitted:
>
> * Ubuntu boot to login:
> Before: ~630k sfence.vma
> After:  ~200k sfence.vma
>
> * ltp - mmapstress01
> Before: ~45k
> After:  ~6.3k
>
> * lmbench - lat_pagefault
> Before: ~665k
> After:   832 (!)
>
> * lmbench - lat_mmap
> Before: ~546k
> After:   718 (!)
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 16 +++++++++++++++-
>  arch/riscv/mm/pgtable.c          | 13 +++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 0c94260b5d0c..50986e4c4601 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -473,6 +473,9 @@ static inline void update_mmu_cache_range(struct vm_f=
ault *vmf,
>                 struct vm_area_struct *vma, unsigned long address,
>                 pte_t *ptep, unsigned int nr)
>  {
> +       asm_volatile_goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA=
_EXT_SVVPTC, 1)
> +                         : : : : svvptc);
> +
>         /*
>          * The kernel assumes that TLBs don't cache invalid entries, but
>          * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
> @@ -482,12 +485,23 @@ static inline void update_mmu_cache_range(struct vm=
_fault *vmf,
>          */
>         while (nr--)
>                 local_flush_tlb_page(address + nr * PAGE_SIZE);
> +
> +svvptc:
> +       /*
> +        * Svvptc guarantees that xRET act as a fence, so when the uarch =
does
> +        * not cache invalid entries, we don't have to do anything.
> +        */
> +       ;
>  }

From the perspective of RISC-V arch, the logic of this patch is
reasonable. The code of mm comm submodule may be missing
update_mmu_cache_range(), for example: there is no flush TLB in
remap_pte_range() after updating pte.
I will send a patch to mm/ to fix this problem next.


Thanks,
Yunhui

