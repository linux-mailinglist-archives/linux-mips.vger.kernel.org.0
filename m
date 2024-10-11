Return-Path: <linux-mips+bounces-5996-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B39799AD57
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 22:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C667281F2A
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 20:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163041D12E6;
	Fri, 11 Oct 2024 20:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l4nqFF63"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730051D0F49
	for <linux-mips@vger.kernel.org>; Fri, 11 Oct 2024 20:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676979; cv=none; b=ifHAGUJKZpSmSJEtglI4Vg5xVXSZdxfQ8XG/37dhY6KbpwmlBMEAVurtn0ZifDp5ejT7xm904clxVCe0/JVBcr6DT+YTjyzB7UdyxnUyvd4Y0LRpzMpf140mO+ZfJOfQNEFRWQ4IrjPXmlRV0yvbzSffJH7N7ohtDyq9KraUMBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676979; c=relaxed/simple;
	bh=ODV50fNLCFdjIqcFnpP2PNFAuAzMtDOje2NXbZ7Egzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doX5lhitfH+kdNaGo9uXr8eUd1yykS1QKVMTOoQ0ttAV4MsT8IiiTl8YV+AvQO+FTQiOtkjG+DP5CZBAnHDHCbkX4Pq6BRXyaUpq6dHo59d9YSVAcAG4/AC/obzJnz6ZQlQpfTVDxvUqpcR/183b8VGxEvg3LFluhmEDMFbuNvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l4nqFF63; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e2e4237da4so22555867b3.1
        for <linux-mips@vger.kernel.org>; Fri, 11 Oct 2024 13:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728676976; x=1729281776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SECYkR1tH36IRXjV2hBFD0fayx6FhMErprkUBOQsJ0Q=;
        b=l4nqFF63kCxQXyOrk0xe+vYNuFRT6J0LNqI+ujjIkJDsuuCkGWdiRVxp7P50rS2M+r
         j9J0UTkOufhR1x4t9qMcLdh2z1dD/+5zm3XoOZVp+GKEaxuh4f7DlsnPPDWwF4zPahAO
         LR2J+a5yVD11owkiR/weuoPaWj4uPyUVD+gZ3Lfg6iXldpI4c2bKeEsWfWdLvgAPyR2Z
         TGfdM8urJ8VSZi62cLvHsBGMAoPwIo3w44fyShIA7RbRaZfdMZvJuub5koZ7MXMmTYnH
         H+VcTDJQVkYRwAcpdUuBhcYvsogGxa/ckvvdQ+oFAqcK/P1QjflGMgFUQpzuMCi1/Vze
         aV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676976; x=1729281776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SECYkR1tH36IRXjV2hBFD0fayx6FhMErprkUBOQsJ0Q=;
        b=RDO/qszHuD2tQWHfCz8hun+ZBa8zNagjyGcDCct8ha7jxqP1+5x59eRfzubrKECWDw
         YCggPYI8phVUJgcWtIxS3hWJUby92sGW9SJTxS1Tw/rxphid0IJrotS2RRBuVJg0wAwP
         /fWMTWz1FtpYNSsZIBI9lvNrgm7uWxp0wDSikqmBDe3fJA9f8PK6F2yyYwHCiPUBddvB
         b/jNC5l3V3VHYc8RUDos8/RI9w/hKTeXKnad3hdVUrkdQQ3FTHLvErB3W1BVVznUPIu/
         VwiIL8AP0u2TuSzjpeLwPDZ/Ht326leqkq12rEQwMeNtDshcd1xJ/n3hr+Hgr7y9N8D/
         0oAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2/OOawEtM98MbJ0U/ncv4s784ok8TB3Qib90PSQR8sXcN8FXpGLh9giupE0uOQGgvWE6gvxmYu46X@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa/zdeKZs/FQLxqwPbT8wzxrfg0d1fYtWS57ng9YENaZSUnSsw
	RZCsuTykW/B8m8H6ogfZMRlXZPEoGa/kocr74HixfmMvaoWQrRJakhuFYx5kHxm0pLPuNRQyaeI
	p52Fh0m8c41I393ewETt/hmtLg6nsBs8t82ejDg==
X-Google-Smtp-Source: AGHT+IEX50nN7GvXdtMOFV2ls3PtiyNs6ga7VtHfFp++1qOGXYlxqaeLTZx/eo82ScV1XRb/2oK53cLuuqtVKJnZo+4=
X-Received: by 2002:a05:690c:4286:b0:6db:4536:85b9 with SMTP id
 00721157ae682-6e3479c297cmr29587547b3.23.1728676976485; Fri, 11 Oct 2024
 13:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241006181310.181309-1-matsievskiysv@gmail.com>
 <20241006181310.181309-2-matsievskiysv@gmail.com> <CACRpkdbJ7xh1qOYaZOh+s+Tj_GgE4LXMFuOgL1zpxBRqJQVx6w@mail.gmail.com>
 <ZwlG9AKToZFFPAvi@KILLINGMACHINE>
In-Reply-To: <ZwlG9AKToZFFPAvi@KILLINGMACHINE>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 22:02:44 +0200
Message-ID: <CACRpkdZh_XZOKJa1Ga5vyh3MvY_yb7hDowbuJv-LG47AoZ+UCw@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: ocelot: fix system hang on level based interrupts
To: Sergey Matsievskiy <matsievskiysv@gmail.com>
Cc: alexandre.belloni@bootlin.com, quentin.schulz@bootlin.com, 
	lars.povlsen@microchip.com, horatiu.vultur@microchip.com, 
	andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 5:40=E2=80=AFPM Sergey Matsievskiy
<matsievskiysv@gmail.com> wrote:
> On Fri, Oct 11, 2024 at 11:18:55AM +0200, Linus Walleij wrote:

> > I'm a bit puzzled by the patch because I don't understand it.
>
> The current implementation only calls chained_irq_enter() and chained_irq=
_exit()
> if it detects pending interrupts.
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
> However, in case of GPIO pin configured in level mode and the parent cont=
roller
> configured in edge mode, GPIO interrupt might be lowered by the hardware.=
 In the
> result,if the interrupt is short enough, the parent interrupt is still pe=
nding
> while the GPIO interrupt is cleared; chained_irq_enter() never gets calle=
d and
> the system hangs trying to service the parent interrupt.
>
> Moving chained_irq_enter() and chained_irq_exit() outside the for loop en=
sures
> that they are called even when GPIO interrupt is lowered by the hardware.
>
> The similar code with chained_irq_enter() / chained_irq_exit() functions
> wrapping interrupt checking loop may be found in many other drivers:
> ```
> grep -r -A 10 chained_irq_enter drivers/pinctrl
> ```
>
> > This needs to describe how moving the chained irq calls achieves
> > this effect.
>
> If the explanation above satisfies you, I'll elaborate the commit message=
 and
> resend the patch.

Excellent explanation Sergey, just put it all in the committ message
and I'll apply it!

Yours,
Linus Walleij

