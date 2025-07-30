Return-Path: <linux-mips+bounces-9947-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58736B160AA
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 14:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C5E8163A57
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 12:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78B12874F2;
	Wed, 30 Jul 2025 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jj939fjQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FE7256C70;
	Wed, 30 Jul 2025 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753879831; cv=none; b=pDreQlFNh5BoQNg+RfH2N7rZSLvMF31alUKksk0XcyWxHbujt/rHnyEFMWuhEMBnx6kS3rRcfTjuyPqkWLHDaUAaUEKXQUwHZqOvXL2XguHp+rImRT8QOEQ4c5ejgnp/fMeOXzom9a68c8h9iuaitx0azmarzgqxT11QK46o12Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753879831; c=relaxed/simple;
	bh=mAirr7gyYUrBa/ClKW/JlnzUq/0q+Y/udQ6/llJgM1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcEHO/6eW5/qwaMH0kZwgAZEqafx+J54nz1/2nvhu5WEtoi6cIdQTkA0Y3G1H1CN4ytm83NS6rXsRK1w9zlK/NQI17Q2OvAoLPL5T7LBtH37LvaCg5nwrtQThzVO5A+IeLLbua0NnMBa7WqkX8pm3yJycRY7lafFnOuXBkfQzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jj939fjQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61592ff5ebbso1004268a12.3;
        Wed, 30 Jul 2025 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753879828; x=1754484628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tvvn2gu3QwfMvEps+Es99aXQTd4n5DxwynGQISYrqRE=;
        b=jj939fjQZ4wDTAgEPxBIpvsSlWtocNqjIVgGDoi1gza4p8ghhPsYOJFa3Bz3JoS9iY
         rZtm3/86EDh2XIm09B4FI3bhOovSAkrNrO+LPglseWwCdBMfcoWDlHqABuBMBg9tPnnc
         kXtPxFoMw5NtUr4vZBZRwFi03jBNYIeDoa2/CYuoCjYuDOPsqUbtgxcmBcf39lRARrc6
         CVxcIx/RJfS0dGgjKzEQG7oJ6b/DJl4dMCpxr+0sJmZU3+sSm7hP/IsksGyF3snefxKy
         vhvgjwknb337ddOAL7ZQlfAxRqpnfLGdaRwFAVtsUgiUUlTbxXfLRRAyA5wYqIvSdBai
         HGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753879828; x=1754484628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvvn2gu3QwfMvEps+Es99aXQTd4n5DxwynGQISYrqRE=;
        b=VtWdnfXKyclte052wUlqjCm8FVwycOWY2c1tmRl4s+5ZK26bOuMfgiDiSaM5Rgp02O
         vOJDcyKAeL0L/F06ARVofFa6xQc1TsHtq5oJko0XY5XX9PD/YAZ7BgIrdsSJvNKCsdnD
         kik9laLFl16gHTr9TYV/dFLyW16ySdfeVVeuAJtUV+is6GR3HNjdJtQuPVqAFt67m8qC
         7LdgN5Cn/jwbzdpPAyiRl/7E8A1IDJYYPTm1q7kRJbsGWglJEEW4bY5j8MfC9BdWbfgB
         YRqpIYCw8y1AKbCit8o7ZCSb3hUyeJ8RuHmpY5Qb+mGYrW44WjXeyqrBejbYCJ7kqyLG
         49Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUeQm8HA3HggJ5qPLFO4IXmQmOpwiNe4OZcKmd+mA2rO74FiYzMQeaXq8ktdvuBGLePGDfUPhl9jSQ/qLZYXQKq1to=@vger.kernel.org, AJvYcCV66tp77Q/YXhNzLpZogLetriY5/4DK31ql96bqJ9sBPxrFpk0uSf1Fm2giuONzXjD6pZf/nd4wmVTZdbDc@vger.kernel.org, AJvYcCVIsEywJpqHD85BmhqIiVHMhKmw8EzIP3Zq+WBb6cKEd3QMgu9zbMV7p6hd3S0Uh/qW1Bdqqg4ZsFvCPQ==@vger.kernel.org, AJvYcCWAPFVqIrXJ+13GZNQXBDX+olT47MOyLExxONuIJ8msyIDoVSHPcgcRItrvtWIRGgZWeuZPi7y77el3Fg==@vger.kernel.org, AJvYcCWQrlT6CELgxlQblrYpdzrAjCTo7IhgGnTiKXY5/RyLgkRX+Ohw2DfM34H9zGUq37YqWCwbp4OdhkuJr/2k@vger.kernel.org, AJvYcCWouxhrj2dQ7/KqShB/fJCV9mSg4F3JKFtgQWO0G+umeS2Whf5aOgKjr9M9a7lUPIubhi7g8LG1mhpsOHxwwDph@vger.kernel.org, AJvYcCWuKr7BYN6q7K/Kv+413333QkxYBSiYy5uZG17OzzSBkz2v6k8WWZhFIlzL9OVNScgFC/ohzdg7WNPU6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWb1b1cnAVghNJ6hMDWw99Y/yUQVI6bK7AwCQWtzriPkb2QDIb
	ncUvgdqlbjhaDrpJbj9nQHzyj3lk8WEaYhlslUZIl9hU9kKQFqP4DUN3H8XdaAfYeyYhLmJoAej
	MjVzSI3DOoZCgVQ6QEqR7OCWp2p65Ot0=
X-Gm-Gg: ASbGncsJUWaNg4xwi/CZrT4sTCEnXvYvBjNG1/kLIL3SLXfeJqAq1sRUCIiKlwRzuOy
	KrTTOHzMzCXcpWQbvD7rj5dezCYq9WVwK+sSh+wQbbm8ZXyJIqDhdgQ0TCI8v104vSg72td/N7j
	k6b6ITJKmRLpu93OIIk7X8cLu5Wkbubbmp83uMo9E8Z+Jmm2J8a/cuJiLjW8Iki71O/bNSCgNto
	G+g9JoSWA==
X-Google-Smtp-Source: AGHT+IEJQOY2N21rRHh/x9SsZgR/AC6673gfg/Aq7DulgeR+61NEupHsjseGW2o2I6RkO01k98hTvI6/W9mnPdZHDTE=
X-Received: by 2002:a17:906:6a12:b0:ae0:b33d:2a4a with SMTP id
 a640c23a62f3a-af8fd97569fmr398869466b.35.1753879828299; Wed, 30 Jul 2025
 05:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com> <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
In-Reply-To: <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Jul 2025 14:49:51 +0200
X-Gm-Features: Ac12FXxgFDuQutFN_-MaFgaos1SbYd6nY92Ty-kjNsHnooD1EOK3KyGkMl4TA4s
Message-ID: <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
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

On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > >  struct pinfunction {
> > >         const char *name;
> > >         const char * const *groups;
> > >         size_t ngroups;
> > > +       unsigned long flags;
> >
> > Not sure we need this. If the function is GPIO, pin control already
> > knows about this. The pin muxing has gpio request / release callbacks
> > that change the state. Why do we need an additional flag(s)?
> >
>
> I'm not following, how does the pin controller know that the function
> is GPIO exactly, other than by the bit set in this field?

AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
of this information.

--=20
With Best Regards,
Andy Shevchenko

