Return-Path: <linux-mips+bounces-7063-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA4C9F4975
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 12:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE36B188CD16
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 11:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A31B1CD215;
	Tue, 17 Dec 2024 11:01:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161FD1DCB3F;
	Tue, 17 Dec 2024 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734433318; cv=none; b=WHRgqJ1tg8fsekoAAVVWgclAAEr64mrZpdOy2YtqxzefYJd8eyzOClJ/FzBRQwsziA+kRUPJvpPSe9Rnvbb0LwTBQlQUjORZKRtXExyF5G0m83HjfTC44PBMwTk4ymJCVi2z8p+mYos3lECk5G/UtdF3uvTqczJcCOjy9byjZMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734433318; c=relaxed/simple;
	bh=NrqjMZ+J+2WHaZCrdfnIKMWsZCnqh8duGYd7H0hLNEo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YAiUzT+SFmY3SDJT+UQ+wJfyvdS+jOLGq18rlCqbiOS+w6py3ZIUJbU/cx3aCPEzOnvJAP8pMD8J265+0WS0GqnItrT+3ZJt4RFv5wpaGydizARiZAqV4J1HYT7N/M6c969rfyBKUnaCCjtNdLinh3y2pa2g37mnIHovLm2Aag8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FFEA1063;
	Tue, 17 Dec 2024 03:02:23 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4E93F528;
	Tue, 17 Dec 2024 03:01:47 -0800 (PST)
Date: Tue, 17 Dec 2024 11:01:40 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Yiting Deng <yiting.deng@amlogic.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Support Opensource <support.opensource@diasemi.com>, Paul Cercueil
 <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Eddie Huang
 <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Vincent
 Shih <vincent.sunplus@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michal
 Simek <michal.simek@amd.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] rtc: use boolean values with device_init_wakeup()
Message-ID: <20241217110140.22c92138@donnerap.manchester.arm.com>
In-Reply-To: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
References: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Dec 2024 08:13:26 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> device_init_wakeup() second argument is a bool type. Use proper boolean
> values when calling it to match the type and to produce unambiguous code
> which is easier to understand.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Verified via regexps that it's indeed this pattern: 1 => true, 0 => false.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> Created with a coccinelle script. I opted for a single patch because the change
> is rather trivial. I can break out per driver if this is desired. If you
> like the change at all, that is.
> 
>  drivers/rtc/rtc-88pm80x.c       | 2 +-
>  drivers/rtc/rtc-88pm860x.c      | 2 +-
>  drivers/rtc/rtc-amlogic-a4.c    | 6 +++---
>  drivers/rtc/rtc-armada38x.c     | 2 +-
>  drivers/rtc/rtc-as3722.c        | 2 +-
>  drivers/rtc/rtc-at91rm9200.c    | 2 +-
>  drivers/rtc/rtc-at91sam9.c      | 2 +-
>  drivers/rtc/rtc-cadence.c       | 2 +-
>  drivers/rtc/rtc-cmos.c          | 2 +-
>  drivers/rtc/rtc-cpcap.c         | 2 +-
>  drivers/rtc/rtc-cros-ec.c       | 2 +-
>  drivers/rtc/rtc-da9055.c        | 2 +-
>  drivers/rtc/rtc-ds3232.c        | 2 +-
>  drivers/rtc/rtc-isl1208.c       | 2 +-
>  drivers/rtc/rtc-jz4740.c        | 2 +-
>  drivers/rtc/rtc-loongson.c      | 4 ++--
>  drivers/rtc/rtc-lp8788.c        | 2 +-
>  drivers/rtc/rtc-lpc32xx.c       | 2 +-
>  drivers/rtc/rtc-max77686.c      | 2 +-
>  drivers/rtc/rtc-max8925.c       | 2 +-
>  drivers/rtc/rtc-max8997.c       | 2 +-
>  drivers/rtc/rtc-meson-vrtc.c    | 2 +-
>  drivers/rtc/rtc-mpc5121.c       | 2 +-
>  drivers/rtc/rtc-mt6397.c        | 2 +-
>  drivers/rtc/rtc-mv.c            | 4 ++--
>  drivers/rtc/rtc-mxc.c           | 2 +-
>  drivers/rtc/rtc-mxc_v2.c        | 2 +-
>  drivers/rtc/rtc-omap.c          | 2 +-
>  drivers/rtc/rtc-palmas.c        | 2 +-
>  drivers/rtc/rtc-pic32.c         | 2 +-
>  drivers/rtc/rtc-pm8xxx.c        | 2 +-
>  drivers/rtc/rtc-pxa.c           | 2 +-
>  drivers/rtc/rtc-rc5t583.c       | 2 +-
>  drivers/rtc/rtc-rc5t619.c       | 2 +-
>  drivers/rtc/rtc-renesas-rtca3.c | 2 +-
>  drivers/rtc/rtc-rk808.c         | 2 +-
>  drivers/rtc/rtc-s3c.c           | 2 +-
>  drivers/rtc/rtc-s5m.c           | 2 +-
>  drivers/rtc/rtc-sa1100.c        | 2 +-
>  drivers/rtc/rtc-sc27xx.c        | 4 ++--
>  drivers/rtc/rtc-sh.c            | 2 +-
>  drivers/rtc/rtc-spear.c         | 4 ++--
>  drivers/rtc/rtc-sun6i.c         | 2 +-
>  drivers/rtc/rtc-sunplus.c       | 4 ++--
>  drivers/rtc/rtc-tegra.c         | 2 +-
>  drivers/rtc/rtc-test.c          | 2 +-
>  drivers/rtc/rtc-tps6586x.c      | 2 +-
>  drivers/rtc/rtc-tps65910.c      | 2 +-
>  drivers/rtc/rtc-twl.c           | 2 +-
>  drivers/rtc/rtc-wm831x.c        | 2 +-
>  drivers/rtc/rtc-wm8350.c        | 2 +-
>  drivers/rtc/rtc-xgene.c         | 4 ++--
>  drivers/rtc/rtc-zynqmp.c        | 4 ++--
>  53 files changed, 62 insertions(+), 62 deletions(-)
> 

