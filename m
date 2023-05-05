Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1AF6F81F8
	for <lists+linux-mips@lfdr.de>; Fri,  5 May 2023 13:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbjEEL2o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 May 2023 07:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbjEEL2n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 May 2023 07:28:43 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593C17AB7;
        Fri,  5 May 2023 04:28:42 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 7F7933200A44;
        Fri,  5 May 2023 07:28:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286121; x=1683372521; bh=4iEamFn++tvVAlj0JQq0eb6eeMq8AZb4PZ9
        4FIUsUpw=; b=JrwyNRS6xGZMJyHsYaYBTQLgcDtbzuFvGIiYoKqEYgZNHWVkrFV
        h5DVZOqYTEy4SgWAYFOhXlIufOQDe+gTQIxGO/DX3ahnIfiV/uoEKrQT5VJ6OF8V
        lYDiSDXSEW6+og7ja5al4Ek2q9LIkasgBw29I5wErpqDjlKd8vcr+TKeMlR/JMKZ
        LlUBZhoBccmuGsoZ6/3e6/5Q9SO3v/vq5k+YKa8U6asgPUkDPTN/3fVUgqvm7cMK
        QokZGVnMAanQqPQWRUIkO6JUrFhmDzzBM4ub+j3pwMTzPhXUHpOF1ygsnDCqnqad
        XML6d4RAF8oEHdvawb5IoEQu0LqZRHJ3gnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286121; x=1683372521; bh=4iEamFn++tvVAlj0JQq0eb6eeMq8AZb4PZ9
        4FIUsUpw=; b=HL85q/L8S8KpJIIJgq5dsK4bB2zrGmPvZMwoYVSfXjtylB7bYb9
        qOg0Qu+7XzQ2eOzyKLh+CqkmXCygY8o8Ebyi2BZ1zrTxc6DfBx8PtdcMGLuPcbhW
        /p6iViGgFJh/DWgCGljpb/NrlpW3bl5hwugOYwienWcbk9HfG9wLmKRqUCoS4paV
        yduOnD58bjViMSHUbY7eM/J0di3DkiI696AnD0TVyyqhzCROHdny23bEi+PERkcV
        fZxFyjj2dJGZwKUwDCGnFKw/69rhtCSxyCBg8FkxN8f34VoNX/TOBHD5LtxWQBbo
        R7aNFr2rTJoZjYmn/HUHzTdsnbyWnDZlH/Q==
X-ME-Sender: <xms:aOhUZGgr4nUN3UtvEP68oHoS61ghBU7cpmmN7TF7-HgZKtnTlfh_zg>
    <xme:aOhUZHAHIuC_8ccdUMLUdCB_EjfKGCTN4KysAXdkhs66qhp3Kj9QWivOYeEN66PS7
    86QaQ-w7fOki1vPRGc>
X-ME-Received: <xmr:aOhUZOEizPMV_SrT1x9lONKQfcHAgx-oOXkGDN0UGfJ2XwZFhxb_wNLSFkYpjEMu9ECdyebZm5z4ALYaltmr6pYDSA1ENUo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aehUZPRrkL_FyNjW8R6e-bQwWad1NCp85dUIBtN75FxHTdtSx41FGA>
    <xmx:aehUZDzzrqo8sTsJYADDAiDz5-XKAtiDhkJqFIbKzmQIihCQ9aFfQg>
    <xmx:aehUZN4UPJ_ZIthJGgkKOxqRCiq4THmTewoyJepc44GAcCq2vRGCGA>
    <xmx:aehUZFvsozc76_6gjkiyCaJ8tuCbXZzVsfuro2kDv26kDOt0oJR1qQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:40 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:26:01 +0200
Subject: [PATCH v4 59/68] clk: ingenic: cgu: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-59-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-mips@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3065; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=s2h6NtNh1xZnvTEaEBbeRwHTKhP5GD5DmrcHaBuW+0A=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5euWfS2aG45Y1QDL9Oyrj35p2f6z2u8c+7Zx843Wu29
 Gxn9OkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRhO+MDDsiDj+NvlKa23/7d9OsjC
 WWG+0q27e3lKux202tWZaUVcDI8Ovw451pz9ef+HXrwgvVhV36xbIMxqWMR/w3bFZ2TbCsYAUA
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

The Ingenic CGU clocks implements a mux with a set_parent hook, but
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
 drivers/clk/ingenic/cgu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 1f7ba30f5a1b..0c9c8344ad11 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -491,22 +491,23 @@ ingenic_clk_calc_div(struct clk_hw *hw,
 	return div;
 }
 
-static long
-ingenic_clk_round_rate(struct clk_hw *hw, unsigned long req_rate,
-		       unsigned long *parent_rate)
+static int ingenic_clk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
 	const struct ingenic_cgu_clk_info *clk_info = to_clk_info(ingenic_clk);
 	unsigned int div = 1;
 
 	if (clk_info->type & CGU_CLK_DIV)
-		div = ingenic_clk_calc_div(hw, clk_info, *parent_rate, req_rate);
+		div = ingenic_clk_calc_div(hw, clk_info, req->best_parent_rate,
+					   req->rate);
 	else if (clk_info->type & CGU_CLK_FIXDIV)
 		div = clk_info->fixdiv.div;
 	else if (clk_hw_can_set_rate_parent(hw))
-		*parent_rate = req_rate;
+		req->best_parent_rate = req->rate;
 
-	return DIV_ROUND_UP(*parent_rate, div);
+	req->rate = DIV_ROUND_UP(req->best_parent_rate, div);
+	return 0;
 }
 
 static inline int ingenic_clk_check_stable(struct ingenic_cgu *cgu,
@@ -626,7 +627,7 @@ static const struct clk_ops ingenic_clk_ops = {
 	.set_parent = ingenic_clk_set_parent,
 
 	.recalc_rate = ingenic_clk_recalc_rate,
-	.round_rate = ingenic_clk_round_rate,
+	.determine_rate = ingenic_clk_determine_rate,
 	.set_rate = ingenic_clk_set_rate,
 
 	.enable = ingenic_clk_enable,

-- 
2.40.0

