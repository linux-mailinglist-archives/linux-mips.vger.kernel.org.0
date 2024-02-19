Return-Path: <linux-mips+bounces-1565-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6233E85A76E
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 16:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 165601F2190F
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 15:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51279383AB;
	Mon, 19 Feb 2024 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m7vj9A4f"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F293B19C
	for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708356857; cv=none; b=qT8HAaIng5j+0XOdiF5ybCnSfBfPYUDQxl0D/llfjyW3EORJQ67zc32UL2KcMFBl6NCSD6MBSd6zLgGcb/98NbdprHiHaLAhbESK8nJNALMetKLeI3/s4LKJb7572ZNBJScsj0Gl5JboOgD/XWREwWRKtQgFigyesge8adeyRtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708356857; c=relaxed/simple;
	bh=OFg9oqTwcZyyxLA+PL9UVn1Rcz+N4HoQ9s8zDEcli2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2R9PxuQE6iiJK9mqIJnX0RAzfHZOAdFYqfj0WZV8dK3LEJPShox+d+3cD6zpbDYAIOqLv9A6FolaXWIve+cPs8mH6wsd9+88PeMk5rh2Gxq2N1MR9L5SamPPdnA5jLJRw3ZZhLNi+rnAzdJAzOkCh2Mw0BMDxaP1c3Ud6CcLS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m7vj9A4f; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-21e63b586fcso1852101fac.3
        for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 07:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708356846; x=1708961646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvVPolj8oeG4AKFrK8d+pLPilaj1PpVh47xpBNRxg+w=;
        b=m7vj9A4f5LEzjmiSmDA/WYeQCusxwYIQiuPFw5YyE7Zsjs1qW5UoGBphfd/0GbHN7x
         beNs5yZ9h2EVHeAfxQLvUn7cqQvZuMWq9aEjZe4a0ojsXnvjxVzdn4XwPKUxatoR25bo
         CRqnlACzqTcmZANl0jr/CnK0S0gI7EflsuCP6LindZOlboJHu/cHTvMH6FlCHqT3qNTG
         2DEdDC7VY1mN7rXlrTIZgvdWUEnXTzx5Rj31bjNyiPSzpIh+9jxmumangJTvPwWAyBsY
         NZuiruElBb13g0vl4AM6T3nHDGhrTSxwWT+rSiQPImMOe44BUU+EIXhFPUg1k4R7D6vp
         spFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708356846; x=1708961646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvVPolj8oeG4AKFrK8d+pLPilaj1PpVh47xpBNRxg+w=;
        b=fVPUFnuuM442WGMDTyVqvuxjHxiRm5l6+hPlxZ8ENZW1qjNXyIKH2UzXrE0PoNRPCI
         NOwbw/f2weR9gRGZjL/UfHPzt5ePFOqmOivRsKTf6XN1HDfrknX0vzkY/3JL0bUqYEJx
         UoTGRsQIzf5lLaPaQc1UvmQWfUCoePmd23pG879NMdK71Bo5Hw+KifQFI3Mu2fqUs1SE
         fRAXv6Ql9bfwC2xn8RlIsmkrKckJhW8uRXjC8opSGYMFuhFTVEMvuGNwbQfs8VXBeGEL
         NmpeyEuZIaJ1YQ0ivqOhqvsCAa+BGUZGwVLty8HUnv5fhBfTvCdivIMKSfk2xzMrO5/n
         E9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJWnXBBEyTN2ntdfSBKrCEsBBxBh+cxlicNx8yiK2fTuKQtSEVHOGHSYfn53pJVBHoktCtCeAPFsHEBPBEgZs9/5wy8pHLB6MhbQ==
X-Gm-Message-State: AOJu0YxXupCNEH1sYDaV1umDhYAeFkdQCUp2IlqDL3s73EeoJx0s1KrE
	pXHiCgWH2h3izHVTgAS5rnauZjN2D0Qkdlq2UpoqBJ3ykiZ1SlOZck4huOXrgwFXVfJipZJDIBc
	hPJMae6L9Ek33QXZxHugxr1ddskxz8kVpOqdNHA==
X-Google-Smtp-Source: AGHT+IH6wgFWgrzdMctoV3icDI335MC/CdaUuFj+nGvrkX8vJ7pjFLlj1xEDLlkiBRM39lL8enM+OZmAUPyDNuGbujs=
X-Received: by 2002:a05:6870:d24b:b0:21f:a33:e48f with SMTP id
 h11-20020a056870d24b00b0021f0a33e48fmr444912oac.11.1708356846558; Mon, 19 Feb
 2024 07:34:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com>
 <20240214-mbly-gpio-v1-5-f88c0ccf372b@bootlin.com> <e031566a85ae0da0ee71dffba5d87c6414ef83e1.camel@pengutronix.de>
In-Reply-To: <e031566a85ae0da0ee71dffba5d87c6414ef83e1.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Feb 2024 16:33:55 +0100
Message-ID: <CAMRc=Me-oEx9S0w=XhwC4MzV9uzV0o0HnWBfNSstcqg5jpXyZg@mail.gmail.com>
Subject: Re: [PATCH 05/23] gpio: nomadik: extract GPIO platform driver from drivers/pinctrl/nomadik/
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 11:03=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix=
.de> wrote:
>
> On Mi, 2024-02-14 at 17:23 +0100, Th=C3=A9o Lebrun wrote:
> [...]
> > diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
> > new file mode 100644
> > index 000000000000..e39477e1a58f
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-nomadik.c
> > @@ -0,0 +1,660 @@
> [...]
> > +static int nmk_gpio_probe(struct platform_device *dev)
> > +{
> [...]
> > +     ret =3D gpiochip_add_data(chip, nmk_chip);
>
> Use devm_gpiochip_add_data() to cleanup on unbind, before nmk_chip goes
> away. Or make the driver un-unbindable via suppress_bind_attrs. In that
> case you could drop devm_ prefixes everywhere for consistency.
>

No! Why? What about error paths in probe() where you want to undo everythin=
g?

Bart

> regards
> Philipp

