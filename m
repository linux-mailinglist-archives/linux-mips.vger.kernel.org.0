Return-Path: <linux-mips+bounces-6530-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5447D9B39DD
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 20:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 012EF28208B
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D99218FC7F;
	Mon, 28 Oct 2024 19:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ir/89H2Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D0A18B03;
	Mon, 28 Oct 2024 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730142143; cv=none; b=Ul5SkFqIuar7LM3M9NsMC4vYIhENtQ/2I6/h+k5Jv9g78yzzJJl0RMKEwvqEbVEbaONYZPaFlr4iIRNyPwkDD420wZkrPCqaMu3i8yP4FhPsVMRlYT756TnI2C2+nGZHhX3TbQnOMqFVB3Q3QuD6LppjYDTa6CiEuDUBWGQVUDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730142143; c=relaxed/simple;
	bh=PfkOnwB+bMpyhgRa6jXCUKCraZEPEu1fw+cmCIjNMBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exBrWGCfirXTLqdVWNyAWw7nn68O2Xt2JUzBfPp6maatx/doEhnIfED1kUrsaqFUnRy+Y6sCNSXm61ZIDOfYZsXhAuWSHNgg+1NZ80oj83kHNGyMVp41PLLFbrlc78878bgyfWlMbFaObR+LSohBoUGsIT4ovFPTVPMqAmD6yFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ir/89H2Q; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e5fb8a4e53so2452815b6e.1;
        Mon, 28 Oct 2024 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142140; x=1730746940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjPQBVAap4Gmg6+47H3QlJPjS4CWKfBshoj23KhRTLc=;
        b=ir/89H2QvnB4kx352JLmgVUKsPxHxRqCj8FoSJUlAWOXSmTDjk5Y45Sda3DZydpql1
         z94cT+6Ooo0MW4bG5mrUOJV8OKwWhReAls4N7OhiH9MSTUdeO6wtLMczRJC2GxYQcGlY
         fu1bKTWUGFwWQ9ajFMBMq/8DzcV/Th0dDWfk0VvYfSRrMpjby7enDruQVM9UnymXq559
         LOzi+/yv4o/xiyirUdTmUsu+Gyro5un8TssPgK+Phy5GwSlgH2e+Nahyx/D6ZB1kWkKs
         4VK/kWhJG0RDQGauRFqO7/9Fi/FAZf2bNyjblHOEeodj6IdbhBaIRUD0bq04Eo79LHFJ
         GOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142140; x=1730746940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjPQBVAap4Gmg6+47H3QlJPjS4CWKfBshoj23KhRTLc=;
        b=lQCMaaCVBEwGOuHE/8D/ObQ39Gebo3dpvgHcppCyzvgasADLWyLLp2vfho8KoZ6xUk
         OQspRZn9tBfKhnEBEP853AFTGCwJqFoHee3axogDVxyvxzjOvGywJGDgpqy1brMlMQCH
         xxJL7LM2OQO+Cdj8VgIl9OUDNb/PSGNg0LVSuZjtR+nGnNh+w6Zf0ixTpFnN4D1EmiSF
         U9x0soX9K161N+RSy4Xy4cIqoSUu8APslQGlxxq98S8p45ZqFJ1d+xL06BEZgbR+MK2q
         XQ2UVgSy7p6vMlJbzRT1I3RK+TeWjZrxUogdrbTczIDxgUWubqIkPtp0XBT8H3g3Iinb
         WL1g==
X-Forwarded-Encrypted: i=1; AJvYcCV5Oeigi+tJZYt4DUYIc+A+x/pCPbFVD3gVMZ0XzmF3oGr6SGukT4aQw0c0/ERnADMlr2L736EsjHe+qi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaPyquNLuCi4S0ssaK4Eu8fmO/i3rIn2hpicGgrNePVDC8DxUX
	uEMT9hXcTQ1CvnM6DfpiLUOSRbytEssshxjzPg/fDqaw0NHjDSyfqrGEH6w+DyRO2Eid3t8PbpI
	JErvxPAu2q+aiSKqX+nNxfHlQs1g=
X-Google-Smtp-Source: AGHT+IFZCm2W053kupwFsQy3I/bQ4Ks7OpIgQM2SJABs/kAYSbN3VhEiAN9xZcSOqiBnqzCePwsXa5B63/ITl+Y5Dqw=
X-Received: by 2002:a05:6808:191a:b0:3e6:b3:33ea with SMTP id
 5614622812f47-3e63824763cmr8102721b6e.14.1730142139820; Mon, 28 Oct 2024
 12:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920075306.704665-1-sergio.paracuellos@gmail.com>
 <20240920075306.704665-2-sergio.paracuellos@gmail.com> <b7ebc645-3b3b-41a0-80e4-1537f7d41205@linaro.org>
 <CAMhs-H-vYFGbjJ163_ZA8ieamAHb3TWQdaDj4JLrHw0xuJv-vA@mail.gmail.com> <e21c00b0-a8ce-48f3-9ec9-72540701a78b@linaro.org>
In-Reply-To: <e21c00b0-a8ce-48f3-9ec9-72540701a78b@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 28 Oct 2024 20:02:08 +0100
Message-ID: <CAMhs-H9-QdfiuajhmiAJN_BWi4Hc_9A_cq7Fc8XxZXiDJdaYTA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clocksource: Add Ralink System Tick Counter driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, tsbogend@alpha.franken.de, 
	john@phrozen.org, linux-kernel@vger.kernel.org, yangshiji66@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thanks a lot for the detailed explanation. It was really helpful.

On Mon, Oct 28, 2024 at 7:44=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 28/10/2024 19:04, Sergio Paracuellos wrote:
> > Hi Daniel,
> >
> > Thanks for reviewing this.
> >
> > On Mon, Oct 28, 2024 at 5:29=E2=80=AFPM Daniel Lezcano
> > <daniel.lezcano@linaro.org> wrote:
> >>
> >> On 20/09/2024 09:53, Sergio Paracuellos wrote:
> >>> System Tick Counter is present on Ralink SoCs RT3352 and MT7620. This
> >>> driver has been in 'arch/mips/ralink' directory since the beggining o=
f
> >>> Ralink architecture support. However, it can be moved into a more pro=
per
> >>> place in 'drivers/clocksource'. Hence add it here adding also support=
 for
> >>> compile test targets.
> >>>
> >>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >>> ---
> >>>    drivers/clocksource/Kconfig        |  10 ++
> >>>    drivers/clocksource/Makefile       |   1 +
> >>>    drivers/clocksource/timer-ralink.c | 150 +++++++++++++++++++++++++=
++++
> >>>    3 files changed, 161 insertions(+)
> >>>    create mode 100644 drivers/clocksource/timer-ralink.c
> >>>
> >>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfi=
g
> >>> index 95dd4660b5b6..50339f4d3201 100644
> >>> --- a/drivers/clocksource/Kconfig
> >>> +++ b/drivers/clocksource/Kconfig
> >>> @@ -753,4 +753,14 @@ config EP93XX_TIMER
> >>>          Enables support for the Cirrus Logic timer block
> >>>          EP93XX.
> >>>
> >>> +config CLKSRC_RALINK
> >>
> >> It is a timer
> >>
> >>          RALINK_TIMER
> >
> > Sure, I will change to RALINK_TIMER instead.
> >
> >>
> >>> +     bool "Ralink System Tick Counter"
> >>
> >> Silent option please if possible.
> >>
> >> Let the platform Kconfig selects the driver
> >>
> >>> +     depends on SOC_RT305X || SOC_MT7620 || COMPILE_TEST
> >>> +     default y if SOC_RT305X || SOC_MT7620
> >>
> >> You should have something similar the RISCV option, no default option
> >
> > Sorry, I am not the best with Kconfig so I am not sure what you are
> > exactly expecting here.MT7620
> > Does the following work for you?
> >
> > config RALINK_TIMER
> >     bool "Ralink System Tick Counter" if COMPILE_TEST
> >     depends on SOC_RT305X || SOC_MT7620
> >     select CLKSRC_MMIO
> >     select TIMER_OF
> >     help
> >       Enables support for system tick counter present on
> >       Ralink SoCs RT3352 and MT7620.
>
> Basically the idea is to have the platform's Kconfig selecting the
> RALINK_TIMER. If I'm not wrong the Kconfig in arch/riscv/ralink should
> select RALINK_TIMER under the "config SOC_RT305X" and "config
> SOC_MT7620". The block "config CLKEVT_RT3352" has to be removed.
>
> Then this (clocksource) Kconfig option is a silent option. The user
> won't have to figure out which option to enable because that will be
> done directly when selecting RT305X or MT7620.
>
> The only reason to not have it silent is if you really want to opt-out
> this timer because it is not present on a different version of RT305X or
> MT7620.

Ok, then I don't want to silence it since those ralink's platform
SOC_RT305X and SOC_MT7620 includes other SoCs models that do not have
this timer (rt3050, mt7628 for example). Only models
rt3352 and mt7620 include this. So I guess having this is the correct
thing to do:

config RALINK_TIMER
    bool "Ralink System Tick Counter" if COMPILE_TEST
    depends on SOC_RT305X || SOC_MT7620
    select CLKSRC_MMIO
    select TIMER_OF
    help
       Enables support for system tick counter present on
       Ralink SoCs RT3352 and MT7620.

Are you ok with this?

>
> IOW, this option should be:
>
> config RALINK_TIMER
>       bool "Ralink System Tick Counter" if COMPILE_TEST
>       select CLKSRC_MMIO
>       select TIMER_OF
>       help
>         Enables support for system tick counter present on
>         Ralink SoCs RT3352 and MT7620.
>
> The option COMPILE_TEST is to compile on different platforms, thus
> increasing the compilation test coverage. At the first glance, the
> driver does not seem to pull arch dependent code except definitions
> which look compatible with other archs, so it should be fine.

Yes, there is no arch dependencies since the only include which was
dependent was not really needed and I already got rid of it when I
performed the git mv. I already checked
that the driver is properly compiled for allyesconfig target.

Thanks,
    Sergio Paracuellos

>
>
> >>> +     select CLKSRC_MMIO
> >>> +     select TIMER_OF
> >>> +     help
> >>> +       Enables support for system tick counter present on
> >>> +       Ralink SoCs RT3352 and MT7620.
> >>> +
> >>>    endmenu
> >>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makef=
ile
> >>> index 22743785299e..c9214afcb712 100644
> >>> --- a/drivers/clocksource/Makefile
> >>
> >> You should use git mv
> >>
> >> Otherwise the code is like submitting a new driver
> >
> > Ok, i will squash two patches in one performing the git mv then.
> >
> > Thanks,
> >      Sergio Paracuellos
> >>
> >>
> >>
> >> --
> >> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs
> >>
> >> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> >> <http://twitter.com/#!/linaroorg> Twitter |
> >> <http://www.linaro.org/linaro-blog/> Blog
>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

