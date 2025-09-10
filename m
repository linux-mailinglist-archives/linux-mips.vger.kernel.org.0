Return-Path: <linux-mips+bounces-11223-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E14B52380
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 23:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8A46A051DA
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 21:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA8F3112D6;
	Wed, 10 Sep 2025 21:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFwj/L7x"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5906630DD0B
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 21:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757539961; cv=none; b=IOFn2AfZK7sAeZAbzVAlk412A4rZMuA/77f2STQ588o4QOsgUGNnKbpmqEf39lw2+cCWevg9poqBe9AI6O+cpqmIxYYVVqjy91r0w630DX7cNUnNMiSNZURiAlQv0YEvmi0HA6cahXa9qetekiiX3qo/Xl0mppSoIuXvVnuvolM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757539961; c=relaxed/simple;
	bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dc1fEsJcEfnCaOvUltVOaDjbm/vmM93pesCRM5MF9Mn1m1vS0tBZytZ6XlDLkqapQPLb4XSk5xrnbNE9VGM3rPlsQyR60XbgOBGBYiqO06IEuSQWQjk8NYWLm5GPRk79AcRWXN2hS0RXnPmSRKICZ2eVhY5g24oiU6XXRre7Hcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFwj/L7x; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-56d1b40ed70so447447e87.3
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 14:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757539957; x=1758144757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
        b=fFwj/L7xMVLXbrafsiUBxoD7MAxOhttI7KRIebIj5TOl47/6pHUwstG+oyhVRiQKiH
         buogzFmlUB5f2PQDjgejothGY0K4DlSLuyCsKaBhZ0tYy4lRUpzbyL08aFN1uSKZ1bDG
         SwaDZh5OI7T4EXyuLarVGg7+a6/LkS9bvhR6We4NQQQm9ACEpOD1JoyqZFNVG0pMxHyT
         OnmyyfB8iOnrNVa4+KqMOsaWig6syyIUVmE81K0XpMJikbhDfgBXGfer5BF+4pI3T2Bv
         edIUKPC/nO4m6z21NHco09MtuTcljb4aeAAEChVIS3lO2OjtwTogOrriBFrM20qnVhOD
         xiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757539957; x=1758144757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
        b=BPRVACFrkbqrU+S1QYHZSU14ONaHJP7FeND/l+HjnZJhK05vthE8AaAXorAUMKIQNH
         nISAlggZc/x+udVM20KhQ1/wsDguvDCRcnFZvkpk5s7cpQjg4mqhZ5H3fE6qQz/o69Eu
         VvzwfRHD5hCJe86BfB6F/XOz3FYj7qVmRkl/Xwp98oNz09KW3bb8+vzOaTHyVIDR0bIQ
         ythPeNq+mxed9NfihttKmuPk77WP80CfmdpB2HqHZh6M645zo0WYtA5GcQ3IFHuwSMnu
         62MpIFKRj0eNjPF4bKZR41+CHitiY12qY466K2h9DmjTEAMr+8sV0pwBt0KqiaKXaHKz
         yTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDn4vS0NiT+40HvSjpGKj8ee9byJ7AK9ySfUYyv2qFJ378Zkmc9Go0R6PRaQFtFzpNwGMpyo/PNfxe@vger.kernel.org
X-Gm-Message-State: AOJu0YzQxKw2hZv2h6qKuv3hqB0Tt3LbEM79mO01uEn3Z86YkuOy1BvW
	ux4UZ1+jO8RfWEEXI1s2mFi3JRHqIfooJWJ/SdmiatvwwqtqJhBCRZyFGdSvDGrRcmb8QScZR5V
	Ixk+tOjZXX//QoCLnUJ/16Tp8IS8uIJ1zQcDomzP/tQ==
X-Gm-Gg: ASbGnctdOWPTymke4tORl4QcDaOEsM2eu161VVMZV4JhDJc+sizbaj3H42kj+cnLq7y
	OvFP8a5M83VS8GmqtWF17vmgxeZ6FOtDx97iHJwkgEQ1xaqbGGOzPmF4JPbiHTfTWKRytlAQvys
	+hl1AE2i158myo5BfsrEuIuoVjw7wEmFfbl8Wj8z7sNEc+GptzOyKgOxSh/idW3J9mTAE+VTDWN
	ZHY+K/icMOf8Mqtqg==
X-Google-Smtp-Source: AGHT+IEDFgI45XU5cTVW9FtG8gM2JjDzoZENa8d1uC1g5vQQ+iix+RIzuYFh88VfTx91WSF4c7ZJi4duHEmeM7k85Mw=
X-Received: by 2002:a05:6512:6404:b0:55f:595f:9a31 with SMTP id
 2adb3069b0e04-56262f11dd2mr5910272e87.51.1757539957420; Wed, 10 Sep 2025
 14:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 23:32:26 +0200
X-Gm-Features: Ac12FXzHQO4QoWSTSppUbrZutew2n-HjqWu5POboMsRGiUcu6mJnWXdH0E38Eq0
Message-ID: <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 9:12=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Here's the final part of the generic GPIO chip conversions. Once all the
> existing users are switched to the new API, the final patch in the
> series removes bgpio_init(), moves the gpio-mmio fields out of struct
> gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
> the new situation.
>
> Down the line we could probably improve gpio-mmio.c by using lock guards
> and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" or
> something similar but this series is already big as is so I'm leaving
> that for the future.
>
> Tested in qemu on vexpress-a9.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The patch set is a beauty, hands down.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I especially like where you caught local spinlocks being
(ab)used instead of the generic irqchip ones.

I don't know about merging patch 15/15 into just the GPIO
tree, that can make things fail in other subsystems depending
on merge order into Torvalds tree or linux-next if your tree is
merged first.

I would merge the first 14 and keep the last for the later part
of the merge window when all other trees with conversions
are merged.

(You probably already thought of this.)

Yours,
Linus Walleij

