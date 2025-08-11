Return-Path: <linux-mips+bounces-10173-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7EAB210C0
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 18:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7C018A1C35
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 15:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ACE2E973E;
	Mon, 11 Aug 2025 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEj+bPbT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3AB2E973B;
	Mon, 11 Aug 2025 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754926731; cv=none; b=bsJgvJ27BhOc6dku0z1bbRrmWwuRdW/plStloYv1cEafh2gJ0ei4kPhnY6mgOP8DKw8ytbeGXlT5T7/9yiXXr5IaD8pTo1lZFc5+866+suvWHo0cnKbAW/F/q6LWLFciWveWFhxkYkV1Xr83owPKNY4SuHsFieOfas8ID8ZLp1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754926731; c=relaxed/simple;
	bh=FPbaAa28Nh3lMI3CatP7a4lPc6OfLL2O6SW4T1FANsI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i9aedr5cFSUp3S2qZotpU2Nzqg5rzojefUwSNmXNrZPaN0lTnyEwcT3KjGylwGYfR2J+CH7Yb898As37bJK41BfUHIB6KlxhjOjfRmpT9zDsbu+0en8xXt/WjiUqzx76+FPs4eCDJOnJX+KrY0NcJLGMHvqVm7KXeZD1rUvXsz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEj+bPbT; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af8fd1b80e5so790058466b.2;
        Mon, 11 Aug 2025 08:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754926728; x=1755531528; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qD3PnaCJHe7CAGf98jDIpzJE6HGS8eh/nvSCm5VXAxc=;
        b=XEj+bPbTLybxmPdSuOG26St4lpw4Y3/ASUiBKPZQhvDZqgfO3oMql/EBYdZdTDmEjK
         J7V17/QfKBE5VmnjELOVEI9hEyesgH4GVs+49w3WiZQuBl+rxd2QVF77plfr3U9RxEgc
         ueFfPe1OmjO8yETU+7oXAzFDC/JU6dCL7pitfeDrlNiUhRMAzyE3LCxy0C9LCqlKz+1M
         6x4MPQ/Jj2iozPBgZok1IyBmfynHYqSX/OD5IMx2kn6yt3pq+e5mvcIgfwtTC3VmOLk8
         l6KLWB9dLPZ9K0/3T+3kZ1cnyM6q7a7z0x42CJeAJQRK9fo9/ir9KeBmcPNJH8yTZyWF
         pJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926728; x=1755531528;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qD3PnaCJHe7CAGf98jDIpzJE6HGS8eh/nvSCm5VXAxc=;
        b=VLcTyrB13YjrLb6hPhwHlj0yovoYmIUjYBN7O0190bh+t+9LWIVGhbm5T7Z2nIQ/Q0
         GjV549+5yitoGmWDBK+9WFzILkEHXHBXvdg8CTm4jbliCKkoeaE1XMt/skeeOsXQAjmv
         L7zEv/Zg1VcBjurFcG1LIlExVRqtnGZrmEquqirI6Lb+mtHju84qAnc/Hj0UDStOgv/0
         3MAzWLF5GvTz+PN+xSdFB9cdMqATXlBKuoC2Us1EFq+dGdRb3zid132b1iDkf3PmqpRE
         FfjXHcZ1bc339UIw29xUWFaB2kCIFyuQ8CJKD9cLQ5HOVCr+QAQZItAQDNm/WBJ1h0WJ
         d/Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUol9W2JDAx90jFu6jU+1dhZnAbebupytFXIgK3FT5ipU6IP94ZtXrMJcEhl7YQme9Lh8jNdacpyg1DVU0o@vger.kernel.org, AJvYcCVyOQFx/FkblYg8BU9NSWTmOrfMX2kKaqyut9uG+OxPJ0fWRPmjliXYXAp2XocXlcsjpA4I+HHKad6eVhbAcE+SU1g=@vger.kernel.org, AJvYcCWHoH97vjWhHrWctXrKKBOQVwO175eugAbEZN1R1KfkvsEEeqquckOyJvY1pXrPduxPAvxWXBugkw==@vger.kernel.org, AJvYcCXASBXxDNlqjDG/DdBLf+5HVzn6JSq/7t+xj4QQgi6ePHsY6/px/PpqIJtNUdcGA0Q7WW8efes7MMXCUaFK4w==@vger.kernel.org, AJvYcCXrQSHhmQgOivJbbZ0vKVYbqdwyzpRVJeoKftlS461WS6hDe00ngNNGpBX3W1tUWeK0F2215i+fo34enQ==@vger.kernel.org, AJvYcCXsmt4KAGJMnsCB1nneGLtDaO7Tw7IaqWj1xvAZOJdnz3jJ0wdm7RNo38BruUiB8sJDCyJvlPBkiOPVO9OcfME5+5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl20mentCq/qxBIH1qEh+nw71XvGpew2bXFdoMSKoIW2JGbMr5
	2Bd5HO2xIq71XCbzMEkHeiRGaRCXKzN3xt7jr7EyGwiGogW4avoCdIU2
X-Gm-Gg: ASbGncsNu8h3JbA278YGz/zsLxtUuKRA7v+F4lm0ScG7gMl+d3+uD3iblITrlCiOIH6
	5qayIwfVpZTPEr1E99QnQYxjClCcV9fHzmQK1+b/h8gMtqiztDvCASX76QlK0SAlFKZh9OI6c4y
	qdCM9EpZlEZTHK6F1GpMf2MhbcGX23mg8TN2WGaJSt145HZR9Q/DwEp9oPXgojFTyA+FgAPEKjA
	A/QEeA0MuEV2YEZB4vnIOqXNz3GcHK77ZxMNhU0C5Gq4HtQckHe2eldQo0IjTd84wZaunMBZeMD
	eiG/w58fHyqfgsnaOom/7gDEd9x9eri0rjjz0mdGe94BlOpbrEEwlnM0WE0MI36o8v5IO8F3STy
	OBP+qu3lRO0B99tzyJxxrOCvESZ1YaVy4VXI8NA4=
X-Google-Smtp-Source: AGHT+IEwAIMMmXMguO85CuFME8BHuByHpdLqU2yJrGASpVc+AuhN3x1kaE4ymuvmmSr6MxnWK7LVvA==
X-Received: by 2002:a17:906:b07:b0:afa:1453:6632 with SMTP id a640c23a62f3a-afa14536b03mr150166866b.50.1754926727869;
        Mon, 11 Aug 2025 08:38:47 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c157sm2047222366b.100.2025.08.11.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:38:47 -0700 (PDT)
Message-ID: <09635747dcd29f45a90dd33a74a9902d7bfa9649.camel@gmail.com>
Subject: Re: [PATCH 112/114] clk: scmi: remove round_rate() in favor of
 determine_rate()
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
Date: Mon, 11 Aug 2025 17:38:43 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
References: 
	<20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-08-11 at 11:19 -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>=20
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/clk-scmi.c | 30 ------------------------------
> =C2=A01 file changed, 30 deletions(-)
>=20
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index d2408403283fc72f0cf902e65f4c08bcbc7b4b0b..6c6ddb92e7cf6a0cfac2c7e19=
c0f15f777bb8c51 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -54,35 +54,6 @@ static unsigned long scmi_clk_recalc_rate(struct clk_h=
w *hw,
> =C2=A0	return rate;
> =C2=A0}
> =C2=A0
> -static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> -				unsigned long *parent_rate)
> -{
> -	u64 fmin, fmax, ftmp;
> -	struct scmi_clk *clk =3D to_scmi_clk(hw);
> -
> -	/*
> -	 * We can't figure out what rate it will be, so just return the
> -	 * rate back to the caller. scmi_clk_recalc_rate() will be called
> -	 * after the rate is set and we'll know what rate the clock is
> -	 * running at then.
> -	 */
> -	if (clk->info->rate_discrete)
> -		return rate;
> -
> -	fmin =3D clk->info->range.min_rate;
> -	fmax =3D clk->info->range.max_rate;
> -	if (rate <=3D fmin)
> -		return fmin;
> -	else if (rate >=3D fmax)
> -		return fmax;
> -
> -	ftmp =3D rate - fmin;
> -	ftmp +=3D clk->info->range.step_size - 1; /* to round up */
> -	do_div(ftmp, clk->info->range.step_size);
> -
> -	return ftmp * clk->info->range.step_size + fmin;
> -}
> -
> =C2=A0static int scmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long parent_rate)
> =C2=A0{
> @@ -300,7 +271,6 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long =
feats_key)
> =C2=A0
> =C2=A0	/* Rate ops */
> =C2=A0	ops->recalc_rate =3D scmi_clk_recalc_rate;
> -	ops->round_rate =3D scmi_clk_round_rate;
> =C2=A0	ops->determine_rate =3D scmi_clk_determine_rate;
> =C2=A0	if (feats_key & BIT(SCMI_CLK_RATE_CTRL_SUPPORTED))
> =C2=A0		ops->set_rate =3D scmi_clk_set_rate;

--=20
Alexander Sverdlin.

