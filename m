Return-Path: <linux-mips+bounces-2364-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D2C88718D
	for <lists+linux-mips@lfdr.de>; Fri, 22 Mar 2024 18:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0810D1F23AD7
	for <lists+linux-mips@lfdr.de>; Fri, 22 Mar 2024 17:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D434D5FBA8;
	Fri, 22 Mar 2024 17:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MwWJqz4B"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7F45FDAF
	for <linux-mips@vger.kernel.org>; Fri, 22 Mar 2024 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711127115; cv=none; b=obpudm63cPYS31ttsoLXOFVV0Fg3FYegBPHdCBc9lGS/u/pE0udiPswwtEY9+xHsu/UiroT1suZvuIurWt4iVX+V6yDFsS6AkMFnkIMdXToElEyDqExhdPd9z0mhoHw6ciDLiD/wCJt1wUJDxxYAFlklLNWd9rOBoqHd6LPtCQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711127115; c=relaxed/simple;
	bh=v4N44CMN5oCIe/XAnwlaVauiT1tmi9O/mBbrMgK8XAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=H0kMiW3jlGND65EGSfLk2GRLSxFRYesds6rEp4fCNnBuSNiWv/pKywYvuUxZZ7KMEQrwt164mqDSRm6vJiXifPL5/3DF+fUmePoPgcfs/eDIXDn1V/zEysyIZ2FHjjnPzA2hVgDgr83SpMgIgds5oSZEbW2Egvz1TvCrOjT+9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MwWJqz4B; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-431347c6c99so11641cf.0
        for <linux-mips@vger.kernel.org>; Fri, 22 Mar 2024 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711127111; x=1711731911; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4N44CMN5oCIe/XAnwlaVauiT1tmi9O/mBbrMgK8XAg=;
        b=MwWJqz4BotKMnVS1L2Flab9VgiKs3qFjXvCzXfivKQ03BIfYf1wbZf3zTzuWRG2Fow
         f3anCmp7SRLqpLp4NH5fokHg79CnuUBfNvLUCXqPZTuFsfB1UN04JrjSoUoYHqk1wMBX
         DJBrMEmUvRD4dQAtXQcCa6eClnFiixPhh1SG4p3mdkh8/aoKriiPc8Yb7rULQuHwQpls
         Z0rEX+UqK//MahHeGBzplcEODjUUPB6bClKRW11eFABUI1zyORFOdcFGGTY1FLdyV1V9
         XiecW1rC2+TWUAkdvwPq+XzUHKHP+AWaMYmGT/1qv4YIv3x7gWdzxbV+aedX4YpWgW8w
         w8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711127111; x=1711731911;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4N44CMN5oCIe/XAnwlaVauiT1tmi9O/mBbrMgK8XAg=;
        b=lEmBqtdyJzv66g9RbubTPDa/NNCItgyUgXxymoIIAHHLlo+asbx1Nnm07v+277gKRw
         7IjZnzN9cGN/o1mA0aT06OCpZJkipMjWm1UlgvApjtGFV/sAofWn7na4rZ3ewvId4a7h
         ukWmuXtHQApJ7zdGqPaR0u9sn4NSI/T1UWZ4wzG792KVmGOCt8qg0BAt9HX/gG82yZJw
         RhkZLa4UU2WE6OE63OOUOsiL4frQ9sDEsFNr344dwHLgqRbCZG/iAVU7qc7Mw1ScuBeT
         C5zZB/mUBjUMJAFouwXsgcuc1/0ROFjc0dNcXLJqTlphU/SSPcJZ2kbz6w8zzlQY2Ixz
         o/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVHtUvtMNgc2KFOQoBJi6WPnm0boc3cORH56kSDHFQFNx7ve6PwyLTRiAkIP8cxiokj1WNYQSxH8/keHah4qvncDFrQmQgN1u4dyg==
X-Gm-Message-State: AOJu0YzU29Q/ORDDtCk4xVuk4JIl0XyeiXi2BUrBPmuQVScd9/2YHnP9
	pGtNVVDvdI9/PF1a6xKfnOc+o9akI2upkn3HSWebH8CGBSDosGmwKD2l0JW4t1dh+Hv7q/byOsd
	3QHnc3mj8oSv57Mws7DHC56rAWo+Wvu4qAEwd
X-Google-Smtp-Source: AGHT+IEMXRAiaxzgPudCV28IsnfTo93KghidIO1NcmkDbiSOepYGnBba5CPcjtadamz0IWr8XSq/M+NvnzVf5opCbEA=
X-Received: by 2002:a05:622a:2486:b0:431:3c48:a65b with SMTP id
 cn6-20020a05622a248600b004313c48a65bmr12492qtb.11.1711127111085; Fri, 22 Mar
 2024 10:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com> <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>
 <Zf22G4jC2gIlzhi_@shikoro>
In-Reply-To: <Zf22G4jC2gIlzhi_@shikoro>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 22 Mar 2024 10:05:00 -0700
Message-ID: <CABXOdTc14kfPpkF96KG-oeLRTLvjxAD_gtOO2TQFLnHMLNoU_Q@mail.gmail.com>
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, linux-i2c@vger.kernel.org, 
	Elie Morisse <syniurge@gmail.com>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Ajay Gupta <ajayg@nvidia.com>, 
	Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, Robert Richter <rric@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Vladimir Zapolskiy <vz@mleia.com>, Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Conghui Chen <conghui.chen@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	Ryan Wanner <Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 9:47=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> # for at91
> > Probably file names themselves will need some care, in a second time.
>
> Totally true. I am aware of that. But one step after the other...
>

Kind of odd though to change function names but not parameter names of
those very same functions.

Guenter

