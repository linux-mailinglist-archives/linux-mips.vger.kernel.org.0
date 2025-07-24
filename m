Return-Path: <linux-mips+bounces-9921-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9AFB10A02
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 14:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B2B27A5313
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 12:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4442D12E3;
	Thu, 24 Jul 2025 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOMptOOI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F982E36E3;
	Thu, 24 Jul 2025 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753359753; cv=none; b=CS771sgrT4KrGXM6KavVFI1gtaYSlIqJ4UbvbYYvJR6GG7/WrFHDVpBgvVbJOiSFaNJFmdU+nFXx+/8YPpfHjHq08Gvtswi1JdPuMRYNHPku+Ke9iVekd2GnbPM8KwB14vFSFva8GDF/MeZV3U/IkH03W1UFk9VutlXQMckXNYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753359753; c=relaxed/simple;
	bh=SuuzfGDvzCnvi/bsKJ4BfINBu+QjHlhVEd84kJsyMAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueej2guU5yoyQwbFBkgjRRkCWSd64t/pzoOKr/qe6IsPwBpiNJYlASUgY6ix80LDzcqweURQSYU74/31KO13j4x6Y2Ty+Lq4GqRbB0ZapS8kfa8M4yIiCNva42IRRTFAlGDcM5hdCUChJcdREGoawcrfHfdpXS4F+JfhRhMozx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOMptOOI; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so1568513a12.2;
        Thu, 24 Jul 2025 05:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753359750; x=1753964550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCH9wMZuCq9rz+O+tflGRTfcHTnRU43/VMnWUAJfNWE=;
        b=WOMptOOI6OyxX8JFa+JXKvi9t5HPBRxQNjZv1aOjNq88l924KQ83C6dDIHLWRJMzkj
         AhnzomiGe61BrR6vFzGDvoAANg8jMFnHBtU4wqG2cpgLg0d3fSbl3jy28IDv7PXxcFVr
         1tTSrRecR2cnrvJBEwyGNGXRnH4D7yFnJTcOIZVa6eBApo5VG1DlxfuFELSxei+uI8MF
         OvtM5zSNquSHwPc3EyoUzHB2EP9npI1UVa4vzMHwZ38sB3cQtuPXzf3rT5uqg4FmHUag
         LDdYORZt246bDpuhQlP+mwDpIyYInxNYzzqwN3RG7aKSZyGSB/A/fqNkL0vp/VpW0cG4
         PY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753359750; x=1753964550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCH9wMZuCq9rz+O+tflGRTfcHTnRU43/VMnWUAJfNWE=;
        b=r8nTFgEUTfS94C4tYB/GZ54NU0XQnuzDukS6pgsiZjA+gxRB/Pz96GY+lmNI2vefuw
         jVFgN+VU3CZGU98g/pWCRE4kcSOEMJrUSAcYH7iB70bFLTLwMTAxn3id1AjwhqNcLgUP
         FGYjWAuKp6gs4qcLLMyUhcZuqTf6Kx9XjpTzcsGCHyYlYToqWhIdwnRBiNeUzL1pRdX1
         hxAP/dnWP67EeQK/F3xyKFHFcScLwFRMDT6f+Mf4EQIsdLXNdaXnPc69SjK5pfYfyrez
         bfatceq0VQASXw9I/vRCb3b23jOAI8xKudhckIlOsP5c6mUcqIz6PeFQmv5zq9A4sDcH
         vhnA==
X-Forwarded-Encrypted: i=1; AJvYcCUCD+Mpnm1UFGnfqqaUG5qRBjKWeJCrw78u/f6cOKyC3QF6fIQJepWUGQGCyG40K5gxiIu91YW4xMyI7/38oCbQp5Y=@vger.kernel.org, AJvYcCUOIdmer+pt2B6HEW0UQyQF98tYReA3G+GaMy8DKAuTJmd4Di3gkkbNtJZ4YRlCn57qy3a6BY9LbFLHHw==@vger.kernel.org, AJvYcCUVDnuoFGSyj/Dy+Pck6CajX+OsP+/r8nPLLu6Fqz2rFIK+BV759YcD5+5SqGXLbWQVnNUoN14/ygWMpmum@vger.kernel.org, AJvYcCUj0umOhQJHYgmC5qcNw26n9PdlBTee3/TrO8Gp44+dM8fjltpxqz30GFFgQYZ2kUna1CRsSm6bLUnA4oxCSpsk@vger.kernel.org, AJvYcCW4i9HwrHUbDZmZPIdrV0oRZ+e9AUpxJ1ATa2kWHuqNlaFliR5QQGdCvRLxABiqdFVpJuqjUrPXjhpllw==@vger.kernel.org, AJvYcCWT8YtOTQoHVO1fuwWgCGqwQx8i6qua5/XKWNJt5YwmKU8fcsulQcp8+cTWG3y0VK8/8UDcOWa4z1WtJAr9@vger.kernel.org, AJvYcCWUVO1wd5lCx+cqGxbOaIwmfEB+6IlzIv4CQZveGyKVNYnPIcuO50Oc8beUrhn/FG9wJlkzZWM8KBAomg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPwVYLVlSKSPSXVYPvrcEY+IwWwAy6wZObJylJCdZW/OSyMfnG
	QjRLFqYv79Cud2WTwOddM+I0YuAuY0JkUoT5qBdVAgWF0LoCzRM1oLkeyydJpeOTS9Pw3FdYwOd
	sH7lUwGtBup17bfyixerXnWRHOKOI0Nk=
X-Gm-Gg: ASbGnctvj6CfyFUWgCDClji0GkdjsQIRvnH1zdybaon1HtEigg9+8wjSTzV8TtUMPJD
	S5vjWTwn0klzO3BT2zn57+AxC4819L+4Od3+HEVuAc0Zg+BL9mnwsBLsZGcflSDXy+a23rvvwqj
	npdKA3r/whUg7Xo9yfDVGx+DeSP02EvX60FWmSZVGH2C5h70XtjpSpzvGfCpfr4bXtEsZWYl7T3
	qvPgObEJg==
X-Google-Smtp-Source: AGHT+IHK0IoDJ6PED5zWXfzDhpKgh5VZvydISu4XMaUvDPUT/I7krIj8dXVVfHCUqibcmSSRfe/rVr8gG8zy8ado+mw=
X-Received: by 2002:a17:907:60cb:b0:aec:6600:dbe3 with SMTP id
 a640c23a62f3a-af2f9385acfmr671282766b.56.1753359749816; Thu, 24 Jul 2025
 05:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 14:21:53 +0200
X-Gm-Features: Ac12FXz2KOnsH_foq66JE5xieoDhq1Ik71OykKjuCvc1b-KzV3FeiggPCBwSd4M
Message-ID: <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> The name of the pin function has no real meaning to pinctrl core and is
> there only for human readability of device properties. Some pins are
> muxed as GPIOs but for "strict" pinmuxers it's impossible to request
> them as GPIOs if they're bound to a devide - even if their function name
> explicitly says "gpio". Add a new field to struct pinfunction that
> allows to pass additional flags to pinctrl core. While we could go with

passing
to the pinctrl

> a boolean "is_gpio" field, a flags field is more future-proof.
>
> If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
> to it can be requested as GPIO even on strict pin controllers. Add a new

"...the pin, which is muxed to it, ..."

> callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
> core to inspect a function and see if it's a GPIO one. Provide a generic
> implementation of this callback.

...

> -       if (ops->strict && desc->mux_usecount)
> +       if (ops->function_is_gpio && mux_setting)

Seems mux_setting presence is prior to the GPIO checks, I would swap
the parameters of &&.

> +               func_is_gpio =3D ops->function_is_gpio(pctldev,
> +                                                    mux_setting->func);

One line is okay.

> +       if (ops->strict && desc->mux_usecount && !func_is_gpio)
>                 return false;
>
>         return !(ops->strict && !!desc->gpio_owner);

I think this whole if/return chain can be made slightly more readable,
but I haven't had something to provide right now. Lemme think about
it,

...

> +               if (ops->function_is_gpio && mux_setting)
> +                       func_is_gpio =3D ops->function_is_gpio(pctldev,
> +                                                            mux_setting-=
>func);
> +               if ((!gpio_range || ops->strict) && !func_is_gpio &&
>                     desc->mux_usecount && strcmp(desc->mux_owner, owner))=
 {

This is very similar to the above check, I think at bare minimum here
can be a helper for both cases.

...

> +/**
> + * pinmux_generic_function_is_gpio() - returns true if given function is=
 a GPIO
> + * @pctldev: pin controller device
> + * @selector: function number

Missing Return section. Please run kernel-doc validator against new kernel-=
docs.

> + */
> +bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
> +                                    unsigned int selector)
> +{
> +       struct function_desc *function;
> +
> +       function =3D radix_tree_lookup(&pctldev->pin_function_tree,
> +                                    selector);

One line is okay.

> +       if (!function)
> +               return false;
> +
> +       return function->func->flags & PINFUNCTION_FLAG_GPIO;
> +}

...

>  struct pinfunction {
>         const char *name;
>         const char * const *groups;
>         size_t ngroups;
> +       unsigned long flags;

Not sure we need this. If the function is GPIO, pin control already
knows about this. The pin muxing has gpio request / release callbacks
that change the state. Why do we need an additional flag(s)?

>  };

--=20
With Best Regards,
Andy Shevchenko

