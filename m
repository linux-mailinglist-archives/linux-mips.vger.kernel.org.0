Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234756D64AB
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 16:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235585AbjDDOGK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 10:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235491AbjDDOGI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 10:06:08 -0400
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A934C3D;
        Tue,  4 Apr 2023 07:05:49 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7FBE458215F;
        Tue,  4 Apr 2023 09:57:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 04 Apr 2023 09:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680616640; x=1680623840; bh=YkG+C+vV7ZctkwqPaFXw45PShNJ45xIMivA
        +SkZxzuo=; b=sDfzMxiK88EsNOBKkSSkJVT4SHez239NYbVPxUcUDHCJ3gvleKv
        YK6K/vHJrOYlhuVt0qbmOJv3cD2bygdHHR2jLfnDtUyu8bn7KNGK52vvnVEX/+5A
        7Rb5noqFC+X9RTWxEf/XbQ/+muGS+fX8S3JmZYcbuFnIbrnJaXk6RwUKVHi4yELI
        Xihf49FwlVT6jYZN+8C09LvlxLYKVNL/P+nbYq2t7Ixlqa/4/5I8T5ITKTnoq0NU
        9gvZjq4WxeiDgoig3Q55PcBH2ZqZT5OSzzpMJ++UWbJguYUMwoMUhKGOiV5ThEtv
        MrYlQqZHGozllmmgEowpIdl8HbJGR27IiRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680616640; x=1680623840; bh=YkG+C+vV7ZctkwqPaFXw45PShNJ45xIMivA
        +SkZxzuo=; b=ov2Y1K0AWHY4Y9MMVw/JCWk6F927YjLN7fHGibqzLlN4V73W3Ym
        OZapqDqbKE/2gTHmym/0v1IYVDGxtMNpgSL2bPesKc/iMQA7Q3RJj7kjlPps2q8z
        em+Dpe7XrpIycSbZ/jrvD5SY2XFM4vtU4cmwdr2Yo/bfK+Ovgq75TvVc3ioFSXLr
        8jfe8nhvLNXQMvwRTWwc8KFHA2bgaLoEDxbpVlUBNqF9V4X7Tc7G5DApJoKWaIBB
        i/bcGWYn3BfyxwnYNsrEI/955ykS53OPSvbSY6KNbIpoUDSq8lY0tfjfbHXgj1qO
        woFs+6seQd3Uuzz6yNxkPeR7KCLq5+rK9dA==
X-ME-Sender: <xms:wCwsZPDiFLjq0l6yOMFyt1jdNbQ6paasgPsSTf8-Tgr60yM5Q_97vQ>
    <xme:wCwsZFhc_sE5mRgWyPCuER3FeIkYkYfc6eM0qnSUOKiJUGWdFZXkI2YWzZkPyz0o1
    Ar9JmIGJLwsmgPPW9E>
X-ME-Received: <xmr:wCwsZKm5xIgGAfHNCBb220urrUKdq-EiejPETyuE9hMOoS2ndtV39_2uQFH2jXE5ZouNODtdAubInzxZ1uAXY5rghpWBqQU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wCwsZBxPQPUtXqfGhVBZ7NR9LH6uRHESCV_wDbw1a58s3bjLfg79og>
    <xmx:wCwsZESbiKUK_hhVdwvl0k-l7lMfNoYNY5b3gep7pmQWQXg1DM1JDw>
    <xmx:wCwsZEbQP9Ld5upFj47SpoLBj3Yr-hUnv8etSD46pBmF6Dhb5qoy2A>
    <xmx:wCwsZAcOwF7rXWcaR9pAGsRzG-ELDwUDd9wfklYt9lU6IIZ5DjBtOA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:18 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 04 Apr 2023 12:11:45 +0200
Subject: [PATCH v3 55/65] clk: imx: scu: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-55-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, patches@opensource.cirrus.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2723; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=b8SqxOytwDE+KkaHfp5gKpFnsaNRQtdPkb4IDowdilo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37eH9Ozk8vnJkrxq7Z5tOdek/x02zC4/J/zPasPlso6Z
 82fEdZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi100Z/uerpJnWWxfK8R39caTjUs
 IPdaXzzDKLprdPfveU9cn819UM/9M2TbKdHLTu+Etjgc86WRIXxCwlPi5SiBd/33anTu/CPlYA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=0.2 required=5.0 tests=DATE_IN_PAST_03_06,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The iMX SCU clocks implements a mux with a set_parent hook, but doesn't
provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. The round_rate()
implementation being shared with other clocks, it's not removed.

And if it was an oversight, the clock behaviour can be adjusted later
on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/imx/clk-scu.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 66e49fea5f8a..bbdc1b23f6f5 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -250,6 +250,23 @@ static unsigned long clk_scu_recalc_rate(struct clk_hw *hw,
 	return le32_to_cpu(msg.data.resp.rate);
 }
 
+/*
+ * clk_scu_determine_rate - Returns the closest rate for a SCU clock
+ * @hw: clock to round rate for
+ * @req: clock rate request
+ *
+ * Returns 0 on success, a negative error on failure
+ */
+static int clk_scu_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	/*
+	 * Assume we support all the requested rate and let the SCU firmware
+	 * to handle the left work
+	 */
+	return 0;
+}
+
 /*
  * clk_scu_round_rate - Round clock rate for a SCU clock
  * @hw: clock to round rate for
@@ -425,7 +442,7 @@ static void clk_scu_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_scu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.round_rate = clk_scu_round_rate,
+	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_set_rate,
 	.get_parent = clk_scu_get_parent,
 	.set_parent = clk_scu_set_parent,

-- 
2.39.2

