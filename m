Return-Path: <linux-mips+bounces-9950-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56842B1618A
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 15:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8514118C822B
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 13:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2D82D3A6D;
	Wed, 30 Jul 2025 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXGIxDbQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0F72D3730;
	Wed, 30 Jul 2025 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753882246; cv=none; b=YG3yCi9FYmyW8weN+EsEm1HuNv/R5qPgCMxOB2XJE1lkIzVubD4OEcn4AqpqHMfHFMMjt077VU1gGP6PFUTSOz7sFWjrgW5pJQo5FwizJLvHJIwnpSkQNvzdGWoptl8DEEVLIyBM0J9h60dmUMX9of82MrVaQ/wozMwhzDnK+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753882246; c=relaxed/simple;
	bh=8ONcE8oQ6Ovxim91GXFYg9iUHoLisltD7bWCaIaZE7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTQGcgyRn4WmWkqP64GtskoXvTsZcexZhvPOUFWU5qz3r2xOG006FMDagfOFNqmxxi+clPItbJMuKjYVhW59yWq22NrdKhgMZXYD4kkXOeTiAWGVNg8nK47AMWvorFnHcz8z701ZAuPaRpY31V44LS7H4uxICp6BMafsXKftvVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXGIxDbQ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af66f444488so494854366b.0;
        Wed, 30 Jul 2025 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753882243; x=1754487043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qi9l6TBdgjaQnQAqpjO6D0pjlwGQDGt3b3+CN6Y3/yI=;
        b=XXGIxDbQgUFtyfBsiUhmmtuDMRBamLuWISnO9xdTQF/YAQ8WANE9CZvOqvJxvQftjo
         veUyXpuqERLCF1u+hgKEmk1YBCxNHtuNYWFbfXaqrmhqRZ7P5l3ZU+FBvyRcvLoS+IDg
         24uU4nabWjNkcyYdk5KN5pntSEfseKkrsGCmhhJcwkzKGl7VyI8oo/m+7ldXcdyi+pP/
         aPff05j7XsXRmSPfEZHJ0dFYnx6W4rUMe6b6ccFga3Odbb7aLvlxN+Kl+UJLXs1SbGT/
         rzOf67HGCELMZeaBHd0czDvOGHEGlGWQSpanulTHNQViqXTfTopHRhOM86mBmgnKz8oI
         sEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753882243; x=1754487043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qi9l6TBdgjaQnQAqpjO6D0pjlwGQDGt3b3+CN6Y3/yI=;
        b=phAso52mGoBHFyZkp0DlaBkyB9T4jn9hZkhp0di5/folX5q/ce/Egp7CzVpS/v20aI
         O2Fpgmpa8cbw+DG6mDCTkVRLWXhz4VipX0nA7vOuH7JWUvz/cyLCN05ldMMfNwgPWmXB
         KxeJqsr0XAsbgX8cB7NhsOBWJMLN5E+zKN4Q/PZLvEPG4g/7cvKGJAfWCDqt1zEUu4dS
         AvWJmccr88XO5DE514guSZ5f6eT2Tcmk/aUaq0xcaU5mviBcP53SY+LkK0RvzZPc8PB7
         JvycNsG+XnKqXpzhwjOgMgAevbiwywlNsxTDS8BoUMpUJDiZgR8TIYrRRQcJ8tFY9wN/
         0UKA==
X-Forwarded-Encrypted: i=1; AJvYcCUghB4NKzq1UKJ6JtGBF0T3HfYkkLaqx5TehD994Gc5yJz1YZ43CkFRP1w8C4qudvFfnGUQ0QZfbUGpPA==@vger.kernel.org, AJvYcCVWOjxdQ8yRBaL3EMd0bTZGIcPsEVBmoS109dHedLroHhx6ZK+xOcaSkAgkGTltSNgE3iCzI8u43+lyiw==@vger.kernel.org, AJvYcCVmEOJfEeQTPHUeIquLEkeBV1I/TOzkMnwdLql9BruT5Bl0HWiG1SD5Uk52oSe4Tuq6LGvKjNewFYpu/nK4z5Vt/Tg=@vger.kernel.org, AJvYcCW7TdmarISvfHFMqh6Vz04SgPNH7a4i0QSyTpeqxa+N3oVsHkjtxtP1IHJGTciG5KxZ9G2trz6MiachTrtbvje/@vger.kernel.org, AJvYcCWRR6QRIzCpZPxb2O4RjOKzcALg/XmGmk4JMzhOBcNSDjuVz5fV9xCTJBvlN1If/FiDnaTfqJHo0F1kWjiz@vger.kernel.org, AJvYcCX/x2cAhZeGKc5Hlem2la7wocuSCT+m1TS/dmPwrfX7YSOuSDOMZbo9sSzuMElcqwmw8xGElmurwXgXCiTI@vger.kernel.org, AJvYcCXk2paaTIFp057xMFhZBUX4ne0MP/ArqGhRSoB/lYvPvIc+lZaW2i+klLxZlcqipT8z4BFlX5ABFxn7KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnTnHTzzY+UpszFobwBpkFac2Dw3G7WijzArDjDD4fv8VXnlKn
	ueoErsC3TXnGtBFUyakO6zL50PfvSO05lqKvDm4rndc3EQ6w6EuG61WIVTwh84BPa0Sf5xKLu+o
	FE/MhvLKBy76T2uXpYBgZV0cgGJnptII=
X-Gm-Gg: ASbGnctjCOoHz2FKEAKZ60ryb1/XGNJ/tXr8uDufUsHONcXrEpyI+txILJXl9+q92St
	o/ilXlISXAiDHbgl3d8rje3/ZUVrCx3Y3PAMIJFg8Bs/EIVs4ck6oOqN3QmhCV39dYvgZva/5mR
	8KOcsI8md2xqeauvTZMEnvZVIhHxwbG68OL/c7RGOxApbi+0TQY6qdgTy+RKVnBm0rme6NmxPIF
	VS9Bmaa+OE8IT3JL9uR
X-Google-Smtp-Source: AGHT+IE7FH6m4Dj0jSn6Xv2SOxyVdUI56jx+oEPv/YLtr96ycR8jtmVTuCl5DRsdQyIzWn8vHcnXCm+w9rLeyqQEmTc=
X-Received: by 2002:a17:907:dab:b0:ae3:60fb:1b3b with SMTP id
 a640c23a62f3a-af8fda93d6emr386293566b.58.1753882242487; Wed, 30 Jul 2025
 06:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
 <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
 <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com> <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com>
In-Reply-To: <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Jul 2025 15:30:04 +0200
X-Gm-Features: Ac12FXyFKinLiyKOfaCHk8Jvp-MCK0UJT4pw-WeZSCiJVFAceB4TVkbq9UOtwlo
Message-ID: <CAHp75Vd_5HVwzuiV17XKkzpEvzd8dzPDRRx5w-VqZnjuCz6m6A@mail.gmail.com>
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

On Wed, Jul 30, 2025 at 2:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Jul 30, 2025 at 2:50=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > > On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > >
> > > > >  struct pinfunction {
> > > > >         const char *name;
> > > > >         const char * const *groups;
> > > > >         size_t ngroups;
> > > > > +       unsigned long flags;
> > > >
> > > > Not sure we need this. If the function is GPIO, pin control already
> > > > knows about this. The pin muxing has gpio request / release callbac=
ks
> > > > that change the state. Why do we need an additional flag(s)?
> > >
> > > I'm not following, how does the pin controller know that the function
> > > is GPIO exactly, other than by the bit set in this field?
> >
> > AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
> > of this information.
>
> No, that's not at all what this series does... gpio_owner is the
> consumer label of a pin used by the GPIOLIB framework. The flag I'm
> introducing it telling the pinctrl core - before GPIOLIB is ever
> involved - that *this pin can be requested as a GPIO by GPIOLIB*.

The certain pin control driver may even not know about this. But even
though the proposed change is an overkill. If it indeed needs to be
done, the solution of valid_mask approach sounds to me much better. It
will be a single bitmask per pin control to tell this.

> It's
> the other way around - without knowing this, for strict pinmuxers,
> GPIOLIB would never be able to request this pin if it was muxed to a
> function (even if the function is called "GPIO").

I need to read the series again, but I truly believe we don't need
this new field in the struct pinfunction.



--=20
With Best Regards,
Andy Shevchenko

