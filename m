Return-Path: <linux-mips+bounces-6862-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7465F9E3ACF
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 14:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71D23B392C6
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 13:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A153A1CEADB;
	Wed,  4 Dec 2024 12:56:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE7B2C181;
	Wed,  4 Dec 2024 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733317013; cv=none; b=cdJ6Pae1jIZMp4RV1rdjdrRyC8Ltt8mrh7a56+nOlJ7+69ycapqRURChbV1M0tOGq9tKeX3U0SkwUJVMMaOsYD7AIfk06xvX+M7sWH56BGiDKfj2HSSeOdaVbk0zKCPICpWdQ/CDkH6Sv4bTwAbtBAyvg3QMkIGly35POgEnBWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733317013; c=relaxed/simple;
	bh=xyvyK8a0sRNvmtsiy7SxETzWVYGnr7V2X13RnJoiYQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZdKpKrNQGn8TJz6HrGAHwbGP//W8GiTMMw0O+mBM6C/F2JBWrj8gzyObLKETyJMeUHvsm2hGJ5kgnKUGE33JmzZLw2unkEhwoNTA5V+l5si0w5R9e6IFN6wH7xhKEErgn1xezZloRpYvnbxtT3n30NY9a77Q8rVliLLXT6/5Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4af60a0478fso481021137.1;
        Wed, 04 Dec 2024 04:56:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733317009; x=1733921809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbtYfoOv44CKDHrcRWfEAiDZ+MRBtL//lmvQ40sWgA0=;
        b=JK6YdD1bqpAvJa942P1zuxr7+CGuneUfgQqjFdqQs6MnXA4PdtnQj0wMJT85TW2E7C
         WyH8uisxWIUtI5eUNsOigS8EY9qo9USyN2nD4xnaZLWvnXJfZv+gtgDs2vWM7ksaq9mI
         UWncUNmG6VN5PyYrXpThYEy6w/MdTbTceSs3sMQgXJ9R7JbgwYOuAUoRCPBIkqZLOoeP
         FisRyy/84yL4Ufjwu0anltRSyqLTuCHN6yNkeg8OQpA/z8Ld2RctW3Ckj6qOsT9/TKrE
         fQ1dg1q6nevxjVy+6hFaYyvOB1sREK2LgM23+9AYHhFfvgeMoVO6Xd0G9c9BBzyjseiq
         +7tw==
X-Forwarded-Encrypted: i=1; AJvYcCV0rVincueGuSgvKwtRH+tp7M35ufHxGrxMTVdQTgmnM7+OszZDxIyzO7kGF27qSz4MbZ5+bwP9pbMClA==@vger.kernel.org, AJvYcCWvGQFOT58EX3tYNbno5sbJXFMiqQd7WY3JSfL4j3KgO+bmXTTPi3dyvs6m02HMiOo05h1b451BCjtuYrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgU+F+P3UGQbrO0F1Z871doGv5luuUOcjm33vhzQIXx08bnCF9
	7rb9S4RdOcI4UfU0eZ0KLMx1jSmCGKhjjfL8lXsyuj7MP9KpaR2thLsGnizf
X-Gm-Gg: ASbGncu0/ZqdyLxsDn3Ycf3S6mmxi7p+xDVcci9FBoTnnjTcxjK9L+EwwCDc0DRpqQh
	66thl2LjkZ1meWh+icYlh+0Px5W22e4qj4YHkpVrxvWqZ1tvk+VxRtnkCaboEr0vZYBGHGyNNDh
	LwKix3MZWDj0vOvbVmAbl4a8xqfRyOOWTFTl+wnhoWqiVxiLMS63HOd1I8CNlILR3fRAB2neS7X
	gIk2oyNQnvg8IfXBlgwINik6VhrhKhVuLaynG+Tyd1EEdOAUs/tWXLIE1sKr3b4fofowuEHgHsH
	JMiNLMDZtyAiKsV6
X-Google-Smtp-Source: AGHT+IGd8BB1NsOAJgFNZXLu86wHtAft5RMraL4ITKCKW7WM0alXrkqGQbM8y8tecPvpN/0Wu61RxA==
X-Received: by 2002:a05:6102:21ac:b0:4af:a574:8b6 with SMTP id ada2fe7eead31-4afa5740cbcmr4085543137.8.1733317009219;
        Wed, 04 Dec 2024 04:56:49 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b82d06e89sm2442346241.31.2024.12.04.04.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 04:56:48 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-51536a46e3dso423573e0c.0;
        Wed, 04 Dec 2024 04:56:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBfoWZ0wRxscxGQOFSUOiRVUneF9mZ4N6Zh0FFKDehplx0dZv2jnP/aLeJup4Ddu7cQJ3+rTdC8OrGzQ==@vger.kernel.org, AJvYcCWC2yhkjSXXbszeR2ysbrZ5pVX8JHMOCuoV5qafE0sr899v3OskF4+DbfXTAUljNrxIeIuDuCmP8rwCpEs=@vger.kernel.org
X-Received: by 2002:a05:6122:641b:10b0:515:4d6:5dad with SMTP id
 71dfb90a1353d-5156a90332emr25552648e0c.6.1733317008435; Wed, 04 Dec 2024
 04:56:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011150304.709590-1-ziy@nvidia.com> <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <89C00242-69F9-43E0-84E8-A4CF8369E86D@nvidia.com>
In-Reply-To: <89C00242-69F9-43E0-84E8-A4CF8369E86D@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Dec 2024 13:56:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUizh=W_Pyg7m46C8aB4P6BKRMiQWQvJGhK9HMzMsOdg@mail.gmail.com>
Message-ID: <CAMuHMdVUizh=W_Pyg7m46C8aB4P6BKRMiQWQvJGhK9HMzMsOdg@mail.gmail.com>
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

On Wed, Dec 4, 2024 at 1:50=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
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
>
> Thank you for reporting the error.
>
> > This causing a panic when starting userspace on MIPS64 RBTX4927:

> Do you mind providing the full kernel log for this panic? And your kernel
> config as well. I am trying to figure out why changing page zeroing from
> twice to once can cause kernel panic.

Both sent by PM.

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

