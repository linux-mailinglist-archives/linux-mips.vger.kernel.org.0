Return-Path: <linux-mips+bounces-10652-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA97B3840F
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 15:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 657F4360A06
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 13:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE243570A0;
	Wed, 27 Aug 2025 13:50:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66F7342C92;
	Wed, 27 Aug 2025 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756302631; cv=none; b=bc9h+gGGyZ/ohefJtj25jaExmeN0UpW35lBCbimGbcRsGY9EQSZr0b5n+WQOlj4wihDQzWTxt7aAZYmNnrWYQFLJBgETU/Jspn+hASSp+pugOR9tNjcwBpYIbKNlj17472tC1uN5qd2WSWI1dXptI9fLM5dVhAKq2yXj8ByGPBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756302631; c=relaxed/simple;
	bh=sjDy2yPaMyRUWRHA7zNCNkrYIPM6l4g0nDQeVISxPDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvLjF50lMH9BSuMKY/T0ifYiu9BvZ9cOl5k7gZaEOMdlVu7hNVjMY+LLOvtvLKbsV9m/MjIAwQ7d9WPFuzzMuXPGB5Z73mcC/HTaQFguerZhp7GLSzOEsM5jbgU9U0O7aaj1x4c+U7gEezTN1/gqIlOd69QCOx2KAlSMkcOe0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1ECC1688;
	Wed, 27 Aug 2025 06:50:20 -0700 (PDT)
Received: from bogus (unknown [10.57.57.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A11B23F694;
	Wed, 27 Aug 2025 06:50:11 -0700 (PDT)
Date: Wed, 27 Aug 2025 14:49:48 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 112/114] clk: scmi: remove round_rate() in favor of
 determine_rate()
Message-ID: <20250827-abstract-maize-tanuki-d1bdcb@sudeepholla>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
 <20250827070933.GB18994@nxa18884-linux.ap.freescale.net>
 <aK8EbcEHz3Yzpa1W@x1>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aK8EbcEHz3Yzpa1W@x1>

On Wed, Aug 27, 2025 at 09:13:17AM -0400, Brian Masney wrote:
> On Wed, Aug 27, 2025 at 03:09:33PM +0800, Peng Fan wrote:
> > Hi Brian, Sudeep, Cristian
> > 
> > On Mon, Aug 11, 2025 at 11:19:44AM -0400, Brian Masney via B4 Relay wrote:
> > >From: Brian Masney <bmasney@redhat.com>
> > >
> > >This driver implements both the determine_rate() and round_rate() clk
> > >ops, and the round_rate() clk ops is deprecated. When both are defined,
> > >clk_core_determine_round_nolock() from the clk core will only use the
> > >determine_rate() clk ops, so let's remove the round_rate() clk ops since
> > >it's unused.
> > >
> > >Signed-off-by: Brian Masney <bmasney@redhat.com>
> > >---
> > > drivers/clk/clk-scmi.c | 30 ------------------------------
> > > 1 file changed, 30 deletions(-)
> > >
> > >diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> > >index d2408403283fc72f0cf902e65f4c08bcbc7b4b0b..6c6ddb92e7cf6a0cfac2c7e19c0f15f777bb8c51 100644
> > >--- a/drivers/clk/clk-scmi.c
> > >+++ b/drivers/clk/clk-scmi.c
> > >@@ -54,35 +54,6 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> > > 	return rate;
> > > }
> > > 
> > >-static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > >-				unsigned long *parent_rate)
> > >-{
> > 
> > I see the point of round_rate is not used if determine_rate is there.
> > But reading the code of round_rate, It might be better to rename
> > scmi_clk_round_rate to scmi_clk_determine_rate.
> > 
> > Anyway, need Sudeep and Cristian to comment.
> 
> In this case, yes the round_rate implementation is filled out, whereas
> the determine_rate lets the firmware handle it, and
> scmi_clk_recalc_rate() will later populate the rate the clock is running
> at.
> 
> I can convert round_rate over to determine_rate in this case, however it
> would be a change to what's there now, and risks a regression. Here's
> the relevant code from drivers/clk/clk.c where the determine_rate and
> round_rate ops are called:

I am inclined towards this. Determine rate was added recently when the
clock parent support was added IIUC, so I don't think it should regress
anything.

> 
>     static int clk_core_determine_round_nolock(struct clk_core *core,
>                                                struct clk_rate_request *req)
>     {
>     	...
>             if (clk_core_rate_is_protected(core)) {
>                     req->rate = core->rate;
>             } else if (core->ops->determine_rate) {
>                     return core->ops->determine_rate(core->hw, req);
>             } else if (core->ops->round_rate) {
>                     rate = core->ops->round_rate(core->hw, req->rate,
>                                                  &req->best_parent_rate);
>     	...
> 
> If Sudeep / Cristian want the round rate converted to determine rate in
> this driver, then I can do that in a v2.
> 

Yes please. Also please post it independent if it doesn't have to be in
the series. To many in cc and lots of patches to respin all.

-- 
Regards,
Sudeep

