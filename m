Return-Path: <linux-mips+bounces-10873-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B626FB3E49F
	for <lists+linux-mips@lfdr.de>; Mon,  1 Sep 2025 15:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D6C77A6641
	for <lists+linux-mips@lfdr.de>; Mon,  1 Sep 2025 13:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5E22773F5;
	Mon,  1 Sep 2025 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NXqh/pNg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EEF266565
	for <linux-mips@vger.kernel.org>; Mon,  1 Sep 2025 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756732859; cv=none; b=FeIN+OVy9coRWwQdjrTHZQIORhxeY/Zpjgj4lPuNq8amRiGCfMqeVO/waD+yBZ3ZlWrLJztMTBHnkAq+J8CtWHYeyGJTUt1O2tIJ4k9nwpfZ3ApYH99j8/M70GqbpTeeRZIyyGjEHwJ+Klzym5Fjp0lL8avtwnB83iGoAB8A+rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756732859; c=relaxed/simple;
	bh=+FzHD6P3GIG+WbvurBqu4eNuHXM1ihNGPdVL0Rl46EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYr0+VPU+G37r+xMs7ArdU1X3b43c2KOipxEcSrxqqua5THUwzOAyIob0dWFXElKe7lwEcMDrf0jKkjwY1LeI+XOXLemICrlLTIudEFzq2xLP4i3zZoMbiNdhdOopcqbKdPuHEFeSRFLnccWpkJcilALgdVFfMPWjndKo5yUkiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NXqh/pNg; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso3209704e87.0
        for <linux-mips@vger.kernel.org>; Mon, 01 Sep 2025 06:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756732855; x=1757337655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ApJifxHePLgmXB9tTWAWedH0XfL5fOO8paxsOA3xkw=;
        b=NXqh/pNgFvdh9534gdG5el6/ZagbcM4qdqFZr+bWDTOqlYOI7PzxLWNJpKAk0Jgw1o
         s0tv+sMZ1fZfMi3cl0T8CdMrzwyvldKPomK1W+l9cLLBhtRBFqMYxk+MIhqu352PH1FT
         PBoChcd91xX7UCHGjfj9JfHSxJGjH+w1vA2E39gFTUVFDLhItLGeT/Pfj5lTzSy+u+L+
         OZz2VDGzuqaMeTUlrGP0aZEP6BDnjizjkuyz4hPpPspV1+PUkkfcCcSBLyrjgJDaT80r
         /+xEWKIfUPKJMg4uwzkVzJBqSKLL4VEHXvCwu4IaATXnNwATlNbZ01/S335v8zUvalv5
         AMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756732855; x=1757337655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ApJifxHePLgmXB9tTWAWedH0XfL5fOO8paxsOA3xkw=;
        b=rdlETqYASg16/O4jrC8rzRPqcYgPH3dYhHF4ObBmwUpz3j2Sk4K3ZlqOeFXphWsqbj
         w0kQ9T7oHgeyyVZhcbb5DIjcq9UHH3XFsOJ9h7gZPCdA8Avb1Eo6ED2YK/cirTJqaC2o
         5EVeMb1wLc9SRv5X7wi6ns6LZs517bctmOodLEIFYRkoKa/f9OLLh2GeEzxHWXDnYtyA
         jSUiupcDg69CJ7YcY89TG6p4ALTG4Ysh1DeswclXwrZ4oADhun0KCh6dFnvMNX1oAD5x
         y4TfH8v3/bpI98UKxEOpBRS9A/5F4svqkf0hmwC/z9nY7q9ugktwhn2QWsoAXAWbix6v
         uqdw==
X-Forwarded-Encrypted: i=1; AJvYcCWR1dIORO99x4D+i9bCQB0bucpqq/ncqXUPRUV4JsznfxGlCKGbCNG0LENbS6DCgsIQc7uTkLg6OnP+@vger.kernel.org
X-Gm-Message-State: AOJu0YxJZIAFQzlhJHbu+GFGkO8J8kB0nL32rOzh3wPm905/xPqNfnoB
	ZWaD/yaMDAaIcsZj7K/opLBjrA77ER250EhdEb2cabGNhy2yJ7aVG+t4/jTpn6WnCDq0hwdnF3g
	o9OgZzZ9L2AqwQ7Tki6kesVMdq3TmN6M2iAXp8cMF2A==
X-Gm-Gg: ASbGncvMqWnyX9EhmskSWrfH2c/cViallTI3IUbQUgajR28pD91xzL4YsYZx0Bfaw6p
	xHTZvohmFFV8oyIwGF/+hwwYCuKu647bO7FBFKugDSbjuSzqqie0lEgxzdGJnuxoC3UyXhHfdAX
	amO4nrA4EfZqMlY6z3QvhMVip9FqGVlA2k7JrhAH7WdC1sfV8vjtdJwD+4gU6tblWEnvFSeut1+
	a8VyPdVvC8Y1yPGVcatPjorkOrgzW9/RfH0hhk=
X-Google-Smtp-Source: AGHT+IH912XrSXzjBk2qT9512Zc2BnDvh2hCyUh1tIL/e/b5XAWzm9U6VOUb2k8kMnjWcaLf9C4w4UWLuNtsABXzYyY=
X-Received: by 2002:a05:6512:2513:b0:55f:4016:ad2b with SMTP id
 2adb3069b0e04-55f708eae52mr2361617e87.30.1756732855435; Mon, 01 Sep 2025
 06:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org> <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk>
In-Reply-To: <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 15:20:44 +0200
X-Gm-Features: Ac12FXxw4k3UY5TBARAefSnKyhMDuDCBaUNs2qyNKYW8yrbkHP8etuyQPhIAuGM
Message-ID: <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 2:07=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Aug 28, 2025 at 06:00:14PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The radix tree containing pin function descriptors should not be
> > accessed directly by drivers. There are dedicated functions for it. I
> > suppose this driver does it so that the memory containing the function
> > description is not duplicated but we're going to address that shortly s=
o
> > convert it to using generic pinctrl APIs.
>
> This is still failing for me:
>
> [    0.628221] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000000
> [    0.636506] Mem abort info:
>
> ...
>
> [    0.801855]  __pi_strcmp+0x20/0x140 (P)
> [    0.805704]  pinmux_generic_add_pinfunction+0x28/0xe0
> [    0.810777]  imx_pinctrl_parse_functions.isra.0+0xf8/0x4a0
> [    0.816289]  imx_pinctrl_probe+0x404/0x520
>
> Full log:
>
>    https://lava.sirena.org.uk/scheduler/job/1758025#L704

That's not a lot of info but it fails in strcmp() which - I suppose -
is the one in pinmux_func_name_to_selector(). Any chance you could
check what the value of np->name is in imx_pinctrl_parse_functions()?
Is it NULL for some reason?

Bart

