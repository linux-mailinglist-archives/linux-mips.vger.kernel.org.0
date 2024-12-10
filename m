Return-Path: <linux-mips+bounces-6927-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF1C9EA693
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 04:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBC86188A53F
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 03:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C4C1D5CF8;
	Tue, 10 Dec 2024 03:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yn0QGp7Y"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3033B644;
	Tue, 10 Dec 2024 03:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733801239; cv=none; b=c7bSbybQoLeK0X/G1kZ7a040U2iVQxqJxCjIwDftj90YNjZVJ2MK+wFQL4yqu5DerYq2rQF6sgmHRDQnAc+xdHjMzqnOOCnugSK3lHZDFVPVisIf8yAGhC911OmM0hWJgDYARoYxeU5jDbr6wwXrtNLEoQEbKqZFffH0P+gtb1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733801239; c=relaxed/simple;
	bh=LlXvsVxs1ZBGsstwIB3bDPbexaTDwqyvZf6awYEUQxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YaIBMHQdakKgagqHj4mAvVpwt16cPefSGbc+cacGAH1n6sdNNEr01j3mBm9nU5tKbG4iMkAbqV2vplaqfjRevicwEfveSo8w0ms6kJbK75El/kVnWo/jnVaULCaf5w4yiWVprPheuSB/Bm54R9wWokdA/P7NPZHsgJTxz1F0O60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yn0QGp7Y; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so5584595a12.3;
        Mon, 09 Dec 2024 19:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733801236; x=1734406036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zw8KjUeVLCoeUttHvlAE11LYFS9kka7RYPFB87xdCOo=;
        b=Yn0QGp7YvF8+o3h0o80tR9NWuDMNMUdzL2Ytmazolc9CYX4gE8LRVs2MS3lrHV/Mol
         rs0tx0Iec3t+XmU/R0djpjWQ135ifnZGr4xpyolR+cfOJtmeUP0B7L+uZbFz0lU1iefx
         VCElq8KJJNYG0zi6aHYbeuUISEZjcq/215w/FQCFdovVqjP14/YiSxnsLGxGH9Sqmfeq
         0hJSjn9I34y2tiyzFD99GpqH69YUbwR9uSusg1cmhntNTTMHVm8K+3+DiqPO2PSm1M0A
         jEWqc703meWTveIaoJy5V1yPrDRq4IYjCcuJwgAAKMX63PbysrxApj0WOaaXUk01d+Nh
         rW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801236; x=1734406036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zw8KjUeVLCoeUttHvlAE11LYFS9kka7RYPFB87xdCOo=;
        b=vHUvtB6TRIdgLB66HafMp/f3Q5bMw875pM7oqqC0JlDLcmNPkSZrT4Rggp8wydD6+L
         PeI0hadNttep2ZJIW0ZQRPB3bnSbnM9aY8JXNRlyrx9lMJnZLm2wgpzcM8sD3Z0kzLaA
         TW/yhPIZb7gTPNBDTk+EqvGaYdqQmQvLgqKWlQF+O1q4FLSDAgVglzQg1ETAR52JjOVE
         hRh32f3Aem5U2HTNRrkpjb0VBgRsA1xRWwkmTKXUXO1+dLHaq4oZfqJcpJ69y8i6m5nw
         oV9ENmM0m/VUS5CTQkuVEucBd4OAmIGirX8NKR12xdiid23PovS8usiufDe333vqKyBu
         QYxA==
X-Forwarded-Encrypted: i=1; AJvYcCV6fnPF0embCSabuyN9hhDmBHazZWg6WFFHju6BPg0WT2U+VUPmkial0ksLsATGhbH1uIuYOGtBPC1IBQ==@vger.kernel.org, AJvYcCVSro9A6m14PshU1c31GOmo1U+4ke4XZgSgqF7gk1h/C1GSVGsEdXaDBp4GZGfR3IpN1rBV64wcfJVpUJJZ@vger.kernel.org, AJvYcCVkvPxSiuspxzkq6NcS2KBW/OPHq5tN+XlOlrJcxA3BMnqUEz2TWmjHBMjQ1hk9d5Kanj1zHTJV7ZaqtA==@vger.kernel.org, AJvYcCW6h2kuns9R/czE5/I5Wd8l9F0vbbt6baHcT8aOnQb+ha2xeidh0963ft9mqn+D3lwpJFvR0JPaKDacBA==@vger.kernel.org, AJvYcCWFMdPYksuxqu/2CHRjOVGLLEIniVxXrj9SB5T4V1Z9XuxLQPCTeMWXQvywpV+cyY86HjKT0DxPIDM=@vger.kernel.org, AJvYcCWPbYDIlCIBhb3afOvvVuOVR1qgRmKHXzurNkJPU0dQtO3KBG9OM3FAUTK3nw2qXeDo1Idzgr7mcxgmUQ==@vger.kernel.org, AJvYcCXQ0UoNUPG0C4aW3qw+EW4HaK0mjhB4zexj+KT4Rr95HIg7bxeQyP3tF0jGxAPJ2Q3IZO5tkjqbaR/Q/CCr@vger.kernel.org, AJvYcCXs9nnghe582B6ZaMU534jNoE/QrxVdr6J2D4gJwx5OGgXTxwcEi15algqXmiySr0+v/ZI3mlvaCYC9TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVyaNTxg1hlwMSHkuuQVQabWKYYpQ4UC5JkNULsuyLN/soSyMh
	akiT27uKOVizDryavkuGK5OvhkE1UmQSegO89nq8j7O5CasU+AURQ1s+G+4lfl54kTslJ/qieOP
	T+46Kr51diRKOjmFebeXbz0g23gA=
X-Gm-Gg: ASbGncv9ZqZ0C6gzWXJ9HShVGapp01CZE7d2557Hhgns8vaWG80GVjUod9ruiT2yHs/
	XzDEjSpT8Ji3pmE58T2cnX/SFy46qpdS4RQFqhA==
X-Google-Smtp-Source: AGHT+IHf2Fi/42HQsEiQo6WzNdGmDcvEV4I1TbpQP4oAJiq1u3pQn+R3NnSbM/I4gmKvXuY9eOlF5eGp3h/ZPgrcEvo=
X-Received: by 2002:a05:6402:278f:b0:5d0:fc80:c4d1 with SMTP id
 4fb4d7f45d1cf-5d41852f140mr3377986a12.14.1733801235781; Mon, 09 Dec 2024
 19:27:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com> <20241210024119.2488608-2-kaleshsingh@google.com>
In-Reply-To: <20241210024119.2488608-2-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 9 Dec 2024 19:27:04 -0800
Message-ID: <CAHbLzkpCRGF+-WXkHVEutkEGHSWydmpb1CwkvHZRTH-f773J-w@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 01/17] mm: Introduce generic_mmap_hint()
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 6:41=E2=80=AFPM Kalesh Singh <kaleshsingh@google.com=
> wrote:
>
> Consolidate the hint searches from both direcitons (topdown and
> bottomup) into generic_mmap_hint().
>
> No functional change is introduced.
>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>  include/linux/sched/mm.h |  4 ++++
>  mm/mmap.c                | 45 ++++++++++++++++++++++++----------------
>  2 files changed, 31 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 928a626725e6..edeec19d1708 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -201,6 +201,10 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm=
_struct *mm,
>                                            unsigned long flags,
>                                            vm_flags_t vm_flags);
>
> +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> +                               unsigned long len, unsigned long pgoff,
> +                               unsigned long flags);
> +
>  unsigned long
>  generic_get_unmapped_area(struct file *filp, unsigned long addr,
>                           unsigned long len, unsigned long pgoff,
> diff --git a/mm/mmap.c b/mm/mmap.c
> index df9154b15ef9..e97eb8bf4889 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -620,6 +620,27 @@ unsigned long vm_unmapped_area(struct vm_unmapped_ar=
ea_info *info)
>         return addr;
>  }
>
> +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> +                               unsigned long len, unsigned long pgoff,
> +                               unsigned long flags)
> +{
> +       struct mm_struct *mm =3D current->mm;
> +       struct vm_area_struct *vma, *prev;
> +       const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
> +
> +       if (!addr)
> +               return 0;
> +
> +       addr =3D PAGE_ALIGN(addr);
> +       vma =3D find_vma_prev(mm, addr, &prev);
> +       if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &&
> +           (!vma || addr + len <=3D vm_start_gap(vma)) &&
> +           (!prev || addr >=3D vm_end_gap(prev)))
> +               return addr;
> +
> +       return 0;
> +}
> +
>  /* Get an address range which is currently unmapped.
>   * For shmat() with addr=3D0.
>   *
> @@ -637,7 +658,6 @@ generic_get_unmapped_area(struct file *filp, unsigned=
 long addr,
>                           unsigned long flags, vm_flags_t vm_flags)
>  {
>         struct mm_struct *mm =3D current->mm;
> -       struct vm_area_struct *vma, *prev;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
>
> @@ -647,14 +667,9 @@ generic_get_unmapped_area(struct file *filp, unsigne=
d long addr,
>         if (flags & MAP_FIXED)
>                 return addr;

It seems you also can move the MAP_FIXED case into generic_mmap_hint(), rig=
ht?

>
> -       if (addr) {
> -               addr =3D PAGE_ALIGN(addr);
> -               vma =3D find_vma_prev(mm, addr, &prev);
> -               if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &=
&
> -                   (!vma || addr + len <=3D vm_start_gap(vma)) &&
> -                   (!prev || addr >=3D vm_end_gap(prev)))
> -                       return addr;
> -       }
> +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> +       if (addr)
> +               return addr;
>
>         info.length =3D len;
>         info.low_limit =3D mm->mmap_base;
> @@ -685,7 +700,6 @@ generic_get_unmapped_area_topdown(struct file *filp, =
unsigned long addr,
>                                   unsigned long len, unsigned long pgoff,
>                                   unsigned long flags, vm_flags_t vm_flag=
s)
>  {
> -       struct vm_area_struct *vma, *prev;
>         struct mm_struct *mm =3D current->mm;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
> @@ -698,14 +712,9 @@ generic_get_unmapped_area_topdown(struct file *filp,=
 unsigned long addr,
>                 return addr;
>
>         /* requesting a specific address */
> -       if (addr) {
> -               addr =3D PAGE_ALIGN(addr);
> -               vma =3D find_vma_prev(mm, addr, &prev);
> -               if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &=
&
> -                               (!vma || addr + len <=3D vm_start_gap(vma=
)) &&
> -                               (!prev || addr >=3D vm_end_gap(prev)))
> -                       return addr;
> -       }
> +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> +       if (addr)
> +               return addr;
>
>         info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
>         info.length =3D len;
> --
> 2.47.0.338.g60cca15819-goog
>
>

