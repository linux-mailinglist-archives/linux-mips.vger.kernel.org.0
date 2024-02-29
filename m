Return-Path: <linux-mips+bounces-1907-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E8D86C56F
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF2591C22288
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B2B605BA;
	Thu, 29 Feb 2024 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TnoDzhTP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807B45F870
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199381; cv=none; b=VV2OztE6kpxGJVn1izsLCzWzC5DFd6/QFXG7DpV2ROBSObmdt6GKnrIuUOOU5xZYUcxIUEir8j2VIGeX6Zr26UfC0Yq50rbO7XZcZHzSarSk8yUj/5AnDGoHJMwtroOS+A6pf+UY5lmTtrEa4Da1UnnYKrXHWTpkLYa7TyCz0Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199381; c=relaxed/simple;
	bh=NIqCg2Lig+ehBNYGyTvhpjqd6T9MIQgC1nLdSgKx46A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIc9LdDtjshsLxBX4zjSj+YuTbp14Tw/VmWMetYBQOx28Eta0s45EoVf8RO+ylw09Tl3lLBxoEOClAAvdTfRVqi9/x/WU6yoUDLUiSzDfAU6DN0biPrqeQ590brCY719GZoM/PewK++/cIXRCQllePxg+eEFE1jgg6LM0pxd4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TnoDzhTP; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-608e3530941so7311867b3.1
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199378; x=1709804178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIqCg2Lig+ehBNYGyTvhpjqd6T9MIQgC1nLdSgKx46A=;
        b=TnoDzhTPL1NMEZWMb9nWQeHeTZInkBgPurxPFKbH38pZIo44mqQN+t6kAy2aVwxtwX
         ygc0IC1VlxoEdbV1zVbiW/Tuk7tUaI6FR9L5hYq/cjpqoq+s0alxRTDL+tQiVmkph/5r
         jhsdwpAY/PeTtiDYGgLJdsQI1dP6yeSs7H0XyjbgQaL6A8CxF7xfgAxQNO+n+ljguT6W
         AuAx1TfyDCFT0fci2mNf20G0doXt1oPguN4lNCxkQCR/gHTogrdQT1qVFbJ2z5FHfDJS
         bLetwnTif5DKGj8evqSdsQ45zXUKFLfL3CnmaKJAUzYNPKslEM2Rj2+AtuHQAdMg0gOi
         fzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199378; x=1709804178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIqCg2Lig+ehBNYGyTvhpjqd6T9MIQgC1nLdSgKx46A=;
        b=T8PoTaPn8YfUKc9DyFyQnJCEFUkA3Ut2pEEAhDjCftzHbEan/9Va9hpCWh7sR9f8iZ
         vnNa9rQQnhqg1oj6m/8+7ajWceS3ttom4uXLQNC39xff4dkZ6yDshdo2nG7bmmlP+Zyo
         RHJaw3ciGn5e3LzZC9qdmxus10m1xrARk/qGFnH9fgerLwYIp4tbOXmi8+/7w0N1Q9XM
         2GK8QZHRZgBtxKcGv4+jU04wZIq28Alc0+zQrUboF7b7FDEiMFqH91DYsW/3EVBarvsg
         mw1cFhFw5b/WwVH1c+dSeuxC4wEJqlcWo5s9DhbiGj4BkkoesmNMHfCCtb2y/uQgVpro
         S/bA==
X-Forwarded-Encrypted: i=1; AJvYcCWx5eXTrwW7VazE182Ei+mrfhWshz/VXOg9zeEWJxnlsQoRaYW/iYnAi7WgFFGNOMCxKIqS5bA9P7gti/XI4TCNmIdeOnSJwkPROQ==
X-Gm-Message-State: AOJu0Yyepy06CLpwQHa0ERJz7ZB9OUAx16Tj2tHl0g6LO1L/hFy7ihkI
	A1i/ctVRaE1xvSUY2Q7UmenwKOPjIaImaxzhVeztqyESC5WLvASOIo9KUEEPPT/8KE15bQq0JRa
	+rX33XlFTdF8WAOC9yzZcDHsU9Ffya7W1dUkF8g==
X-Google-Smtp-Source: AGHT+IGmwaMXnIIeUIA6Bhmf0jz+VJ67d+9hoLzM+6q8PV0Woj1UIg0FkmlH8MD2QBtjAqYNuO4XZHGyfTuC4wsmq/c=
X-Received: by 2002:a25:aa67:0:b0:dcc:4a0a:d0ba with SMTP id
 s94-20020a25aa67000000b00dcc4a0ad0bamr1554828ybi.63.1709199378444; Thu, 29
 Feb 2024 01:36:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-22-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-22-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:36:07 +0100
Message-ID: <CACRpkdZ01WqbRDA2B-8cM98RkPtcRbpf06oF2xHhYdfHqPhACQ@mail.gmail.com>
Subject: Re: [PATCH v2 22/30] gpio: nomadik: support shared GPIO IRQs
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

> Support a single IRQs used by multiple GPIO banks. Change the IRQ
> handler type from a chained handler (as used by gpiolib
> for ->parent_handler) to a threaded IRQ.
>
> Use the generic_handle_domain_irq_safe() helper. The non-safe version
> must be called in a no-IRQ context.
>
> The Mobileye EyeQ5 platform uses this GPIO controller and share an IRQ
> for its two banks.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

