Return-Path: <linux-mips+bounces-6004-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E89E99B6E1
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2024 22:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 992EF1F2128B
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2024 20:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18D71474B8;
	Sat, 12 Oct 2024 20:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mJVFxTt9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB05712FF9C
	for <linux-mips@vger.kernel.org>; Sat, 12 Oct 2024 20:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728763485; cv=none; b=bLOkLy6Zi/f5DcG32uAYF7dj+r+lzQD3FTsSvxzaWhCZIeFKT55pUfMQJi/fXlB3TmXnHouMt4px5OeQoqIsg8nFImdqN/5WZNE72zlV7i6wDewwXzNZiz1ecPj8EQ3VzVNfVW9auiJmyeI6mtK9VMxLFe6u+FgaplXA3TKpp0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728763485; c=relaxed/simple;
	bh=+hwDZaE3yuZt9vzeZthmLQI6V9yR8jL9Lanqpbf5zyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5VsfFVfRqifuxp4s2rBBaWbz7R0RLzkW45KfgYow23vXLG4t8gSNeeqMmeuuUNz3s9+O0/v/o6cOIPxtN8DkF1Ll5RX7C/qYexhNw0LMcQ06rBUuYKfxbm/m+yjQsCydDjnjgSDNHTmy5T24Qd+a7YFVX4vWW+ZflPedctVFCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mJVFxTt9; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398939d29eso3859091e87.0
        for <linux-mips@vger.kernel.org>; Sat, 12 Oct 2024 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728763482; x=1729368282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ciER1RAhj6UxGN+QOMhjY+VHtJCV5IkRQu/ipXf70g=;
        b=mJVFxTt9ypcfY/K1geBC6yYKPzjTSzU9bxjxUkH9cn4FhA3xUGqjtyPydgZw5OUK7X
         UzqMYF1/LXgPlvpPmV/eJt3VYR7Bqlx908YDAPRj3OTx11LGkZ6WzB0mTqRZmQ3BC5Sv
         iLRNrYVhxyOUjOWVEN2pgdREpGHf1FFocDNe1SLQrfG34rX2VIlt37zfKSfipbB3WtlJ
         NapzrvLymW2ealCBLSCqds3xOr7Q29QeXGhI0VePrK7UJKCf2TUyeVdMGcVp0w/MIh2h
         NwZNo+t0Y0UaMV+l3sAKzplUwnTkxDysLX6d+odIQETGkuZ8W8sffGJKo7RAKdya6kDU
         GoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728763482; x=1729368282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ciER1RAhj6UxGN+QOMhjY+VHtJCV5IkRQu/ipXf70g=;
        b=Myjxmll8Z7DKKZ8nDbmERgU2EG+TSePL9ZzT6hNI6TUqtt0HGQuxwB8Qi2pc38yfP3
         /c9vvxwhlRl34t0VF6e5y1fJ5EkyPke0dyTnAZSKRSyTFHskfhPsIf8GAtWGYJHs95XC
         NZyO3qrZW9k3MIelIovPVa5qdszbIUI5NWRfA6ZkiUJqdu18GFxNhSmOT5zIVFQ2/Zoy
         h6z0HMj0LxDJgpGygYF4SQgNY/Tbis14SrZ45ctkGG9tvHUxeY5PAxOpkm+xvylBpXSF
         /pIB/Tf+xtIzaaTKyzW4iZxyyvfV+zcDTkweKS/fmbizBteTe1fSP2A8euaDMqohi7C+
         fVQA==
X-Forwarded-Encrypted: i=1; AJvYcCWlpIRFP0vh9l3UDKI8S5q7NeiSoWiaEyDug3qrhCzogT9sv5yKFwzCs49vT1Bvx8aaxv4/Ledu+Kun@vger.kernel.org
X-Gm-Message-State: AOJu0YxiYr215A2i5fmIAlD6ktEPn87XbwL4M0smMI7UUFyJW0qM7d4M
	FE2EVKaeIxJGKPSAWesjI0oYobTycYq9QdIckm0/9Z6TdqesfyxCrq5TJaEYX/HQxsE9ovwvsOl
	1A7gs+W9a3hGBUay73AhC4ol7WcBg6Dz0agLN6w==
X-Google-Smtp-Source: AGHT+IG/ELgjIgEx+R/BAXvPNIpE0fvyJmngo/5bMIK8gL9M1DCkIU3s9GUQNTn52WN5JfUcGc1E7sPXQ4NdxPfSNRU=
X-Received: by 2002:a05:6512:3da4:b0:539:a3eb:cfff with SMTP id
 2adb3069b0e04-539da5ab2e6mr2914165e87.49.1728763481918; Sat, 12 Oct 2024
 13:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241012105743.12450-1-matsievskiysv@gmail.com> <20241012105743.12450-2-matsievskiysv@gmail.com>
In-Reply-To: <20241012105743.12450-2-matsievskiysv@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Oct 2024 22:04:30 +0200
Message-ID: <CACRpkdbCVFEgP3ZchLtM8KgDVVbCiK7ZgGha=iVfTBveRstDkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: ocelot: fix system hang on level based interrupts
To: Sergey Matsievskiy <matsievskiysv@gmail.com>
Cc: alexandre.belloni@bootlin.com, quentin.schulz@bootlin.com, 
	lars.povlsen@microchip.com, horatiu.vultur@microchip.com, 
	andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2024 at 12:58=E2=80=AFPM Sergey Matsievskiy
<matsievskiysv@gmail.com> wrote:

> The current implementation only calls chained_irq_enter() and
> chained_irq_exit() if it detects pending interrupts.
>
> ```
> for (i =3D 0; i < info->stride; i++) {
>         uregmap_read(info->map, id_reg + 4 * i, &reg);
>         if (!reg)
>                 continue;
>
>         chained_irq_enter(parent_chip, desc);
> ```
>
> However, in case of GPIO pin configured in level mode and the parent
> controller configured in edge mode, GPIO interrupt might be lowered by th=
e
> hardware. In the result, if the interrupt is short enough, the parent
> interrupt is still pending while the GPIO interrupt is cleared;
> chained_irq_enter() never gets called and the system hangs trying to
> service the parent interrupt.
>
> Moving chained_irq_enter() and chained_irq_exit() outside the for loop
> ensures that they are called even when GPIO interrupt is lowered by the
> hardware.
>
> The similar code with chained_irq_enter() / chained_irq_exit() functions
> wrapping interrupt checking loop may be found in many other drivers:
> ```
> grep -r -A 10 chained_irq_enter drivers/pinctrl
> ```
>
> Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Patch applied and tagged for stable!

Yours,
Linus Walleij

