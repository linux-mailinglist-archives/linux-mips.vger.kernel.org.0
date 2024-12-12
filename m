Return-Path: <linux-mips+bounces-6982-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0A79EFD0E
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 21:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3984A188E0ED
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 20:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDDB1AB51F;
	Thu, 12 Dec 2024 20:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/xwloNO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E011917D6;
	Thu, 12 Dec 2024 20:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734034327; cv=none; b=E545n1q1iKGJ4PPNz6UD2KXwwGnB4DlRhZ8izVB9qF5RbLjdhifml9g7z56CknYjfpRssRkov0Hg4M09Y4oWsV+xKzi25hw01sUyT0DU5OEf239e7x4mnWZqjtas1MkKOy1LGPL7uz8eGPdh1mYfrjCRcxw6LszVeEiuOQIbsOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734034327; c=relaxed/simple;
	bh=ifgXMXPeJaw+0iXfb3YVtq+uFZZPMVRdg7oRM0gxOwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3fkonEgYlW2bkToHIYsiED2k1yOsHlNwCm5DjNiUpM5xuu1Hc4e85TtG8EM7fYuZRmy1plVk1+sgKI30t7QYYIYTgEPL5TLJg1uWSBwAGOHQrHs/Z5t1dnkacGQUY4tP7byFWmdDgZGR3rDvmrTBlck8dwqXDTJXHcGY3Ba5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/xwloNO; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa66ead88b3so186305766b.0;
        Thu, 12 Dec 2024 12:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734034324; x=1734639124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccEjllC2XhoGMyYqcFrLm7vpFIY0Cm+U6Sao32tSe/w=;
        b=B/xwloNOa71LT0OQyobLZ72r7ltLXGRwoANhNW3pdNLOLfoZXHgS14ixdb2Bao4WCD
         H9N1iXyA8il2Jl9PFbnvIcjQUA7ivQuC6InLqFWwVm4YcpjR1Cy9paGnEHlBmZlwed7W
         lk3AaSJbKGLu10AIYMmfskS2ck1C7qA8KLvNxnP1lGQPJ19aiRlVyvBFMCUEpBRuD7WN
         ly/Mlu9Yoz2+y6cSxo61lb3tOpApfmuYdFLG9dcBLCiE/MK7TVq6WCBK/5arZUinGjQ5
         vbofT0phu6Be50T0ClqabCKlLTGMMDQIAjeTw4TUDewhhR9rlEIuLXJ9XC7St9wJNJhr
         Ho/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734034324; x=1734639124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccEjllC2XhoGMyYqcFrLm7vpFIY0Cm+U6Sao32tSe/w=;
        b=M0kOJ1LoL0zQT6ZBFXj6eTkylKVSprsowNwcExLmZ4budlRnt7S06cBaKHmXEn9dLA
         JggQ83rkpMix9SqDVCzTvWu3ams3EyQezegHjVO4i8snV0EYKVxpLOaBizEYbRSRVlvF
         eOtHnLhX0ehZGMwR8JE7+RutCExxNXHIU+tDuxRaWPYaqbqv+gs0fB5JvSANTk/f6WtY
         V3rKV/I7X7kCc1dOrSgrY3bVArZ4/vVcgrmWgCC4me7fvyjs4yTZ3Yx+PFcCI+vfJtlI
         TAMaxqmA1UouIBFbN1XUqt9M3WCEVQ+0fgNiYZVMvI2Qyih5I/oykFJieFjzTzeSxEqA
         SsEA==
X-Forwarded-Encrypted: i=1; AJvYcCUAXx2BV+Eh5d9cwgBopEIrw/5eoFIt8iyWZcpjCXk21BG6LB0aB1dhE+Wbfnl0hX764H6bqrYg+XOLAg==@vger.kernel.org, AJvYcCUEvRCtoQjrRH+7yh3ixqGenh2gb+kfXU4h4Hf4KOLSDCtWGdFD/EB/Mj2t2PYnv8yB6CLkgcIYS2QTvA==@vger.kernel.org, AJvYcCUMxZM3yLoJ68Y9UpXxE1bDSFbG6g7Ip0rA+lFR1RteBOSy9xiRFUAqFfCVz4qvfNtu3TSmnGSF47zQ23Fw@vger.kernel.org, AJvYcCWPdo1exEZNaQUPobEQWTZq8+Ju2kRNUUHvmByic2oeItdM/qFCt4QRBvAN88Dl0J9HlLOYfqdaDv7WRQ==@vger.kernel.org, AJvYcCWg/9WTlxFMM+//zRBDMbFDdCJs3snB8jvOB1Efay34M5ByEG3IuN3kuur4W9uOpyKPM1NQTdAzBMickw==@vger.kernel.org, AJvYcCWsn/IxjKzBF/wWIUwjTlYXpzyB87rxBBjJZa4MaJTUnnFL7Az5J5iCv6mPA6IAOpzHiRQ9YkBw+52b1VvB@vger.kernel.org, AJvYcCWtw0MaL11nUjb8GjyGFf+7coAAY8f52R5S9yP1A7XfnS7CPiHCBTdsQsBr+ixKKXnMmBS9oN0ytoM=@vger.kernel.org, AJvYcCXwFKPMJzZ0GHwN215PsSCKk3GyuyiWMyK2KAQwBNSE9oXTuo74jPMrXT9+AvghSEaWDLEzJUlBOhR39g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz07jaPZ4T3ESnlRtmUfqpI4ZqHVUpN4PJIyWuOYzK6jVj/tt0A
	uRK/kLN7d3JZZdzb5PkWOoqD0RLAyG9MSkXUljCue7CZ97hCipptVsbTfrpEJlAacTwT+3gsmW4
	UZQ6s5uYXqqWgfgZ/OcV91z+2s8Y=
X-Gm-Gg: ASbGncu+AhHzhcAhTrW+9kDieRTarVLJLHrHkIWfdC0wkE7rzb/U0PiTsG6rE6TwqUo
	aAmmd3zTY4QDCRMp/y4fX0QF/imPnGbu0FaO30uQR
X-Google-Smtp-Source: AGHT+IF7qx5Z1/fQb+D9Nv/8CkFXoKyEEzLktdUfd+sTUwFi+n5jfhaKRcSctFjQDfGrQzxwJV8DWyyLGWYjEOqOZ4M=
X-Received: by 2002:a17:906:7304:b0:aa6:94c0:f755 with SMTP id
 a640c23a62f3a-aab778c1eaemr4266066b.1.1734034323514; Thu, 12 Dec 2024
 12:12:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com> <20241211232754.1583023-17-kaleshsingh@google.com>
In-Reply-To: <20241211232754.1583023-17-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 12 Dec 2024 12:11:51 -0800
Message-ID: <CAHbLzko2Z0-QReXo54H=sd1asXsPKEHf9N4Nmv0=Ry7SM=XX+g@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 16/16] mm: Respect mmap hint before THP
 alignment if allocation is possible
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

On Wed, Dec 11, 2024 at 3:31=E2=80=AFPM Kalesh Singh <kaleshsingh@google.co=
m> wrote:
>
> Commit 249608ee4713 ("mm: respect mmap hint address when aligning for THP=
")
> fallsback to PAGE_SIZE alignment instead of THP alignment
> for anonymous mapping as long as a hint address is provided by the user
> -- even if we weren't able to allocate the unmapped area at the hint
> address in the end.
>
> This was done to address the immediate regression in anonymous mappings
> where the hint address were being ignored in some cases; due to commit
> efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries").
>
> It was later pointed out that this issue also existed for file-backed
> mappings from file systems that use thp_get_unmapped_area() for their
> .get_unmapped_area() file operation.
>
> The same fix was not applied for file-backed mappings since it would
> mean any mmap requests that provide a hint address would be only
> PAGE_SIZE-aligned regardless of whether allocation was successful at
> the hint address or not.
>
> Instead, use arch_mmap_hint() to first attempt allocation at the hint
> address and fallback to THP alignment if there isn't sufficient VA space
> to satisfy the allocation at the hint address.
>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>

Reviewed-by: Yang Shi <shy828301@gmail.com>

> ---
>  mm/huge_memory.c | 17 ++++++++++-------
>  mm/mmap.c        |  1 -
>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2da5520bfe24..426761a30aff 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1097,6 +1097,16 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         loff_t off_align =3D round_up(off, size);
>         unsigned long len_pad, ret, off_sub;
>
> +       /*
> +        * If allocation at the address hint succeeds; respect the hint a=
nd
> +        * don't try to align to THP boundary;
> +        *
> +        * Or if an the requested extent is invalid return the error imme=
diately.
> +        */
> +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> +       if (addr)
> +               return addr;
> +
>         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
>                 return 0;
>
> @@ -1117,13 +1127,6 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         if (IS_ERR_VALUE(ret))
>                 return 0;
>
> -       /*
> -        * Do not try to align to THP boundary if allocation at the addre=
ss
> -        * hint succeeds.
> -        */
> -       if (ret =3D=3D addr)
> -               return addr;
> -
>         off_sub =3D (off - ret) & (size - 1);
>
>         if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 76dd6acdf051..3286fdff26f2 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -814,7 +814,6 @@ __get_unmapped_area(struct file *file, unsigned long =
addr, unsigned long len,
>         if (get_area) {
>                 addr =3D get_area(file, addr, len, pgoff, flags);
>         } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> -                  && !addr /* no hint */
>                    && IS_ALIGNED(len, PMD_SIZE)) {
>                 /* Ensures that larger anonymous mappings are THP aligned=
. */
>                 addr =3D thp_get_unmapped_area_vmflags(file, addr, len,
> --
> 2.47.0.338.g60cca15819-goog
>
>

