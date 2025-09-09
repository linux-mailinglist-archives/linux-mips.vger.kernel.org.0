Return-Path: <linux-mips+bounces-11160-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8199B4FEB6
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 16:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3623B1B26714
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 14:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B763301029;
	Tue,  9 Sep 2025 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pJkEPVMY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE70B33CEA4
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426756; cv=none; b=stYuuAEKNEHFzL2oaXlOy71kvW9n3W32u5WAsP/S8Tg490rhdl7u8rUVG/d+rHUnlPct6JStQMUy7UMn7yW0sJfPimi93dQ3xdyfHv9foGWW08oxTlaAOUC+tXCyxUiDiAkIy92IHhVRBRarGnh5lgx6DWhhlIEUWni71cjVChY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426756; c=relaxed/simple;
	bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTdevX2W0wq328MQWfwPs6NzeP2pHOAscflY8oRHQViFqsEW/waj0EIbl5x7oMMTeaZ4uZ7J71kf4gvONu9u3t2p0hGbLlUzf5o6DD96p2lS8+BWrhCnuvdL/uIozjVGwYYcMsuhMHXtPNsVISAn3ZaFcN4JewewWQ+auD948pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pJkEPVMY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f7039a9fdso5797676e87.1
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757426753; x=1758031553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
        b=pJkEPVMYcYyGrKCWpIdIdsYemX1+edMoeK8dfB0h6epJDltOW+qyW4gtxHE3bEkTle
         Hgi7LvvcW5+jq/WaEol2CJBs1dUrEAlMOhbZQg315laBjc/up8VmZpoeVh+2VIc+cmgu
         Mkj50G4pop64g6/Yca1j8m5tqEfMzPhIjYs3o02NfZTRkGa6mNSPGUyNGoRUCeuJocP4
         7khfVIbhscclQw7ANbbsJ9j4jSIcF5mCOQ5aUgwxgCRP5ys+O8QkzGzNLhNY8BOHcrWF
         4ACnK017d0NcMVDnO7uXzB85KniCDb7LlmUqt7Tq0EEdE8aION7GqY92E4JsfxemflnV
         Glmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426753; x=1758031553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
        b=O6vJg/mumSr1/u9Th8kHmJUcS6FOtnISWUYvFqcYxSOUW5vN1bfnQPDos3Z6h4SKG/
         jkkZ7I3j/STAf5vSB5Y+3qABCiLc5emoSBxFrNkc3h4PLQzL61cZs6McIwhZL5IUNQla
         aY7/QYqkXd3paMEenIM7O0rwZd6p7yx0FgMXUbfASHQouZpshZ464UYKUqp1pyT9+9Lc
         dd/z/tw5vDYiaLF58bRYsmpemI2sfXlYECVWbcjbsQ4twd9IOP3aoy99G7Bs//UVzOqR
         zjDZQKjaVbz6EtxE8A6w1nEi7WKMMcpeD0DZo4g62uGa11l26CnLjC6jprY8Zt83mY6v
         9m8g==
X-Forwarded-Encrypted: i=1; AJvYcCWcBgZfAJUQjD2WanDnrhLT8q0m0Q9n7M/NZj0vs/YKslyKSZCEuf9f+tMstENwWK6F2zrPjrAVSnz1@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZmEm0tcjWngAh6Quz4RlAun6X0BzhSS5N/0tbfuaq6uHcXIr
	c4/rO43HBBQmxNYgSpN0N0/Z78wUAQ0kZ7JSZHr7Hb9I4igLGglHz+kqXnTTmN4cqy8Ix5GKy25
	kZWhmtCPLvuFDRXi/6V9kn0tBSAk2hmyJqZZDPTyuug==
X-Gm-Gg: ASbGncsp2inkEIvt6yPFTEyTaWS0tAn6pQTC9JXWHR9UurSVSS06KjL35kDBVE88GHy
	TiWs5Se96r5ALbgURkU9jxu+11qKxDYO7g2F4454Akuv4L/Bu4Jilz/qkfs6uoK/zT9cdIsEn8Q
	4i0THL7n3ocuaiA6kNDZ+IDEbFn9dyEBKn7LCwcktV2xL6UrfqJpkJe8/YSXJw9efxhwIe7RRL3
	YoKlykT2a86Aos0uiXQy7pmYkav1fKwVzX2tJA=
X-Google-Smtp-Source: AGHT+IHxbtPyFzNpPyeaiiBaisDmRYDyXY5HX06QQvzN7rQqg4ycDBS5H9rZi94hP+dpGNYd7MLd29QcT4mULfuZ6+0=
X-Received: by 2002:a05:6512:108a:b0:55f:4db1:e450 with SMTP id
 2adb3069b0e04-56260e3b836mr3230997e87.22.1757426753065; Tue, 09 Sep 2025
 07:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com> <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
In-Reply-To: <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 16:05:41 +0200
X-Gm-Features: Ac12FXw1RLq4MdeG1hkRFaIkCvacYp3h7kbqz23NMJgO5kiwlT10dViDUNZvzbs
Message-ID: <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
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

On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > >
> > > TBH, I think those 6 all made the same mistake, i.e. thinking of the =
compound
> > > literal as a cast. Which is not!
> >
> > What do you suggest?
>
> Write it in less odd way :-)
>
> foo =3D (struct bar) { ... };

I don't get your reasoning. typeof() itself is well established in the
kernel and doesn't

foo =3D (struct bar){ ... };

evaluate to the same thing as

foo =3D (typeof(foo)){ ... };

? Isn't it still the same compound literal?

Bartosz

>
> > And are we not allowed to use C99 features now anyway?
>
> It's fine, it's not about the C standard number.
>

