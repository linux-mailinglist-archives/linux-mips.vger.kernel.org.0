Return-Path: <linux-mips+bounces-5256-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0995A966C8B
	for <lists+linux-mips@lfdr.de>; Sat, 31 Aug 2024 00:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA9A2280EEF
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2024 22:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8463F1C1AA3;
	Fri, 30 Aug 2024 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FIRXkQJK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA68A1741C6
	for <linux-mips@vger.kernel.org>; Fri, 30 Aug 2024 22:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057330; cv=none; b=PmXuhhE4C5FWzPtvoQPnTk9gpK6t5ovJsEfZrLK8Tewj9k7sQd176olpRJSbQMyQbpPAoYX62Mj+7rd02ZiLxySaX1xDeY3ZARutQRxYytWo2wGOYCKCGh9qqOIGmFySfOun3l1QrSgBd+e51Mr9V6jqjZIu6Yp2EuXvZu+9uqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057330; c=relaxed/simple;
	bh=v4iBb4s46qTC+OnNjFfAVZeMlvAyxTlCo/S0K1EAh0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=haYj78e2BRErI1ViD0DJReVeoIoUcTx/wMtBorcmkMB3K5kod4C+AydrIMBDNNfo65CMfsWAtFiITOWsNZLWZ6f+57aiNEul1e38/xK/oXBMvZLLmSRv3zFK4tbz2niJgu9xQUKcJ78g7FlMGzXhweAy/PbhSBfQkK8zCOdAu6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FIRXkQJK; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5343eeb4973so3568764e87.2
        for <linux-mips@vger.kernel.org>; Fri, 30 Aug 2024 15:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057327; x=1725662127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4iBb4s46qTC+OnNjFfAVZeMlvAyxTlCo/S0K1EAh0E=;
        b=FIRXkQJK60oX0HSKcsAyjeAb9Vrf84275dDoWiZ7DEvvDkGTn2hYJHAoKO4VGcMSWR
         OaTZ7dUy7o0/bmK9FkSGhi2jTn66XEUZkcMsHvqn7IKyV8CORW5TJe5QISGT+M8msVAN
         xbGFU4tqCyl2ljx6Ud/zAsC5jID0/rYMqIkmIjxoHUr5V1AAdoqL4njehBM3tazrHLhA
         pFqUwozDdwQ6JcADJe3VgiNYBXJHONrxDGQUAle+Z2TXimeFS/erAQuUYYUtOugpEysv
         pWdh2G5Wzx9dSeciigU/EPphpCad329evx06S3MzmbQoTy8D7PKF7dCTgf6pslvw849Z
         U7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057327; x=1725662127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4iBb4s46qTC+OnNjFfAVZeMlvAyxTlCo/S0K1EAh0E=;
        b=EJwswVgyK5TICljQtldVuNE1dmKOMGN7ii+HqwvwluF2XHK/78ikxpoaiTgOXlYUus
         VNSnjLQSyMjnilZlkIo/g13dumZdT1nsvaAYYnF6sdgJMGrFRbEFV1/hcrSGh/qsdLNM
         WiUA62EDRD/ASsKLC9/KbXbRylX+E9PeSvT9Mml/Nvev/XwuMnMxeisMfPVZ9HdHmeoo
         P6f5Wm2ugbdR5zkpsoERf9MoUo51NcTlrACkOC8em5NXcGgxt7TdBuT3WB4CXLiPooiC
         b5GvpseZ2zBQY9SiRj/TDksc2ziI4cerj//zjW6viy2J85TUWBjlFZYFV2GryDep1zc1
         X//Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaub1oL21y9P+kE8xm58npcsKakCwIS3WDkGs8cS7OiwKd4qy9qin3c1ZbSh0OF3B0N/8fbuxEuw48@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3EblpNBu070/XeWLX5zVvjVk2kr13kyOKnwlDITMdhSSkBJjA
	rs94y43o4plPjt6r5heiizlmujDVhPXC3t5h7sfj51SKcDS5Lbiyf1HwEiDru+SjvEcPBVStIJm
	CwMgRgYzRljEBEu5HD+m9dOLPwd3NGlWanX/+Tg==
X-Google-Smtp-Source: AGHT+IEtFXEb5SKkS9Dwum0owW9p7oKua/V4jc1o1ChojvOLPjtG+8DqWfpQtMEozfboOaOre8Jhvg92ZV6kMcJdkjA=
X-Received: by 2002:a05:6512:b9f:b0:533:4591:fc03 with SMTP id
 2adb3069b0e04-53546bde01dmr3131559e87.46.1725057326166; Fri, 30 Aug 2024
 15:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828142554.2424189-1-andriy.shevchenko@linux.intel.com> <20240828142554.2424189-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240828142554.2424189-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:35:14 +0200
Message-ID: <CACRpkdZ3L0DGdrFEzRUF54c=yC+aDjO1TNd0dVuSmKninpR6TQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: legacy: Kill GPIOF_INIT_* definitions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 4:26=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Besides the fact that (old) drivers use wrong definitions, e.g.,
> GPIOF_INIT_HIGH instead of GPIOF_OUT_INIT_HIGH, shrink the legacy
> definitions by killing those GPIOF_INIT_* completely.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Excellent, thanks Andy.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

