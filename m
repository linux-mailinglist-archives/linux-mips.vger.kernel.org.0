Return-Path: <linux-mips+bounces-11235-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70856B52AB9
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 09:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E13651BC371D
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 07:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A102BF017;
	Thu, 11 Sep 2025 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3ETJqR4v"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C7D2C158B
	for <linux-mips@vger.kernel.org>; Thu, 11 Sep 2025 07:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577404; cv=none; b=plHJMnQPenEvlhr14KVGuuKN15XdAlHlLvqlTFkfEtu7ovAvSfOd+5JbfjPpXtWFCRFGz20PB9WH6bfBwC8/jGsNN7WZ65d4hyDg8uG3Pwn8Mc0FYMQ93LelWAvZz+CwXx5rJIVwohoXqWRaMcD53DazkX9uitL+GmbHc7OGxbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577404; c=relaxed/simple;
	bh=9XrvhsWNNRvcRClDoeF6Jt3/A7wdBGZCuSPlcTCRTrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nB2X86ngzcS7uAOvLi4MFP8X1ldpm5a1O2/FLNOJv58bl4Ug0vSzCKcefqagXc63nBvbPUeA4iu6l2ub7BF0FL5Ef94EMx25ISy8sjpYrCclzXE2nZoN+S3ZMHhTfHFe8C2l4mRN6Ihm4eUlN/0lzYbavOJ01L0i28hicMr24G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3ETJqR4v; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-56088927dcbso463951e87.3
        for <linux-mips@vger.kernel.org>; Thu, 11 Sep 2025 00:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757577401; x=1758182201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=;
        b=3ETJqR4vgoMaMqt+KEy7Te/f85X46tzQudrlEpUFN2LPx9p9UCLIERH8L24fjT0cJE
         JF6mO8kJXP9n38SxR9kfsYWiSHUxhP/xvV1JXW7v1S38hsSo+j1jw+eHvKd/UgyKD5h/
         vXUq/PMlMdm81/xpQ1cuxlWS8vTV2z6fdRDfaknIIsnHd+YPE2rLXFHPOA/6jbIE0rbc
         aSS9o6d1xFR/hnlaFV9e2Kj3mzYtxYuPR24Hdbo3A/PUUdzppNcFcMeGXHR1hqLf7BtT
         EIvkzzxyuXPzBzcvapeMgXNXaK9WecfSAvYoOBK2Q5+EvNiZtmALQFI7sb3yAagJf9FO
         tw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577401; x=1758182201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=;
        b=fjLsOhzoE+DwVtkPk/0NlpQkA6JIAiuOSVAL2Pim29L7d5r4ye87cd0Ar10gClQPUO
         33Ygl9WlbAwKn55CwAca4g/sgRvJ6bXNI1wGNjH8UMplThg29sX9hMyluNKKpXyiTMGC
         1K+EV5PT5lpJ6hvKGV0UFNzjP10mKlXq7fgrSS30HkgWE/6AdBv/xt+R+0MH6w/jMEpz
         jRuw3RLyENDzStg1hFm67KMWD3H7EwmajrK4+4X4RpQpuZ2GbmCkYIasfSz2GNBdU6CD
         Jpbntd1dN19M+Df5k82i4BxTtuKLC5eroANLj8dfgec97ojQEKWsNNJlGn/tmWjAg/Nb
         i5dg==
X-Forwarded-Encrypted: i=1; AJvYcCXGMFmqBYxHmSkwFKd57XN4EsaBaEtNO4dMGK77c9w5KT6yeT37y/OCzkQAmH7yMaCC9VeRZosXW/yX@vger.kernel.org
X-Gm-Message-State: AOJu0YwRDKhlvjPxd9jFfU4ZtD/zNna5mzlFHDJKfsNkIriO4hqFp3m6
	1jz4v+1uMe6rDoLfYwXnCCrk1rinz1yppU/hCpwu8osUmpWP6qLUc8MF07R1AncG8Ly7eIVIxlp
	beJqs0sEd+kO1CPy3jwnSgucRfacWZcdfFGGJiCHjmg==
X-Gm-Gg: ASbGnctlnmZdSePx0wZ+bKvP3/c64QoWnH2QmdyuBc3d9HPbG8npLoVnFQwkHxNunMo
	oJMQafC7mIE60d+63D0joOyn4BIlxt5VzL4jZE/o0oeEKgcPGTYkFfdY7+3r2I7q2zWmEoahRzT
	HlE5xnasjx5R/u59PZwVrrrjOgsI//1LMtKP6uQGVP+GAZ9Zq5UXSi6G0D2OqYOmoYRF7GI1Axv
	8P2xpSxz549QuqqaiPrK0cVukIiu9N8usYgkuA=
X-Google-Smtp-Source: AGHT+IFSDgCLPJndg4TOxS4/+K2sQKL3XaKKbJwpYxrHeNncRVK3PIq5fLt3S1TrCjsBx8V+oC1pdTue83tyCk/M6OM=
X-Received: by 2002:a05:6512:3e23:b0:568:25d0:f843 with SMTP id
 2adb3069b0e04-56825d1df24mr3328322e87.4.1757577400507; Thu, 11 Sep 2025
 00:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org> <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
In-Reply-To: <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 09:56:28 +0200
X-Gm-Features: Ac12FXzR1a5xkbJIh_yEzUr3Ha0h6_elTIUATVbDxWcMjvS8AEDuwvbJ1IToPQE
Message-ID: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Florian Fainelli <florian.fainelli@broadcom.com>, 
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

On Thu, Sep 11, 2025 at 2:11=E2=80=AFAM Doug Berger <opendmb@gmail.com> wro=
te:
>
> >
> > @@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_devic=
e *pdev)
> >                * be retained from S5 cold boot
> >                */
> >               need_wakeup_event |=3D !!__brcmstb_gpio_get_active_irqs(b=
ank);
> > -             gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
> > +             gpio_generic_write_reg(&bank->chip,
> > +                                    reg_base + GIO_MASK(bank->id), 0);
> >
> >               err =3D gpiochip_add_data(gc, bank);
> >               if (err) {
> >
> I suppose I'm OK with all of this, but I'm just curious about the longer
> term plans for the member accesses. Is there an intent to have helpers
> for things like?:
> chip.gc.offset
> chip.gc.ngpio

I don't think so. It would require an enormous effort and these fields
in struct gpio_chip are pretty stable so there's no real reason for
it.

Bart

