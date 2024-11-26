Return-Path: <linux-mips+bounces-6800-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C54E9D90C5
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2024 04:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F39F0166C92
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2024 03:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF6D29CE7;
	Tue, 26 Nov 2024 03:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdTkgm8M"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD19D51C;
	Tue, 26 Nov 2024 03:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732592584; cv=none; b=pBcJk8FrLCNpqFg7s27CgrdJ29Y9xNRFRnU6hqgye9DDsaK74sQObRuU5cz3tANjQI5HMqt52M7bViYI8Gp6l+4BCJrpme1F/8x7YittJSCsnmHNqZ86NERRXNbfJafZeOlDSIuiouiyNf4AI+/pILT3tSn+1EYWUKy6uND0b84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732592584; c=relaxed/simple;
	bh=coU6IBfT0ptME5r8k6EBPWODOMkjYnPJZewhEgS4WKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaoU9r2AMz9yYrVCnQth+4P76ZJkcjopZv6ioBkoOWQCWKQ5d++YvjcmwYiZmxs9YePFH4HLjFfMUBinoIegAlg76QNbv3znhsEy/ZaQNX/2qrsAMT9QjW8f/8DEbzspTOUOqCMUzOLkSNttvPBcWbnwL4K9J0xNTLzqSKjxZ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdTkgm8M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541C6C4CED9;
	Tue, 26 Nov 2024 03:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732592584;
	bh=coU6IBfT0ptME5r8k6EBPWODOMkjYnPJZewhEgS4WKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EdTkgm8MaFvF7699I1jAEPZaEkXG5WCz9+QTv4vohZfiT0KoHvBIKjyTPnbXeUitn
	 XFl7GCBQJhzVxb4LVsSxV/twZqpQIlkwAsAACumvL++6vnZ3ZbsciVHtbIPaA2VmAB
	 BdZTfzyRGaB5+6DX6gdJlUkdOoUvITK7L0WpmO6H/BzAshEdGDag7LLKlDeQz8dS1e
	 YkwI7xrYZkegmvyIDWCFhTsYSt3xFsMz4HGHg9n53dZMKXPXdXLO0g9Qb3gTVwU21z
	 E7Sue+6YSvrztrW6X2bZViURnkVQlpqP3qh26zatH0k43WGDHeCAb6ESYUjXt+l9O7
	 Dyi7rHvBTLn0A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53de579f775so2157737e87.2;
        Mon, 25 Nov 2024 19:43:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFDFrDuuVyyTjA51eCyozGZBvRlB2ChYxi0bbyasptdJWLI24GEWTspgPdX7qNZizTZP72bAG0Xl2Qbw==@vger.kernel.org, AJvYcCUfeOFi7k0ZCxBijlGl7BX6cHmYKIoLGyWSRt2VADd/lSDb9ekf1QTjyqGauV6QL6uihnIuxUnZv6GcW7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4xkGolATIJG55UfoCXxuRVVe5SumNSxjKlcQeJ6ZaOTPoMKtM
	tXW26+kSL8l8a8PWQlLqWThGAojPbrr/7XxTGpo3+sHaXUMdWIlRW1TnK0mJ+PpaI+XjuemUSLe
	dfKePiN9Oz56B255IpDskeGS6WII=
X-Google-Smtp-Source: AGHT+IEQpZv/hujVQNHXaxcIW6GTzjb5penaCdidZiUAGFfpA0i1KjvGv3vy9KvflJV0w6RzGHdd8L2R2qyiJ36t9Po=
X-Received: by 2002:a05:6512:281d:b0:53d:e602:c0ec with SMTP id
 2adb3069b0e04-53de602c105mr3668096e87.49.1732592582919; Mon, 25 Nov 2024
 19:43:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241125230953.3090508-1-xur@google.com> <66daf1a8-efb7-4fef-92cd-eb680c7832fa@alliedtelesis.co.nz>
In-Reply-To: <66daf1a8-efb7-4fef-92cd-eb680c7832fa@alliedtelesis.co.nz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 26 Nov 2024 12:42:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQi_R_ppZu3Y7ZBEbGpGviCYoD=vBUvt9rgaPLkaLZ9Xw@mail.gmail.com>
Message-ID: <CAK7LNAQi_R_ppZu3Y7ZBEbGpGviCYoD=vBUvt9rgaPLkaLZ9Xw@mail.gmail.com>
Subject: Re: [PATCH] [MIPS] Place __kernel_entry at the beginning of text section
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, Rong Xu <xur@google.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Klara Modin <klarasmodin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 8:42=E2=80=AFAM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
>
> On 26/11/24 12:09, Rong Xu wrote:
> > Mark __kernel_entry as ".head.text" and place HEAD_TEXT before
> > TEXT_TEXT in the linker script. This ensures that __kernel_entry
> > will be placed at the beginning of text section.
> >
> > Drop mips from scripts/head-object-list.txt.
> >
> > Signed-off-by: Rong Xu <xur@google.com>
> > Reported-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>
> Works for me on my RTL9302C based board
>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>
> > ---
> >   arch/mips/kernel/head.S        | 1 +
> >   arch/mips/kernel/vmlinux.lds.S | 1 +
> >   scripts/head-object-list.txt   | 1 -
> >   3 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> > index e90695b2b60e..6d5fc498c6f9 100644
> > --- a/arch/mips/kernel/head.S
> > +++ b/arch/mips/kernel/head.S
> > @@ -26,6 +26,7 @@
> >
> >   #include <kernel-entry-init.h>
> >
> > +     __HEAD
>
> I'm not and expert on any of this but... should this go below the
> setup_c0_status_* macros (just before the CONFIG_NO_EXCEPT_FILL) line? I
> don't think it makes any actual difference but as a reader it feels more
> logical that the __HEAD annotation is applying to the .fill and
> __kernel_entry.


Agree.

Having __HEAD right before the allocated code would be better.


We have one more section marker, __REF, some lines below.
This is placed right before the affected code.


Rong, could please send v2 as Chris suggested?

Then, I will insert this to my tree to avoid regression.

I will drop the previous commit
(MIPS: move _stext definition to vmlinux.lds.S).
It changed the location of _stext when
CONFIG_NO_EXCEPT_FILL is disabled.

Thanks.




>
> >       /*
> >        * For the moment disable interrupts, mark the kernel mode and
> >        * set ST0_KX so that the CPU does not spit fire when using
> > diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.=
lds.S
> > index d575f945d422..c9c1ba85ac7b 100644
> > --- a/arch/mips/kernel/vmlinux.lds.S
> > +++ b/arch/mips/kernel/vmlinux.lds.S
> > @@ -62,6 +62,7 @@ SECTIONS
> >       _text =3D .;      /* Text and read-only data */
> >       _stext =3D .;
> >       .text : {
> > +             HEAD_TEXT
> >               TEXT_TEXT
> >               SCHED_TEXT
> >               LOCK_TEXT
> > diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.tx=
t
> > index fd5d00bac447..f12b4a7b8406 100644
> > --- a/scripts/head-object-list.txt
> > +++ b/scripts/head-object-list.txt
> > @@ -23,7 +23,6 @@ arch/m68k/coldfire/head.o
> >   arch/m68k/kernel/head.o
> >   arch/m68k/kernel/sun3-head.o
> >   arch/microblaze/kernel/head.o
> > -arch/mips/kernel/head.o
> >   arch/nios2/kernel/head.o
> >   arch/openrisc/kernel/head.o
> >   arch/parisc/kernel/head.o
> >
> > base-commit: 3596c721c4348b2a964e43f9296a0c01509ba927



--=20
Best Regards
Masahiro Yamada

