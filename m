Return-Path: <linux-mips+bounces-6887-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B59E4F7E
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 09:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D0F51881DF4
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 08:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573771940B1;
	Thu,  5 Dec 2024 08:15:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7906B194A43;
	Thu,  5 Dec 2024 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733386550; cv=none; b=FoWbk4dJSZmUEX4TtVCF0xi6gigpd4FcOFoLRRgBXrvtUP17xvUZu+KaRLzNyvoe8Kd9KLIOe+7zW+UweHXGkLEBGJbyMuyN9oQl31d+lDnhnmfjEcew07yA+Qtdbr4/5wdrgylw/4tZusyHzu365L6xM/vYbeyZuWed6i2Znrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733386550; c=relaxed/simple;
	bh=Xhvhb8dLBfRndBFPR1MMTcqxL0NW07oXk+ebZSXF/cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3f2YrqIM/MunLaK5bAIJvq2B3okCMNSToMqwFN2N3ZScvGu24NtTePAmpBMzvnhvSNjz+ziwVzBO5TY1MiD7w8IrmmsbaTF2UjjA9NnMD/C7s9DD59qSHwAUitO9coPZdjKwc1CcfYNhyjwlXV+P1sLoV+Ef9HrZxHUXscSipA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-515f18355d0so56960e0c.0;
        Thu, 05 Dec 2024 00:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733386545; x=1733991345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxwEuUP0RFmoaIeR9CtOUPb98unFbw4v06g3fCFWPf4=;
        b=chNrG0jVV+5817YC14Tjci1cec7/SfxqcrWBRvCIJmvbkj7ZMnBLuhdfwP7Log3G7B
         cck27HrQP6sqZAkCDo7KVyJfepALFfeC3++thyp3hdHXxRDs5Wa6BZff0jenWhDrVYNx
         SAp1V2oNBHAySrOWlKPTRvmarO3KMTBzVVBGfLSZmq+JrI4Njc6qgSF+BRgvutceKeR4
         agxaFgqebw/YB+W/NnhSjC8ET9xPmlRvr9skyltnqmtDdIlTdIXF3s6PwN0dgC0Xf5km
         H//Mjijy2aPNvLZJnJ8LnpNLvkyJwzjOMIttLcy8nSNc9gCg2KQi4r0G81iT/E9bYZJ+
         eU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfpb3byBsncfvhGyxIzrhQByxVo16KohYUApwMlvge/adlguBP+GFh1sBOnKn+xpsufQg1ZlJQBjOClg==@vger.kernel.org, AJvYcCWfrBqoKhzVf7BsdM53nb3o0e6ZEcWF0JE0J0zJCwMf92EFefsqu2E5ipnU2bNc0tZkVGxutkDPb0h8/ls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmzt0MUxfTAukrkUiV/fGqiZXa1ufnw8p7VhlgEv+HIYkw/JQ6
	IFsoqa2zz3mIvsnMMTcxhA+yffulQAgjqk3amPaBZCbl9UpvFna7VqoTes+X
X-Gm-Gg: ASbGnctwaR3q+IPxu302w/4lWfzao0DITus/Bs32W7MHgLCngDISj6VLsW4rJ6JtPiV
	j8lUkRU+c/Re9QAiNImIoFYBsFgaIuHgjnISAO3JubF5eMoAjQTwYUypg85Q3M1JNrjUbbEBYdp
	Md0kk4REuBxDpGRDPl9ef6EMxPO5J+PKDOV5Y2AV+f6lZyUAE5YkuVMsPsQEvpZpfkGL8zzlRMI
	JicaXVSFqnsL8kZxjt6nS97K0NIEqnQ/q8taWqgkwrEncD0fJfV2lEofEOm8gFlzoHaJdGqU2j/
	cb0FayjvqXup
X-Google-Smtp-Source: AGHT+IFOt5f+hepIUBWfI0wTizFwLu6lA8f6wJpF53q/rKahtueUPoUAVi2WDqcdKHVBfyrr3/ny1Q==
X-Received: by 2002:a05:6122:886:b0:50d:bfb2:4f2f with SMTP id 71dfb90a1353d-515bf3b9936mr14165623e0c.2.1733386545457;
        Thu, 05 Dec 2024 00:15:45 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eae15d2fsm84155e0c.1.2024.12.05.00.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 00:15:44 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afbbb9fc1dso180386137.1;
        Thu, 05 Dec 2024 00:15:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUD4zklBaIm5KwBlkPw5A6FkYPZb61cpP4gG/NLGHcCpL1LiET2e7eigtAFJE6MVky4EiUKlU0dZgqUm0I=@vger.kernel.org, AJvYcCVtvLE0SVm7ijp+fwkE0byupMDoYumdZqQmHADuc0uuMhA2kLT3DFnmsQk/6/xP0cIRz5wjRpeDAsUbzA==@vger.kernel.org
X-Received: by 2002:a05:6102:3753:b0:4af:469b:d3ae with SMTP id
 ada2fe7eead31-4af9729081cmr12311913137.27.1733386544384; Thu, 05 Dec 2024
 00:15:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011150304.709590-1-ziy@nvidia.com> <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
In-Reply-To: <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Dec 2024 09:15:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1s+vREdU8+yBb0b2Y68awM+GgNdyDm+=0Ux=aHchsng@mail.gmail.com>
Message-ID: <CAMuHMdW1s+vREdU8+yBb0b2Y68awM+GgNdyDm+=0Ux=aHchsng@mail.gmail.com>
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with init_on_alloc=1
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Miaohe Lin <linmiaohe@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	John Hubbard <jhubbard@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Alexander Potapenko <glider@google.com>, 
	Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zi,

On Wed, Dec 4, 2024 at 4:24=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> On 4 Dec 2024, at 5:41, Geert Uytterhoeven wrote:
> > On Fri, Oct 11, 2024 at 5:13=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> >> Commit 6471384af2a6 ("mm: security: introduce init_on_alloc=3D1 and
> >> init_on_free=3D1 boot options") forces allocated page to be zeroed in
> >> post_alloc_hook() when init_on_alloc=3D1.
> >>
> >> For order-0 folios, if arch does not define
> >> vma_alloc_zeroed_movable_folio(), the default implementation again zer=
os
> >> the page return from the buddy allocator. So the page is zeroed twice.
> >> Fix it by passing __GFP_ZERO instead to avoid double page zeroing.
> >> At the moment, s390,arm64,x86,alpha,m68k are not impacted since they
> >> define their own vma_alloc_zeroed_movable_folio().
> >>
> >> For >0 order folios (mTHP and PMD THP), folio_zero_user() is called to
> >> zero the folio again. Fix it by calling folio_zero_user() only if
> >> init_on_alloc is set. All arch are impacted.
> >>
> >> Added alloc_zeroed() helper to encapsulate the init_on_alloc check.
> >>
> >> Signed-off-by: Zi Yan <ziy@nvidia.com>
> >
> > Thanks for your patch, which is now commit 5708d96da20b99b4 ("mm:
> > avoid zeroing user movable page twice with init_on_alloc=3D1")
> > in v6.13-rc1.
> >
> > This causing a panic when starting userspace on MIPS64 RBTX4927:
> >
> >     Run /sbin/init as init process
> >     process '/lib/systemd/systemd' started with executable stack
> >     Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x00=
00000b
> >     ---[ end Kernel panic - not syncing: Attempted to kill init!
> > exitcode=3D0x0000000b ]---
> >
> > or
> >
> >     Run /sbin/init as init process
> >     process '/lib/systemd/systemd' started with executable stack
> >     do_page_fault(): sending SIGSEGV to init for invalid read access
> > from 00000000583399f8
> >     epc =3D 0000000077e2b094 in ld-2.19.so[3094,77e28000+22000]
> >     ra  =3D 0000000077e2afcc in ld-2.19.so[2fcc,77e28000+22000]
> >     Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x00=
00000b
> >     ---[ end Kernel panic - not syncing: Attempted to kill init!
> > exitcode=3D0x0000000b ]---
> >
> > or
> >
> >     Run /sbin/init as init process
> >     process '/lib/systemd/systemd' started with executable stack
> >     /sbin/inKernel panic - not syncing: Attempted to kill init!
> > exitcode=3D0x00007f00
> >     ---[ end Kernel panic - not syncing: Attempted to kill init!
> > exitcode=3D0x00007f00 ]---
> >     it: error while loading shared libraries: libpthread.so.0: object
> > file has no dynamic section
> >
> > Reverting the commit (and fixing the trivial conflict) fixes the issue.

> The provided config does not have THP on, so the changes to mm/huge_memor=
y.c
> and mm/memory.c do not apply.
>
> Can you try the patch below and see if the machine boots? Thanks.

> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index 6e452bd8e7e3..bec9bd715acf 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -224,7 +224,13 @@ static inline
>  struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
>                                    unsigned long vaddr)
>  {
> -       return vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma,=
 vaddr);
> +       struct folio *folio;
> +
> +       folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
> +       if (folio)
> +               clear_user_highpage(&folio->page, vaddr);
> +
> +       return folio;
>  }
>  #endif

Thanks, that works!
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

