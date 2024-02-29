Return-Path: <linux-mips+bounces-1906-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B3186C56A
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A631C1C23C38
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B7A5F554;
	Thu, 29 Feb 2024 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EmJIgriT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F535F548
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199319; cv=none; b=FuXpQ7oTXDzj/JOHDwU0m1AD4NDOULtJBFypGdQPVokgHE24RK58Qjlnta6+9D7U2oSit+H6CzH9hCcVJtBy3yiUjY31eGxO07CR3+S2z/fwdheniizFmU/518jT5eEZ7b97l3YlcOd135cGTUIPIgT8LIn6FYh8gs9QyudjnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199319; c=relaxed/simple;
	bh=E2BCwCWKr83pu1Ph0WYIAlvgDlw5ksBM/Bs5jndzFeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=to00i4Z2evH6IYUgq5piLX6Bj1VGNnETBwqjSqhuojm5TktKRPdWq/uOrSZ9E1KYOI1Xe8aheyPzNljAORRHrsUX+6F0LEWRyIWdWb4kp1XIudJPntQi57Pb7/Q0AZhFYOBKSiHQmp4IA313IdxemhXPHSUnG5bvzVwbTWvfFDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EmJIgriT; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcc73148611so773069276.3
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199316; x=1709804116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f50x61FNXrIWBR6f2QHRlicPFI4c+LBiZV4KjCEImyg=;
        b=EmJIgriTLhwFa58qCl0w5+2kg9n1eUSXkpQWbhYvXRQKvuq5IMKs1050cmML5xRC2d
         6iB7gVpoVtNKCZ6IrkJRFKkU/pF5qo9uwVAeOZelGZxS3aadCNun0CmKA+X8RklR/vCH
         vRGcfw0bQOqWdisJUTNwlUqslQiKrDsHYncjLTWBQkVPXiZqI0RwL8+lAuE9huFI7SaC
         TPs7A7XH80MBRVdeWTiz/edLSGlbPSaKRShB6kDLHy9JeKc9zG3wZq+nUzMQ+A6x16ls
         UOTTacrQM2JWW2W/Txrbno7Ga6hbkrhHlGq6gFy9bIkB5O5LfcCo1nJcQD+BhhzQcDYH
         a8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199316; x=1709804116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f50x61FNXrIWBR6f2QHRlicPFI4c+LBiZV4KjCEImyg=;
        b=D1Y648gWazzeK9woZZpz2OlAaUPrM/SYygyEpW4Zsa4lvZ8ppfBK5r6JSacW/mAYxd
         tMYFbkkwugjNie/Bxr8OhAwzNaQtg2h8IIe7C5vvWH9IDnbR2x2K+tvhAppHvIlh80Xa
         fsl3dYLLNJx87b3kW4wDiDc+g3BUzS5p/CaE8FSOA9nO2jBjRu6ELBnEUhrqGU+sBBPB
         MVYMGAIuGIwatDRvCOOUhQHUKXGm0PTK/FCEARjR0wA2uy7bc1b2OZ9RXOUr6A3qgG9B
         7+2TekU7QDSQC7CAJFBWQLCQrn4RUjFEDppCrNh4dqf0kjPbuIwCVrkHeJUNtk5DINrD
         iB8g==
X-Forwarded-Encrypted: i=1; AJvYcCWwkDRXuRc231aiJb230TsyDp4j7Inu7XdxX27NzzU7h6q2YOpjlkaWTrxztU+tzj9GRPKEtKz3SsGr7X/7T247mrvdmL8fAOWpwA==
X-Gm-Message-State: AOJu0YxxSKDvoI2HXX3MVUTrGEAZu3HYB37IeEQ+teycW20j93WAaR6r
	hsATVUU7B+GwUDTG9DE30+z29APSgvqSZErc8Zjs8/7SgdBbVj6RXapjnqfwm7WqJpzk+w3NeRo
	7ATV1KtZnUmLdwRJVlZRy9TiThVMPq8ap9XxGZw==
X-Google-Smtp-Source: AGHT+IFfB1CzRcwoLd5A9MKz+8jkh/89e61JZ8wEvR20tH5L9rZAg6gSACHkzLEHC6fcpjmod7PS/OVzmdDO4jPTA5M=
X-Received: by 2002:a25:c904:0:b0:dcf:4663:ecd8 with SMTP id
 z4-20020a25c904000000b00dcf4663ecd8mr1840712ybf.8.1709199316704; Thu, 29 Feb
 2024 01:35:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-21-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-21-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:35:05 +0100
Message-ID: <CACRpkdb4egmLuudmhv5Lk23+RbKNOnxfQWmYz8S5pB2hJyV2jA@mail.gmail.com>
Subject: Re: [PATCH v2 21/30] gpio: nomadik: change driver name from gpio to gpio-nomadik
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

> This GPIO driver is historically related to the Nomadik platform. It
> however can be used by others as it implements the ST STA2X11 IP block.
> Pick a less ambiguous name for it.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
(...)
> -               .name =3D "gpio",
> +               .name =3D "nomadik-gpio",

Patch applied after amending $SUBJECT to be nomadik-gpio rather than
gpio-nomadik.

Yours,
Linus Walleij

