Return-Path: <linux-mips+bounces-11158-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C0BB4FE53
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 15:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 274847B7A56
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 13:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDBA17A5BE;
	Tue,  9 Sep 2025 13:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WshGuwoP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FE0341663
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426217; cv=none; b=Ommb04qQSL0AvPtz4ZC2b4BOfevMCsD0E3GU995MSA0rdwml69suuGwQIAaVwEjb0fa01jpp1HqAjAgn1rFKg1OBez1boJvT8fghcOCuT4MPG89oZ8LgERhF+HRJz2Wr3nSuKQs9EW7Exgu3dgoYCrN3L50EVG0NMQq25JUUbqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426217; c=relaxed/simple;
	bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8ft3yNqzIppt584s4KkReu+T7lmRtcDQ8pRHA9mnLeQA+lgXFXR/PiC0KdvgJwjpHTKNpeB+VBxnnlK12R6G1+FjQYjmTEzyTNUdIC29yKFFojqOV/niKWN8hhldDKhJrjOKktEv/VU9QHxzx0Yp7nw9rev6NulHMiBzc/TWs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WshGuwoP; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5608bfae95eso6355538e87.1
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757426214; x=1758031014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
        b=WshGuwoPIVsb9lFy2eO/07IyciUutK7uuQEzLrSTUSjfNKPS5wMpQEXrjv0NeaGdI4
         c3TspzI3Xx4JxsLMCrHx2SjoAgubjCg4jQgdrlsl1oXQFC5P852zHoPA7bR24/YCbBcA
         I1XdtZlv9Xjv2ATUJk3NEB8lgddayESWcvn1bKOltvSyl6zwIQM0DbITSlBHpsyWne5y
         HUuK6CgsEu4Xqyp1Ym+0rMJS0UlW5r2c2TVaKifxEMAA2IXIfVCAulOl4gbCWJDT48iN
         gX8xeYRZdAxI0Bx8h1SIaS6Pv9DarT+jOs+0IaBBNvPI2xTr9Xzi+WkMAhhjGCABzpu/
         tz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426214; x=1758031014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
        b=vCKZxXzZSe+wELtYfxJmo3c2OTTH9fxATYDasX1Y4iCxoMzbEN0BP83kPCsXStoa/j
         wkXme93YRDWhVyybAlnRFao4miZUD7E100d1kzRrt+eibF5CQhNntIHZqG62sctGj37E
         t6G6gYYrv43FB6cn7tM/zb2FoKdBbQBGJJh22qGLXRihuM8IotJRSi+Qpuy4ZHgtvsZ+
         8S0bc7wSNjaonXy2behhv2N3M+qZPFH4Bl25yAhQLBvHXM0+brsy6VBpZdyj9UmC2tI1
         5FIuq+eN/XHzLK1kA8wftDnVB5a+sYMdg6cB4W3CYy/IfIxnGzUwt8FEDVEQ9biqla8q
         XqCw==
X-Forwarded-Encrypted: i=1; AJvYcCV0O7bqqZ8I5qjFOdxeN89a9fz98Weq+x9CuJi3VeECocPzsSOFQltgKgaQnIWsXofcUzlqWgdfyhHv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Ynqbcbzkk4HGEg3TTRkl05m52hR/yU8webYAZ4J/pvJH/+lq
	F+ByYF2/VDnUKmVfNQMjO8yBgLFpCoEfy8qk31+8mRHd0c3dwTtFcE8wbyFQmLeyH82/uVeWVfZ
	TpopXjCHlBsbsa8DEWGmDShs7jTvox5MgVDBgjR+OXQ==
X-Gm-Gg: ASbGnctHAxieQxTzpZjXHNgK8/HbZpDQ8HNTNTDX6g4jHt0Edh0IcmOm+mUJlPuTQNy
	ywBoAUCGRZrFoSZ8Be4qZJxtQEWddYX4U0E041MIYGkvOjpUD9rduUnDiCeFWGp7ibgh4290wg9
	/6PKaOC2AU+LtvRf/cy9zQmoOFXa7j3qar0qhuwI4XHe46eaN/LAaJKQUYaurJPPnOMBHURZTGP
	ewXoLejjGuDcVwi13Ux0oeudedTlgoj5GUrpfAgdsF8fpXIvw==
X-Google-Smtp-Source: AGHT+IHBxkyJPoP3osXnpgBU6pdsryw/ot72GCgtbXz1ukCkdeMh24NQ6AJOJ87AcYe5pD0xcM8OlZUSXTQKermPfKE=
X-Received: by 2002:a05:6512:b8a:b0:561:9635:5af5 with SMTP id
 2adb3069b0e04-562619d971fmr3883543e87.48.1757426213571; Tue, 09 Sep 2025
 06:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
In-Reply-To: <aMAv3STeZUdSQ14p@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 15:56:41 +0200
X-Gm-Features: Ac12FXw-xJdDcWBTzEH08jjeniZk8zNeWwiQ6jDsDwHAH3I_S_ZPt9IHyI66KLg
Message-ID: <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> TBH, I think those 6 all made the same mistake, i.e. thinking of the comp=
ound
> literal as a cast. Which is not!
>

What do you suggest?

And are we not allowed to use C99 features now anyway?

Bartosz

