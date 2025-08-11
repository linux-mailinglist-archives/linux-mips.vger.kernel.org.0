Return-Path: <linux-mips+bounces-10178-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA7BB211D8
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 18:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FD40504CBF
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 16:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068792E5422;
	Mon, 11 Aug 2025 15:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DA8Pu47T"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9B52E03F3;
	Mon, 11 Aug 2025 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927969; cv=none; b=Mx6oTX4c/Y8aKC4U6Yl8BYHqXuEEZ1hhiBZ+2hTB1hWQ36t8oHaL1wSftgwXKRcEoMGGBSIitocX/nzyLNZJik4u6Y0XWYW3bTIoj8gGD/u8x6zNqQde+uvsyiJn1HSJqSahKNivVUSmgV3MFRVex1Y6Lokz9G5XlR4Oj13E4DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927969; c=relaxed/simple;
	bh=1ZjtfZm6gzHoBq7YwuEyZk4iDxQ70a64CmZy/OoszSI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iz82LT9lQRJ1/KmPtuxlCF3WbmYpUoWPNL9Mq9hbhSg1lHqqho4sF8KZYuY6uf13OoNxvRC7SF+q/taNFyHF/ebLEGiNUFHelb/omv0gRoW84vgTeHop9EAX+rZ4C07haY7iRrCTtB6iFQSOCHNHCMI9OCB1CQPudh0TKIaZeNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DA8Pu47T; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6180ce2197cso4039815a12.2;
        Mon, 11 Aug 2025 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927966; x=1755532766; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TvyCEuzC+XGQIfI6+Ojs1caIw/9527DVynHbE5eSZOc=;
        b=DA8Pu47TZp1mfxf5xiR57HrU9NJ2l6ZvTZRhJYCtYltZGEOTP38U9wrW0OlgUs+Rpq
         kk5Ww925qfMl0GIO3U9hJ21DIYLRjVBGh4CqPqkMF2Nzw6MHAKrH2JLuVUzfrnhDvQEx
         xNIIaIdvdw/zvYyTdsOjZ87QSB65n4D5DT6ICBOvX4upccNOqS/VJTu0t2/CkPnmZykE
         k29pmtYql/ksQgwobaVgHxkGOVZHPhuruEDDhpY+7gmz51ymp8MiOgwGruIRkgzAYb5I
         zTHgwM+xBJfmDyaUKTe0izXOzorRt2ms+/pvFi3cjQI0WYm1kgxR5itstZhDblgDLbYW
         9RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927966; x=1755532766;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvyCEuzC+XGQIfI6+Ojs1caIw/9527DVynHbE5eSZOc=;
        b=LOVb32/dt3un5L3JwHHpUz4ZoDC4djA268hr1m95CwWUKVsFN2myiDwTuxjAbRcgnL
         i5I95Q3fLUWTAlEa3hGHLhTD3tLeYSHuvtM113isO9h45RewrHYfFbZ1hQ7izjuapxF8
         7AcGtSF0cU5y1SKPUnyQSieNiechGcecvPF6Dg9YCNv7G5YJEK6mf5Vy68rs5auYTNDl
         BqDTa0BVSa83nfq4lPpH5Xs79yZhBD3BHQwnZoGBe4FI49JFumbIBvCtsWqZ7F+Oev38
         LzRaCpx+E+GNfYOL8FRbjen7yXAVfpk3byQpWlDHSRv2L4BJeKcOd68S3r63ZmdNYKFy
         5O6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTy+4m7IrLAWTE2NC5ZKVPtQByKA112hDceNvHiyiYbhf9+WuQIE6prERfZ0Y+Rx/YH4iMuDGcQidk+oAjBg==@vger.kernel.org, AJvYcCVB2ooAu4fjJ6Qh9QbBsHODyAgqrhZbhK5gdYf8BE0OLYFNF20MONNSOIlNmW68NSTIw7RTeLNsiqf2iA==@vger.kernel.org, AJvYcCVnVCuHzitoTjvzukscdfaGZB4ynOcY1qj1jJcnBVMsgKPgjpUAGxmNlVn9efSO1kimZzc/DpfO6Q==@vger.kernel.org, AJvYcCX+Ll157MnEOaNbDOD+jJlXDPqqUiMc3YhuPg51z2/pVDsaf37hi8fNMztYXD/R3WoPH0LTlgx2SxN6koT388gJ7es=@vger.kernel.org, AJvYcCXAKkxSvbfKxHFmwQV1XQJa/4mPAVEzp++2mEp1LruN26JQVm29FWxNYfyGbbyJ0XswfsXKoqpvoxuKUnkMrZjc0x4=@vger.kernel.org, AJvYcCXR/FfROnsmfyuDxH/apNX+dIoSFaGWGg3UpSRplHRGBxng3PhnlJ3hoVUpE4UZsCjjauke3nLrSzHg0n7g@vger.kernel.org
X-Gm-Message-State: AOJu0YzqS0rtMI4vd7u8hCQ5HCPhYttICG15x2PU9PmUYcg8fjFdGhhC
	PeEIT4mh2iV9AX9R04j55Vm/AWLX8Io7TbaK8OP8gIDXcCLa0HCWHk2h
X-Gm-Gg: ASbGncuwSQs9s2HSycWFgp3fepRPluHnf8a7i6f/Fc/J/t1QUgprCZpsrJez+xIPylf
	GFKvC9TTdXaY4Tqq6vly2l6wCUxidFHD7BsKSds/CJlNByxQY57hnRVmY/LnCKqj8WQ+Y0dIhR8
	zcFt5bHe3vGy1H48DWjmFmrJ80RcQHWqySkQXLvdxEK+otH9qZvu5QI6OETgla7UiPrCXQyjEix
	Kud19dXP9mKRH0j9YsFG73T6ZnkXqbgdMF51mtLUFcc2ClpDXx+56iJsbI7fP1Cp4NkhL2txZqo
	sPi59K0Kn9w96rqpW4COorKuyiTt3dp57QhxozeWecVurHjpyiNIcQRQtRhsxLu7BdX6FRYfwwW
	lh9Jb8Ab8lvZ1BkinJq/TyEJWFXtCsoUtOhtht18=
X-Google-Smtp-Source: AGHT+IHR6aQlSF/8bXSoH4TD6ap2xoMQpmbGXXfb1yr3omEUKfVx4ptOTSMnNibgVm0ppSBcD6Zkmg==
X-Received: by 2002:a05:6402:42c5:b0:618:4044:67a7 with SMTP id 4fb4d7f45d1cf-61840446cc7mr1952899a12.5.1754927966277;
        Mon, 11 Aug 2025 08:59:26 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618200a0159sm2966360a12.6.2025.08.11.08.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:59:25 -0700 (PDT)
Message-ID: <522ae36bf788df6d957bfee671857d6b2e1e8863.camel@gmail.com>
Subject: Re: [PATCH 001/114] clk: at91: peripheral: fix return value
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian
 Marussi	 <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil	 <paul@crapouillou.net>, Keguang Zhang
 <keguang.zhang@gmail.com>, Taichi Sugaya	 <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,  Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jacky Huang	
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Vladimir
 Zapolskiy	 <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan	 <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon	
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Orson Zhai	
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue	 <alexandre.torgue@foss.st.com>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,  Manivannan Sadhasivam	
 <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>,  Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa
 <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,  Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>,  Romain Perier <romain.perier@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement	
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner
 <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>,  Krzysztof
 Kozlowski	 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi	 <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Qin Jian	 <qinjian@cqplus1.com>, Viresh Kumar
 <vireshk@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Alex Helms	 <alexander.helms.jy@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>,  Liviu Dudau
 <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Nobuhiro
 Iwamatsu	 <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 11 Aug 2025 17:59:22 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-1-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-1-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-08-11 at 11:17 -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>=20
> determine_rate() is expected to return an error code, or 0 on success.
> clk_sam9x5_peripheral_determine_rate() has a branch that returns the
> parent rate on a certain case. This is the behavior of round_rate(),
> so let's go ahead and fix this by setting req->rate.
>=20
> Fixes: b4c115c76184f ("clk: at91: clk-peripheral: add support for changea=
ble parent rate")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/at91/clk-peripheral.c | 7 +++++--
> =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-per=
ipheral.c
> index c173a44c800aa8cc6970c266995f4a60b0a38554..629f050a855aaebfd1a03ff87=
c2b016cd2284a5a 100644
> --- a/drivers/clk/at91/clk-peripheral.c
> +++ b/drivers/clk/at91/clk-peripheral.c
> @@ -279,8 +279,11 @@ static int clk_sam9x5_peripheral_determine_rate(stru=
ct clk_hw *hw,
> =C2=A0	long best_diff =3D LONG_MIN;
> =C2=A0	u32 shift;
> =C2=A0
> -	if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max)
> -		return parent_rate;
> +	if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max) {
> +		req->rate =3D parent_rate;
> +
> +		return 0;
> +	}
> =C2=A0
> =C2=A0	/* Fist step: check the available dividers. */
> =C2=A0	for (shift =3D 0; shift <=3D PERIPHERAL_MAX_SHIFT; shift++) {

--=20
Alexander Sverdlin.

