Return-Path: <linux-mips+bounces-10299-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0513B26B0C
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 17:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ADDD620064
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 15:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5717821B9CF;
	Thu, 14 Aug 2025 15:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="bk5vgVr1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OgtRYyef"
X-Original-To: linux-mips@vger.kernel.org
Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5B71A23BB;
	Thu, 14 Aug 2025 15:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755185372; cv=none; b=nnj8xcIfxlaIsBEYqM/7M1PzpmVRR2OvqHy7X+3POIkIwIg9iu5gD9Bn+XigklJy0ufjWYvrvojSqK/57nrFerlISj0L9wIWXbtlrI/TSx7bkZGmAR1NsT97Q9PpBxn8JgP1PaoGYzGmJYyBUcLx9orRP49hYJmo8HkdNhUn5s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755185372; c=relaxed/simple;
	bh=a6SJJWaFi7ZgwKDaB2nMXQoeXy6bLPWSt6+2erBGpzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a88faqjsf8R6swYCruzZU7VmS4dsBxpEddi2MkcAnVb2krUTZqSczrpxi3ZtQxi7s2ESm/Wt7dDOHGKyWXax2ETPbxnFgPaV7m+KryerAMtcCCWkU3QDltnZCj8+Uw6ys65l3CMcItLZYIuFU1GLuZuTQdFLlUdKMEKNmukh2OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=bk5vgVr1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OgtRYyef; arc=none smtp.client-ip=202.12.124.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 105C21300304;
	Thu, 14 Aug 2025 11:29:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 14 Aug 2025 11:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1755185366; x=1755192566; bh=rkWnl6reuM
	6yvJ3xZDTKQK+EuArjQadhj3fE3KZMVRQ=; b=bk5vgVr1CLPZUpu/8yzDk9lb/A
	tHVYzQv9hTbjQ5kwcym7VsHTp19WAkg0Hpqa0wD+CqZ1Nd+U4CYQUhklsxcsM+gf
	+Z8ariB4+I6d0eYBWBqwN85t+DHDwDQ7fqbhoqiETlG6gco3KS7d4UK8VRBiyAAS
	6uQ21llXN+4WgyvPXd92zlyXucFtCItZdyaRf6rM974aMV78YFLsf5bYqI0hfslp
	WGrZ3W02q0h1GvDjIb47eJZZb/RoRsmrCwwgfK5H4wRRs0C8WqQHHYIrOMK0ZHVP
	aDBjLclEdxOpupQdAWDgeTb1M/iK05Vsaa408ZFpj/IrPd9EETcasajpGZrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755185366; x=1755192566; bh=rkWnl6reuM6yvJ3xZDTKQK+EuArjQadhj3f
	E3KZMVRQ=; b=OgtRYyef+tMauOvZ4k9rGfwXDQPdj9klbG3t2P3cD1RmOS/9tKr
	ofSSHcPOA4xPenVBOXiV5FhURDpUSMTCxAaCfaGDs8djlJNyu+CDw00HGUTHuZE7
	iZZjz4ciUS7g9j3QlvnqXWnhLS9T0Hfr1vQzrZacIOAYqclBu7P8wHiQyBn3x1Tv
	3IRsTGZTVlX0WWvOsiM9n8XZ6hNCPKGYNq9gwZN2kX8ko8IOuG4Q8FPM4sUswTeC
	AgWkrih3zpy+BYFRHxDex0LNtVY1D6KtF6Lq5T4lYxyTSy86ct+fI6zX8qKxzdu/
	3y8kkYasdpgKe+p3NAh/zboekg1+6r4CeXQ==
X-ME-Sender: <xms:0ACeaPzCAtXgPuyqWluGHhM-MFgm73xya4MqxCsQTtBCktFBJqK7kg>
    <xme:0ACeaMERX6gx9_hULngxnLQfekqkXc4lLgLYc32ut3v9CMFW_su7guEwNB2tie5mH
    w5fawJBsHbwl2-YVLE>
X-ME-Received: <xmr:0ACeaLVGQlU6CrqqKVJitR-Q-KYnw8sFF555-uv-1ZSx_gltuJRQBRXFJYSpweaBmMTG7ASMGOfysdY55ljMVadCgzU7C0B0G9o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedugeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepkeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegsmhgrshhnvgihsehrvgguhhgrthdrtghomhdprhgtphhtthhopehmthhurhhquh
    gvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepshgsohihugeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepshhuuggvvghprdhhohhllhgrsegrrhhmrdgtohhmpd
    hrtghpthhtoheptghrihhsthhirghnrdhmrghruhhsshhisegrrhhmrdgtohhmpdhrtghp
    thhtohepuhhnihgtohhrnhgpfigrnhhgsehouhhtlhhoohhkrdgtohhmpdhrtghpthhtoh
    epihhnohgthhhirghmrgesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlrghs
    rdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprghlvgigrghnug
    hrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:0QCeaCmil7BHYfOOKicsmHxn_e78pk70Rk65CyKWeasaaevmqI2c1w>
    <xmx:0QCeaDoCeuybXqCAns088Q1xVlB3g1e970x8zyEDaKcok_TAC0lcKQ>
    <xmx:0QCeaEVFJkoSfREyDcMyNqqo6Jw3DXglTgApYi_wACt6wsNooYRRBw>
    <xmx:0QCeaBiIqVIoEzYCR8Pz3QPaA5HZY-DpDdZxQjhq8wajhutrO-oikw>
    <xmx:1gCeaFTE4FSOg2ZAQsli0z35YCTwrTgdlOhrp7ge8wLAulQpy-Pb8Suw>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Aug 2025 11:29:19 -0400 (EDT)
Date: Thu, 14 Aug 2025 17:29:18 +0200
From: Janne Grunau <j@jannau.net>
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,	Maxime Ripard <mripard@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,	Sven Peter <sven@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,	Qin Jian <qinjian@cqplus1.com>,
 Viresh Kumar <vireshk@kernel.org>,	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,	imx@lists.linux.dev,
 linux-riscv@lists.infradead.org,	spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,	patches@opensource.cirrus.com,
 linux-actions@lists.infradead.org,	asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org,	linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 075/114] clk: apple-nco: convert from round_rate() to
 determine_rate()
Message-ID: <20250814152918.GA854971@robin.jannau.net>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-75-b3bf97b038dc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-75-b3bf97b038dc@redhat.com>

On Mon, Aug 11, 2025 at 11:19:07AM -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk-apple-nco.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Janne Grunau <j@jannau.net>

