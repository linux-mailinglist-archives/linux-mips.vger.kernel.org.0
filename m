Return-Path: <linux-mips+bounces-6981-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4755E9EFCFD
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 21:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77D3C188D7EA
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 20:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B342F1A7273;
	Thu, 12 Dec 2024 20:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nC18HmEk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F411917D6;
	Thu, 12 Dec 2024 20:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734034131; cv=none; b=B82oJIzXM6AsawXMZgnQqjZ5zDjqyDjPwyyFPUtam0ygzuOBEH9bWQKaTDFttqQyF0CHFsH5vovgYj2xfMxsDgann1yJzYP4RiNl6gXVhG1CskPegGqH93aGddwjajN8fa4nYtYYTWHmxdkndH9041fWuv8gZdu54xg4a2+GSbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734034131; c=relaxed/simple;
	bh=rGlNM0MTKO9H5+NJ7e+yXuofUkMksUw402gZcNo+JtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkL4pkOlrrcBcg1dPfXCzyjd4bv6OZKoPSBhJmpSGEutp+GhT1aMT6vX5YurqLvoZdFpchOOq2d6af2W0+WmtR6pxMaYFBn8m27QtokgKWa9gQu8Br/zm/z2aBui7hQKUSHIk3+YfvgJJqZt+Vu4t2//cDwggPHRlBAL6Hzi79E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nC18HmEk; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9ec267b879so85627266b.2;
        Thu, 12 Dec 2024 12:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734034127; x=1734638927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN4Ym/UunmzCYsNSflmoKoSUjG0g5+VHwXB/fYxaNqo=;
        b=nC18HmEkPWk2LHyQx694Tbr42oN7dFcjfH5A9N3keoz3zBUaE0/rtZORWjmLmy5EpH
         gbq34HCneM6WwNhQLv85ughXiPO9Llki6vWL0soaIOjVUXoKI6/LaGV+dOfsfyihPMXN
         osH911k6Xemv36oeCtZ65bC8+XT7OedAft59sXZ0/X7BRiFNVw2X1XC7T47zFsz9PYUB
         e1921ouzKmOvJXwg5MBUrKJ82FFlyhifhPvBs8T/5fav/Bb8trkvK0QTBS+EfEx3roK/
         JyTEHJcyu3fTDPEuCW9QLJM+OLcMeChVwPo+Jqx4nLIH86uIu745W6jQVW/webhagDaL
         qOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734034127; x=1734638927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zN4Ym/UunmzCYsNSflmoKoSUjG0g5+VHwXB/fYxaNqo=;
        b=e5WmD3OM7ojmI3VHMtI6OyaCFLVJWYldZk3ejd/9SNFRFWS3f+X8FrQQUcFqRKFxsx
         /hMgH26BqA4X4Sp2dtNuqqR/xbtAN5Wi9DKXPQNXvSG8inwhbiHwcwL2Zm3Lta7iEI/A
         CnEgjanK+/oshm7E0SXDW5Gf3GU4yX+7N2IFpv3oCnEE9+sAIyNisfHrwlVvDJoxPeVS
         cBMpCC+YM8N1CL4kTMOh1AwsZC69nerNw64Q0/Lek+SM03UxZXUF6JJ1PrRIebvLVqW7
         o82scXSZ90htrZfviEVGzNmTbUafxbXkqFG5xB6C9Nrg13QYRq7asIThwDyv05PJi7Dp
         ycwA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Tn+g09L73kYuP+hssrO7SNypLGKd3FCoxrx2zzFkaXCTjFfu8KO13s7ol7dGm0T9L+uxQ/GRTJW2HQ==@vger.kernel.org, AJvYcCU5/8FwEbJzTjeBB3vZQ3BC6SAgue9GvuMPw9gbwk6evrCmhijw0EkEZQ7VL4uhxthrfFJRolWDEr8zCejv@vger.kernel.org, AJvYcCUQZZBTk1hr+RrghbPyHjooLFQL2HElizZGgA9EBrVkKHBXzvBsXkYyLUCvv76e+xzlie4PCb3r9XeF2+Y7@vger.kernel.org, AJvYcCWw7bTyHolEVY+fzNFpPhMcqbEEoBOApAbG1OKZvM5XDtX4ZN95Tv20l/EmbzYt+2b0lxV0FIEC4xhmpQ==@vger.kernel.org, AJvYcCXPhXMM48rvHNzILyBfCz4i3FgiiQH0TQ4DcpHGUNtIeuFzCgUWqBoXn13ETBeetS3OEPz33tqXcNkL3Q==@vger.kernel.org, AJvYcCXQJNRgRicRc566dtDi7tUn9SWSNwEstVWrQC/o9etEJ47T1J8KFKWSV5QeXVqnf5au7w4dOTPtJdt1tQ==@vger.kernel.org, AJvYcCXeJPenmMR3kJFk+Z8Tl7GjWv8wGurEJwC5sKuRvrs2ao+c7M/P6B7KXf5ilav3+ghwwU/HRQw0S7Y=@vger.kernel.org, AJvYcCXjtPVDUdDeerHQSwyF8193l0ssk4ek0vPty7Lpd51smRp99PB2Ejp4JD6c4va7iGc8b2WyrJvXQmOJGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXzoLMJ/YL62gNnItcGvhUFoBaQ0iMiUgouE/Mv7uJXRcK2efE
	RhA6c+3LeMIEUvsRZ0RER+4NfaFkBrI1fLjYzUtql0+3QjvJtKWmq3hIQ3bt9zBUnDsxIH3hGPb
	s0LcfNGm7NDmG8w/oapZPXZyshTg=
X-Gm-Gg: ASbGncuvWyWSD1Zh+XCt4PDA11TJdv6BrGUKoorhizN3mEUuYfzYyyFUf1m/UY1SZWq
	yCCgQ0jRa0wVzqYT8VFA8ICEDf93G6WvL5N2pZwkT
X-Google-Smtp-Source: AGHT+IFBjZrg88OqeWBDO1jTyqFkrRhdvj/sM97FkFYUxtUn8pc+yCVr/hdiAj5KO+SOUnoKUqWUM88SK7LqY4tEHG8=
X-Received: by 2002:a17:907:3e9f:b0:aa6:64be:ff2d with SMTP id
 a640c23a62f3a-aab778c168emr3388966b.4.1734034126714; Thu, 12 Dec 2024
 12:08:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com> <20241211232754.1583023-2-kaleshsingh@google.com>
In-Reply-To: <20241211232754.1583023-2-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 12 Dec 2024 12:08:35 -0800
Message-ID: <CAHbLzkovqMsjti1g_G4dFj2mb4hneBPtR2eGTxTZmC717455-A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 01/16] mm: Introduce generic_mmap_hint()
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com, 
	linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
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

On Wed, Dec 11, 2024 at 3:28=E2=80=AFPM Kalesh Singh <kaleshsingh@google.co=
m> wrote:
>
> Consolidate the hint searches from both directions (topdown and
> bottomup) into generic_mmap_hint().
>
> No functional change is introduced.
>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>
> Changes in v2:
>   - MAP_FIXED case is also handled in arch_mmap_hint() since this is just=
 a
>     special case of the hint addr being "enforced", per Yang Shi.
>   - Consolidate error handling in arch_mmap_hint().

Reviewed-by: Yang Shi <shy828301@gmail.com>

>
>  include/linux/sched/mm.h |  4 +++
>  mm/mmap.c                | 76 ++++++++++++++++++++++++----------------
>  2 files changed, 50 insertions(+), 30 deletions(-)
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
> index df9154b15ef9..382b4eac5406 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -620,6 +620,47 @@ unsigned long vm_unmapped_area(struct vm_unmapped_ar=
ea_info *info)
>         return addr;
>  }
>
> +/*
> + * Look up unmapped area at the requested hint addr
> + *
> + * NOTE: MAP_FIXED is also handled here since it's a special case of
> + * enforcing the hint address.
> + *
> + * Returns:
> + *    ERR_VALUE: If the requested mapping is not valid
> + *    0: If there isn't a sufficiently large hole at the hint addr.
> + *    addr: If sufficient VA space is available at the hint address;
> + *          or MAP_FIXED was specified.
> + */
> +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> +                               unsigned long len, unsigned long pgoff,
> +                               unsigned long flags)
> +{
> +       struct mm_struct *mm =3D current->mm;
> +       struct vm_area_struct *vma, *prev;
> +       const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
> +
> +       /* requested length too big for entire address space */
> +       if (len > mmap_end - mmap_min_addr)
> +               return -ENOMEM;
> +
> +       if (flags & MAP_FIXED)
> +               return addr;
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
> +       /* Fallback to VA space search */
> +       return 0;
> +}
> +
>  /* Get an address range which is currently unmapped.
>   * For shmat() with addr=3D0.
>   *
> @@ -637,25 +678,13 @@ generic_get_unmapped_area(struct file *filp, unsign=
ed long addr,
>                           unsigned long flags, vm_flags_t vm_flags)
>  {
>         struct mm_struct *mm =3D current->mm;
> -       struct vm_area_struct *vma, *prev;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
>
> -       if (len > mmap_end - mmap_min_addr)
> -               return -ENOMEM;
> -
> -       if (flags & MAP_FIXED)
> +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> +       if (addr)
>                 return addr;
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
> -
>         info.length =3D len;
>         info.low_limit =3D mm->mmap_base;
>         info.high_limit =3D mmap_end;
> @@ -685,27 +714,14 @@ generic_get_unmapped_area_topdown(struct file *filp=
, unsigned long addr,
>                                   unsigned long len, unsigned long pgoff,
>                                   unsigned long flags, vm_flags_t vm_flag=
s)
>  {
> -       struct vm_area_struct *vma, *prev;
>         struct mm_struct *mm =3D current->mm;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
>
> -       /* requested length too big for entire address space */
> -       if (len > mmap_end - mmap_min_addr)
> -               return -ENOMEM;
> -
> -       if (flags & MAP_FIXED)
> -               return addr;
> -
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

