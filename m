Return-Path: <linux-mips+bounces-1915-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8024186C5CD
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CCE71F25EFB
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB0B60ED2;
	Thu, 29 Feb 2024 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwpAPcha"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6A260ECA
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199781; cv=none; b=oB1nWVs4ZAxU9G1EtmoliMCRasrmhIsfyVNcbDegAd0O2KzU2hS0rFlG0onad2QCLMRF2mAF+gzmpFzuk+/s57LDsqR8iTWWFMK2ARk5H0x9JqOCF2yUMtPUuNRB2acRUv3xY0Rm7nIJHzH31Y83fJ4PMkmGSqE8mfyUjrPf4Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199781; c=relaxed/simple;
	bh=WX6ElzN18ENGeITFFDkMWABhcHlHX3NBsTlvSRXysgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KuFhtXkZeTyBW44bpwFG8wDvu5OkSH2fXxiBaqUcpuoS0Zt63PbTuKKnvH8nJK8vzUvCcSUsubTI483TQ41r3CMZoqJRwkZw8AM6e7slfJGMSWjCDJ4hFFjt6m+b6mDcFT97Kf6URCIvDyUv6N8a9MWEIUAmMOfeFMhZXriyjjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwpAPcha; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc86086c9fso776812276.3
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199779; x=1709804579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WX6ElzN18ENGeITFFDkMWABhcHlHX3NBsTlvSRXysgY=;
        b=VwpAPcha58IVwBhOUoRrxXcCj4urcm/iMWfWwUZjGayw9A6C87UU/jo0/YS9kaMSlz
         RxQ8CrM4nRtLU48hYwDoMeTNFpYXJh+IUbvD9DFbwtnIEA7UHTwZr2PBNDvNifkGuMgK
         UCVHWJ2SnfPt7jtO+Cldq2VPS94EYrNQQn6CgcdlejoJHkMOKW8pRon3uzWonq8mRo/w
         NBL3xd2c40WKqJCz7/Oyf7auOeAgP9lyCFfbsgr7xuuYnbBMW8omDHnk3O5GB6rlgzCk
         6fhbSouQodxb/7QoUkppeH3j6k5tWfOx7QAbVGq5Un9ZzaJjtayB2Hd2/Bqsi8CZ/UuK
         Tkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199779; x=1709804579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WX6ElzN18ENGeITFFDkMWABhcHlHX3NBsTlvSRXysgY=;
        b=cj2prdlfFylqV4giAANUKbFZgEi2YNu1RlTamo2lNDtdisUsYqZ5/wB0d43D+2rZy5
         K4oo1dPLHS/djHpC7W47lQCa6h/Mcy0srKi0m4kCbvxaYbaUQBkH4TzX318iEiuJ2DHi
         b6oiRxfTLVm6Onrzy0bJKOm37y4x1t246SPgx+RwlMg3HSXyG/9sbYm6NMiyWK7ELROd
         QbTDMiZOO31iIX4Zu+j8GtNjEImRaNIt39EvpvjGRVKpfYrY86y/3KLKyL974wkI7gg9
         oomKpn2dtzvWlafUScKGBtFDbNEPxFLNvsGkSm82K9+/0kruJg2c7zfTjAny2W64Oz0g
         Uc5g==
X-Forwarded-Encrypted: i=1; AJvYcCU8n8l3w6KCn3n6PZJmDyCZGSR8PlXc4Wu50rBByk7VH4pLPOqYSmR+M2TBcPuok99OILcx4LKpFsGv/MfyUdviIPWuZnkf572uCA==
X-Gm-Message-State: AOJu0YwQN5oEysMRtHfKnsKYtx4ewQMqLST2H/cW5XJyyfU0E8EEzVNw
	BXI3MIuYdJt2xH6t9eUdjarnThcyqlxSiJn4Hr0eAW55AuW6rgTmvH2BnBYUJ5RCRGAkH9S9/rk
	v7fb3v3Yh+eb2snZxaVo/e+CWUT7O/PNnoCWqyQ==
X-Google-Smtp-Source: AGHT+IGWB8ii4Rr1OBtluZ0lydmBWdI57cDGyFQbH9+5gpfG9FKxBEkZzmzb3kJFjrZ9rPeNA84QZSnk4Kq3aGP+H3s=
X-Received: by 2002:a25:b209:0:b0:dc6:9b9f:d3c0 with SMTP id
 i9-20020a25b209000000b00dc69b9fd3c0mr1735381ybj.10.1709199779367; Thu, 29 Feb
 2024 01:42:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-30-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-30-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:42:48 +0100
Message-ID: <CACRpkdbHhbxu4TX8ZnkEGA_+v2GdaYSMMgBZH6pL2a356kcS7w@mail.gmail.com>
Subject: Re: [PATCH v2 30/30] MIPS: mobileye: eyeq5: map GPIOs to pins using gpio-ranges
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

> Create a mapping between the GPIO controllers and the pin controllers.
> GPIO is handled in a one-instance-per-bank manner while pinctrl is done
> with a single instance for both pin banks.
>
> See gpio-ranges documentation:
> Documentation/devicetree/bindings/gpio/gpio.txt
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

