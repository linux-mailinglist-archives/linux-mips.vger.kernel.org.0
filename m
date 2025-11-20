Return-Path: <linux-mips+bounces-12312-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B5DC73F85
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 13:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5C5784E0672
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 12:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB951335093;
	Thu, 20 Nov 2025 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RndN/vLc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B632D334C0B
	for <linux-mips@vger.kernel.org>; Thu, 20 Nov 2025 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763641927; cv=none; b=t60uoxsaKA2a04GtHWnitBKu7OjOCH7p6z1mU593Cfo41dMM/UgA+eWAWSiRqO+85IzZx7anw8aOTbCVbsO2PPNibAVqijfqP+VhU0eJgsW4ncESbDcj6B6QzX1Apz1y90/YdeEMWtuEim5wW39QZYqWUi9HLLY2u9f96DTuoY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763641927; c=relaxed/simple;
	bh=0rQwJssga9YnN7wmpQctXNGgF23ajBFMXC+AVr7LJKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p87uZf5tV73hQ7K3Ye3571AtzWOA/PwDGISbCacH838FRVkMQjV3VYT3gT329mSNqrP53fsev1plMIyuw7M5rFzG87IjMDg6NLtozapNFe+pChc2KDw0L3qep5v6GUUkGJeOx0xiYKkEbrECu1jn0I3ugcb/hTCU/NjcHEtu0n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RndN/vLc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5274FC4AF09
	for <linux-mips@vger.kernel.org>; Thu, 20 Nov 2025 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763641927;
	bh=0rQwJssga9YnN7wmpQctXNGgF23ajBFMXC+AVr7LJKY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RndN/vLcW3xfcaz/xvDoKvt/ZmZNo646bwfj9qQWiTZu6+URp3B0lujOnahV6dws0
	 0ZOIQ4EU3ddRcQ6nVSzvkolTTNWvqH/nOIH5eX42aOgwhy3N4wjB86zutNhYbTW3L/
	 5d+GqP6Q0dZiBot/M+RKigFu7lo8qq9afxAu5w2dmnqc98Y/KHk+ouuXa+pwtxf5bx
	 tjFdHf9Hb+YxFlz2EgNp/gLIKR/uZL32FLXKjIcSj0hFuz24IpqsCptzokKdGSr3ZS
	 haSNwUHsMa47PQnW2/Y5PCJW1u6JrFSxteoWc8LG/PEuqQ8SCkcyNKKf9VxsMK86oI
	 E/MX9afcql5JA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b737cd03d46so123288166b.0
        for <linux-mips@vger.kernel.org>; Thu, 20 Nov 2025 04:32:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIhPQ+c9jz86P+L2zw5Li2qd8ep2g3i9sxoJ7AMjiCjZKLstDJo9QI1hCe2T62j9qIPSHB9CfdOGay@vger.kernel.org
X-Gm-Message-State: AOJu0YxDAxPCQA0zgacxTgVMZTTSOvqmfkTzh18u6LOZqXsWvoQZ7s4P
	K9y+gYUQUlnaejwkb26Dv3i/NwQrdm2ICb7WBodC06gbJQh9GLX2+9IktjmQvAJfUN+wu3aKmMp
	BiigGZ68fm1JOMjc+z09tFjXOFRaDetU=
X-Google-Smtp-Source: AGHT+IGnP98aEN3Th7y5t9iKMMhUnRJ8JhR4C+OrFu2s9lPlxl0KM61s7+cTNxIYoSR9MLgq0dNC7ItOIHmg3EPI9dM=
X-Received: by 2002:a17:907:3e99:b0:b73:4006:1882 with SMTP id
 a640c23a62f3a-b7654eb70bbmr353238766b.38.1763641925922; Thu, 20 Nov 2025
 04:32:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120121030.28524-1-tsbogend@alpha.franken.de> <20251120131654-78e73c37-988f-4f58-aefc-ea6dacc11603@linutronix.de>
In-Reply-To: <20251120131654-78e73c37-988f-4f58-aefc-ea6dacc11603@linutronix.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 20 Nov 2025 20:32:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6oncTWGXRO_n3B-JR_qnro-=4jg5-qwRnpTox5qr=CXQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnM2O9lkigZPa0mSE5V4XbakQp0TiclOU3znpE1VWvWJozDArL9OkV-8dA
Message-ID: <CAAhV-H6oncTWGXRO_n3B-JR_qnro-=4jg5-qwRnpTox5qr=CXQ@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: kernel: Fix random segmentation faults
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Nam Cao <namcao@linutronix.de>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 8:21=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Thu, Nov 20, 2025 at 01:10:29PM +0100, Thomas Bogendoerfer wrote:
> > Commit 69896119dc9d ("MIPS: vdso: Switch to generic storage
> > implementation") switches to a generic vdso storage, which increases
> > the number of data pages from 1 to 4. But there is only one page
> > reserved, which causes segementation faults depending where the VDSO
> > area is randomized to. To fix this use the same size of reservation
> > and allocation of the VDSO data pages.
> >
> > Fixes: 69896119dc9d ("MIPS: vdso: Switch to generic storage implementat=
ion")
>
> Thanks!
>
> Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

>
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> > v2: Don't reserve additionnal VDSO_NR_PAGES, but reserve VDSO_NR_PAGES
> >     instead of the one page before.
> >     Reworked description
> > v1: https://lore.kernel.org/all/20251117191815.69556-1-tsbogend@alpha.f=
ranken.de/
> >
> >  arch/mips/kernel/process.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> > index 29191fa1801e..a3101f2268c6 100644
> > --- a/arch/mips/kernel/process.c
> > +++ b/arch/mips/kernel/process.c
> > @@ -692,7 +692,7 @@ unsigned long mips_stack_top(void)
> >       /* Space for the VDSO, data page & GIC user page */
> >       if (current->thread.abi) {
> >               top -=3D PAGE_ALIGN(current->thread.abi->vdso->size);
> > -             top -=3D PAGE_SIZE;
> > +             top -=3D VDSO_NR_PAGES * PAGE_SIZE;
> >               top -=3D mips_gic_present() ? PAGE_SIZE : 0;
> >
> >               /* Space to randomize the VDSO base */
> > --
> > 2.43.0
> >
>

