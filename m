Return-Path: <linux-mips+bounces-1894-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8639786C50E
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E20E1F21BAA
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA845D74F;
	Thu, 29 Feb 2024 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nXYyUMPa"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA005916C
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198810; cv=none; b=EUzAbDmDJu52WfWNsQA9jgQFrAb2s0jYsIyGuZu/3gYr1WY0Pw7P259wuFUqTVfFd00cTgBfOwNf3fIqIL1xIaR2xgIuBAuTQxS1kHfkv11TryXhe6o/ej/3xrQr+1gFfpaZQeo1/EJsgcE/zYCYw+yivwV6DJOHEZokFZOVBQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198810; c=relaxed/simple;
	bh=mMVB3NbVb2aor6sIOhTKCLgvCgLNr1BwNA02SqIQ2f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khAhC982GoxuyABHTXbO6ouhAMLZ1fHqG3g3mLwkCeJgIPqwC5K9k+azxQ1UVeO7x0eTXIWHyUJA3oIZRX+vNEhP8AGHPId2ROcnFCX3+8BjQXWlWXDBil4RrhL6PvmTYC+nOOjlSps9rP0cr0So5otPyTz7qslw8zH+DNEZlkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nXYyUMPa; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso788681276.3
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198807; x=1709803607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BynpSFPstF+JPRCovNMfjh5xTc1CIZoNd8nL81uMYyY=;
        b=nXYyUMPahqcmdnXVePAsGhpdzsdYM+6chflJELk3irKfodzos+tvQY7x+djuFSE+qa
         q9eCtmjtli5ZMAzkJPBquAf7XtUXQjNNLcXkOFFPFNV2GrJZ51jyMwayt/eV3U0cTK4f
         nulm2kwtUG942P2Bf2qTRor42vlTXQf/yQ06JtGUedIbzkbkKErXooS0u5szO+SmCnA1
         6pWQXEt/9tefpxDP9SMSjSv77Wc7c3Aw8Z6AIs4fZn0/U/RYzkdc1wxknxXJKsSfKsL0
         a6SHO0wK65k5YyYiW8QcK80ZKLJ3U9PijlrXKgHot6cfJZvFTHRUYqpqm1j0t+0hByJ+
         fybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198807; x=1709803607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BynpSFPstF+JPRCovNMfjh5xTc1CIZoNd8nL81uMYyY=;
        b=eMM3XY/uGUenZme38bqnxtwpybuaODMT+DMWUcfzosw6K32gZ70JYSFgWb7fKggoou
         u79vZh49zo1Qp1z3li0MjRbxmUxAsGgAPDzGtV8TRJuxzdCr+f6anldH9IJmSii0n5YQ
         bCm8pruVbu2ol8GUk6KHZaLIHlWPZZSlaPU53DFY4+2BNjwylYBumUXXy/y4OgCKCOig
         v8yoyoI0Um9IrC71npCOJpE5O1DcLxnZXKLtdsQRpOOlez4yccSB6K/A88I7feg+ajoi
         2GSOm/DFzifkDIGTTsgBxwUf4Rm4xMQ3RKkTpkHU3ilEQZ3L06boLyBIHfWdsCF29S8+
         1u5A==
X-Forwarded-Encrypted: i=1; AJvYcCU5PSWr9DIvf2YNltgmXg8Ybqd9kSoqEUNkLqIFU1p8BXYx/MwFTQCZBoC/Y0Q+r81znojC24wFrKbHMmlVcdI1keCN/xPNxqRZ9w==
X-Gm-Message-State: AOJu0YzSnC3Om21xyLG1OS6vFipMr3XWdyzT9WWinaYBVeqH+rgqgybf
	Ju+2RiHmEL2/pzq1DiaOUDyVAdFpDddqfAOx95mzcJv89/SYZWRPcM1XVYjvxcDMct8cKpnwlJR
	K2ya9vOT5whZI0E+LWuNmkECAhFB3ZAhlhp0FfhAjDEKybCmJ
X-Google-Smtp-Source: AGHT+IETBT7Vkf+KWC2B0cVuE2nVenXl/BHkUQlIpZscJkS6D21qmSwap0I27pP9tdeA/bkvEGDjtm1MbAwYZE0AjDw=
X-Received: by 2002:a25:acdf:0:b0:dc7:4c92:16a3 with SMTP id
 x31-20020a25acdf000000b00dc74c9216a3mr1423519ybd.27.1709198807667; Thu, 29
 Feb 2024 01:26:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-10-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-10-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:26:36 +0100
Message-ID: <CACRpkdZj2+b4G3V+YeMAEXy=Xkjs=c4FmJ9NBPi_2Mok00_76w@mail.gmail.com>
Subject: Re: [PATCH v2 10/30] pinctrl: nomadik: minimise indentation in probe
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

> nmk_pinctrl_probe() iterates over each GPIO block. Use an early
> conditional continue to skip to the next iteration rather than indent
> all the loop code block.
>
> Do not change code logic. The block is changed from:
>
>         for (i =3D 0; i < NMK_MAX_BANKS; i++) {
>                 x =3D of_parse_phandle(...);
>                 if (x) {
>                         ... do work ...
>                 }
>         }
>
> To:
>
>         for (i =3D 0; i < NMK_MAX_BANKS; i++) {
>                 x =3D of_parse_phandle(...);
>                 if (!x)
>                         continue;
>
>                 ... do work ...
>         }
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

