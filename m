Return-Path: <linux-mips+bounces-1884-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A77CB86C4B9
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4913D1F2376D
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC1C58138;
	Thu, 29 Feb 2024 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cl7F07NW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BC15813E
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198200; cv=none; b=Tv5sCrktNMMaw/aSB3x9PCwxwRcIFD0vQ8S0UaMqgcr7W4HcfnkCV55+9mOk3WHSQPTCOMck8A/l4bmocQGLurn+9GuYm4BQo7NgsfIf3kWxBHyBeCu2XR7jn6NfhtIYjQ7hAgxwlLKc91T0kb6MLEHypOVno/va5wdiTCgx3G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198200; c=relaxed/simple;
	bh=12Q3Lab7vVufV3JjMryOMg1biEUs3CM48GNmHip2yUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWsn3p7rtBIzehZEX9lDYVfdzqQKiPzJq6w1sE+NT+fXh8sL+s1A70ATLMhb49vlcQ2TOkp7sYhwIIRGnIinYF/5HKZbdkbywhSfAohFa7dz9bcOFfpHeUaRJPde8ZUcYTdS5bKi5ZPVozs0zenWep1W0Xi0qaBmq71sli8p2ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cl7F07NW; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcdb210cb6aso767600276.2
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198198; x=1709802998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12Q3Lab7vVufV3JjMryOMg1biEUs3CM48GNmHip2yUw=;
        b=Cl7F07NWVeYfL/+MDHun/YtYIltwRutU9Qh/gdb4r5x8mPnjgiTQBbbQlkgIAvrFYQ
         3jKf8J817G9Vzj1RmXu6Cxib1rQOQMagJkpPgWI1k+jgrC4qIC2kcanJ1PVPZ/iVoTVx
         f8I3kKEFsDIqR5lBUPEyFtaq+dqj+y1119W2WtrtU1GyX1YX03JU+q0B6oKgonbKuAtI
         KVVGoNkHo4aqkQR7nGb8WW/bAAvSz7BB3kBTtqcp2OgaAxtNiURAJdG6A7r1yaVDuBtI
         NTr9VXbhniteNKCQA5vC001+/X8lQ/ttig0d8PnasQ5VN+RjwIJHyR7zY2wE/WMY7dOX
         7ijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198198; x=1709802998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12Q3Lab7vVufV3JjMryOMg1biEUs3CM48GNmHip2yUw=;
        b=rVRKsyHx8/23jWQxRbYb1osHN2UEopp1nsbIWIKWMSXJGKKR+eWZA1qOSmGPftj5+V
         AV/tNIAZDbPHNKiD4QtxzCP9JbRTL1+Wp2Buu9oiZbJ9SK7FJ4KK3E44NNg0f2OadsLD
         QBTPheMcqfagpUd/1fJipWqUeRyctSQCZku7EMT470j4VPbwMc25XBAqE9qqcQA+Ovb+
         n01vP5qyn4EK67SzTDm3Wsy5Z5P7NMnFOQF3fuCV94bHzIQOYrgGT1dly8ua4VnOsaH/
         pt9US84SkrgvZ6mIh+KTHaDmwSnrTlFkPxyV84+dsYsdVBjhTTl+0XWKT170iYh+s6BU
         pu4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZaAQsJkYakMjsf2Ybzmg4aRUpXi/qoiy/bW5hnUeK8FF9M61CKtEUz/q4kS3KMDxhLkNOuSRK1Lc0a5zd0myoBVHWho8Ek9sh7g==
X-Gm-Message-State: AOJu0YxFDrV06Lns43m7qD485Z7WKBFi0iOo9SilAGKrEv1GZXEdHjhD
	pYab3gpGzMbPjFFmrSLgbZo9nsqK6iqEOHf76pHDuMhSuyURlif2yE8OEvH0LwQQHZzjtIzW56r
	4ZQs9F6ri7gz8L9VcD4f7RZm5TTvXHh5/HMiaRublmxay6Mpu
X-Google-Smtp-Source: AGHT+IH4s4l/IJmacCffS5lh7es64Kgiy4GN5FtK8rUnKhowjj7pwcmaCOZ56HnMOLBU0U+sIX27dQ8whoKCxGdEv3A=
X-Received: by 2002:a25:2e02:0:b0:dcd:a9ad:7d64 with SMTP id
 u2-20020a252e02000000b00dcda9ad7d64mr1612123ybu.48.1709198198367; Thu, 29 Feb
 2024 01:16:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-1-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-1-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:16:27 +0100
Message-ID: <CACRpkdZHUBdMvoic88Rs+A7kjWO0=h4tPMPFj_JXce-Lny9a0A@mail.gmail.com>
Subject: Re: [PATCH v2 01/30] dt-bindings: gpio: nomadik: convert into yaml format
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

> Create gpio/st,nomadik-gpio.yaml json-schema dt-bindings file as a
> direct translation from gpio-nmk.txt. Remove the txt file.
>
> Add clocks and gpio-ranges properties which were missing and are being
> used in Nomadik devicetrees.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

I will be queueing this through the pinctrl tree so I applied this patch
to an immutable branch, and I dropped the unused label as pointed out
by Conor.

Yours,
Linus Walleij

