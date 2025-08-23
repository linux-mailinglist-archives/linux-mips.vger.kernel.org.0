Return-Path: <linux-mips+bounces-10514-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45374B32B21
	for <lists+linux-mips@lfdr.de>; Sat, 23 Aug 2025 18:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FF3BA2865D
	for <lists+linux-mips@lfdr.de>; Sat, 23 Aug 2025 16:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702BF1F76A5;
	Sat, 23 Aug 2025 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qO1BhwyL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F70142E83
	for <linux-mips@vger.kernel.org>; Sat, 23 Aug 2025 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755967850; cv=none; b=VFVwI2rcFJZvz6GzRurmVu17UlJXqAszvBpVok0T2zZUuu30NyFqunvhEK0YucW658H5UXExsGhAI1bnlsSOm8FRVdmMfww2HJQw1iwSm8veccUvPfx9vtLIIJ2KBETMC6IxCSyGWfFAIeqQI2Qq8PZEiMXJ+8AhbvFH1Npiqjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755967850; c=relaxed/simple;
	bh=D4l/bK6NOcyRlgfuSTYFAZkY/V6CNxkCV8wyOCE4M8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jkgDLd5Jns5zVdTn+jph/gbh9qni1UFMAilEleYKhtO40/ROik1mc35jxs7gt6r7pyQxiNgXmdiQgQKNdjwJz5Isemgy5nEXBz+fsx7YMI/FwG5u12uVQtiLntlGjLKPdpDAhrrr/mKaq5AfAErlRgpk/PTDeVpPjoibrdyg1sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qO1BhwyL; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7a96309so43316666b.3
        for <linux-mips@vger.kernel.org>; Sat, 23 Aug 2025 09:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755967846; x=1756572646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNq2Nibqdx+evdv5zNaDNJtsHifnmrRlp9CMMl4pZuI=;
        b=qO1BhwyLNkGuK6PH9KoWStrKpkImbcOlq4WZ9n9VAIia82M0e612FabpjtB5PBbtHc
         lTKuCHv9NjI4DSx0VHXW/CYUa9yapqoH6bxaGxgeiWv8bwVRtAYZ8kPOkrFWGo3xNLLe
         uBKsBUP81G8fN1pvKG20dXCZUMPWrUnZ6lncqKeN1fnAN4wNeYa27lrDHdSa3iS3L8Z5
         q8b1dq2uXUW83ml4fLMvqhpbfN0tq0qBnFMBsrJVl3zazVpaFqPNjM29BlgUMlOOAdVW
         eZCSuMyFYu/5LtZ40JBjLdB+bQg7XM/7x8HNPstlAB+fv2/vQplqEKNq40bfRZl4ViFj
         1tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755967846; x=1756572646;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNq2Nibqdx+evdv5zNaDNJtsHifnmrRlp9CMMl4pZuI=;
        b=tKdJxx2pemGf6dxH9tvVHPWmC1Cgp4nzim52MwI+h55KiaTxVhI2ksWdps6Y4yjtdW
         GI9Ti4p8VQm1HUNWBM1nRUIKO557eivJwAAeq2Awi9+4eTY4Isw3/S5y9ANdoPKBhVEj
         VeHJewu/taMv9b+KhvuwCCYiO2AjEpS74j+s04jgP78WuK7EdPbEjK1ASkAMJDOV0cSD
         wlnYFtyde1OUxy62V0Z2+Ul7QEXPq0OI/bFk2rGoUSdR+tTTZ/VeTcvkwJAoVoENFbLA
         Ho5MgZ6JBzsh42t1LJaMFct8cWY9oKwYF19q4odjq3/7g26ExAPorZZ0HR3vjK8YRiM7
         kk1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7YxERd/g0K2/a/zULmFUoOk5lJ/labNlig+o/wcmGo5pXoKNYNH3P7/BTdgEKj6mKMs9U2RxTdoUV@vger.kernel.org
X-Gm-Message-State: AOJu0YzDrJuaa4yTjGL1ra3HORlw2ny3OOjFqZP74IYX9V8xntvRhRoP
	fdgSrMD8VSONrVkMONVjtLrG+ZMp6LoQKeq6G/uRbUYBHWkKM1LOvlfzU3ihmIrPYa8=
X-Gm-Gg: ASbGncvr3UgLSctPqxi6SrBDSFmVe5B+3q8R5lC4oRLA9HmCOe/CX1Zgew5vXCi9Qi0
	fAbkA4gZFk7469mXwWLUFLACAyqvNfrAK//mfevXyiZsNi+7N90u3fiwhucO32v1pc+VnhYMgqM
	+fIZfZlSqf0lOVBaZBVm6zc3/PkMMhgn7l7pT54jQ415P93IapQXgAgdrZSGtqpHKN/6Ja1X5t7
	a0Azvfs26hqX6OmdWtWdMD0Xa3wUKUIM1Orwxi+vwq69bddCyDg55ADvD02U5h+lO6UCGl5CGOK
	SGqNOoPj7otXvUdo3Q6esBH8uK6NCEKA0zzeu/hRI5VU+mMNLcc48nhjXAlw0ltmnBA38FHLXgG
	A9kUsaMjIpCKC8NxTGY2HA2FXACZACz5AZ31uAkA=
X-Google-Smtp-Source: AGHT+IHHFRcZ2uWc450cm6YGSWLLm41zFn8yMlhrRzRS5mz16K/9Ne7EtPYoZsI+yYfZ3MDyCa6PPQ==
X-Received: by 2002:a05:6402:358d:b0:615:7ba6:4876 with SMTP id 4fb4d7f45d1cf-61c1b91089cmr2916571a12.8.1755967845817;
        Sat, 23 Aug 2025 09:50:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c312c4cdesm1797880a12.23.2025.08.23.09.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:50:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Alex Helms <alexander.helms.jy@renesas.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
 linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-98-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-98-b3bf97b038dc@redhat.com>
Subject: Re: (subset) [PATCH 098/114] clk: samsung: cpu: convert from
 round_rate() to determine_rate()
Message-Id: <175596784123.52468.6703738128182958997.b4-ty@linaro.org>
Date: Sat, 23 Aug 2025 18:50:41 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 11 Aug 2025 11:19:30 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> 

Applied, thanks!

[098/114] clk: samsung: cpu: convert from round_rate() to determine_rate()
          https://git.kernel.org/krzk/linux/c/05c58c9415d1369387aedd28518fd0fdaeabd178

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


