Return-Path: <linux-mips+bounces-10360-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B866CB2A14C
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 14:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0F7C3BB447
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 12:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E8231A04E;
	Mon, 18 Aug 2025 12:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="1hz90Qtb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887AB326D79;
	Mon, 18 Aug 2025 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519263; cv=none; b=eKrD62oAj57FaNrUMEa3BSR40CreQhWzp8vs1wQgGBAEcYvC3bThmKq7mCQD5AmIlTbbRqy4rL6Sf6D2EN1bXL8gWgh7L3KwpcSScIJ/FT39XnbEMcjo/ws0R3sGEOaTjlz/Jt3l1vXciVH+dz8m3fZOQyYJ0lfOuaZkzvD9lY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519263; c=relaxed/simple;
	bh=mD40O8ELAQZNuLx/Q1w5PsWpc3asVslfYsz2e2ICqJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nCPQj+U30wLaD4VFkdlTd4ywAN+LzTPUnd2ZOTMEHOfvwbvoextdnP2oXYCpqjJudiR2YkODpMALuFVo//Q7/yiKfnRKOOye3jvqT0BGErAAGQNrXYy+rWikGupe/640Vtu6lYVTDhqBCi0Bgyzk9d8u8azkAmXcSGOTcpJGtmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=1hz90Qtb; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IBp5bh013848;
	Mon, 18 Aug 2025 14:13:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Di2sJMGDTfc2gFtc34a6qY4519gtg5sAUPBz5vhubF0=; b=1hz90Qtb072d/lZA
	y9NnyHsNccVQIbaFxcx7E7yMN9BVd6YWYCKylGEN0e+OTGXy865/O0Gbf3dEl9Z1
	+pyjnZtqZmY2hzn9RxRMNrPWlLtWLnBzv9SpI7iBuZ/YBnTIyzd+BxQeYYhkAnBf
	lX0UbccWrDFNhEjef3I/A05Gy8if96eAhsYMdQYBIYX+g0MMFq0OgbfziCesFdFl
	nXQ1MgcAlJriBhvCSa3kyLIDJFZiBSDm3BbHyZUB9/jrK0ro6YbspzGy9IWCI7bL
	FHgHd+KEt/UAXCrUnRbJH4HCqt+6p5voVSZk9OWqBUOTtwg3MAsd6wUIGVvnupeu
	MGwV9Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48k4xmm2ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 14:13:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 53C774004D;
	Mon, 18 Aug 2025 14:11:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5BF7971CEFF;
	Mon, 18 Aug 2025 14:09:58 +0200 (CEST)
Received: from [10.48.87.121] (10.48.87.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 14:09:53 +0200
Message-ID: <836b8be6-ec6a-413d-8657-ee02025ebc24@foss.st.com>
Date: Mon, 18 Aug 2025 14:09:52 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 059/114] clk: stm32: stm32mp1: convert from round_rate()
 to determine_rate()
To: <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        "Cristian Marussi" <cristian.marussi@arm.com>,
        Chen Wang
	<unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Nicolas
 Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Paul Cercueil <paul@crapouillou.net>,
        Keguang Zhang
	<keguang.zhang@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        "Takao Orito" <orito.takao@socionext.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Huang
	<ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        "Vladimir
 Zapolskiy" <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Samuel Holland
	<samuel.holland@sifive.com>,
        Yixun Lan <dlan@gentoo.org>,
        Steen Hegelund
	<Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        <UNGLinuxDriver@microchip.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        "Maxime
 Ripard" <mripard@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?=
	<afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, Sven Peter
	<sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig
	<alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Eugeniy Paltsev
	<Eugeniy.Paltsev@synopsys.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner
	<heiko@sntech.de>,
        Andrea della Porta <andrea.porta@suse.com>,
        "Krzysztof
 Kozlowski" <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
        Viresh Kumar <vireshk@kernel.org>,
        "Ulf
 Hansson" <ulf.hansson@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>,
        Nobuhiro Iwamatsu
	<nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <sophgo@lists.linux.dev>, <linux-mips@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
        <spacemit@lists.linux.dev>, <linux-stm32@st-md-mailman.stormreply.com>,
        <patches@opensource.cirrus.com>, <linux-actions@lists.infradead.org>,
        <asahi@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <soc@lists.linux.dev>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-59-b3bf97b038dc@redhat.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-59-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01


On 8/11/25 17:18, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

> ---
>   drivers/clk/stm32/clk-stm32mp1.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
> index b8b45ed22f981df580506f3d4ca801ba11d2bab2..2d9ccd96ec98c05eb836d632bfd9903de60ba1bb 100644
> --- a/drivers/clk/stm32/clk-stm32mp1.c
> +++ b/drivers/clk/stm32/clk-stm32mp1.c
> @@ -970,12 +970,15 @@ static unsigned long __bestmult(struct clk_hw *hw, unsigned long rate,
>   	return mult;
>   }
>   
> -static long timer_ker_round_rate(struct clk_hw *hw, unsigned long rate,
> -				 unsigned long *parent_rate)
> +static int timer_ker_determine_rate(struct clk_hw *hw,
> +				    struct clk_rate_request *req)
>   {
> -	unsigned long factor = __bestmult(hw, rate, *parent_rate);
> +	unsigned long factor = __bestmult(hw, req->rate,
> +					  req->best_parent_rate);
>   
> -	return *parent_rate * factor;
> +	req->rate = req->best_parent_rate * factor;
> +
> +	return 0;
>   }
>   
>   static int timer_ker_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -1026,7 +1029,7 @@ static unsigned long timer_ker_recalc_rate(struct clk_hw *hw,
>   
>   static const struct clk_ops timer_ker_ops = {
>   	.recalc_rate	= timer_ker_recalc_rate,
> -	.round_rate	= timer_ker_round_rate,
> +	.determine_rate = timer_ker_determine_rate,
>   	.set_rate	= timer_ker_set_rate,
>   
>   };
>

