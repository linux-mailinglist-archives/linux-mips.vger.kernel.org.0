Return-Path: <linux-mips+bounces-9719-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B23B003D0
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 15:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B55A7B8C25
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 13:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAFD259CBC;
	Thu, 10 Jul 2025 13:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vm0E40b3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F7282899
	for <linux-mips@vger.kernel.org>; Thu, 10 Jul 2025 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752154754; cv=none; b=ut6SUkVAjwqgli45aIwyDej1FXVrq2udFM2qmuRQ3jUOxZBxUnBro2HegtRKl/C8R+RxUxobl8B9mF7iaN6LDq1uBg30/ql6UrGWLfLJowIWO0TEUn2FVb9pClkX63fCNMIHA36qKS6kw6folnczbodt7ep5oOedAXK/pa68Ptw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752154754; c=relaxed/simple;
	bh=AKXQs7l/JnXnGET0gMtJ1sU9EPmcS39N6hUdQpcxAYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AyJv81AdBUa1PyTyK8h8qwlbEggLjvnhFg30MGrUcMkI6lhOPFPUqhYUQFluKvW0+MxZUFFa9jgwuzeB3Eh94/n2CwNiN8uX71I+otZyvc3fbYG+Cye8qWx++5uFz32MPYKEVvJnl8/ZdnkXxO9gDVGajtwHwuqQA5aEsFtrp4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vm0E40b3; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so2407799e87.1
        for <linux-mips@vger.kernel.org>; Thu, 10 Jul 2025 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752154749; x=1752759549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrVJz6seKnsGWdk+TcTY9r2vqG/4YZecUgijiRF40No=;
        b=vm0E40b3KJdBYURwDB2SGyiajheBsl+ABER84/3zfU8FaDh4lF6D+Y/bDXTVWCd9Ls
         wQfPH4WyJavgbd8gLpfhWeorCRWjjAyQcxsQtlmdoTuhFAaXygoHlpbIkAatNIyqGeYf
         hMUuBVb+N5evrFuB/8yu1RKA8mSwBKBtq0yHfBL45cazgVdQZ8RQfLEguPTL+dFVFh1E
         64e8JIl8v4CJLQ1lapFPopee8/ozT93rpi/nuBbxFyskVLYXtfpmtq53J99V+8182n/d
         V42bW7RcFbcLGnUAPuYz/umho+C3YZ4eCMWc4dndAKcTvXekjhXd+80++2qIoBdAAnbh
         Wq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752154749; x=1752759549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrVJz6seKnsGWdk+TcTY9r2vqG/4YZecUgijiRF40No=;
        b=HncoQqnjpsM6PMRgWbLxa6pk7Qb9pzz8W6xxt2rmQF2dFOMszYO9CKtNOEaupcXhp6
         EwpPahgdGG5Bie6W3Z4nNMGkAvJVBtyKxfMz841TxX4YP/LursqE0/aldvWb2IT/ePER
         gEEbSmriluxlm7ym8lxd84ohqpnndmewv8cD5/FSLYPmhENKlEyqrQaEdL51MDxq9hwu
         5Tn4gYUR2x7H/do/3N9oODaz0L7t2utheBZoKQNcpXe/DA43OpxKD+0iCzt7sJxXyA5T
         hi4A9BGBlO+GcM25BRGZjQuD+X9K8tNmrFet4FkHXQhSvpEJ/ZnIykbMeuFv7CYiBIpv
         5dUA==
X-Forwarded-Encrypted: i=1; AJvYcCVT5FaBzqaDTE5J2MqGy6AZJrVxAy2CZaOIIoNFT8axDJOurldSLySZB8WjbHuUGTnLyt72begua07Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyRmtNJJg1baMc+F28G5OapFiDy1lRN2UvHQriC4QoC6Y7BL9W9
	f2Clr6tHuZDdDHu504yiJoUrcDKJ4qC/z1gCFZiyu4UgcsRGKivChpIra2vKl0sq0hvkQw4wNqW
	PxmRnYS5D78zMxF9uQOJELoNYMG4gVD9T6ijiSipl4g==
X-Gm-Gg: ASbGncuFPL6EbULnKlQpGN6V6HTiwhX5/CD8SUx5A+xjG17q7Zuq5mmiKlWIU61UJx+
	+UyTSi6bFHJX3ofrcuolKJqlmGuW8As83wEY+6a8GCeNj/n6NNWVd+w2UadrPbIaHTWYRigjx7a
	MVTJsqprcQl6iv159cbiWiH3bQWksoKexL3tKjBt0Uwqr7nlFuekUVbKWpY+lisZtKowujcvuSP
	3w=
X-Google-Smtp-Source: AGHT+IGB6UUmFZhzqKjRvGV4lr9BeyGDE6WH9O1sGiazwi8CZoRnZBbYDI50VNLpbqgC1sRg+VYVXXWLsDZF+CuXQF4=
X-Received: by 2002:a05:6512:1587:b0:54a:c4af:15 with SMTP id
 2adb3069b0e04-5590071b7c3mr1264610e87.19.1752154748737; Thu, 10 Jul 2025
 06:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org> <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
In-Reply-To: <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Jul 2025 15:38:57 +0200
X-Gm-Features: Ac12FXwUS6h2JE4LNA_vmGF3f9mhet3j6NKR8eSjHb_k-YJ2CoyhrM-67s3nQ-g
Message-ID: <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 2:25=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the existing infrastructure for storing and looking up pin function=
s
> > in pinctrl core. Remove hand-crafted callbacks.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> [...]
>
> >  int msm_pinctrl_probe(struct platform_device *pdev,
> >                     const struct msm_pinctrl_soc_data *soc_data)
> >  {
> > +     const struct pinfunction *func;
> >       struct msm_pinctrl *pctrl;
> >       struct resource *res;
> >       int ret;
> > @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pd=
ev,
> >               return PTR_ERR(pctrl->pctrl);
> >       }
> >
> > +     for (i =3D 0; i < soc_data->nfunctions; i++) {
> > +             func =3D &soc_data->functions[i];
> > +
> > +             ret =3D pinmux_generic_add_pinfunction(pctrl->pctrl, func=
, NULL);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
>
> It's good in principle, but we're now going to house two copies of
> the function data in memory... Can we trust __initconst nowadays?
>

Well, if I annotate the functions struct with __initconst, then it
does indeed end up in the .init.rodata section if that's your
question. Then the kernel seems to be freeing this in
./kernel/module/main.c so I sure hope we can trust it.

Do I understand correctly that you're implicitly asking to also
annotate all affected _functions structures across all tlmm drivers?

Alternatively: we can provide another interface:
pinmux_generic_add_const_pinfunction() which - instead of a deep-copy
- would simply store addresses of existing pinfunction structures in
the underlying radix tree.

Bartosz

