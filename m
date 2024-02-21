Return-Path: <linux-mips+bounces-1604-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B362685DFB8
	for <lists+linux-mips@lfdr.de>; Wed, 21 Feb 2024 15:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 625F11F23CEE
	for <lists+linux-mips@lfdr.de>; Wed, 21 Feb 2024 14:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035137FBBB;
	Wed, 21 Feb 2024 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WvBwT6Kx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168E87FBC3
	for <linux-mips@vger.kernel.org>; Wed, 21 Feb 2024 14:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708525909; cv=none; b=FEtmhDsLUI+1kV54fMjEcqAKj8bqFhFlb63BBWmx4rDWqLNvG/b6KUYtYKKXL9pMDASpw9v7a9C9eZm7LlgcxSZYFS7oVqCjTgFQK+56Qjap64Sn7KzHaxmnZh916IS0bcb1/D2mcRdHa/4RrDPBiHwln6h+Rg2PKyWob3+zNmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708525909; c=relaxed/simple;
	bh=SzQd87jZwG+oQiOKEili2Q5rk6+fGGD3FVIw4/CT1CM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtkJjxJkPE2TAHckREq2UKHY1pDKVPJJm/P80kb2S7+7lsa/HRYJYSJ69jgaTbokud8F/A1zGm9Bl8XdksSXhxOmucvgy5neWPBv3PKTqum9Qz1hBCGgCrJy9mieg5HT8K47gBLFY8iMrS5n2MWsBbI6VLA9lrRkW3B/JU+ux3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WvBwT6Kx; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc745927098so672897276.3
        for <linux-mips@vger.kernel.org>; Wed, 21 Feb 2024 06:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708525907; x=1709130707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzQd87jZwG+oQiOKEili2Q5rk6+fGGD3FVIw4/CT1CM=;
        b=WvBwT6Kxg0pz41I5TVkIu6EVzlO3ZDVkCIV9Z+g8N0BHND5m7t8ljeJzvjBSHum0nk
         fzp23KDC3LOWR4Bx0hebzKNR6NvbzbTAMNq9B7gfVse5yw8y+SZvP+Ak81S91jQyX/8L
         3Htg9i3w4wF+RICufExVT1gX1Y6VUlQgr+ePd3Tzz21PO+SxKVKCGQImxb46c+y/2ifm
         cuPZEYaImpDBi971tR+T118AzAP/0R+tTQXH4i5R4yy21S1tXI/hVgbipb5iamrXxfHj
         QuolaT5uWejS1o3TNuYztREzKcG3kMlMJHvDKSnQukwSm0/u0qB2iNOXPXdzWLViqIpA
         IE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708525907; x=1709130707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzQd87jZwG+oQiOKEili2Q5rk6+fGGD3FVIw4/CT1CM=;
        b=W3KtCAiG++Xg0vc9G6Tb4gDQvaRf1qcXUWgQS2vNA0BnfsjhhnnhlANTnIB0CbnKpt
         kfuLcujClRkD8MXT2vLDNKuaZTs/YTYMS+ek5kYq06E7UDfxVqzIqdOgnwwy93RfPgCk
         ErIkkamwDJqWJ2uWa8dTTvjOdzwJpC3aD0WXj4tZQrGw3wuBChX+oTD0HaPDYtIAu+o3
         fQvvI8TPuMojZL1b8zmtyfpZntXANTIP2uXCVhqbD+bnpM7ZR5/9pCBHt/4YYGSZjLfA
         zk51sDpMOGrYC9ahxwxruPNFUr2xbE/fQ8G0KYHheeOSHadInOxT/0JRA4CbFJG/ZO/N
         ezhA==
X-Forwarded-Encrypted: i=1; AJvYcCXwCFoT/FP4x09G3LApnXfYImODEtZi9NwJiAiwy/O8UNKLUMrLzT9Y6YyvPtD0bYuwesW7fe23BGsZffe04VMIgnImjNdRj1YHoQ==
X-Gm-Message-State: AOJu0YzgrlcAdskTLIiWUC7p20iqDo23GbsHRDjob1fvRW1toxn6Qrfc
	vwXCmx2XcjV02g8c24ajr5c5PU4N995zsGac3EsbgeEZocisZvgMQe/xayTK6cF+ayqb09DSSlq
	nc7QaPefOPrdlKzRdsGa4eCxy+ZXX7PznuHgnxA==
X-Google-Smtp-Source: AGHT+IHtPHuNmDP1ivorhMWyf7CtrVAVcOmamjArI6U21e7odr0+fcnGW+8ENjWO4dIYPF7XJm3UqeeahMkOdj2+Yic=
X-Received: by 2002:a25:e0d2:0:b0:dc7:5c37:5420 with SMTP id
 x201-20020a25e0d2000000b00dc75c375420mr15986478ybg.60.1708525907011; Wed, 21
 Feb 2024 06:31:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-18-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-18-f88c0ccf372b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 15:31:35 +0100
Message-ID: <CACRpkdYLBGsphNkmWyPXQZvFaO2hHGHGTMt1eqz-HAa2k5F3bg@mail.gmail.com>
Subject: Re: [PATCH 18/23] gpio: nomadik: support mobileye,eyeq5-gpio
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

> We create a custom compatible for the STA2X11 IP block as integrated
> into the Mobileye EyeQ5 platform. Its wake and alternate functions have
> been disabled, we want to avoid touching those registers.
>
> We both do: (1) early return in functions that do not support the
> platform, but with warnings, and (2) avoid calling those functions in
> the first place.
>
> We ensure that pinctrl-nomadik is not used with this STA2X11 variant.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

When testing I noticed that this patch breaks Ux500 (up until patch 17
all works fine!).

But I don't know why.

Trying to figure it out...

Yours,
Linus Walleij

