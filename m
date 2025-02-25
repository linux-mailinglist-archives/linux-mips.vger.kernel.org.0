Return-Path: <linux-mips+bounces-7952-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FE4A445B3
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 17:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF2823AE8EA
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 16:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAB418C903;
	Tue, 25 Feb 2025 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BdgKMrn+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DEA1547C8
	for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500000; cv=none; b=WrAnOxnC+HBfp6UHzwmw9JB0NskCoDZiKRBbeFhkHsPojZtipvSiZc/o8Qu/Cw0Avx5nOXpsOjxErOpptAQjynOq3PN8wXif3KslnlCh04XLC+uqLHKtMdO5YWFJhaAR23od4TY6OzMUybcaqaLFg7KxoufrH19tqnNGP062yd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500000; c=relaxed/simple;
	bh=rCByvJMOjUxh8ZzB5E/B1+AmONBCyWA+/sUB1yHUqbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYkcj5nODAIj83dtPrF0rTFci3bGjBgzxq12dWVZzgenN4zXiwSXeGmLHEC1obVP4SKDGyZ4djSDOCQvARSqLGYfRLQ4jgsdNFaqkLeiPvgaX2uiNuSu7p1ZML9jARNdOr5xYSyXKi+5+3/OU6JUNCuBVnkZu11XhPWYpZ6S2pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BdgKMrn+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7430e27b2so907664766b.3
        for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 08:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740499997; x=1741104797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=BdgKMrn+ARwuwNYJ1W9bKLJbqTR7BClwo735B1cXkJVB75ZGnscGi4JUseHyICoxIC
         pA09sXJqpFfdKvjdhuP0dcbriipFiJyofGrKV6TcDVDDgRZmg8+CJJpNG2p53jJf+U1h
         FE6iU51alcAuDwcVqdicpANJKsBcWOOBgJofs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499997; x=1741104797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=bR0cqPi7LYqVkDLtIVDc+PIfVSAv9i7d5dQ/swsttKzuKijAECXigztHie0Wqk/zXt
         XW6omkMpEzE4XIkBlyj0NKMOkeah3BVZpVHy0eJ8yKCk/SQjUvqsGYwfE2H3BzodFX20
         6esaQEH+zZrWyUVXB0sVSIHomRVLfPKrMU9Ztr8F6wtHQzYAHMQNaMbGb1cbRq3SUlzo
         5dIO+JtBRXu1euhw8sKglEqvyG7VldJBEf5RPDGUIZ/YeCcs5R92mN15UOr6Qx+J+KWk
         DVweanArDRUpCxPp0mMzhNpdRoJzzD3iGgaNoYf0F3snhjKqSQfMAMdOPoB4tX/77jQo
         y7NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOWKQrKB8bqvmC9cepJnBBfLTaUAvLksDEgxh9bchpLUoz3u8dZ86iqXn1k419mkB1BiUi5nd1qSFw@vger.kernel.org
X-Gm-Message-State: AOJu0YzKU/Knwoz1EQ4EVqtMNWegAIhcmkh8Pzs6Ar8LkuYABmO9n1YR
	JyKxp9J/I+DzAWA+Sy6z5LASGV5muchofFQuXtUpoSNcXOpnhPlM+eENRkxrJjaXCtUQoJBtflQ
	h20k0
X-Gm-Gg: ASbGncsS1/A1qcAHWPVSIBq1m6vqh6ogtfMVawuvaclEsa8jhrxdQLf4Jb5nJcBYkh9
	RBbZ7Meto4+MZP4cm9wTMGW1Bom8fKnXOiUuA/nh+aBRdwGcsZOkuX3OJoBu2zf55cVEnBvttZf
	c8KWTXDJS9I7YK9cE6cb8tyQDqSq6/CQO0fcaRX2y1sf3JinDmWzG8klX5j++LsPEDOFI/HALz/
	nXMGY0r0XWtKdCHJ04uz3RuOns4S6RbIth/T6A/4z5AJx2lQ4XLKu+zCZbRtyo83WUJ4jum+vWP
	Wv5Sewyu8/CqSqKW/Ynyp1aDjisPlidO6plrsYoCY73iDvfIlExmwYZfbsAeXvCbWA==
X-Google-Smtp-Source: AGHT+IEEtF23PAmhVFlJDpWvLpqUyhwcMV90X46n2Edg8JlOp4LVcJonb9Sel7NxmF4W5+Ql6i6Jhg==
X-Received: by 2002:a17:906:1da2:b0:abb:b24d:c631 with SMTP id a640c23a62f3a-abc0db50b2dmr1564948666b.34.1740499997061;
        Tue, 25 Feb 2025 08:13:17 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2010ffbsm164294366b.106.2025.02.25.08.13.16
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 08:13:16 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaecf50578eso1136147766b.2
        for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 08:13:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIFCrkyEquYbbmVnJGo1rnrH8fF671xCq0K4to3aqW5Y6E3HCwnxJNB2sy9Umx327Da9W5mvKT3Ej3@vger.kernel.org
X-Received: by 2002:a05:6512:1241:b0:547:6723:93b6 with SMTP id
 2adb3069b0e04-5483909d1d1mr6678553e87.0.1740499509419; Tue, 25 Feb 2025
 08:05:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com> <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Feb 2025 08:04:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
X-Gm-Features: AWEUYZm3vRrajChqqVao9eJTA9wadMF2aiVVZGdKkNeW96YTlQauMsPFnVVKvC0
Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++------------------------=
------
>  1 file changed, 7 insertions(+), 42 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll snooze this for a bunch of weeks and check back to see if this
can be landed in drm-misc-next every once in a while. If you notice
that drm-misc-next has the necessary patches before I do then feel
free to poke me and I'll commit it.

-Doug

