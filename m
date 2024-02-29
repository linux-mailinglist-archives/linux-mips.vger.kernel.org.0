Return-Path: <linux-mips+bounces-1887-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A6986C4D4
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABA5C1C2082C
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F3C5A102;
	Thu, 29 Feb 2024 09:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BgfHQuZf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826105A0FD
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198416; cv=none; b=Z7tZgByqCPkbPosMAED8CqeHLThJLNCiD3GcAndyhC6uVUElsBveQiB74olpt69dZ4u/By5WEKUETPGXjljOG+tSeTfZ4mIQajDRO4pdN1NVucerlCXXUMbl/erhRV4g54DZlt9jHNSA5Ohvxha9P7HSrRVlc3Ldmk0J+LG5AVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198416; c=relaxed/simple;
	bh=5xzfnn3F2GF2BfKe/mVyPJKPZNzVltzgAEBEx7mAnhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkdIECoLk965Q2VCb3rXSJt3EZj5SgE3iSNUIQ0hpwCqC8lIQ47aIlJRG6N1TAXk90u+4UCEGFoWrDwCEADQwAkBsg0Jf4n4riOey/PqYYWJbyPwx53H1clMwfPptIazC9taEwOFnRhmLtUEsJSaveeh6bTHzraQVkIdLUZTK+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BgfHQuZf; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so710765276.2
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198413; x=1709803213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xzfnn3F2GF2BfKe/mVyPJKPZNzVltzgAEBEx7mAnhk=;
        b=BgfHQuZft3r4L/CZCnL4Qe8QX3b99EIcOrvScbe4ckSkfABseWzaJal8aDD4D8pqnx
         7hWlPF/XP71qOLqZAzN20mbge7gl6RYw5RGU67dwW09hnZVrB08GJ10ExletdYFGPeW/
         NGGdmd9dyIzUUg8T7dgiRPIAiegGoGfokjes+PjOHz2XUwvQjAT7P7HqcjBbBNKJS5aS
         dEU0JDghOEccNS7dsI3TSjUCVqEfetHzSjYGW3gwhROEgfkEHzD0Bv1cnD0ZLnjMh7dA
         B+V5m0mkXascWaz4pQdTJAis65wHPEUsSOxbJN9bjEqJis9nqIAtc1qt8SqFvKbbbTgO
         a2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198413; x=1709803213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xzfnn3F2GF2BfKe/mVyPJKPZNzVltzgAEBEx7mAnhk=;
        b=MDcee4ZCjahPPBPOrFk7x627NBw+m3cp45pODioRp16K4oXLSs84eJYKnV0TkqIJvG
         wmgrnR9LGslVSDHsV2T2IauxYHzBsNNhwRXw43/z2UhZRgSzafhPlnKFzApOIKTEtQ/2
         lTBGjVgaaOVn1XJXTVGfizqPcYJ1CKS8cAmlQ5h3AiTNMoRmXZYjEtnDxSaHX6PaMAFL
         L8NMkhNMLTMkKkI2ANFZFrjJVmepnl9gTCeOCFKJe7kXCqdGm79MLtbYfvrTcJMKbNrq
         TZC0i3t4gnhMh2smuxZ+Z4lmwIYc9PL+Dcb6X1eSA08BnILT+XAYJ34Ix3a12/FH735o
         uxCg==
X-Forwarded-Encrypted: i=1; AJvYcCX2E+Hu1s69LDCpH8jawK/xw4SgGkYQNwUAv3jkVVxGfGAWmn3100o0KJphBce/KPHhGSLfgEJmogj5CTpv6LQBsr9xraLMesqIVg==
X-Gm-Message-State: AOJu0YyWdxhwe3EscbpSGs16cApot0KjZ17jdlY5RxbvwD3G1XZcc3tD
	M1gfDOFAAheHTTI9ZnfSVgxs1QEfaviM12NjZrgf24NpgLyRGpSQ7FPKYvvJk8VO3KD1TIx6Pkn
	onl8+PkU4tauATlqlylG7P+nUeaL9tkPuM7EBvw==
X-Google-Smtp-Source: AGHT+IGt1MHfcsA4yW7IZbUF8nqXwJyHryvR5atqc+sje8VW2MJ+tKCW4a3qqqWQL8pBx8LXl1is3Fk6Gy4y4Etyzw0=
X-Received: by 2002:a25:ce14:0:b0:dcb:b072:82d5 with SMTP id
 x20-20020a25ce14000000b00dcbb07282d5mr1507386ybe.64.1709198413600; Thu, 29
 Feb 2024 01:20:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-4-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-4-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:20:02 +0100
Message-ID: <CACRpkdZ301u-iAGBVQS0VPW+2XX=onGViuaK7fZ8eeTOXJCFPw@mail.gmail.com>
Subject: Re: [PATCH v2 04/30] dt-bindings: gpio: nomadik: add optional reset property
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Add optional reset device-tree property to the Nomadik GPIO controller.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

