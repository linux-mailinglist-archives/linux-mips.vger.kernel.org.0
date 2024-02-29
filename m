Return-Path: <linux-mips+bounces-1901-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C588986C53D
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F8CA2879CC
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F211156B7E;
	Thu, 29 Feb 2024 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="miaiGnrt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DC95788C
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199087; cv=none; b=YDWNTWD+OPECfKQi1QQEO/1gw08SOOWF4HamcPQ38UQGbXB0sd6a0sI0YNaeHdKQidNaGwxXnStv9biA7ISTHLY/tsiJoZ1z1q2Sk/bNzqzicZsh3J2/yK7Igiltas3MIg/+usZqPj3w9pyEoSsXvGRuzGmKq0FhWDpxO6TU/sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199087; c=relaxed/simple;
	bh=yLDH/SmZ8OkNo4IKopG13DYJTMTGxHzaAKTzK5mwr88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIUveTUQAf/Jqx+k0NX87ljGmM1XU2WCS0GXgjDatZhgkgpTcqp5q4TGravGYiQlPOUQm57YFaQhapUArypXxcbIHqBS0w2N/+x5I7tHv9esHtE0XZnKoWYFdDiIRbiQYD9hQzjapCx3IN95tkI7Q7xuGXkIdjuoBgpiV5iWhSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=miaiGnrt; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so773043276.0
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199085; x=1709803885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLDH/SmZ8OkNo4IKopG13DYJTMTGxHzaAKTzK5mwr88=;
        b=miaiGnrt0Ofo/Y9TQswPkiaTMl+dgvBYegpF6lL+Tla111mA5PVr0JxUPAjhFaXN8t
         YPgwarVt4S8w8FCN8D+M950Teob1tIypeRLnkMqPeU4jRKp8b7TWdBBPT36bwfbkwXD/
         POufNVxJ6LAzDlLr0WsuTatvvFG14Xojy+jC8GYqH4zfcdtn9wyFyr+uDya5ufUSjLEm
         O0olpqp7JT7iqOlii1adZmBrxq5i5+U/JP0jK5Zqfs5vz0G4f5KXA0ieOK3KVyPXedBn
         e40aVi/wAdwxsUEzL+3NTKhqtftZxv2VWjvzGDq3K+7YNRAo0Ir4QXofOrThA4Glammg
         Zs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199085; x=1709803885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLDH/SmZ8OkNo4IKopG13DYJTMTGxHzaAKTzK5mwr88=;
        b=ogFaB90TeqsvYHalipmVKvBe3azvndRsous39P684r5rghCB3bA+T5sbMiE3533J2U
         BczmBJrKR38sqX3eFUE20udXykf+APKL2Uv+j07hvTYION59dzC1QNO3zSvBb38uc98l
         ZYa5ppG7H+utIlPtVUlpcc3bGeHXO1rrJiQgrpz8DdointyjlmJU29QJrSHsOmwnzWVG
         c4idD++kueyhgoGRuIrhjMTwmAUgu0evWnVqukOzSsyzDp+XHcgl4Bcd6zM4ttiiteLS
         XG5orqsIz1kzXoexifLgnETmaG/XVPMIAq2sM8Rvdxqeq/BFvxS9xHrR6+GhSzSyMnBQ
         9b+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXifE34BKE+X8Fp6qsCv4HXmyPo7PWT8cImhl4S/oIrG89BAi9mcKOjW/q2vgJ3FOU8LErqTRMrEba1QsEOzrZite6o9X8iFJK7wQ==
X-Gm-Message-State: AOJu0YzPIuZhIvY3kCjSUnpldIiTzxDIZA9P5Xm81uYCCV4Y3mNv7DVE
	5Sw7j3kPJb3kzOv299HnTrR3d47NxWix4xW4+LcpKneLbmLHU7/HJAR5CYjbcYMavCvGHdseK8v
	pIWGrfR/6efgI+iBjYky2E4qd9NPpQcojPneJSg==
X-Google-Smtp-Source: AGHT+IGSggpuk2KLmltD3piA3qT24S+sa7pJ2na4Fu/l5Ohz9uHZf9k8yLApEggfc1Jf09gIebRKKbZvOzn1ChOVodk=
X-Received: by 2002:a25:a28f:0:b0:dca:e4fd:b6d5 with SMTP id
 c15-20020a25a28f000000b00dcae4fdb6d5mr1603586ybi.27.1709199085627; Thu, 29
 Feb 2024 01:31:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-17-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-17-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:31:14 +0100
Message-ID: <CACRpkdbUNiK7wmtR0xastCgtsp+QpfEGgXTBf32S+R5xQtxD0Q@mail.gmail.com>
Subject: Re: [PATCH v2 17/30] gpio: nomadik: use devm_platform_ioremap_resource()
 helper
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

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Replace calls to platform_get_resource() then devm_ioremap_resource() by
> a single call to devm_platform_ioremap_resource().
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

