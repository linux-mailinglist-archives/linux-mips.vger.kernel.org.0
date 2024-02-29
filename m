Return-Path: <linux-mips+bounces-1916-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C62E886C5E1
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81B5F28D993
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520706167B;
	Thu, 29 Feb 2024 09:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t+50Fwdf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D1612F9
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199887; cv=none; b=AF9sy8xWDSR6w+2qevadc2bUoIuHggd700mR2dRfG2xkkNVTg1tfOIPqa4NeOsuYwDJQ45MHWHLE29TO3jWFXNjJNXJL0RQvExlRqE7sGUmA+DWwNFnKcUV0QpJ/NLGdaXxR4374jwHB/2GjWFuZ7tISeVtvKdTw50W5LUHhuDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199887; c=relaxed/simple;
	bh=6K0C69v8aY51x+51DR4S1y5FfPh76F89vxnIkCM64Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLApTl6giG+knMf3TYhvBLGIumKKkrGbj2obvWOLDhE7JMwKzlG29wrJcVzOs0cfAmp7gKkBte3qpGixeTwcwPg60Png4Sk+1pN9EZ2/qFyPDxMeUUURedEZyn3QbaVoegOaIzfXxrtriy422l3BJk2REoedewBFhF1B3un5tRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t+50Fwdf; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso792843276.3
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199885; x=1709804685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtGe/ds1ZRlsDzPhDzq5vY2M1N8N9oZVvQoi1ym4DQk=;
        b=t+50FwdfE+URjGigg3CltFoEYEGxSFwhYFI4KJHK1sRFAdBN/QbCAVBZtWWe/rwlfq
         buI4lWvF/G7e+8Snre4sjNj9wzKVn0AkqWlBw5UTR8IpVeaZ2CK5CLSwE1oSYI/jIYq2
         IxxN9pR3s/Y+1Y+HkKuIjUbz/FVlxsSp7Sh8wIa9jiyxqqubgv9H0r5c0B0sI6r3qH2h
         UdPzI6NoWLsnBfJFvMiOqbdeG1a3UVkOy/opGP6JcuUqie9KJioRYSii/axy8/8mVqgt
         XTMpZvIAil3vJuCYEM7BIsPNqrDtelAh/5yyCN0GzazpLijL7WjbPyLr7EkBbbYB8Abh
         tJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199885; x=1709804685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtGe/ds1ZRlsDzPhDzq5vY2M1N8N9oZVvQoi1ym4DQk=;
        b=BtUORU2MQheykbcK7G+V8Y3DBQnAACtzQo0u8q2YQXJkOlbzdH0l4gJ3KwUhpvQDB8
         OrKRcbV9vZtFKV48DTr11qUup6VJXyArDdlSFxfP+Qc7pK2YC53hFk4TxReLcJ2Pql1c
         1iBaQJss452DCU2ClFhKJaVjLQtN1hWvvOMfyZMcmiSWaOClGCqEmdXbYdL8wJ6nwTLN
         hAWNPVMeTmFj2j/NUV/83uuVorCVBxYAv5txrEnhaFQG5rqpHTVhweS1X6NzkB2L52wa
         5UraJv3rGuaciMZ+rf3cmHnVzW57Vus5mJYH2xtr97Y4jrkIsBL8LkrnJssr6Af+uh08
         45EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSWQE2yxOFID7VGJ9feKs4bNv3XW3cHTE5qH89MR3TcQ5BasDSWR78+qpvtA72jbML06A3pbXEHA7s6NWi82G/3rr9N1nVGXuoYQ==
X-Gm-Message-State: AOJu0Ywv8jnbK87AcWA82ABQw3ypEwmf2R4673KeRhB06P3o/1ZoxrRS
	xwpuWQ/egVdz4RemavTMgxl/vNGTNb1BlG1h+pLSvVgOIijLZszUiEFrxa4/7alU7fNxEpRbyPM
	DdBthZ1x8472oAHhLjTAljf8OYuvcFeJsvhYWsw==
X-Google-Smtp-Source: AGHT+IGbChf405oU9sCbujzjSA/cHfa3590PjMRDmzrZOTzMB7BN3TjSi37+bplsHq5uUkE5RbjhcMUip8MDonqNbgI=
X-Received: by 2002:a5b:751:0:b0:dcf:3f11:633a with SMTP id
 s17-20020a5b0751000000b00dcf3f11633amr1588471ybq.35.1709199884731; Thu, 29
 Feb 2024 01:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:44:33 +0100
Message-ID: <CACRpkdbK2Sa_4qp3VE0ivHP8W6F-QDkuxV-XnZYviAkO5ZBMsg@mail.gmail.com>
Subject: Re: [PATCH v2 00/30] Rework Nomadik GPIO to add Mobileye EyeQ5 support
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> This patch series reworks the Nomadik GPIO driver to bring it up to date
> to current kernel standards. We then add Mobileye EyeQ5 support that
> uses the same IP block but with limited functionality. We also add
> features required by our newly supported platform:
>
>  - Dynamic GPIO ID allocation;
>  - Make clock optional;
>  - Shared IRQ (usecase: EyeQ5 has two banks using the same IRQ);
>  - Handle variadic GPIO counts (usecase: EyeQ5 has <32 GPIOs per bank);
>  - Grab optional reset at probe (usecase: EyeQ5 has a shared GPIO reset).
>
> This GPIO platform driver was previously declared & registered inside
> drivers/pinctrl/nomadik/pinctrl-nomadik.c, side-by-side with the
> pinctrl driver. Both are tightly integrated, mostly for muxing reasons.
> Now that gpio-nomadik is used for another platform, we loosen the
> relationship. The behavior should not change on already supported
> hardware but I do not have Nomadik hardware to test for that.

I have queued the relevant patches to an immutable branch in the
pinctrl tree for testing and I can also pick up some ACKs if they arrive.

When I'm confident in the branch, I will send an optional pull request
to Bartosz for it!

Yours,
Linus Walleij

