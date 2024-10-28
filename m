Return-Path: <linux-mips+bounces-6526-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 435759B38B1
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2F34B23EAB
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96221DE889;
	Mon, 28 Oct 2024 18:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRdmhlO2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B244C1534E9;
	Mon, 28 Oct 2024 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138677; cv=none; b=Hl5+oCfm64IJtr7cp5ggOa94weEWDsyoZ4BAaNqvY1Wc66VRtkq0VkZ5UdArpfb8YPq5bmLVLIOdxA3x7vm2xLmU9obYIR9VvkK2Ul07YtazVhggA2FnoPJ9f19ftbKE+07pO27QmPg8KlGhqy5f72Vpmqo9q0vUSMHQYwlVPU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138677; c=relaxed/simple;
	bh=+ys6N0eJrKfgfo4tsrfhYsYNup903HNaQfRQ/Wu9IhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbqkdUGBw8v4E/VIvmx6a2p7rcOjdESiBtnEQmCF1acUsArBQWeki/GzdlEAygMp9kNN3OSBmudqDFcSEohmWRmToR/UmLIvFLvWjH9RpFXAfpJVf3W4NQW9OQJ7J4COXbXlIkquPCHmvPfqsWRDzQtEjwckB0JGQwCZTxXc9S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRdmhlO2; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5ebc0e13d25so1744071eaf.1;
        Mon, 28 Oct 2024 11:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138674; x=1730743474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxJGAxsxBwoQc6bLtf48Ith1q40gkz4QAx/ZvlPDEUc=;
        b=QRdmhlO2QUZCjy10eUm+RkauhxTH+c3w00N8zdGY2mV3mvr/xT4Hkuf0cPzrAixmpM
         A8dxn8Qxm2XbNVJ1tRzkPOMMVBTbt7xbBvrWNonbCm+Y+fr2z0oaF6hxH/CCwLKFkcWI
         3a55d5urHy1bvGSSMt+7Dj/SqTD9jv+r2Q1PtL5LEItHeorOONCti/3Do3YA8KiMMQ+M
         L1Xz94Z32mrfuuH1xBLPRUhTV6l4uB4pfZp3Jqg9wSrcSYSILbJylDR1M76rMvpf97Iz
         iAS8T3VqUn79TNLbYS8MW3S2LmiOmy96oyV64b6oUBOHbGUC8DhpxBOrfvkLnZVxEAUe
         C/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138674; x=1730743474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxJGAxsxBwoQc6bLtf48Ith1q40gkz4QAx/ZvlPDEUc=;
        b=FxA1H/KvsebRux0wg4jvdRmEV9keT0P3/W+z+MweiPqOOuAyHwRYm/4G1gIfB7hDZ/
         aoQoDsontgDGqclosBqFPi6s0smGCmpvcaLFwq76Om1vC5fogPinca+5sKlyfXQIA8J6
         hzJacK2mlwW5UM42baeUU9C65E5EfwWOuy3NxG/uDLPs/34ClI7zZ4abszrHjVhATKdC
         lDbjr4J05tdI8OFZajqfloz9nMORzc9zxd1Sqwr837LV0OOOdQSgerns4fJN6ZXDRDkD
         V8WJ2IVxzX6KZkHFsRGf2yDquKxC5pSeGm9C8YVdF5HYH1RqVjxwow8aXF9KYoAdkL+S
         0n0g==
X-Forwarded-Encrypted: i=1; AJvYcCWOcA2TcpcHhDi6JWK1VPawiWrJ6Ewxyu6iJ5bdVPPMLj9UY9oltqMgyvNSNO1SCW8ICgXqdEqXmGp3uYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQRRKS2ElerfVtI/chcjTgw/B5AeyH34Q1uXzMj1Mw2jQtVRjm
	+3t1L9UiU2V2bEiL3Ng6105K5J8sx39i4i32+HZlLXVVdfdfJSzLONML+wCjxFgt5xzWEf2peeG
	SLluFsTGaXC3rB7KowO1ni+9Qnlw=
X-Google-Smtp-Source: AGHT+IF2mazyfKROWdZdNe9I9WM76gHuVnhRu5ZXMc5Urp/vfv18zcNNmW+7ExZ8nIjDyA+DElfTnvlmIY2j4ApFzDc=
X-Received: by 2002:a05:6820:1c8f:b0:5e1:de92:6b66 with SMTP id
 006d021491bc7-5ec23821f1dmr5615712eaf.2.1730138674505; Mon, 28 Oct 2024
 11:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920075306.704665-1-sergio.paracuellos@gmail.com>
 <20240920075306.704665-2-sergio.paracuellos@gmail.com> <b7ebc645-3b3b-41a0-80e4-1537f7d41205@linaro.org>
In-Reply-To: <b7ebc645-3b3b-41a0-80e4-1537f7d41205@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 28 Oct 2024 19:04:22 +0100
Message-ID: <CAMhs-H-vYFGbjJ163_ZA8ieamAHb3TWQdaDj4JLrHw0xuJv-vA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clocksource: Add Ralink System Tick Counter driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, tsbogend@alpha.franken.de, 
	john@phrozen.org, linux-kernel@vger.kernel.org, yangshiji66@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thanks for reviewing this.

On Mon, Oct 28, 2024 at 5:29=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 20/09/2024 09:53, Sergio Paracuellos wrote:
> > System Tick Counter is present on Ralink SoCs RT3352 and MT7620. This
> > driver has been in 'arch/mips/ralink' directory since the beggining of
> > Ralink architecture support. However, it can be moved into a more prope=
r
> > place in 'drivers/clocksource'. Hence add it here adding also support f=
or
> > compile test targets.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >   drivers/clocksource/Kconfig        |  10 ++
> >   drivers/clocksource/Makefile       |   1 +
> >   drivers/clocksource/timer-ralink.c | 150 ++++++++++++++++++++++++++++=
+
> >   3 files changed, 161 insertions(+)
> >   create mode 100644 drivers/clocksource/timer-ralink.c
> >
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index 95dd4660b5b6..50339f4d3201 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -753,4 +753,14 @@ config EP93XX_TIMER
> >         Enables support for the Cirrus Logic timer block
> >         EP93XX.
> >
> > +config CLKSRC_RALINK
>
> It is a timer
>
>         RALINK_TIMER

Sure, I will change to RALINK_TIMER instead.

>
> > +     bool "Ralink System Tick Counter"
>
> Silent option please if possible.
>
> Let the platform Kconfig selects the driver
>
> > +     depends on SOC_RT305X || SOC_MT7620 || COMPILE_TEST
> > +     default y if SOC_RT305X || SOC_MT7620
>
> You should have something similar the RISCV option, no default option

Sorry, I am not the best with Kconfig so I am not sure what you are
exactly expecting here.
Does the following work for you?

config RALINK_TIMER
   bool "Ralink System Tick Counter" if COMPILE_TEST
   depends on SOC_RT305X || SOC_MT7620
   select CLKSRC_MMIO
   select TIMER_OF
   help
     Enables support for system tick counter present on
     Ralink SoCs RT3352 and MT7620.


>
> > +     select CLKSRC_MMIO
> > +     select TIMER_OF
> > +     help
> > +       Enables support for system tick counter present on
> > +       Ralink SoCs RT3352 and MT7620.
> > +
> >   endmenu
> > diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefil=
e
> > index 22743785299e..c9214afcb712 100644
> > --- a/drivers/clocksource/Makefile
>
> You should use git mv
>
> Otherwise the code is like submitting a new driver

Ok, i will squash two patches in one performing the git mv then.

Thanks,
    Sergio Paracuellos
>
>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

