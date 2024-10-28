Return-Path: <linux-mips+bounces-6502-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE9F9B3325
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 15:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C6AA1C20FD5
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 14:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350C91DB34E;
	Mon, 28 Oct 2024 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJ9D/JXZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D18F1DA631;
	Mon, 28 Oct 2024 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730125099; cv=none; b=kRsheXy+oT2C8Szvu2M6uRagF7PYwJFKrUyv2XEGAPLw5QvCZwEMiIv+abyTmMVIcqwHbnIDk3Rg4csbB8FTz08bSTS3qcp+vgITEV8GyGs2hQGvsMpG3MG1XFLrMUX9KaAVCy9fTRyD+twqPpQRF4Nb0Uv3xV0HDADMtDTVtEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730125099; c=relaxed/simple;
	bh=30NcFE7W3QlEwFblG175ej6PI0H7YxOEUZArPsK4Syo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXmJzpulb6pJEKPj80oy5tpbO3Yvek4ejZzgsjaWcQZk/DylJbTFpAWgDS7a/9qmMi++MARE4VHBHyQUfts3WCxIjsVGs8J6x/uqpMe12eNlqLMTJz43HKfyRVo/bPd3p7HqWIYkxMr50wvp1t9aGBR5LWnhyzjmF0aHSx1llP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJ9D/JXZ; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e619057165so2361509b6e.1;
        Mon, 28 Oct 2024 07:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730125096; x=1730729896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImoXb51REQ7Fya2d4oChU+OCStxYaxddfmycRqcK10w=;
        b=CJ9D/JXZgo2cj/+CQIuh1p70nnDNNxzCvgjhmLBg0nbeDnQdS8jQalgKCYPANos3QU
         awVO+kTPiLrgYbL67X8LfaJg3ZUo5US3titDNtOatfUb4uwi6LqH/Cow2z6DP89afu3Z
         fvavO3VkfqL2/1q6vVXFzrex/HXLXEOXg2IxRyVQEFZJWnbumPzMWLzg2rdnjveztCME
         FFop7EUUjZHp3JHiTqMmCa8bLE+1NrGXAdTr9vQ8bODwXQ+nEOFKnire6d3wVoO5uv5D
         GGI/kU5m2orXVu3ie2u3AoZbe8V0grqvXuHO7sWj51v8G5uXdyXeFwSmOrVQdCJI4nXF
         YlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730125096; x=1730729896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImoXb51REQ7Fya2d4oChU+OCStxYaxddfmycRqcK10w=;
        b=Xf5JVlWJ6ssl0e7WWDh+k4Znde2geoskyXgqPF2yZQrPNkgW0vGRCjod0X0dSUOsK4
         wpZN1q9yqvf8yLfURoFYc3snHO60sCuyOP/0h6XDsSu+lmRf6AG4OlWw22iPetpBi0AA
         euwXdl+GsB+BAAurxQyt8ffVpxyesntDzCQJsecUfwHU3brKAvNRbjsGcPr6QgchRKXa
         HcZnh1284et32a4kY1vngBz8+cVXkqK2wiKlRoRJoPLLNgHDSyfT3YZRLwyiaZf6dg6e
         IqNl5pjiBFRBvdjM5Xdzl9IqG800KSYcbQGr7Ntt5OlW+EbL1GQy5xIToBFIVSZ+ERZU
         dfCA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ88ijx9rH0iqDs+9qruo4QVFUqNwDwYtDW8H/4Tv8rRA/8Tcfasax2FPP29OiDhEmiUS7yQf9wbfdzrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwIpR5bovYdm8QrD2FP/u4dD4Y4Au2Sp+JibxXPybCGK9Gwy3M
	Qz5DAeZLxYgcJwpowcWjHPGoRwsb4E8JNimXSFhpJPpaT5etBn5UVSWaGk3+I//nobpp2HUZWq3
	ENGcy+oVaAwXiK7a0eXR0A55BZMQ=
X-Google-Smtp-Source: AGHT+IEIe21Vr8jKj6/bAsk2kCSM1b2UcE1pNqthB4zEAfVSKY/yptM9Yz5JVl8ZG5HH7Cjogzn4kd6vXEzuYuTyRsQ=
X-Received: by 2002:a05:6808:2384:b0:3e6:30e2:5411 with SMTP id
 5614622812f47-3e6384403b0mr6544230b6e.24.1730125096342; Mon, 28 Oct 2024
 07:18:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920075306.704665-1-sergio.paracuellos@gmail.com>
 <CAMhs-H-ChXQSZ_6EBiTKtD7ve2j2QsVvgVm0B5O1O7BfGwKFmQ@mail.gmail.com> <4f4572c2-8436-41a6-8c8d-4811da8231b1@linaro.org>
In-Reply-To: <4f4572c2-8436-41a6-8c8d-4811da8231b1@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 28 Oct 2024 15:18:05 +0100
Message-ID: <CAMhs-H-RWLGP5DJ86U6j5dy6wJCqi2bNGx_Pnv2njbLCTyq5wg@mail.gmail.com>
Subject: Re: [PATCH 0/2] clocksource: move System Tick Counter from 'arch/mips/ralink'
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, tsbogend@alpha.franken.de, 
	john@phrozen.org, linux-kernel@vger.kernel.org, yangshiji66@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 3:16=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 28/10/2024 15:14, Sergio Paracuellos wrote:
> > On Fri, Sep 20, 2024 at 9:53=E2=80=AFAM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> >>
> >> Hi Daniel,
> >>
> >> System Tick Counter is present in RT3352 and MT7620 Ralink SoCs. This =
driver has
> >> been in 'arch/mips/ralink' from the beggining and can be easily moved =
into a more
> >> accurate place in 'drivers/clocksource' folder. This makes easier to e=
nable it
> >> for compile test targets as well as reduce LOC in architecture specifi=
c folders.
> >> Bindings are already mainlined and can be located here [0].
> >>
> >> Thanks in advance for your time.
> >>
> >> Best regards,
> >>     Sergio Paracuellos
> >>
> >> [0]: https://elixir.bootlin.com/linux/latest/source/Documentation/devi=
cetree/bindings/timer/ralink,cevt-systick.yaml
> >>
> >> Sergio Paracuellos (2):
> >>    clocksource: Add Ralink System Tick Counter driver
> >>    MIPS: ralink: remove System Tick Counter driver
> >>
> >>   arch/mips/ralink/Kconfig                              |  7 -------
> >>   arch/mips/ralink/Makefile                             |  2 --
> >>   drivers/clocksource/Kconfig                           | 10 +++++++++=
+
> >>   drivers/clocksource/Makefile                          |  1 +
> >>   .../clocksource/timer-ralink.c                        | 11 ++++-----=
--
> >>   5 files changed, 15 insertions(+), 16 deletions(-)
> >>   rename arch/mips/ralink/cevt-rt3352.c =3D> drivers/clocksource/timer=
-ralink.c (91%)
> >
> > Gentle ping on this patch series :-)
>
> I'm on it

Awesome, thanks!

>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

