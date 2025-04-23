Return-Path: <linux-mips+bounces-8720-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F85A991D0
	for <lists+linux-mips@lfdr.de>; Wed, 23 Apr 2025 17:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CAB9922BAA
	for <lists+linux-mips@lfdr.de>; Wed, 23 Apr 2025 15:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F7528D82C;
	Wed, 23 Apr 2025 15:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OjPls7wN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28DD28D836
	for <linux-mips@vger.kernel.org>; Wed, 23 Apr 2025 15:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421410; cv=none; b=XA4lqiZsfABDdrNe2pJBi0uCkMoL7N99wMdoxvEeuMiug9IuV0SdM913h8twrl2mcNl1uy2LNak1sT7eCis3yCWrw5JKuv77NYXt0PVHhlqMpEXsVaB+PHEema+7Bf7VeaRNFzHKI+cYGRG9vBVBJJrDeNwEh6WrdNoDS4YJh2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421410; c=relaxed/simple;
	bh=wiQRxjVfq6FHjvTR4eF4WEQlEgSYtFXiwIFHwN6ZJdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKZD606M/NYOEVC8yLPhWAW1/DjEL6iWeQwLdEnBOqLemjYe7kS6m0sSoI++xfcP8GDBZCLrADoQ8Eco6BvN7RXXZdhErrDOJevJ5HPpmbt6rRx5TXhcu3YIW8+gKbh30l4q2OHKXrblWKFRZqPhnhzKMnIYcWHSRFPqVNPGp+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OjPls7wN; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30de488cf81so128671fa.1
        for <linux-mips@vger.kernel.org>; Wed, 23 Apr 2025 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745421407; x=1746026207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jo5fNYX7M8KjPw/nzhDjJuKY3qNiI/6SOFAiqZVsVI=;
        b=OjPls7wNqoIHWJqn8Vtmy4jfhirj5aOrFBgpxDsy4m1towrIGT5zXUMNjwFJUO8/IL
         g7jsiWCs5cA8zDI8bGU1znOZXshKwoEX6iqtDXaf9nn/jfZqF64bJ8Zka1mYpCbcRMGr
         KIgHo7WtE2Gofn1RG8ZgGnWel8B5hTJi+IMenI3Zj8hYk2K661e7iNfoahxBX3xG6eOq
         zBO4VR2dYMweIw7CBFBTt+n7ks7rU09WAcSDA2i79ZnCrRDM+nUOpyXh/aalXYIUsTq6
         Frmmyt+DZiPRLJAfqopWdKFCdHGzxYW4Fdw6WWGrPJX9XgeBJzFA/F24E3JwnspCciVz
         +7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421407; x=1746026207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jo5fNYX7M8KjPw/nzhDjJuKY3qNiI/6SOFAiqZVsVI=;
        b=TtVE7Q6RvZ+FDWTO2ea6TFtZOmOUloN40ZgK4csDxqKcKP0bXEiTTsMFyAFvwZswmM
         1MK4gTeF5gLE8/CVvs+ofMQiA7H40mr0oViLk4GXFD9MJcO3ko/HszCKpB3ZgmeyTVXG
         gH8JVWT1CjvQhMhCG5B2/kpqmi9ecPYmuoCDsGbfTekUURi4shdVSQ5ZMLqsUhGLpQy+
         qDsV/kFuKCfVzTVFIDKYzuXOADGfUKQupfISYb3iDb0MMB4qQhj6pwxyXOjWR34Yd6/V
         ImdR2KzrGY8D83tKY3OuEKtSDgHoBZ5+NfLgg/gHpEoRkW10oezrZU7muXTYjVpnVmPy
         gCWA==
X-Gm-Message-State: AOJu0YxxnTsY1VwbuFbIsHf8N0gKsZwdTCzwURNmF2Sq3fRJ/UTebX5Q
	LPWOl2T1A2vAELRkPqw65DK9V2hQv0T1k64Fjg3rDhpunrH41Jj2xmy2ASdOcfTJluUWPIVWeZS
	CJUyXy4qFjQLFp6k4fklKqoP3q8jEbVeEV0zVVA==
X-Gm-Gg: ASbGncuybmMZk9PsTjOfhihiH5d9L66j3NM4xxzxk8CbNVAloX8pFLkOzlKOeIT/vyv
	WeD4KHVsGZXoDM1U3f3e8UnRvbprP2N3OySmKO8SMKYc8YdtfcY0zI+c/j2yPXZ/vvt78KFdocE
	s/Z3DobE4RCd3eNpNDzhI09/34RfZBFVfrxugkWTC7pMsMg0pQg+qNhg==
X-Google-Smtp-Source: AGHT+IETE/k4w1fu2U8cN+Dnfk6dutM38e/zDtMkQO31fN5/T3kjC7GQG5tDFfOMiRyAghFnvFrA/27CKuuGkDO0Ong=
X-Received: by 2002:a05:651c:1463:b0:30b:b956:53bd with SMTP id
 38308e7fff4ca-310904c7e91mr63840301fa.4.1745421407059; Wed, 23 Apr 2025
 08:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 17:16:34 +0200
X-Gm-Features: ATxdqUELgS6WCJFQes3519gHJSdg6pzOWNNHSfSI0N6izE-OdLoImE-rCQIjitc
Message-ID: <CAMRc=MdOVSWzt-J4_g+4H-TSVYyc0tCOmog0WSpHUqE+hCEe6w@mail.gmail.com>
Subject: Re: [PATCH 0/4] MIPS: convert board-file GPIO drivers to using new
 value setters
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all MIPS board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (4):
>       MIPS: rb532: gpio: use new line value setter callbacks
>       MIPS: bcm63xx: gpio: use new line value setter callbacks
>       MIPS: alchemy: gpio: use new line value setter callbacks
>       MIPS: txx9: gpio: use new line value setter callbacks
>
>  arch/mips/alchemy/common/gpiolib.c | 6 ++++--
>  arch/mips/bcm63xx/gpio.c           | 7 ++++---
>  arch/mips/kernel/gpio_txx9.c       | 8 +++++---
>  arch/mips/rb532/gpio.c             | 8 +++++---
>  arch/mips/txx9/generic/setup.c     | 8 +++++---
>  5 files changed, 23 insertions(+), 14 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250324-gpiochip-set-rv-mips-43c07e67328e
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Gentle ping.

Bart

