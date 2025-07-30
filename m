Return-Path: <linux-mips+bounces-9948-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85807B160BA
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 14:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4934B17CB1B
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 12:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CDB298CC5;
	Wed, 30 Jul 2025 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cERN9kFy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0C629899A;
	Wed, 30 Jul 2025 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880008; cv=none; b=jv6mjRfOObTMveokAx4AnT3EjAVJdSuz//usSjD1sVnwa5p2talSCGxJDxTyI5DjDvpyWLGsq5tzbwGrZmAdxCqr0jPwOkY6gawOUVFezDu27pZF6488yQrrzkIp5vTpHhbkTJ6HzFizBDnWOf+unGNu87lwv0fzkb7b6+OnqDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880008; c=relaxed/simple;
	bh=yp7SViKG4Gt6cuPjj1Me5hhtNgyA0i/vd/UWUlXH6fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nk4r9c5zn7vcfwo618qn/E2kU94bbEaweKjiCZpBzTi8snYo+l4hie2o4arOQwZSH79lyHE+mscXquP8eV3BSFBoxvpK4mVqeLz/9kpe+e6r4nuy/lgc8VyqwSsUGGinpaSaZI5FUeR/EQ0JILQfoDxsJf1kP/AFR/3gUJfoDwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cERN9kFy; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so10856201a12.1;
        Wed, 30 Jul 2025 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753880005; x=1754484805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHuGd1o3geC90thSCnWisGLP32owTrOKYJC4wfO+xvA=;
        b=cERN9kFya4ZDlCG2luCfC91O/Bi5nilAaAFOuqBAfl6ELDWD8QA9hMEhwqTmPKCJE6
         NOL7y9dIvwVCxoRJqwGGklAPomI2DOgZ6XYLzkmuKEEa8mbdkvjSfRWelbGKszGWX7rn
         +3je6r16CdAioNbQCpKYlK0m+q/u01NC6AXw21XMUMAAHJdfaaxQEFkQmyxXr35sZhs2
         8TdxvYjiGaOvDkcHMjTOuXtJggdlRztoyCHPkVLIP0PGlH5H70lFoSFk2gK/zz0aWNKE
         2v6Wc8+7kdose4ypVc99566FbzoWVmph9OFokRyYF8vdMvIZAolSD/T2peBssfDfVmZu
         E/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880005; x=1754484805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHuGd1o3geC90thSCnWisGLP32owTrOKYJC4wfO+xvA=;
        b=q9EydRWfV6Vab5Av354O5VeZTXvE3v/uPFb6CvpefiYrtNjupo8DCDNvVhtoQVYmWP
         8hIhPCO6iIbeini4g7dqFkxcuxArylcCMaSUbigfLdYJtFiAtDV38s+b5ZWRjWB/dveA
         x00sDW/eTxvrSYVwWMkOa6S3KzpU9VD7p3j70n3mc0fsY97OplYca2JiTOQhMxbqDR38
         IAVvhqzpi0Z6NUdPfw+hmOFaMYqGJUrDImf/fw//7kpT/R71ez7ehkLoLVrdKdjNiasV
         1XvpMoBkwrsyt+bIEGj3A1P3iahHg8RhFAGavI9IhL90KlN47UA7j5yzxUxWQjLPlfmo
         CBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+UIPizUklnrAD1k9vpaILAV33Gw4Wy0QCUp+OPYGB8hrPPlQObzUW7O/XcmvlBTFQ1vozpgAtclb2g9ip@vger.kernel.org, AJvYcCUL+lCWK3IDdN2bJ0jU36kv+A7X94UCD9awZHsBBxxdlS+FlIkRDxfv5ICOGMxetqw0eT87OQBZtTQvX12/hT3kUYg=@vger.kernel.org, AJvYcCVJlcvqte7HuDqR4TwnOyQB5u4hFplwVzbg0Kr1/nDyEdwMiiKi92jjJzY0PxJMn+dFpwrVYv3csaQuVHeMiDrN@vger.kernel.org, AJvYcCVy4Dn4jcc0+rMxCs5ScWlXQoTTvYIBOSa+vRWUlQtvMwjC4548SjoP0MT4XudEDNyJQmY7xyAzM8+/vA==@vger.kernel.org, AJvYcCWiFOgZfhah1ZBUNUxGZph/BZJLxaZgGG63k2+fb4Ldlp1uUvQbQ/bfigotE8QblnXp0XClWR7Rqr9doGCh@vger.kernel.org, AJvYcCWkWdqZ0IM4/wQNHnJ1y+3kW9hFZZqD2upFuUhrYxu6rEY0E8BCfQOmvDKK6XQvRzsHm0N/QirF/eEhNg==@vger.kernel.org, AJvYcCXO8pgY6ezrbuJUAf/SNFk7WIXCFL38uffRJ85MGxfJkDxpYnAXhmwg1xtSZhq4eK0vbsaqDyGqmAzerQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjT4hsclPVcasDWKLDgZs9rxfuGEViSp8SvjODTb+ur5dzIQy1
	6ttiIFu8ggo7/RgiMOqp40XTBQAOB4dskf+HO/KJ480x67fkdGcNKaA9+fsP68nIyF5HUEc/SdX
	3K5ywifxIKDLpkguR9LlWSAJU4JKsKU4=
X-Gm-Gg: ASbGncsL6mAfPP5LgjTiojzseEDna1W4uh88nzFOvUNz9MQB+RFaic/tjIYb3u9seL7
	rTGL6HIfMEOLYjE3M3+gGk9/n+mCI15KWZrmr0Q44VFPXRi2A34EhD2xwIMSuq/wMzelaFHqkt+
	PZxA4XPMzgNOj4XavR3BZlOQUlhUL0J+7CogKZqoHmD5d3atmWVD6JP0/FKYYZZdqyspJL0odWK
	0UAbpKuZA==
X-Google-Smtp-Source: AGHT+IExcFLcRiu5QtKTR/cGupB5CiCW+Pjw09y0EZqUm/lnXA4CrvfRLkkrfhzcJE8+pxyrQnSgTbf1NQKA1MoVcOw=
X-Received: by 2002:a17:907:60d0:b0:ae1:1a30:6682 with SMTP id
 a640c23a62f3a-af8fd739a45mr409970266b.18.1753880004488; Wed, 30 Jul 2025
 05:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
 <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com> <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
In-Reply-To: <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Jul 2025 14:52:47 +0200
X-Gm-Features: Ac12FXy6gmS688CUsaG6BseFKvaIP4Sk1EUtOxMURXryhfGHjEY11oJr_rDyuZs
Message-ID: <CAHp75Vc-kFPz9J5CQgrwb+5Wgzyxne4RVn5efEDwwATAHTxC+A@mail.gmail.com>
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

On Wed, Jul 30, 2025 at 2:49=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > >  struct pinfunction {
> > > >         const char *name;
> > > >         const char * const *groups;
> > > >         size_t ngroups;
> > > > +       unsigned long flags;
> > >
> > > Not sure we need this. If the function is GPIO, pin control already
> > > knows about this. The pin muxing has gpio request / release callbacks
> > > that change the state. Why do we need an additional flag(s)?
> >
> > I'm not following, how does the pin controller know that the function
> > is GPIO exactly, other than by the bit set in this field?
>
> AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
> of this information.

To be clear, the pin control and muxing core knows about this, if the
certain pin control driver needs that information it can request this
from the core or do some other shortcuts (as it knows the state as
well in the HW). So, I do not see any need for this flag. But again,
maybe I'm missing the subtle corner case?


--=20
With Best Regards,
Andy Shevchenko

