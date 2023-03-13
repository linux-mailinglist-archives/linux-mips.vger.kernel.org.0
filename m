Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608596B834E
	for <lists+linux-mips@lfdr.de>; Mon, 13 Mar 2023 22:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjCMVAZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Mar 2023 17:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjCMVAV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Mar 2023 17:00:21 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3613593;
        Mon, 13 Mar 2023 13:59:56 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id cn21so23862611edb.0;
        Mon, 13 Mar 2023 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnURxZI1suPSaEDTpxd+ifaQ2eMQxg73RycWrn38PLc=;
        b=ROqj4HpX4GZbhTwBtrTm+VNh+b0mGK6CoPCop2a0aq1XCIB3dmizqbQchDDclQYfZd
         PTsEu8FiYXk1vFgRwIUnBIDxgxMAwUtBq/VyiKObIN+Te21n7AmkktWHP+foHUl6xI72
         ZXt7MZYqcnC2fxXGrcvZYNbFwRcFvEURz9NEXYqgr4A9ybLRjlj8vhUYP5fIFgnzquzL
         x5n0nqGuGdyOY9SrbvzjUPNmAMFa+IX9f0NQ3c6tdBQSS7RRJmstIf/mSxTZeQfT5DbJ
         laP/IuaJUTTJiv9He0yiy72ZITg78/81MWk339ShDsfV/LjOl0s+6M1VPBUfPXwEaQMQ
         nEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnURxZI1suPSaEDTpxd+ifaQ2eMQxg73RycWrn38PLc=;
        b=eY17cVl0J52WKaZ9aW/z42KSSN2U5n0AdivPc1byV1CdUPM6mPm9Sl61zjC+ZPTIY5
         966Nsa3MsVt5ej/3TBFw199yJ6ORD1RpA0uMYi+Ceda9ByZ7GUQTlFUHmOxEWp7415SO
         7jhy2scqHqL+MHC3f0FNPPrDZ8kGe+ENEUmKEf6LGOM2Utogpr/EaQX7h6U5z5JXZ33g
         Il5WyHt9twwz9dvTOktVtG0XMLgJhg2w+qx+EvbaCxSHeLcmwD+1qiqC9HlwrsBTamFP
         CKxhWI9vA9BO10bANjNzu7Z7c/wuljd1FebmVJtvBa3X2jZTfvF8d8dtWGR6nlfZeqU+
         lpWw==
X-Gm-Message-State: AO0yUKXVcQwNKTFbOuvzyZD28HZfkR+y/JxD4nKCMoDjySfmbSRQEfMR
        hTyrb0wHlqaXV0otF+DZJZ8=
X-Google-Smtp-Source: AK7set/pTlKtqFd49Y6pzTSIMLlQjQGqARoRT9dpDQvpprkqeDE7e0q00LSgv/KNRfZbi5ibVUeHNg==
X-Received: by 2002:a17:906:b214:b0:922:cb10:ad06 with SMTP id p20-20020a170906b21400b00922cb10ad06mr7733015ejz.43.1678741194795;
        Mon, 13 Mar 2023 13:59:54 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.13.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 13:59:54 -0700 (PDT)
From:   arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        William Dean <williamsukatube@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Hui Liu <hui.liu@mediatek.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        Daniel Santos <daniel.santos@pobox.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>, erkin.bozoglu@xeront.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: [PATCH v2 01/21] pinctrl: ralink: reintroduce ralink,rt2880-pinmux compatible string
Date:   Mon, 13 Mar 2023 23:59:01 +0300
Message-Id: <20230313205921.35342-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

There have been stable releases with the ralink,rt2880-pinmux compatible
string included. Having it removed breaks the ABI. Reintroduce it.

Fixes: e5981cd46183 ("pinctrl: ralink: add new compatible strings for each pinctrl subdriver")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-mt7620.c | 1 +
 drivers/pinctrl/ralink/pinctrl-mt7621.c | 1 +
 drivers/pinctrl/ralink/pinctrl-rt2880.c | 1 +
 drivers/pinctrl/ralink/pinctrl-rt305x.c | 1 +
 drivers/pinctrl/ralink/pinctrl-rt3883.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/ralink/pinctrl-mt7620.c b/drivers/pinctrl/ralink/pinctrl-mt7620.c
index 4e8d26bb3430..06b86c726839 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7620.c
+++ b/drivers/pinctrl/ralink/pinctrl-mt7620.c
@@ -372,6 +372,7 @@ static int mt7620_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id mt7620_pinctrl_match[] = {
 	{ .compatible = "ralink,mt7620-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mt7620_pinctrl_match);
diff --git a/drivers/pinctrl/ralink/pinctrl-mt7621.c b/drivers/pinctrl/ralink/pinctrl-mt7621.c
index eddc0ba6d468..fb5824922e78 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7621.c
+++ b/drivers/pinctrl/ralink/pinctrl-mt7621.c
@@ -97,6 +97,7 @@ static int mt7621_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id mt7621_pinctrl_match[] = {
 	{ .compatible = "ralink,mt7621-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mt7621_pinctrl_match);
diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index 3e2f1aaaf095..d7a65fcc7755 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -41,6 +41,7 @@ static int rt2880_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rt2880_pinctrl_match[] = {
 	{ .compatible = "ralink,rt2880-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rt2880_pinctrl_match);
diff --git a/drivers/pinctrl/ralink/pinctrl-rt305x.c b/drivers/pinctrl/ralink/pinctrl-rt305x.c
index bdaee5ce1ee0..f6092c64383e 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt305x.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt305x.c
@@ -118,6 +118,7 @@ static int rt305x_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rt305x_pinctrl_match[] = {
 	{ .compatible = "ralink,rt305x-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rt305x_pinctrl_match);
diff --git a/drivers/pinctrl/ralink/pinctrl-rt3883.c b/drivers/pinctrl/ralink/pinctrl-rt3883.c
index 392208662355..5f766d76bafa 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt3883.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt3883.c
@@ -88,6 +88,7 @@ static int rt3883_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rt3883_pinctrl_match[] = {
 	{ .compatible = "ralink,rt3883-pinctrl" },
+	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rt3883_pinctrl_match);
-- 
2.37.2

