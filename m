Return-Path: <linux-mips+bounces-11149-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8BFB4AC38
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 13:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E79F03B22AC
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689EF31B833;
	Tue,  9 Sep 2025 11:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WM/w8K3Z"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1CC24E4C6
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417719; cv=none; b=gbjLsqFoRc261kGEqcJEC1F+77AFKQxjkluCaDtpWnCWlyl//90ZPW5L+pWfgNILLkv85qg/qE+m52uUzlZtCFxbnG2vaUqlVoEVFGj6TBw1spxwf+Sr8ptcBhOevVhaif5F5AjegMySWJtkCx4ex2gxFPdelk5BZlAeq8dvBec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417719; c=relaxed/simple;
	bh=JRXEj2Vi20oWUI/zgU4BerivqZ3hoKieY+gD3mRHVac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1Jlf89I18cW6awzbjm1foh1jemuB3QIl0NPgSOCNTktvepM0bB4l7jjdHwOC2UybUxHdRX0ptRreQ405UNlgR4YEvlSBFHguW+n4h0IZJBraiL08Tn7342C28V9n8m0ACqmv7AwckIcuHY49xZJeSkO6oLy3ZgdtpqsnV65sK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WM/w8K3Z; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f76277413so6292961e87.3
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757417716; x=1758022516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6eCnKOXIsJYGPMWl3D4Jhjj+0Ieti5SchV9n8g8z8A=;
        b=WM/w8K3ZxVHprReJtOWBuv8Y8GRaFaiGHBd3ha2kEzCn0dDlW1a1Dw2fJT8mq9yzJl
         iIBlEig5VfQyrvvgCJlyXnbNnztnN2U0+Fy4T8nVANarItOdeIR8Y0Tz4MMwTDDzpZ75
         qdB6H8HQQIZHzIr/+UqyL/8KLJ6BOrEdW8FGEzJ5sNZAcYggPUawtCMqbNA/ZPz3eUIl
         hTHY/SLcD1qyYBaa4Ju5fXrfoiW41uPOd+PaPAhBY9TG2RRNi4L3Wk5MiA0iAbZBMAaj
         1LgBcG7Ci2BXd6YdKK976a1BGclFzsgmB0ke/26YEMn4vAcb2xQhttiPRMhVJZ4m3Zhb
         1DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757417716; x=1758022516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6eCnKOXIsJYGPMWl3D4Jhjj+0Ieti5SchV9n8g8z8A=;
        b=MBqIIzUewhemr1kKgmDd4Cg+XzITmPdFMpCtisV5Jmd7G7dyMDIhpHlC94w52krVKj
         w4YGzyIxxzYiIY0smOKT80mwrmYpjjzeG7oy4C4QgBtrunSeqlJBRqhQv0vymiY/wQ5k
         xD3VVk0wHLlgRkU2qbvslgKXQTuVmzjKRfEkfLA+uub9bLGphvb07FgTbHVo6uZJ72Ie
         RWdF42xzTDOaDDZSXMGcsdrWI0sF1+UJSPCRmEdGdqcLJ47OVg6ogGZSzZhncCamcrKQ
         U1wEckWFBYe05b5qZmHGqejUS1EpvSJVAF5zHlC/qJPa4CFqmgOk5/myYvCUfMwMWq/8
         B8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVRsD4Q/IRiJnFtL5iGJT73R7l4rBpR6Jwi1ap17+GiQLyUAC3+z7v52bpCoecyfIU48T0+qkjpWb/2@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJ0YrE0fNVxTULXbu0Ob2ULp6PWV+b+QGhd3zd3Nnh/5FL7XJ
	riOTRAsjgZohZ/5OLrtcpad4358B3yC4/EqGnrxBPY7ogX5p3oCJxZaRJF7UwdkSzH/XfAgTpCN
	+5d045lPrlNjS6zrm+Ton40MlAAI/3RAtMKa6DJLLwZqaLlRJPISR
X-Gm-Gg: ASbGncvtF1llHvNEYvPNdl2FOoelbKXAHAx0x17kWnI0T/xKAwIB57rPdh4gg8su0r0
	aWDQQN0CsrnQjHoRAjVyVXYnWfd8Gk9i1O3Ew1LSq2GHuHKqsUPBKbUZdLBai/0IF2Pqu9O55zd
	6uqBpVJmFNSVCcA1nGDuIqPAbSbr0Q+u9uO7lA0IFE0Gc7K9KxNH6HTlkhtv9Li0a1g339Ir0Am
	Gd58gGO6Q0z1YKK5BH1WvZXkeBc20XIgTxyAhIhIDPrJMYNfw==
X-Google-Smtp-Source: AGHT+IHWd+/2o3jpP5pFKotnmfcWTA0FpdlTJ7xwTNOp9WJ3bLpmlAirprq1zjBteK7SqJBfI4YYAjx9R2Xs8MJv8vM=
X-Received: by 2002:a05:6512:639a:10b0:568:4ae7:8371 with SMTP id
 2adb3069b0e04-5684ae7fda5mr659891e87.4.1757417715746; Tue, 09 Sep 2025
 04:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org> <aMAP9hAWars0T83r@smile.fi.intel.com>
In-Reply-To: <aMAP9hAWars0T83r@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 13:35:04 +0200
X-Gm-Features: Ac12FXwO2LcDkWGWZohqu8ChVnTISfR-cQj8e5EdoM33wEcP1qEQLJ7mzcbrqVk
Message-ID: <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
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

On Tue, Sep 9, 2025 at 1:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:
> >
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.
>
> ...
>
> > +     config =3D (typeof(config)){
>
> This looks unusual. Why can't properly formed compound literal be used as=
 in
> many other places in the kernel?
>

It is correct C and checkpatch doesn't raise any warnings. It's the
same kind of argument as between kmalloc(sizeof(struct foo)) vs
kmalloc(sizeof(f)).

I guess it's personal taste but I like this version better.

Bartosz

> > +             .dev =3D &pdev->dev,
> > +             .sz =3D 4,
> > +             .dat =3D sd->gpio_pub_base + GPINR,
> > +             .set =3D sd->gpio_pub_base + GPOUTR,
> > +             .dirout =3D sd->gpio_pub_base + GPOER,
> > +     };

