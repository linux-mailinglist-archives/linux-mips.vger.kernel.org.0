Return-Path: <linux-mips+bounces-1563-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D2C85A69C
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 15:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1066A1C213A7
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 14:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70580383A6;
	Mon, 19 Feb 2024 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="inQcANvX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417CE3839D
	for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354522; cv=none; b=WkfwhKXR1z7mnUfTB8924PX/PA3IBMBPO/VgHfD+D87HVEjlgHRsh+SHyaigXAqC3p0nUy9PNuurM4DibAkIlrPeHCmZ9XoGmRCRyijKdpWQw6thjcEFl+Au7DjN8fdA/eYL9k6nczDLvl5Uz37mQFgNap6l7EIMvAU+nPRDXok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354522; c=relaxed/simple;
	bh=qH5wXiM3i78ypS1cE2GuObYzdJP6nTn9QLDwtM+E/gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aecpyeBYMQv3a9EbkJCSVxpUZQ1LNxEiPJMedV2ZyASgy2mfbblRv00/Nn7Fe3c98485i/8UsKB3MTxfecvXLoglBr0RJQEBqmXxqJ5yauaw5v7Q+RVeLraw2XIwImoGT7pOzuv51A/6nPOP7jQzX1ULInFvFtMgj5mGJdnt4SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=inQcANvX; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60823dd1703so12001437b3.3
        for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 06:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708354519; x=1708959319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qH5wXiM3i78ypS1cE2GuObYzdJP6nTn9QLDwtM+E/gc=;
        b=inQcANvXPuCuqHnryjl/iYJk9U8YX74QKTNoRgcSh/w3cNzWxiLg/phOgd7Tfz8l+M
         VSOksR+Auug9hFDV0A0XSvsSlwoMB/9AftArn1ydHjsET4v8TKc90WV1CGo3lRbuO2CM
         8zPFN2Atu7tW6mPt7Pn0W4PK9UYx+j8hQG4N424F79htcSecCIoTnBle/mWx/TvWB68F
         KN6ilw43mTQ+X9kulN3QOdJwdMVKjcf2w8PbOhRiN1gjez0fcrku3gpTKuQUOKyAJJYL
         V12Wzw3rmoOuVbBwGpZRAdu7wRE9znCPzDM+JSFW6NaUqySFNJp51p+S0Rjr5Z7iVruP
         KLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354519; x=1708959319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qH5wXiM3i78ypS1cE2GuObYzdJP6nTn9QLDwtM+E/gc=;
        b=CyCjkcWDrq5bUGnsv8XiAWR6YbtGOwehCPdnI4NRo7U1FmVT30nExL+/Y4WGTY9SIa
         ccG4ohbUOygpu9oL6115Pc18FRPOc5Goh4WsFiNfNkBQz4eS4Sp4Gul3e7wq/dxnOPdm
         Ix6ybhlRuvF1m26sRC4SVhRLkSIQeoF15+mwCWM3XFTI47w9rbVRZ+uIb7D9UI54q85B
         roDLYkcM4xyVor3REtF43Z/JX6RLULlLwTBxj1tFxFc3ClFYLq0ZKbNydsF2Fv1c0wCG
         55x9KZXSI8bngZ+2iTMPi+MnKpmxkomC/omCjHIDrhi5csRUPeHEoQD6mqNxHm+yVp2e
         BIqg==
X-Forwarded-Encrypted: i=1; AJvYcCWziobxvTIYK6liG/GvhsqOQ0eLuvAW3ZO4AWbFFybKEYLw9ju8tUuNp7QJk2emybMcEnF1FArf9DGGLcLT0ck1ap/qARiGIwZfww==
X-Gm-Message-State: AOJu0Yx/yiJFKWtjcGeBuIjkoudhUofFmB7PWvzPTH6DnRT9ankcwelP
	3hGRmCW+TKmj7KS7yJ45ph4Wh8cOG1ZvtYUOxDRNTozvHf6r/GGkY00J41jMrMA2FeBVvgeBbCD
	ypx6K6owPOc+XkQLHdmTdD1rPWWOUxeksMURlbA==
X-Google-Smtp-Source: AGHT+IFltO6KkjBY25OUgoFC/Kmxadk8ahvUfaezI8PdV+xriL2Xe4U881DZubLOYqtDNDNARjLCAVm5NBCSj2rOXnE=
X-Received: by 2002:a05:690c:a8c:b0:607:a8d9:c29e with SMTP id
 ci12-20020a05690c0a8c00b00607a8d9c29emr13974595ywb.33.1708354519351; Mon, 19
 Feb 2024 06:55:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-4-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-4-f88c0ccf372b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:55:08 +0100
Message-ID: <CACRpkdZ5v4GUJtrOV4U4bhvKC+RZFXk8LZdyN1cbxmm5mxcLuQ@mail.gmail.com>
Subject: Re: [PATCH 04/23] dt-bindings: gpio: nomadik: add optional reset property
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

> Add optional reset device-tree property to the Nomadik GPIO controller.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

