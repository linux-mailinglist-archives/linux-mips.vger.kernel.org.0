Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C29956F81FA
	for <lists+linux-mips@lfdr.de>; Fri,  5 May 2023 13:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbjEEL2r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 May 2023 07:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbjEEL2q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 May 2023 07:28:46 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3057BC9;
        Fri,  5 May 2023 04:28:45 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 5681E3200A57;
        Fri,  5 May 2023 07:28:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286123; x=1683372523; bh=ha775dXEQ6n/LuUuOVDMa/G4jIcWIGFZi2I
        k/pZGv7Y=; b=FR1CavpzOrul6dpfLkqitbMTPFFv4ejeCktUq53/Vj8EuL1ca3N
        zU8B/a9fn+wi2BbwSolz8++xTMI+eQEhsx0QzZ6ibw3TOijUgmTtovj5FGsmhe2S
        yadKUY3rjbRwbp+KinqDQrHCxGXCexg4gIbQc1BzOGRe4dOQA+tUDCHjV7skAilS
        qHg/QmQb0+9YAdEm6TIYR6kUUPh/60J0lrL9LkF98SuC4tDGeH18egOw8Djgc9Wx
        TLq+8veQPCqjaRG3INUR3Soas8ZG2dyvAxTuQLNSOZfcubdkFQjDDIVeDLh0rRNH
        Y5ea6Xi9w/xGJUjOpmgOeSRgvmjPTBOyWSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286123; x=1683372523; bh=ha775dXEQ6n/LuUuOVDMa/G4jIcWIGFZi2I
        k/pZGv7Y=; b=MXY7jVFfFB+k/UgAf6zlWn2Dqh4x83dBTuCwXlkW0XWeuaSGcJf
        Otbuln0GveMfib/vCZryASCXc1Y12qcs5CC+NBlkJj92OvhHJMMtcCg5l56N6oRS
        UTA6LrFZ0kDkbnSf8XcFuU+a08XTOIepABY+X6AZJpGuFOSHGtlS+fpz0HX9d89c
        n500eN5F5Gmt/wY4NmE3/2uwL7G6cFUmdXEGAZW/JrCK+xL0m4Mx+xn7qLf5wS5E
        INEr4GRs4wXhv4KQ4//GKKpSWLdMm6PT5Q1tA9WhPTPdYM7yIx5441LSaWhxd6WW
        Q88VeqwCBSIhtymemxu9TA1Zjy0WHOkhW9A==
X-ME-Sender: <xms:a-hUZEvRXYp2rWwpLrSZ4WDHij1h1LLaWZSl7Gf4lmT6AycmPt5FAA>
    <xme:a-hUZBebFXe-qToPfI9JjV5AsEdWvMvaot0wG9EIWpc7l5dcqa-E4iibocxQLrrFv
    Q3J2SNOFbCTZBvFEd8>
X-ME-Received: <xmr:a-hUZPwKHgBbBx9YkirsewvFH85wL-3XU3QTzaSWVWf6bnZCOEO3dPvLte8UM_FbUH_J4sEwTRc2UJ7_1MDMdkcXd-0LfRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepuddvnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:a-hUZHOB3PfjtLffeo9s9C955jWQapGEQWrqCzLD4CZ-Afp6qsWJmw>
    <xmx:a-hUZE80ePEC9VUHUeIUjSFJyRlGV8BH7pnCsneFkZ91opL3i9URcw>
    <xmx:a-hUZPXb5wqoEfS_-0j1hfDsjrME_NmTQW2S2gmQuncH5F5GpBYhlg>
    <xmx:a-hUZIZJz833SkuUV_OGLlqE4V-ySikhG8CPpkVZ8o1C_d9Ih2m2Tg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:43 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:26:02 +0200
Subject: [PATCH v4 60/68] clk: ingenic: tcu: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-60-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-mips@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2886; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=vMv8cJqHuqTSrFAiOuxHeMK+bNhjCnPVj2f+xVcpeEU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5d2u+hInU9ImPD5oJgFY/LiDZ6d5xtVZt55m/fWqupL
 9ab4jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzEj4eR4Wzz+Tq3tNl9ZZJ/Gi5sO2
 TGvW/vE8a9HU+1Lx89vfxgXQcjwymlZS0vZxRbW8mtY9r67nrBkQtuhzk+5lo8e7kh8VZjGC8A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Ingenic TCU clocks implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

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
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/ingenic/tcu.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index d5544cbc5c48..7d04ef40b7cf 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -178,18 +178,21 @@ static u8 ingenic_tcu_get_prescale(unsigned long rate, unsigned long req_rate)
 	return 5; /* /1024 divider */
 }
 
-static long ingenic_tcu_round_rate(struct clk_hw *hw, unsigned long req_rate,
-		unsigned long *parent_rate)
+static int ingenic_tcu_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
-	unsigned long rate = *parent_rate;
+	unsigned long rate = req->best_parent_rate;
 	u8 prescale;
 
-	if (req_rate > rate)
-		return rate;
+	if (req->rate > rate) {
+		req->rate = rate;
+		return 0;
+	}
 
-	prescale = ingenic_tcu_get_prescale(rate, req_rate);
+	prescale = ingenic_tcu_get_prescale(rate, req->rate);
 
-	return rate >> (prescale * 2);
+	req->rate = rate >> (prescale * 2);
+	return 0;
 }
 
 static int ingenic_tcu_set_rate(struct clk_hw *hw, unsigned long req_rate,
@@ -219,7 +222,7 @@ static const struct clk_ops ingenic_tcu_clk_ops = {
 	.set_parent	= ingenic_tcu_set_parent,
 
 	.recalc_rate	= ingenic_tcu_recalc_rate,
-	.round_rate	= ingenic_tcu_round_rate,
+	.determine_rate	= ingenic_tcu_determine_rate,
 	.set_rate	= ingenic_tcu_set_rate,
 
 	.enable		= ingenic_tcu_enable,

-- 
2.40.0

