Return-Path: <linux-mips+bounces-1579-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B0985AE18
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 22:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 063B31F21921
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 21:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B267A54FA9;
	Mon, 19 Feb 2024 21:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yaKQvI2I"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D354FA7
	for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 21:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708379806; cv=none; b=rxSqaJU/xPAE5XQ9Vcper5yyz5RKeECPZDp5Qe2dea+s7CkTjOB+7zaLT2Xv0d9MS4d/yZIcV56z3d68D6+7bIjY59uMygpPQTB3cMWaeG3Q/xpdlyuYgH8W9xaa/M3IkQu70rHzQ2JCUA0YXh08ITRinLb1L8u0iLD6Z5WCsRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708379806; c=relaxed/simple;
	bh=jnwZE4S2VTxOOE1MLufKwv7MLtdIeQ/H3SGA6T3ceVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KF2t+vgN4AiEzXAnuAT/kwQHi7nnAucpmygv+W8H6E1HGeq7L8/IkJLEfj5Xsx7GHVjeHi1c+Hwq8ZF6TQ33nYJr5WGEbCWQ1U26hV2mtiago4DABV/EMpZ4QZozjuLuz56x6ExxzoI+PPiOrzy5XwajJdLkDp4TRUM5sSLBj7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yaKQvI2I; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-608170eb5efso20603427b3.3
        for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 13:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708379804; x=1708984604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/z7Oth3uWYAoZv2gVpy6Dr4nj1eg780SKedkbWLNvY=;
        b=yaKQvI2IzjqJefvDuWLsiN7ih+t6Ar2DuN96gdel9Da/lXfAe0CyXVGlmNudhJragY
         SAxpmWT2IVinRNrzaJaze/UJLrcjIRBH8gjrEnF9nZ7xUMQ5Pz3qeezT/EXGY2GVF1kG
         /RhvKWGnszItfi9V84Pn4iLNaaupRH9Jh0hhSQxQ3BKz2ozGC04VFtpP4wDrXDup3BUC
         GnQE1aEOmZFViAvgWMKX92tXQuzI7AzuTftCAMqsZGoVRH5X/Fpwz6l1ssAPm2UKJCqw
         js0vmBGHx2zMjkUn6Y6KwefSnUaOBQNEjChV3pz0PVUurPGG3A7qcpAVjAuxKlwJvzmI
         3PdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379804; x=1708984604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/z7Oth3uWYAoZv2gVpy6Dr4nj1eg780SKedkbWLNvY=;
        b=WDCPZDeWXpA4Ez/Vd3udA0pwH7+LuvDQ6+SL8lV0S5kAdlX9l2/TluaEE3AoFEUGVd
         LCbI/tqpv56Kbqcb6WmqzFe16B7a2VJJ1ziNwIK8MHQRuWXBQCnbfdnbga1Y9IpemSLj
         0LWVGYKfjS8I1oiAdaBiHBxCTohnxb/wiCtChKQEjQKrOgc779KzdMOYV9wG2sAn10WC
         hh+lgkAp2dMwFTBm0uHE9ZXs9U1n6zVJmrcZ9Cvdvmu5LXY+KjBs1cj7iqZVQJUZtIvk
         +pISNGHZgx5xwc2qUBr4TzAyjwnM8zYTU77xNPgysRVCgJierNKvSNR0JsdOSdBGU64U
         LpIw==
X-Forwarded-Encrypted: i=1; AJvYcCU3JNCS1LknwFehf8OkY6g0hEM5TMKagNHofDUWvr+O3HEcezngu1ClsM93h1LD6V6DrTYDe6JmvZDkZ0cvusPoRE5mCDYYazbIBg==
X-Gm-Message-State: AOJu0YyqT21ESytKLwFDjacNE/hlEe9FgmqoKAqLJY7wFAib9tqv3cwt
	agvF9j5BSGYp1MeikjDlQEsR9QEyC8OteNNQrNcXR5j6e4qdcU0zyX+ZBUlk7ENUpl93V6UmnUi
	MYjKS8Q9NVuPWe+wIy96/fEmUJoU+e88lTh3dzg==
X-Google-Smtp-Source: AGHT+IGcz7rDFrB3H96NwCEBK79eVL4dxmtjY7EUMR+E2Y+tyM0OKpEUleavbf8K7T1I+Q8afEbrz38cYzH/dDLZwL8=
X-Received: by 2002:a81:ae41:0:b0:607:e8c7:f9c9 with SMTP id
 g1-20020a81ae41000000b00607e8c7f9c9mr12782963ywk.1.1708379803904; Mon, 19 Feb
 2024 13:56:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-13-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-13-f88c0ccf372b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 22:56:32 +0100
Message-ID: <CACRpkdbq_QxdftNGOv3+-SpfrV_qPTB-m-atdY0hCE_s8DK64A@mail.gmail.com>
Subject: Re: [PATCH 13/23] gpio: nomadik: fix offset bug in nmk_pmx_set()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 5:24=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Previously, the statement looked like:
>
>     slpm[x] &=3D ~BIT(g->pins[i]);
>
> Where:
>  - slpm is a unsigned int pointer;
>  - g->pins[i] is a pin number which can grow to more than 32.
>
> The expected shift amount is a pin bank offset.
>
> This bug does not occur on every group or pin: the altsetting must be
> NMK_GPIO_ALT_C and the pin must be 32 or above. It is possible that it
> occurred. For example, in pinctrl-nomadik-db8500.c, pin group i2c3_c_2
> has the right altsetting and has pins 229 and 230.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Ah good catch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I this something I could just apply as a fix or are there
dependencies on other patches?

Yours,
Linus Walleij

