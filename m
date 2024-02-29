Return-Path: <linux-mips+bounces-1889-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C0586C4EF
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CC111F23F60
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2B75A0F1;
	Thu, 29 Feb 2024 09:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="skO3Z3ES"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1103C097
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198655; cv=none; b=Vk9PBc55D4bvzK3rEdJtdj4n+WiLzxsktciMt/RK+BcaPBs6WM1jWLPfZuXWDSrq5JdXQxhNgMipz+QXOkb0YEruTFvuz+XvZUA5+aUOPScNXTMShcSeyJSOdUJv4OQ6jw693tfRJY3hC8LfR33Z74UlIUnNC8FloVbIO5b4iME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198655; c=relaxed/simple;
	bh=acHOjUiE9FcyTIji+FDfgzffemwW9Cnt/rCI5e+Lozw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBQE4+fB7G1SGYdF18cv6is2kyJ1hH3dL9KyxmXVqB++jEanlG9mGwnCW9xEHHpWzp4Nov08P2hC5nzbJ5q7pPQSxcchcz6sV/AlUhDuFTRbrKqRZEHtfMxFpHHL4jI2VIRbzTbel3n/vsaACg4EXagjfxCgtD/3Hs9ceHrYnVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=skO3Z3ES; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcc71031680so652865276.2
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198653; x=1709803453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acHOjUiE9FcyTIji+FDfgzffemwW9Cnt/rCI5e+Lozw=;
        b=skO3Z3ESPncq3Vthb3+r5exm/XuSrp6A+qR2s5irtnvnDWUm5nE6KuFMEUclWl2Q/j
         2CLDojI6Bk32/F6itPCKktSc7D0rAend5rD7kom9GnaWJ2JtwRNfYCAjrFY8ZCh1oBR4
         xqO60nNKbFwmuxviTCgzJ4qGdX4A8dow0iB/o6khzT2tmG/+Nhm006+1TrPZSzLZzyo9
         iezC1RLtV096WW7L5yp7Lg8z12E1b0o2t4MwGZdeiXHqDsUmaW7mA5hWxLluNhZLCI5h
         I1YNSwE3AB708JSOJyROvVyOeqnaN+c7xg7CdpWYVJk9j+Tayp1Wq7bs9X6JOdJ6y5XQ
         7W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198653; x=1709803453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acHOjUiE9FcyTIji+FDfgzffemwW9Cnt/rCI5e+Lozw=;
        b=FY87vIH08Zb4Yin4TJwwkNKAX8mRJg1wOajrTZDmOsf8MgWRhGwZ0PIB27NXns+E5M
         Jx0P8Z5kj6SFfzxXbaSa1E5qjPPtZxiVv9yCub2B/vsVmIokCuBRLm9BeU1I11rcjNcN
         sikDxlQpY8hHtUIS3QuTWRbsNoE9RGeiaqqS5nItC/KSCiXAwgCgbOgPEDRZCf5ascFd
         ygk0D/KTWeFQ2malH2EuQx2izQdspzX7SlPdw3UsfvLfqerR/x6DSjC0PftkexruZJ3E
         d5WuSYHXru7ZcqLTl4MeCYBWSaax/GusiYuKl1SyAeQLx2T7jo8F0QjGuap40RgvtJID
         aCxg==
X-Forwarded-Encrypted: i=1; AJvYcCVWvvLcbz1tDGnoeJDHDaJQXNPHUkBfmEX/bP4KGMSj+yI95gqpQM8CWtVfFMnTqv/34zZy6v1ZnMT+aN/sQrn+M6IAb/4u3tgwQw==
X-Gm-Message-State: AOJu0YxgTWwQ/wQduUzgGnIaNZLAzlEDsjoy1gqawxxZGwYdQYbOyQDe
	TcPWyJ1GNxwfuw78/6b8HBi/F5GE6qEO/eJcSZ1w1lnPJwy+eoJybvJ+0ZwfoBBeaFlF22LesQ4
	ITzVwO4pUT9LKGSXdVyXokEg/ky7nabrMYQfmrA==
X-Google-Smtp-Source: AGHT+IHuxs+y33+QXYrS7v42PbEsIL492f7ErZQmwtJt+UzdJGQk5GkoOqe+C/FQ0kYdzZUyDoNwliFQRIcjVaMqD4c=
X-Received: by 2002:a25:8451:0:b0:dc6:b9d6:1542 with SMTP id
 r17-20020a258451000000b00dc6b9d61542mr1619157ybm.48.1709198652964; Thu, 29
 Feb 2024 01:24:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-6-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-6-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:24:02 +0100
Message-ID: <CACRpkdY+cjU__XSxrSnKtZjkd=jRT13OWD8RXh3JUedNk0TPWQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/30] gpio: nomadik: extract GPIO platform driver from drivers/pinctrl/nomadik/
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

> Previously, drivers/pinctrl/nomadik/pinctrl-nomadik.c registered two
> platform drivers: pinctrl & GPIO. Move the GPIO aspect to the
> drivers/gpio/ folder, as would be expected.
>
> Both drivers are intertwined for a reason; pinctrl requires access to
> GPIO registers for pinmuxing, pull-disable, disabling interrupts while
> setting the muxing and wakeup control. Information sharing is done
> through a shared array containing GPIO chips and a few helper
> functions. That shared array is not touched from gpio-nomadik when
> CONFIG_PINCTRL_NOMADIK is not defined.
>
> Make no change to the code that moved into gpio-nomadik; there should be
> no behavior change following. A few functions are shared and header
> comments are added. Checkpatch warnings are addressed. NUM_BANKS is
> renamed to NMK_MAX_BANKS.
>
> It is supported to compile gpio-nomadik without pinctrl-nomadik. The
> opposite is not true.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied.

It's good to get this move done, then we can iron out minor issues to
the GPIO part in the GPIO tree as we move along.

I will send the patches to Bartosz with an optional pull request for
this immutable branch.

Yours,
Linus Walleij

