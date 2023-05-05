Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA5E6F81B3
	for <lists+linux-mips@lfdr.de>; Fri,  5 May 2023 13:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbjEEL1I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 May 2023 07:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbjEEL1F (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 May 2023 07:27:05 -0400
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F041AEEF;
        Fri,  5 May 2023 04:26:39 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id EAC902B067B4;
        Fri,  5 May 2023 07:25:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 05 May 2023 07:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285945; x=1683293145; bh=UQKDjmKPSzC7x5C95cs9YOZc6yAVPvrTJ4b
        1utEyhQs=; b=UDQJjfgae9Jy0KKyFS0jdkkFbIHInOjJANJqIPxcx2irxjptzoa
        sOkGAs/Z2RiPml73V/Dyqz18ojQmjuG0m5k2qzRasE2wOduD0CM8Clamakjgpmr6
        cCDoP9q1ou3E91lXfG3zQq94jjWZw7UtQ4ecrXCJNgsgnb0RX7vXIXcU3WAaEa7D
        PrLAjPWKmGuGUZB+qjmy3wiVkZUpVewbtTrg5ySbFZP8gV1D1a8ytRBQ6oMOsLEw
        5e92vJbN6fb877F8q/bLcn8jg76/PM41W/zJ3tFHn9N3jA4plS5kcc3kJ+o8zzms
        2jftE0cuihiOeKakfTVrSqvLxUNW+XVhkgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285945; x=1683293145; bh=UQKDjmKPSzC7x5C95cs9YOZc6yAVPvrTJ4b
        1utEyhQs=; b=eETp/afWAPWzhC0ojTjFS4E2W8DChqKPKekP/EPuz5wcqmFBedN
        ZE+2I5zoeVPXyzKsIEvFVqbdeKASr4jE/E0HiMkzTedmCrKH7DHijuv1Pr0iz6lm
        mkw6mO2IYBh/nuQLdyKHPD9sAPZo6XHnTGzbJmn9B/JRjfopvt9kUHSt7K7spG5U
        mWrJ8HMVdVXDUOfwWRWWOBbcosSLQzfxtxBGfoiLaSQVUQQwmLExj8nwhCziNLGx
        3WVMizySGqhM98PNWHHPcW+udXkQtb9aSDcQw/m31nJjuplyRlOmetOHAEsIxyUq
        98B8xE3APjy+uJkG8FtMHjn7l8Mdn0KBGkg==
X-ME-Sender: <xms:uOdUZNj3ZpRewkMtfxJ6-ctpOTk2iZx5Ay1l69YUkk0t1y1bBktOIw>
    <xme:uOdUZCCzmcX3Ogu0_MvnPgEHEe5QuKkoSeQ39kZDFWs5CBbm3W3hi8pMTy23Haspl
    MBMYjdHw32Wvd2ycdQ>
X-ME-Received: <xmr:uOdUZNFcQBLQLsDsGRahkPNFqahy8ULrpN3NGsH_y-MOTDZwMw-Gom31V1u7tVnIPIHyGwtAF-f649-KhACFYqJrLXRbNVI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
    jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:uOdUZCS3WqyF5n_W3EiJVuNpMnHgAXUa1OpdnFRLa8UYUgd11F-oNg>
    <xmx:uOdUZKwWniyq1PrG5KiKO_9_icEmzUCRDxijmAeCZ0CdvgtAjfwv1A>
    <xmx:uOdUZI7LJJc_HfCtyAo4xAEhts_dpqgNb42EzjXV5B62USvVCiTKVQ>
    <xmx:uedUZK5NUkPOnYhg1Pw5l4WoybZn50aZGTzwuONG_b-ZzRWQ6TMX7TYzgTw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:25:43 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:05 +0200
Subject: [PATCH v4 03/68] clk: Move no reparent case into a separate
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v4-3-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Abel Vesa <abelvesa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        David Lechner <david@lechnology.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jaroslav Kysela <perex@perex.cz>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Peng Fan <peng.fan@nxp.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sekhar Nori <nsekhar@ti.com>, Shawn Guo <shawnguo@kernel.org>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-actions@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        patches@opensource.cirrus.com,
        Pengutronix Kernel Team <kernel@pengutronix.de>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5599; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Pxa6LrZe1o/eBr4UI7umXibSzTm/MpQguARoHEO5XCk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxc5Rstf2bExQeEn73VnY64JKuoy700DJTb9UzzofGj6
 AUHmjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzk3AyGf/Zn+S0ni19r774wuWmK42
 TRba9ZDL7d93cNy5IJu/ex8zjD/2SHmTwr1himMz9fPun629N1J8OVT1ytvTFn9681xQe/X+YAAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Stephen Boyd <sboyd@kernel.org>

We'll need to turn the code in clk_mux_determine_rate_flags() to deal
with CLK_SET_RATE_NO_REPARENT into a helper clock drivers will be able
to use if they don't want to allow reparenting.

Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: "Andreas Färber" <afaerber@suse.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: David Lechner <david@lechnology.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Miles Chen <miles.chen@mediatek.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-actions@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-sunxi@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: patches@opensource.cirrus.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 75 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 43 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e495dd7a1eae..f57f821a5e5a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -594,6 +594,46 @@ clk_core_forward_rate_req(struct clk_core *core,
 		req->max_rate = old_req->max_rate;
 }
 
+static int
+clk_core_determine_rate_no_reparent(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct clk_core *core = hw->core;
+	struct clk_core *parent = core->parent;
+	unsigned long best;
+	int ret;
+
+	if (core->flags & CLK_SET_RATE_PARENT) {
+		struct clk_rate_request parent_req;
+
+		if (!parent) {
+			req->rate = 0;
+			return 0;
+		}
+
+		clk_core_forward_rate_req(core, req, parent, &parent_req,
+					  req->rate);
+
+		trace_clk_rate_request_start(&parent_req);
+
+		ret = clk_core_round_rate_nolock(parent, &parent_req);
+		if (ret)
+			return ret;
+
+		trace_clk_rate_request_done(&parent_req);
+
+		best = parent_req.rate;
+	} else if (parent) {
+		best = clk_core_get_rate_nolock(parent);
+	} else {
+		best = clk_core_get_rate_nolock(core);
+	}
+
+	req->rate = best;
+
+	return 0;
+}
+
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags)
@@ -603,35 +643,8 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	unsigned long best = 0;
 
 	/* if NO_REPARENT flag set, pass through to current parent */
-	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
-		parent = core->parent;
-		if (core->flags & CLK_SET_RATE_PARENT) {
-			struct clk_rate_request parent_req;
-
-			if (!parent) {
-				req->rate = 0;
-				return 0;
-			}
-
-			clk_core_forward_rate_req(core, req, parent, &parent_req, req->rate);
-
-			trace_clk_rate_request_start(&parent_req);
-
-			ret = clk_core_round_rate_nolock(parent, &parent_req);
-			if (ret)
-				return ret;
-
-			trace_clk_rate_request_done(&parent_req);
-
-			best = parent_req.rate;
-		} else if (parent) {
-			best = clk_core_get_rate_nolock(parent);
-		} else {
-			best = clk_core_get_rate_nolock(core);
-		}
-
-		goto out;
-	}
+	if (core->flags & CLK_SET_RATE_NO_REPARENT)
+		return clk_core_determine_rate_no_reparent(hw, req);
 
 	/* find the parent that can provide the fastest rate <= rate */
 	num_parents = core->num_parents;
@@ -670,9 +683,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	if (!best_parent)
 		return -EINVAL;
 
-out:
-	if (best_parent)
-		req->best_parent_hw = best_parent->hw;
+	req->best_parent_hw = best_parent->hw;
 	req->best_parent_rate = best;
 	req->rate = best;
 

-- 
2.40.0

