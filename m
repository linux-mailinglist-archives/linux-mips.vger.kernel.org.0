Return-Path: <linux-mips+bounces-10396-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75170B2D990
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 12:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2FA6189472D
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 10:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B072DC35A;
	Wed, 20 Aug 2025 09:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6J4HBgO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454802DA773;
	Wed, 20 Aug 2025 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755683982; cv=none; b=ZTSneBPNoJdDST0ajw1G8PwNNt4/jhIHIlah6DXwbWzm+3c8RK6n8vhptdMYPdzVHlB9Hu80OAbgCbvjAb77z3t/XHV0RrKtGjeYVEYc7Hvmffqn4eaRFIyBJnav0nSTgPypaF509ao7wRlJUUxdTtu2o7KRkT4GP5gDhdk/k7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755683982; c=relaxed/simple;
	bh=laiWuyKWR3ASNPyoDieuVX6zxtjO9IOYMfbCtl3c354=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdYsvVTVNyWtpXxZaoPlaE3MQZ0lkARnUr+k+cKTPFjSd8e94uaFNRK0dd1bZiXyf3jfk40aahoVPwf+jgienFl9haZFyCQ+Z9sYR4FzitRZ2cVFXIunx88X8GlRI3JpzyaU5EcdyNLTkLTDKTf2OZFCTEMvqY4briWWAzPL0SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6J4HBgO; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb79f659aso952485566b.2;
        Wed, 20 Aug 2025 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755683978; x=1756288778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPSwHXJiuPboMvGmzdZl86YoheXT2JJemMGGCNbTXh4=;
        b=R6J4HBgOFtVb092NiSH3JWCkwtrROsYYFSmzWF2NKOVV0eUi1Kb0DcxGUGTGxoTTh4
         +oxl8nOJF5zsQas9C2xY6qxKOTIv14yILT+nX/r6jYS6E1QC4BJ/EobOSZA3JGZ8QDAs
         avj/M5wbLoSfJYlLpL4NIPX7/WooDMG1cC+LUnwkKgLO+AJoDYHfKFLA0k2RHVCQUfTr
         L8dAsYKyYbNVzt6f1jsqApW9OBJVX36pUppdvVV8hYxIT5Mwt0oA0ubPMWZfss4wshB0
         ObZf9TpGSzM9V5qSGR8NgrRMB4EMS1ZAd2XBNrXQFS9i9KWxPF0Ie2pg/QBF9C8/uEau
         CdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755683978; x=1756288778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPSwHXJiuPboMvGmzdZl86YoheXT2JJemMGGCNbTXh4=;
        b=Z2Mqu0wXPDIBZY/pH4j0b5kRFpu/oK/zpum5CgGIYAn22UG+Ywmcb9FLEp/hsJl72c
         EpddJIYHnpcHtzXeqvvhp/NdekbHzLoFHrimyFeINhfCJHYbdOXcASKm2VAxQ5VMZ8gg
         RrlXkhr6b+Tkz/DwQzecA1dQvIe3vwxmT/Mp9qgekyr6E8qvcFkcEmSoVViGioWzdrZn
         2scRuy1MuNENk3mchOJdSExdvv8aEc5Cj8ntvAGzwzDP+1It3KBzRrPDhJgkHvZy9oxZ
         r281r1EjgMSonMSEuzNBH7tBCxhPmq3lPXs8lUAnFmg4dMiA1EKfvBjfRPf6/y1wrjId
         3WCg==
X-Forwarded-Encrypted: i=1; AJvYcCU199ot7Bh//K/7Gwg1IfN4Y5fDcsXNvCQshI3sKi02nx/xo2PMXS7tw0kysX8Uyulo8de19xEt2ofhR1rxZW44QG8=@vger.kernel.org, AJvYcCUsCaUw7B/u0Y95/PZ4D7Y9lEhKkkLA/GfGwX0XNVYKkUKZcCi3RkJABViVU7WyOHrSeoGSaORsz8Izxzuj/qk4@vger.kernel.org, AJvYcCUvR7QkfGbRfksoAk4RA3cCiZt9SRYQnYzds9hXuMSfwUnlGRPbyHWKGJ1dhB7Df2uYHFH5b5S2c/FuiVu4@vger.kernel.org, AJvYcCVK3TSW2AsXjdy/jwbwerWurOEv0Eitl4Ae8PDGxxKG6j2LiKotaqE+jyCizf7pDPL+9c4jEFxuG9vRKQ==@vger.kernel.org, AJvYcCVm4tU8w7eoFQzK2g8t4HcLxylLo9IL2+BM14zVvLB9DAbFJdHmtqrXuD7E9TAMWT9q6pgj91ycH7CGJQ==@vger.kernel.org, AJvYcCXpZRiVSzkkfTpvz+eXr/kNM7I76us135SYZHWoqycsoULJrN+O35qyKY0UX9AZxpgIozRrjWwpFIX0zQ==@vger.kernel.org, AJvYcCXv9zfiBRp2GY3U0quWRqOjydVAYKdEvbowJNWubOSEBmDlNHHYBQea+KZgIujzb6dtSiIPRxecOrTdTDg1@vger.kernel.org
X-Gm-Message-State: AOJu0YwO94YiZDWYv2CoUmx+m5Y5U1GGT7O9r1ulxsCEPgDzcm34bV1O
	wpvB56ssCEvernjZo2BHvXLj+LiUwHi7AgIbsFdPfyo2KCZf8xdFmI599AcUXJQIwMLLhyDEHZW
	z0hruJLRhQ5VVkrDyoGrw5/4Vyxq7oZw=
X-Gm-Gg: ASbGnctDuoucb/ZExOs3bf2/i8Ki6ExTzjTit30LjlWIM8DGqsOxQfxlalYufnRFM0O
	uijpILYu+DX8o41VEkxP8Bt5/4wsc+ayGPRkJXhT9YMQyoi8TC+p77yCQ03ttf8Ncx6AaDshw0W
	XP2jfdMxfbgVuTrLPfZROCFCy2E12iQMMqztPeJQg4oYl0sU5RJDoLGSG/R3qNewb7nQ6RgxHlN
	S0Cfha41w==
X-Google-Smtp-Source: AGHT+IFLILsumUxXGG8Le22U8VXLfiB3UImn/sKCUBHCwulcrWRoCPLLCjJAWxmPAx6D8QUNkGdtQmpTps7zJUlvWzY=
X-Received: by 2002:a17:906:fe01:b0:ae8:fd2d:44b8 with SMTP id
 a640c23a62f3a-afdf00e1d0amr167565066b.29.1755683978222; Wed, 20 Aug 2025
 02:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com> <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
In-Reply-To: <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 12:59:01 +0300
X-Gm-Features: Ac12FXycXziPzAbLNx1s7hMXfLqQ2mmNzJaOepqBGK1kK3uBfF-tyE-7OZscDUk
Message-ID: <CAHp75VfNhBrukJ46ahY77La5Ywkeu1xiC_eUbUj99ZQcderHbw@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, 
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 10:13=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Tue, Aug 19, 2025 at 8:31=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Aug 19, 2025 at 4:02=E2=80=AFPM Linus Walleij <linus.walleij@li=
naro.org> wrote:
> > > On Fri, Aug 15, 2025 at 11:09=E2=80=AFAM Bartosz Golaszewski <brgl@bg=
dev.pl> wrote:

...

> > > >       devres: provide devm_kmemdup_const()
> > > >       pinctrl: ingenic: use struct pinfunction instead of struct fu=
nction_desc
> > > >       pinctrl: airoha: replace struct function_desc with struct pin=
function
> > > >       pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
> > > >       pinctrl: mediatek: moore: replace struct function_desc with s=
truct pinfunction
> > > >       pinctrl: imx: don't access the pin function radix tree direct=
ly
> > > >       pinctrl: keembay: release allocated memory in detach path
> > > >       pinctrl: keembay: use a dedicated structure for the pinfuncti=
on description
> > > >       pinctrl: constify pinmux_generic_get_function()

At least the above I'm pretty much okay with. Can you still have them
being applied?

> > > >       pinctrl: make struct pinfunction a pointer in struct function=
_desc
> > > >       pinctrl: qcom: use generic pin function helpers
> > > >       pinctrl: allow to mark pin functions as requestable GPIOs
> > >
> > > I applied these 12 patches as a starter so they can
> > > stabilize in linux-next.
> >
> > Hmm... I'm still sure that we don't need to have a separate flags
> > field, but since I am on vacation and will be able to look at this
> > closer next week, I can't look closer to it.
>
> The qualcomm 32bit platforms fail in next anyway so I dropped the patches
> for now.
>
> Both you and Bartosz are on vacation so let's let it rest for a week or t=
wo.

I will be available fully next week.

--=20
With Best Regards,
Andy Shevchenko

