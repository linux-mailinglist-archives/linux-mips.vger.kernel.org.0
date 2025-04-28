Return-Path: <linux-mips+bounces-8824-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E6BA9E6F2
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 06:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D47A7AAA9D
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 04:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F554191F94;
	Mon, 28 Apr 2025 04:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3sblYlh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783F2154BF5;
	Mon, 28 Apr 2025 04:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745813505; cv=none; b=u/umLepY33azeCrZlt1jI0nC1tZ8dL3wclP6MLpSydIYJwYt7mu2GQFLcmW/cSggbaIKaWjn/sILpGvSnKftxfwtfQ1vXD3JXcm++pi0trGtMjBDGdAEj6nnOYjhI9d6nDun+ZT35WSBXn5M7Hx6aid8t7lUo86VeAVJiqTQfUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745813505; c=relaxed/simple;
	bh=GszICtC1MKlps1qqdTEdVMPJeZvJMbnebtbXxO/B+0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxrCWx8eyAanPgI/uFHhq44I4SSX4qToOuQzhHqxHl25j+Q1U5iDo/eTl91L4UZ22jIsYEp8f9HjahWwDhI2naBxCW0Z5+PWaeRbl0/+Py3hKATtBIMMQIT5ccQssxEu4CS9qSzz+jFIon8ZGfSErRFI9OOCYKbAme+w3TokW8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3sblYlh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4E6C4CEEE;
	Mon, 28 Apr 2025 04:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745813503;
	bh=GszICtC1MKlps1qqdTEdVMPJeZvJMbnebtbXxO/B+0o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g3sblYlhLjF5UWWfLgeX2cFERxnwlmlPie4h+P3rjlNoXbsfzQiGwHieehD6ngCsn
	 rhmdhc4wLx2GaS5nsg/p1UMEYzqqKtjebbmGfMPoq8dHbDIL3JSoPBksvWOFO0p/At
	 bj9UKsXLZTXIBzDGt11qhSB05dB9Xm1dQEkkmKes+kXzF+wuoc2Vg9mYMdjFDNEASE
	 bZ2oLLPxGCRg7Cx7S3QUcjvaW1tNNEXvEoO20tg5T+I7x+89wFR0iJWtvfnVkq7fsl
	 c7XuaoEoWwUuwlmbr/W53BK2uVzid57CEDG9HFT1y4JOSxGw7OyTtASppQbngmzL8S
	 bxc+XFclcYiKg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso676577966b.3;
        Sun, 27 Apr 2025 21:11:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUR+poA8s32Yy828ofXUqp/E/ZGCZHMMiXwyfs3w0D9hK5W1TdvzYLJK1e4MihIJ5PQjnzmEU1H9wtrQzk=@vger.kernel.org, AJvYcCX0t8ua/W1hBW2Nl9hxl7da3UL4jUzO/W9HNi7APlrFXbt672bXJixGcAGoV21cpDpxr/UJltOdUMTXKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDVWubv4vn3ARFY4/I5Ubwc8RDeFjnqEiNl1c4TmGDZNjmTRQt
	0JgRpUzLP0JFKtz/Cwd/X58PaqLmCuPCgOm4QwTlDN/c/r1GSaZeMyiNkNwObcZBgq4Yz8Rvdyd
	b2sZO8hl7e1xdRVmn4M2Y26y9SA0=
X-Google-Smtp-Source: AGHT+IHEisNdcWaw/fa8CtjrqP+A9U573RipRQlnpt73lvgPkuqTvPP8Otp3QP5r8cS0Nu+FjQV1RTDk3ZbWZtygK+Y=
X-Received: by 2002:a17:907:9409:b0:ac3:446d:142 with SMTP id
 a640c23a62f3a-ace7104eb61mr1012669166b.2.1745813502266; Sun, 27 Apr 2025
 21:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403161143.361461-1-marco.crivellari@suse.com>
 <20250403161143.361461-3-marco.crivellari@suse.com> <CAAhV-H4dQ8hRfBm2JWmgMzYH5tuy4ph6hyOSXQBLOvtCQ+K9dQ@mail.gmail.com>
 <alpine.DEB.2.21.2504280426010.31828@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2504280426010.31828@angie.orcam.me.uk>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 28 Apr 2025 12:11:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4WTrYecBj0wev8AUi_of_qAnvHCk4heTU5P_3pMZv4fA@mail.gmail.com>
X-Gm-Features: ATxdqUHBB9HeyK51drCDtyHy2AilTn3f7w5Xk9U32-mNgPMKOwyo1ild44o6QyE
Message-ID: <CAAhV-H4WTrYecBj0wev8AUi_of_qAnvHCk4heTU5P_3pMZv4fA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] MIPS: Move r4k_wait() to .cpuidle.text section
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Marco Crivellari <marco.crivellari@suse.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 11:28=E2=80=AFAM Maciej W. Rozycki <macro@orcam.me.=
uk> wrote:
>
> On Mon, 28 Apr 2025, Huacai Chen wrote:
>
> > > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > > index 46d975d00298..2cf312d9a3b0 100644
> > > --- a/arch/mips/kernel/genex.S
> > > +++ b/arch/mips/kernel/genex.S
> > > @@ -104,6 +104,7 @@ handle_vcei:
> > >
> > >         __FINIT
> > >
> > > +       .section .cpuidle.text,"ax"
> > If you submit a new version, adding a space before "ax" will be a littl=
e better.
>
>  We use no space across our port though, which is why I haven't requested
> that before.

Current status:
arch/mips/include/asm/ftrace.h:         ".section .fixup, \"ax\"\n"
         \
arch/mips/include/asm/ftrace.h:         ".section .fixup, \"ax\"\n"     \
arch/mips/include/asm/futex.h:          "       .section .fixup,\"ax\"
                 \n"     \
arch/mips/include/asm/futex.h:          "       .section .fixup,\"ax\"
                 \n"     \
arch/mips/include/asm/futex.h:          "       .section .fixup,\"ax\"
                         \n"
arch/mips/include/asm/futex.h:          "       .section .fixup,\"ax\"
                         \n"
arch/mips/include/asm/paccess.h:        ".section\t.fixup,\"ax\"\n"
                                 \
arch/mips/include/asm/paccess.h:        ".section\t.fixup,\"ax\"\n"
                                 \

So there are a few files which have spaces.

Huacai


>
>   Maciej

