Return-Path: <linux-mips+bounces-1559-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AA285A665
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 15:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F4EA2832DC
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 14:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C0337141;
	Mon, 19 Feb 2024 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RffIvzM7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1970D249E3
	for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354272; cv=none; b=FD25hAOK0JGRpB+2LTJo34bHlS7xbm/+XRON3CZVw5K3c6SH/GVQAWCvEc6PW9co92leUOdQa9hhnoh1hxXarF+rRb2lU+wTPqwfIcCUfGa78LvInpqL4cHdsGMqR2paqZB18Ng2aigii6WHydTSpMegydeDjakaqtM5uE+YMLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354272; c=relaxed/simple;
	bh=VwezCsSQ9DJibqG86kh85HBeHbyDtKdujvrran4hZNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVjR7gPvtchnpxqVkRNh42bqevw2lvEz3SD2+DIn5AA8Fn3oIb/cyzSR8xP0Zb0LsPV/JMtGs2/hvm3eIdQsBResoJqj8kHY7SkheZWcuygMnR7WhoYVLbGFbd2s4iUpoqmaoq43GX3749rwuoFK0zw4plPFvkLIWz4bRTLvzxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RffIvzM7; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6082d35b690so10362217b3.0
        for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 06:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708354270; x=1708959070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uK6DW6wRUhapLpjMNPru+6tefOfW563KnlrWQg8HD0=;
        b=RffIvzM7PIwXi9fO8mlQ+5JFl2XbP5ps9CIz/aUfK8dlhJ61+Q9RwP+ed5eJuAZUgJ
         51fWgahW3RrD+oHxFe/ppW8sXxMxqfPnBij2H26VozgvYvdf5koHKpJ26GB6JAbuDZKv
         OkxkCaDQPLW3kLZoLKwccZlYm6bNyrM5o+nPpG4+VS4uvHm8O2CM4opBnEuOtsAju48c
         O5r6wwW7w+lBlV/+Zv9M5x7frAXvN66nu7X7n3IPIbS93dIP7cHaMddDd+PsbG7meqTG
         1VU6XpNNoXSsGkKYFUK0cvIxwz01jaUr22PuNbE0NevqmISz0leS/k8H7uTQUTwaVeeu
         24yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354270; x=1708959070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uK6DW6wRUhapLpjMNPru+6tefOfW563KnlrWQg8HD0=;
        b=ZSb0ax+rZBDzzNQJnM8cEjBLkWglyKftv7TTe3H6pdzyuj4irUbjfntmdqcelQMUtc
         /LKSVdultl+7dB3SfNm0EdVWrH9E+t7f8YCPZRKAuGrx9qmF37J5vGTMAzFpzNj/r+pi
         FuXhbNTPuWesyPie6SiwXnQiAdfatlfwjsIe7VQmGuXCXMlwrLsQ8TNc/UHOniV0lZ3S
         zs58B+urEeY8tKm3d0dLdG/eESTR1KhLDx5lL6SCPgmQa/xjMI0QTWGI3qDBAszYaXnk
         2/Xuu/cqvZYlp1rWBb93ryyR2+4JW4Ndbq7wA3v0Gh5fdndeJM/te8ptdeu3WNfdbeLg
         Q6xw==
X-Forwarded-Encrypted: i=1; AJvYcCXFS4CjeejO5EXtYui6K6JF+xFBbgly3qU/LjOluuBt1gqmPYOOXrsz4HYFlJ4pl2O+prWMJH1PpgKIUSaLteD/jgUmDwCLooFdMg==
X-Gm-Message-State: AOJu0Yx5IOA0Td59CnPnFLPriWdCaSn/KF1rerZtK1K5jERyNPAn/opO
	9E5PV0quNn9e92Kf03u5F6TXMJ3YTm7wQ4TxgJcI2tO/4ofKgxK0ra1xd/o8jkD2v4JtyAacgsa
	8udCdC82aDGx1EONlAfN9WOuIPkMH472DT3ucYQ==
X-Google-Smtp-Source: AGHT+IH9w/3fXcqUPbXBgmVF6w9lg4F5v6yvEb8r8rQEhAiFOFvfENIsHmXjey93as80w0DTDmBiAuNLdD8NfwPl304=
X-Received: by 2002:a81:ae05:0:b0:608:5b8:ac3 with SMTP id m5-20020a81ae05000000b0060805b80ac3mr7651706ywh.18.1708354270183;
 Mon, 19 Feb 2024 06:51:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-2-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-2-f88c0ccf372b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:50:59 +0100
Message-ID: <CACRpkdawXwae7GKf4zOfVUJPLgLOeEX-8w5fbnr8O6FXuZHuaw@mail.gmail.com>
Subject: Re: [PATCH 02/23] dt-bindings: gpio: nomadik: add optional ngpios property
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

> This GPIO controller can support a lesser number of GPIOs than 32.
> Express that in devicetree using an optional, generic property.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml =
b/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
> index a999908173d2..bbd23daed229 100644
> --- a/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
> @@ -50,6 +50,10 @@ properties:
>    gpio-ranges:
>      maxItems: 1
>
> +  ngpios:
> +    minimum: 0
> +    maximum: 32

I can't help but wonder what good is ngpios =3D <0>; but OK.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

