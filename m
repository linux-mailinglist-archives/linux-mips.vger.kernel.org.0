Return-Path: <linux-mips+bounces-8509-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258BCA7D72D
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 10:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD57A7A2FF8
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 08:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A472248A4;
	Mon,  7 Apr 2025 08:06:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A15221F1A;
	Mon,  7 Apr 2025 08:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013182; cv=none; b=aNHD3UJokIoso43TGiGaHZ6K9JdXNbw7S5uspIT4gdL45DetQhFiXvRxc/srHyOSmhWGornAWUnLRbH+ufSQ/gx9ettaJZVEOASuJBKXYVkO91E0Gky20lq0TWvKGJAOSqaV+40JMfliawKoEA5JiuwH2JUWaz3gHWNEt6LUJco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013182; c=relaxed/simple;
	bh=Jv1axMlTH1d7Bc5hi8tVqQgcr6gs+9TX6BEWYeJwdVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKQ957o1MSkafX5pwI7Gf9clj6PbObqcZLcQY1jcfJNOJzNpwIDpAxt1QdNKrNj/R3+XmyblYmIphZlmKkyxHL6zGP32AsswlkQglnUGDjIvB0RazXGFp36Ie39qgdJyu1oZFXS/v42rZ8J86fhpmgqfN1qi5G/gSU+BgIlDHns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86d5a786c7cso1786399241.2;
        Mon, 07 Apr 2025 01:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013177; x=1744617977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=em0yD0kIpDtyZFKdGXKgNdHuMfrDjAXLZIWfYU3VNv0=;
        b=QqoqyMgVdul9RvY6jWkaX+jVeFG76VW6QPGh9oP/Iza/B1h1x+BgbxTkGM7Q/eE+q7
         5BwkCjbkHtbMKod6l9tjUG9KHq6axf7oMKSBZ3IC52z8xHO1fqnBd4+q9v7WaSiE1Rjb
         JPDOc3Qz+MzX9HqTlgEZQM/rwv7jZzbCn+P9PDa1okiVTTTnbsiXWYH1W5wKqdtAtDdq
         4o58/QyGJRO/wJgJ9allz2XZPt/tVius/SXM2hRhGDFC49P11kUcp5VBTHFZeka+svO4
         i+kvNrz1IH6Imfy5uxY4fzhXuKVkYkpCezWqvr4gBs6SMPHw6coYsDpdnzpZGFSPai1a
         yAEA==
X-Forwarded-Encrypted: i=1; AJvYcCUhJUhMIX7ey7JIMIpmNo2dbjX2zmwRnj+ooITqnjTm4nFlK+B+4O9uM/UuseVZ+20r6EvT+1zUh65zdg==@vger.kernel.org, AJvYcCV1GxUjWZkZHaOulzHDZEhLqTr21DQsvIYxmfSJ95U6oYKwynb5qgqXUWUbw5VNT0x/vCtd/WtkCWQ+Kyjj@vger.kernel.org, AJvYcCVIWaGcPTyTrUg30ALAlFceyKRNwrcBOOCp2emu3/kirpFq45hvgkrx9Z3XJ12MFJp3NwX1m5ScCWs5WQ==@vger.kernel.org, AJvYcCW83VGOcxjmus0QhbAe56vQdQJ5+eg63zAy6tJdY/4oYJ82Gk6P55x4hvkCaQw+eH3YOn4uAB58j9POHfBE@vger.kernel.org, AJvYcCWKcEfSYGfD5TUxfKiur0V2N+ThBM4zrWmq1johOhk+6da8cuUcr062Xqm/ap6rIjU5fvnufYjuUo2tVTenM9c=@vger.kernel.org, AJvYcCWptsgVifqzSzqF3ja0eHZI03VnCO2o7/J257cFfErHr233QRaP5zWDNX00CNHR77W+mNzxrDAlA8YoWw==@vger.kernel.org, AJvYcCWqjPIMJGsHx4iAWsEbMjRij7lJN2r3cFM9ekiRdT/7/DuLKQHBSsT7t3NhzFoZ+xwsRQ3cXi1ib49PSw==@vger.kernel.org, AJvYcCXLbXVPJkbmRjXH4bDbuUOAWOU051RqtdimhWebNQQ9hCyRnYG+w0Eql/0VhjEb4zqgLtfYqs/KeDtErf1R3A==@vger.kernel.org, AJvYcCXWe3RzKKIpomRwaTimB0zjhNeFAp31+AcECETHtt+iEm9wE+OvbBtRZ9eUt50+cKCFJIrEcGNJSBY=@vger.kernel.org, AJvYcCXePFHW
 hGFPP6+i+dx+6ELcWQYbu+h1OyuNk6P3STWvHDLMhxmRZCw5clqJtcMALxDH0ei1OYzgiuEh2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwCfCdnnCdQ0DD6VegW7o/cJ5iZ3I8e2TsFo8lM4F6xeTAkk9D
	l7+/DNWCua279LMzRjkTBHpk0Unq+yvHnx4xXkjjX93y1WGKffCEv+Q49aJc
X-Gm-Gg: ASbGncu0i1j82qY3DHnDejG9M0T89T7kKhPF/bYGtt5KEfAO0GFr1Wd975p99ZI9c1y
	yBJe+tnABeKZEf8BXYa0R4KLI/hxf77/CnAdhkiKWy7oZwB64BTWlANeLsZdKg9BZuqaOI6B6bO
	78xgeZpUi8Oe0DGTNgGAql1lryboJEgyVo/3TDv6+wnCtG9jVwRBs8vDhbgP5mcYGAS7eWOiMQh
	gykBYvihKfJYIZbyMCOLzRxG+dKQwyluiJF30nGGRDuw//4RAsaFuXt1Y8/MU00fPL1OSXAXyme
	5T9wH+7SCqldNVb2Sm3vCvb8v3RjekbU8W/38jRrDOLCn+T4TLuqjgbw7Le+6orgX0rhhIexsir
	PK2SNlI0RVlbkiGgWFrxnDw==
X-Google-Smtp-Source: AGHT+IEIypkAlw58qGBac2+Hu5A+Jxul5pRODKDJKvH5QRRf02oHU/YDN4T+WxofIAG1Nz+RXRMAuA==
X-Received: by 2002:a05:6102:1481:b0:4c4:df5b:330f with SMTP id ada2fe7eead31-4c8554696f1mr9046623137.17.1744013177543;
        Mon, 07 Apr 2025 01:06:17 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8738b2b1020sm1647791241.33.2025.04.07.01.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 01:06:17 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51eb1823a8eso2185853e0c.3;
        Mon, 07 Apr 2025 01:06:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUb7UJxdnHYbhM6Vw7DNrjQnSTGYH89rT5cEBXWd4aozJ+uBaGyPZSLtNiu+09oIvooXhmJmuf9nYgoVA==@vger.kernel.org,
 AJvYcCUhot8uSdvgO/oSoh3al83nNayK21jFzPGK5Dl3MIB8dIMiNTFwZ4P7PLSZ8Ls7U6QlDTSojpp8GFf3Hw==@vger.kernel.org,
 AJvYcCV2Lhk9GsyFHtPx7NCFVOcR1kSam/FtMao+qKM6aX2X9w7+B/77ZXm3neVSC77JpoQznVhTTgoDP+4hzOEvKg==@vger.kernel.org,
 AJvYcCVfU9VvwKGc1e1aAylr8ZhYqSK8QYN0bIK2mjRyWy9dqv5DA+E3KtbP20XjS9O3X4N3L1caUid/yzhPww==@vger.kernel.org,
 AJvYcCVjd6dtfu5ML6XO+C/HJu1zRJxBx6CHPkDNe7EjWTYDpRkE0C6MpjLVj9W/Bwsth4RywdSYtvFteZYSwvrQcZE=@vger.kernel.org,
 AJvYcCWAuR79s9UK9QCMMIeg1JxoiTqBVblIs1FWXWigmehgZoTbMw5iV2uWy97lsHaPJdnBGZ8XojfI9sbCrZ7G@vger.kernel.org,
 AJvYcCWqORCKpls2JuoRtXlhj5DQ3ZtoEr2mt+m7i+ymy5qef0PCSi6lRv0PE+64Ab2PU2EpJt3Dd+PuvdVjXA==@vger.kernel.org,
 AJvYcCX4PHiREUhBv8dPJzFaHjRN1uii9gufCMhavgTwfDo6UXnRz8eGj2mRS2bwGgSotKznjM5LdxqlNuk=@vger.kernel.org,
 AJvYcCXaHQHsx+LGm68LDBhVRqKM7QBwdSiKIvMwp8Fr2UX2KfX8crfAZ7R9CE/dvaWU8EXYenDodot26/9VRS7u@vger.kernel.org,
 AJvYcCXanLK+LH2pLYgUqXNBqxRZQoGk4/W+bGdFSl0DpVT4aE3kJ4/l1w5E9EH0XBzZpCr0Y9Eij5BJhl60vg==@vger.kernel.org
X-Received: by 2002:a05:6102:1622:b0:4c3:221:8f47 with SMTP id
 ada2fe7eead31-4c8553d0fafmr8533368137.13.1744013176401; Mon, 07 Apr 2025
 01:06:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218175735.19882-1-linmag7@gmail.com> <20250218175735.19882-2-linmag7@gmail.com>
 <4209b9816551367f8e5670cc5a08e139f0f2c215.camel@physik.fu-berlin.de>
In-Reply-To: <4209b9816551367f8e5670cc5a08e139f0f2c215.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Apr 2025 10:06:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLVw8aUY8aCowgOz+puxjrDqcbUXUAoVXGi8=FpTHwrA@mail.gmail.com>
X-Gm-Features: ATxdqUEtUaFZruSQ19joR0gbmVyVokHgxasQdxoPHK2-UPmtdbKL5noyYxpgMcc
Message-ID: <CAMuHMdWLVw8aUY8aCowgOz+puxjrDqcbUXUAoVXGi8=FpTHwrA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Magnus Lindholm <linmag7@gmail.com>, richard.henderson@linaro.org, mattst88@gmail.com, 
	ink@unseen.parts, kees@kernel.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, chris@zankel.net, 
	dinguyen@kernel.org, jcmvbkbc@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	loongarch@lists.linux.dev, monstr@monstr.eu, sparclinux@vger.kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Sat, 5 Apr 2025 at 19:22, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Tue, 2025-02-18 at 18:55 +0100, Magnus Lindholm wrote:
> > Make pte_swp_exclusive return bool instead of int. This will better reflect
> > how pte_swp_exclusive is actually used in the code. This fixes swap/swapoff
> > problems on Alpha due pte_swp_exclusive not returning correct values when
> > _PAGE_SWP_EXCLUSIVE bit resides in upper 32-bits of PTE (like on alpha).
>
> Minor nitpick:
>
> "when _PAGE_SWP_EXCLUSIVE" => "when the _PAGE_SWP_EXCLUSIVE"
>
> >
> > Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

> > --- a/arch/alpha/include/asm/pgtable.h
> > +++ b/arch/alpha/include/asm/pgtable.h
> > @@ -334,7 +334,7 @@ extern inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
> >  #define __pte_to_swp_entry(pte)      ((swp_entry_t) { pte_val(pte) })
> >  #define __swp_entry_to_pte(x)        ((pte_t) { (x).val })
> >
> > -static inline int pte_swp_exclusive(pte_t pte)
> > +static inline bool pte_swp_exclusive(pte_t pte)
> >  {
> >       return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
> >  }

> > --- a/arch/xtensa/include/asm/pgtable.h
> > +++ b/arch/xtensa/include/asm/pgtable.h
> > @@ -355,7 +355,7 @@ ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
> >  #define __pte_to_swp_entry(pte)      ((swp_entry_t) { pte_val(pte) })
> >  #define __swp_entry_to_pte(x)        ((pte_t) { (x).val })
> >
> > -static inline int pte_swp_exclusive(pte_t pte)
> > +static inline bool pte_swp_exclusive(pte_t pte)
> >  {
> >       return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
> >  }
>
> I'm not so sure about this implicit cast from unsigned long to bool though.
>
> Is this verified to work correctly on all architectures? I wonder why this

Should work fine: any non-zero value is mapped to one.

> bug was not caught earlier on alpha on the other hand.

On Alpha, "pte_val(pte) & _PAGE_SWP_EXCLUSIVE" is either
_PAGE_SWP_EXCLUSIVE == 0x8000000000UL or zero.  Due to the return
type being int, the return value was truncated, and the function always
returned zero.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

