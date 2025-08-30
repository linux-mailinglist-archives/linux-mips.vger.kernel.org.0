Return-Path: <linux-mips+bounces-10856-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F86B3C902
	for <lists+linux-mips@lfdr.de>; Sat, 30 Aug 2025 10:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A6B67C5D19
	for <lists+linux-mips@lfdr.de>; Sat, 30 Aug 2025 08:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8962848BF;
	Sat, 30 Aug 2025 08:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWCttz1i"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA02F21B185;
	Sat, 30 Aug 2025 08:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756541117; cv=none; b=beMi2nv1wxvcZ/XkMcgbSqa1YM7ExmFzUlpbBPh4cB8dIRDk+ICDW2jMQUueJBXOjwH0F5B8W7kwXpROJCqpXINA38FySSt5zYkhWUAth7pjNV5kQtX7rRo3nPMSvt3t5+h+24A41n7f19SxCklDgGSicObV2UihcPCGPqE7iUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756541117; c=relaxed/simple;
	bh=E+3FytFWpN13QNaZlIP9PT23YkoDdof1b13hg+sNa10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXg9bYg2G4O+N7Si7/3SCG4M2xFcY0/qDX/Goahhb0fG9vvJkl+bFoqYZ7AkGnG3QxWiYxj6LyavefyNbZ96W+x+WOv/+dMXHmoVVIAhR/arJSZ5kUw6jqB4yV9nljm85LRb9yWt6sFiyrvcWgC1U3amD2ovTl8HwzboZixd79I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWCttz1i; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afeceee8bb1so421738966b.3;
        Sat, 30 Aug 2025 01:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756541114; x=1757145914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+3FytFWpN13QNaZlIP9PT23YkoDdof1b13hg+sNa10=;
        b=OWCttz1idIoD0VnsSHFGIawRXJFYgGlr1IsFW5L65nEQ2+rYy0cZ31g5jNyBrLABOo
         5hbz+t8YtsXhYYiuNy1ZlRlFXMqfzEBx6XgAPA8pjWkUM72j2g6BVF+160+JVuC6vhmN
         fpnRCewYZujadFszMCKLa382P8UIVOIOsUKAJeqTpW4f9gMw54tEIpem1kc/DIzQnMyv
         CWGdfilRifCnzpNS3iJiATZtxTJsYoJBuaptC328zBxTQ3EZBQqEQUDGZeeSyXh8Oz3d
         bf7ONrj/gb2xfcoekvf2DiOUO/bX13LtqJL5TW55DUsnZ2brvp1pYbverT/kaj/cGKdt
         m5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756541114; x=1757145914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+3FytFWpN13QNaZlIP9PT23YkoDdof1b13hg+sNa10=;
        b=VcAhQPrfOLv8LXg3m0EZQWxedyNB0S0CjLiZQqK1Mz+ACiNYyaVURxvW6Yzc2auDaD
         FCsVC89+3519zmw5uEb8jhfKipgWld2FfxisQz+7mdu3Ee95vitwBiZxaYPTKHIZdGdD
         UEDK+9alQifsAdxc+tPMcE2hxmceJFWqWDokhSykzwxLm7SmaIA0w9Xm2LTwd24hr1tE
         9uBGjD5i+gVWl2klDIcVATWXpBMp9MKNbAVxKKd7dzEtc66elTG0VvhKsLBpxyL6icpx
         BP02yivy/uiksDHEocZ2OhwxAI95F9kPhALBtK9ZNC3bb3jxVTczSf9XpGjlEJo87NtB
         Pjbg==
X-Forwarded-Encrypted: i=1; AJvYcCU+wP2t9w4C9MDx8bCjeG9XxWAAo/8b6AVfUxeOXlkK7ppQO+kDDwEycAW5SolbktEhVEoRG2UysjC0fUbB@vger.kernel.org, AJvYcCUXI+sPMYtg485TDQanhuYWVwMyKVr8MF4t+LSN4ED5s2EcAjaqC5OaHGHQTTQ8WMRRuFjWk82tuCoboykf+wyk@vger.kernel.org, AJvYcCUmmXCsQ+TSou4R/2bwtDRhDPGoD6wZ+FG3ntD3IZYu1PcvIa17n2vUR/tY4tptv5gfvElGvB2Jlqwilw==@vger.kernel.org, AJvYcCVjZO+WVMqoeuVyXw4GRTqCB/3rauHwTuW0mr10JhvyC7ViLrxRfq0k+FTgNAxRhkTx2rN8cakc53wcFA==@vger.kernel.org, AJvYcCWCoy0HamBYezqdodix7IQo5nOBMmfkbfGTznwitFUoJIKnkZ5gWZGa0dVW0I6+lIFIKbcFsbzG1ed2JExD1J6+A00=@vger.kernel.org, AJvYcCXi1qMLwiJ9uzcUURLMIvHXQndaUtuQe+Euwr0uzQLKyHGoDpj4kMDq/n7Jyk6xFxIYE2Uh5ARnw/RIEA==@vger.kernel.org, AJvYcCXvaxj+NXAiZMudh1Od+pz4mgmWAdl28dX6/IoZucd7DoFqzy8JAzHjHEg5lHBHXu/H+kNe7946F2M2/lMY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3A7v62H8aMswOsoCZQXYkweYah+OfSh/udtmcXJvQWHAkk0GY
	ZeafaQKNicV1nil93d8BmEEgAQYixGYwNV7rYiiA1tUUPzdFK5bJTLM1gmXd61Z1rYYDFnC2Fl5
	RI9g79Ny5xfM4jjmSUETESjUvdVk4UgU=
X-Gm-Gg: ASbGncubCSj6ETjgY1Zef7OBfHA0X2Mg3K8kCNROOFhuySp7lY2p9LHAzsc+VvsedaN
	IA/Z/m/nlFHyFSZfwDoeBLO8UQYDkVUxvSAgPHlWIFQkn5YhfXcCnR+SjKk39O/p75A1UrLvoau
	Z3XBA93wLiWDbh005j47p6l85RR3bBsIXbypWOJ4pyA0qE4KqmOIGhovj3MHZx5CsKk0K+Inpv/
	caekSU=
X-Google-Smtp-Source: AGHT+IGzflFMFHhQCk11BPmcxfewbn8R9ACv8Yo0SSn9TtnTW1JgawjqxVwsmdBQr0ZCbodUJMXZIPy39a0Dt37TD0k=
X-Received: by 2002:a17:907:7244:b0:af9:6e2b:f30c with SMTP id
 a640c23a62f3a-b01d972f530mr112838566b.34.1756541113922; Sat, 30 Aug 2025
 01:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org> <20250828-pinctrl-gpio-pinfuncs-v6-4-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-4-c9abb6bdb689@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 Aug 2025 11:04:37 +0300
X-Gm-Features: Ac12FXzW7SA_uUOkcPEFLfZfGLYsYzzZVOKlWfYhU6akvDLYnA0W6YgK2rZDIDs
Message-ID: <CAHp75Vci1uAcA9ahofn95hxufa+Yi1Fjt4w74HSObQq-Rz5zMQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 7:00=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a dedicated initializer macro for defining pin functions for
> mediatek drivers so use it here.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

