Return-Path: <linux-mips+bounces-10389-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBB1B2CC0F
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 20:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 08B784E493F
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 18:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5DA30F80C;
	Tue, 19 Aug 2025 18:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lb/nuauV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB841E5205;
	Tue, 19 Aug 2025 18:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755628318; cv=none; b=ERUoNn+fmmXnx90iqxOfm3YTiUGSKTCPEsJS+P77rSBJ63xw9JqKRHcEjqu0U08uvpwWkymjmBXSPVqRUb3ry5hrEqVC1Akara0PuFfs/fGtuFO0c3F5yThb6Ncy/W2fFl/jd4Ta6yC2SQoadUmjyepF2XkjEWElkLOF+y/5rik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755628318; c=relaxed/simple;
	bh=ELVk40zB/S/lTRU9qhJakzcG7jLCkklBrhAYe+KgKyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTLOYpBu7RdkBHqnVj0YndDydi9VdsbbblrY2WJm/lgYaoQ9itH8BbN+RDrlYj/A2zB2Ncjz967qz3UHGR98Zv+1G89zAceYkMcLS8cPNh+sKZz7D8IRvsHaBkFOvCPiNtxfhDroxWj83WsZjxXX2N8SDtyk8jn0kDI4QOy5G4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lb/nuauV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7a16441so877193166b.2;
        Tue, 19 Aug 2025 11:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755628315; x=1756233115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nduGwRgCS4jl5SzExLMSPPD9EivCrI3lCOm2UzUncAk=;
        b=Lb/nuauVa3mB1hQcUs3mokVUSOFxD4IG2+OShAQfjuzSpboc8/kx5vrsJSTANt0/vt
         AkkeVaU7RjsI7DS3wqaUVaDQOJWuK+8bbGkvTlMeEk7w/Ya15bOEEhQA3fqc1JS2yXKp
         txbYifraNLsYW7CWo4884+fC3NW+b7RKjpDLOQoiRSQLxHsM6T4AFti8abk8XKit2O/H
         ksldjTMmFrYK1sQGPpDzAq6yQQ+bRhootlHuhczvO62y9N94Q4maxHiJDYg4bQmGjRPH
         7b6AV3CmvsXle2GDGIOOHWZGAaiKeqtfUN6FLF0JawGgm2Ao3xJk5/wJtscKKoC6I7PF
         rTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628315; x=1756233115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nduGwRgCS4jl5SzExLMSPPD9EivCrI3lCOm2UzUncAk=;
        b=vIpR3EF42eTfQV9uQ+dQuYp1KV4DazAqLsXKs2FvTg20MGHjnvjCRgsQ8T/YPKlM94
         U61xKCjemH6Koj70krrxNrEfTIAxLoIdKdjFXSBfAhE8oWqBxKUmNY1y8KrczBOTH+5A
         F4nWJqqwHAzlIH88Nwe6ybXci2txHAC6QihvAt0U2EripB/gLu2EzPTuD0Rs2V74lk27
         R3d7vJKLM24jFPu0E0P4cQr8glHRcx2CRzzTZaF/52G518RiYUWKE8BO7L4q0R5Eu+El
         9ryyrxd26udI4xjM1Yh6cUDV1L+Nl2+abAndL1FH414ak2aPwkvkXg1/FNagQDnqS7uK
         AVJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJGH9cbSwhPlxfznXJRuaRls/CJUgl7kYKWP4oFDGEAzkREeW06jR4Hoe0L/47AJjiKP/K8j5ForlUFh6nPQNS@vger.kernel.org, AJvYcCUy9b7pfZ/i+yuXse9SyY3J3rQchJMfXpARg37hSgdUxOGjb5FDXscImkXo+APB6QxFSFLcM1RhBPOeRX6jNHOq0/M=@vger.kernel.org, AJvYcCVJPG3PkzN5lv+299FoToobKy9WVmG9akr59YFi1lFPNRAByl6BgbxcRoCLhENMpC8FlhgtcC8R0jT0H6PE@vger.kernel.org, AJvYcCVneJrEjjglzE0ACDuBHfuhFxW+oK56Y4poVroPixkAYrkz9TxtzFHhximDa4m0FI4asi5aosAiWGrzHoEC@vger.kernel.org, AJvYcCX2YqUK8SHti24h1kl3lKkfzde38/37guEIv1V+T3byknebvzh9DOxi6vO9xr0HdzCnZluFfevK+/L7PQ==@vger.kernel.org, AJvYcCXK2L+MCTmoNsbJQfEq9zCS0eDX2lyc+aOqRdZeh4E2Kg27q8+SmqDu2GkoyUTwti+XSHxjv9s4DlVhxw==@vger.kernel.org, AJvYcCXUtG2v49MkuDuoCgeNGsZkwgxOLfipKfuX4vfk5W3YOWrJ2F+xIsdN0zZe5ZdEDKIwDTNCc7YSMJgEPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyCGJ6euZfLCWv/rf2g/u0Kn1TGdvoGKwfEBOyJz8bQwpU1JvE
	dONG3CmqeyojsRtJenM0gqZNkFoXpjUncknm/PWbScoKkHgd2c8YCzrb75nL5Mq2YHWTBdEEELO
	Cqp5da0pq1wWbkib2cQZeQ+tXYs7Yy4Q=
X-Gm-Gg: ASbGnctkfFLF5sQujSAdskvhoeXrB47+Gvf2ENbfPbgoi1ulaUQewBtUoJlL1+RgPDv
	5/ntQhQjPG+5shuTvqeFRd578gJvoNwp2V8TCvi9fPfUu1A2zTPeOLMMlFBOxmXPcXmGwSJxLTz
	qa0Pyck+DyX6saE/CQkeGuSvO3Ly3JXGw4uA2PMlLBSjWVRUCMybQF6p4GWH+9AvxmksE4hdMyK
	oqSsnY=
X-Google-Smtp-Source: AGHT+IF9qpemszLCjKdTIPsWz0t4GcsgIaQduXYK/rUO4127Ry+Cx5d3EXzVvEU87daLwDxw0y5nugBK0Rk2QA9qZjg=
X-Received: by 2002:a17:906:dc8d:b0:af9:1be8:c2aa with SMTP id
 a640c23a62f3a-afddd1e42e4mr344769166b.45.1755628314808; Tue, 19 Aug 2025
 11:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org> <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
In-Reply-To: <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 19 Aug 2025 21:31:17 +0300
X-Gm-Features: Ac12FXzsYRtjNObv84CHy6T-R0DRBoqbq7I0xmmsDobIVB43mAqIdnnlLv2k1FE
Message-ID: <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
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

On Tue, Aug 19, 2025 at 4:02=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Fri, Aug 15, 2025 at 11:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:

...

> >       devres: provide devm_kmemdup_const()
> >       pinctrl: ingenic: use struct pinfunction instead of struct functi=
on_desc
> >       pinctrl: airoha: replace struct function_desc with struct pinfunc=
tion
> >       pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
> >       pinctrl: mediatek: moore: replace struct function_desc with struc=
t pinfunction
> >       pinctrl: imx: don't access the pin function radix tree directly
> >       pinctrl: keembay: release allocated memory in detach path
> >       pinctrl: keembay: use a dedicated structure for the pinfunction d=
escription
> >       pinctrl: constify pinmux_generic_get_function()
> >       pinctrl: make struct pinfunction a pointer in struct function_des=
c
> >       pinctrl: qcom: use generic pin function helpers
> >       pinctrl: allow to mark pin functions as requestable GPIOs
>
> I applied these 12 patches as a starter so they can
> stabilize in linux-next.

Hmm... I'm still sure that we don't need to have a separate flags
field, but since I am on vacation and will be able to look at this
closer next week, I can't look closer to it.


--=20
With Best Regards,
Andy Shevchenko

