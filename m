Return-Path: <linux-mips+bounces-6885-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 085819E4F3A
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 09:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A90382870B7
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 08:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F029E1AB517;
	Thu,  5 Dec 2024 08:05:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BE67E9;
	Thu,  5 Dec 2024 08:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733385912; cv=none; b=uurHNkl62NVSEHo7qIeg7jf6ERSdhXFYQbYUgnDeO4pEdpB8RxUFVapUOb8hxLBDJ1Xn2mfkCoXu5hPO84Hcm66MivNSbS8vejwBHwO/6OJWYn2UJhpavB4C6lnRVYFJiNgpx4TIhvD9N8axfuDmEGlw9hCZnbbGd00nnk/p49U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733385912; c=relaxed/simple;
	bh=wNSVin2EsTh/ulc6E0rq1H4TXDaUocYUOBm/GkipnyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROfiC9VaalGqnB22jTg/gv6K6kC9B42vnY87E02OUNYHblpqyhPbRnzwWG0gkh15jNK3IFqHH4CxZYo7RU7X8oZR7zebUGMur6t+tmBUfi76eohRovvepto0eSPnxxPGbZPhcJvAJ6l+z6RucVYMFrPaw85jxI3Gbh+ba/3gzM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85ba92b3acfso143635241.1;
        Thu, 05 Dec 2024 00:05:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733385909; x=1733990709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlP4q3uC5bDLtilUpgKfXFCPT7CpFieLIRjR7udPpU4=;
        b=ryYniLxJLlzqMbAifnxf7COogNB/bLo0x9cztZAOvd/y61/KTXdlx9qmxaE6FPamhu
         WiLncU0lJw4c/JRXDi+UR+/5h47CRbf0y9+5EuGaB0WrzKGq3TxB3S/cUkkWw907pvrt
         rI7OpGLxTCtUznHXBEeuW8kzJA6chdVDN7AsaQLj8tabsdnOu7Wz98LlW+NyCMObOMJw
         BEBVCFc7n5XaXStHrl4mxWMjVGQ4cQ0/L3hoUNvX2sNG2/xd5GbuwYaoudjlFFvIqDDa
         ViZ5lGPqOrcwr/9q64uFHKiL776LLZqTQ8D1z5ChF3EUP4R0Kxq1FRysNj1NCqu5SkFn
         Q9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUX0HHVQpAMs5fshyg+0WZw6RDxyhP2r5iMIH7cf9spZX2R4sjCOxGDlwzkHdihibLidx+Zn2goZUwvtzk=@vger.kernel.org, AJvYcCVFAyRzD/w80/+7G14CaPZ/EQdY3bS6QvPp2wkHQYB1LSYKz/EFKyFbLQNfsiWxSwt/qVzBueJOXmnZGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPNeN2ojcnQufVihZeAFUmd+xqDEdxpmRQkHTInPb/rz636/ei
	6WBkfq6O61m8Y1dFNNbRy4SMvv7jcqB8e14qmw8EH9GS4A74KbN+gzdBTE+E
X-Gm-Gg: ASbGncvsxWKGXjPGyiGhdhSqjFDAU8VVOHDpk+djsVssiK5HCUVHJTa7uCVwI9LzWU1
	y20eClCfQ5iaG4+LqCuHEUuEpmfYWSB8PliU1yM10GXLj3kJqtbZzLf8TbIjfoWCo1ee5mPWtAc
	Yawju/jLhn0hDdmN/g9bVZPY13lzNo606VGZcRQtZ9mvssvn9BwnrTDKkUEZa06VIbz81DsIq79
	3uWy7Ob5H/7bxLg4/Bg0iNfgw+BuEu9SGloOAkW7h6QDGCSJjB5WV71tgsbvks2vvcmm4qd2G8Z
	w3yXSShG8/M9
X-Google-Smtp-Source: AGHT+IF/Ctvor0TpawIaUh692ghVlENnWGr50Qgbb9O9uQ8eObmOvgOzpCTqiDLacG1wS2dCnA2DQw==
X-Received: by 2002:a05:6102:26d1:b0:4af:c1b6:c4fd with SMTP id ada2fe7eead31-4afc1b6c9d1mr500395137.22.1733385909064;
        Thu, 05 Dec 2024 00:05:09 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2ba8b1f9sm119195241.19.2024.12.05.00.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 00:05:08 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85bafe25279so156496241.3;
        Thu, 05 Dec 2024 00:05:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1/yK6zY0P6AWQniIVFGPWmkYgPbPlZK10HKBHaopda1lYFtRG6RTDbWC3Wg61D4TRZ44cGR/KMRMDHA==@vger.kernel.org, AJvYcCWQ/erbR3P1bJZukU6t7kC1CBmi/SODzKpnNJMidTabIzwnEy+hRME7hTF7x3EqqN+1eJHIpQKxGv/ip8A=@vger.kernel.org
X-Received: by 2002:a05:6102:26d1:b0:4af:c1b6:c4fd with SMTP id
 ada2fe7eead31-4afc1b6c9d1mr500382137.22.1733385908547; Thu, 05 Dec 2024
 00:05:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011150304.709590-1-ziy@nvidia.com> <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com> <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com> <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <09B2AB6A-B122-4287-B97E-F800E511097E@nvidia.com> <995E365D-5B83-41B3-A46C-6493D203A761@nvidia.com>
In-Reply-To: <995E365D-5B83-41B3-A46C-6493D203A761@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Dec 2024 09:04:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4=HScVk2C+vkG_JqO9uMCF2VoJTuGqSi1-H=86e2RqQ@mail.gmail.com>
Message-ID: <CAMuHMdW4=HScVk2C+vkG_JqO9uMCF2VoJTuGqSi1-H=86e2RqQ@mail.gmail.com>
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with init_on_alloc=1
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	John Hubbard <jhubbard@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Alexander Potapenko <glider@google.com>, 
	Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zi,

On Wed, Dec 4, 2024 at 7:30=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> On 4 Dec 2024, at 12:33, Zi Yan wrote:
> > On 4 Dec 2024, at 11:29, Matthew Wilcox wrote:
> >> On Wed, Dec 04, 2024 at 11:16:51AM -0500, Zi Yan wrote:
> >>>> So maybe the clearing done as part of page allocator isn't enough he=
re.
> >>>>
> >>> Basically, mips needs to flush data cache if kmap address is aliased =
to
> >>
> >> People use "aliased" in contronym ways.  Do you mean "has a
> >> non-congruent alias" or "has a congruent alias"?
> >>
> >>> userspace address. This means when mips has THP on, the patch below
> >>> is not enough to fix the issue.
> >>>
> >>> In post_alloc_hook(), it does not make sense to pass userspace addres=
s
> >>> in to determine whether to flush dcache or not.
> >>>
> >>> One way to fix it is to add something like arch_userpage_post_alloc()
> >>> to flush dcache if kmap address is aliased to userspace address.
> >>> But my questions are that
> >>> 1) if kmap address will always be the same for two separate kmap_loca=
l() calls,
> >>
> >> No.  It just takes the next address in the stack.
> >
> > Hmm, if kmap_local() gives different addresses, wouldn=E2=80=99t init_o=
n_alloc be
> > causing issues before my patch? In the page allocator, the page is zero=
ed
> > from one kmap address without flush, then clear_user_highpage() clears
> > it again with another kmap address with flush. After returning to users=
pace,
> > the user application works on the page but when the cache line used by
> > init_on_alloc is written back (with 0s) at eviction, user data is corru=
pted.
> > Am I missing anything? Or all arch with cache aliasing never enables
> > init_on_alloc?
>
> Hi Geert,
>
> Regarding the above concern, have you ever had CONFIG_INIT_ON_ALLOC_DEFAU=
LT_ON
> for your MIPS machine and encountered any issue? Or let me know if my rea=
soning
> above is flawed.
>
> To test it, I wonder if you can 1) revert my patch and 2) turn on
> CONFIG_INIT_ON_ALLOC_DEFAULT_ON for your MIPS machine and run some applic=
ations
> to see if any error happens.

That seems to work fine...

Kernel log confirms it's enabled:
-mem auto-init: stack:off, heap alloc:off, heap free:off
+mem auto-init: stack:off, heap alloc:on, heap free:off

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

