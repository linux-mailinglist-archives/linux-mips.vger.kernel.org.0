Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90C8B626EA4
	for <lists+linux-mips@lfdr.de>; Sun, 13 Nov 2022 10:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235276AbiKMJJU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Nov 2022 04:09:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbiKMJJT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 13 Nov 2022 04:09:19 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 214E511C3A;
        Sun, 13 Nov 2022 01:09:18 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id i10so13037096ejg.6;
        Sun, 13 Nov 2022 01:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hdmFyrxH9KBgUJy2hTLc21pkrAs2hfwxAf5+zY1YFck=;
        b=W2rhpb9dqHDTWZPBaSQD2aj2is28lAxya16Pmp3K4hSzT/DUPDYMAHDr3GF4BaR3F0
         Pj2SygikL0TCh6bqLN+47qXLsydcV2wJnHn/AKoT27Kupdu7rq6dA6OxRkoCthqDpXUV
         /QIkSeLHHGwk2fnRbLOhGcjzOwyl9MPJ752V01UiZ00CcH+xutjIi6fdEMdBSpWzu00k
         j0LkttyohlX8Euz2Jtkg08PAq7U4CLpClqAqpeWNAVUn9jRT4DPOxjfyCx0bk/TVvKDC
         Ig9KRXOV6xVmnff08gEV5voppY/STdCXhArX/LywooGrL/CL5anxXFZ8x2vvEKkBqT30
         ULrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdmFyrxH9KBgUJy2hTLc21pkrAs2hfwxAf5+zY1YFck=;
        b=cBsvm1lfkWTYw5XaEevRHCtRoNDA7jqROtdC4zkMvFjWLmzdGyVuYJiZQyGBRAYIbb
         tu4eABXMqAePXeN1wnFS8dQe6BGYIP8HhK2MAptaN6Wh2rdlQgKOEGvkKGIOS4Ar3DWS
         ghqSbk7HhXbwrXGUZeAEf+9c8c43WW+BKbCVxT6VzIUUxS79uwlR53JVQCm1AcQ/Vp0o
         WUKZhgmU6rDRAoPNi/zy9lhL4hUmY5TbCDdnwXoBnB+bAIXCaCLoMYs3bVYjVGHZGYFn
         M2LwP/SrqE2a46fbwOFXG/95p6k1Tnw7EPRuxMZk24UTAW+XiyV9+ljiTeFn6Dz9RVE/
         nRXQ==
X-Gm-Message-State: ANoB5pmug6n870Ls16PJRU8ZpyfatR5XrJBhkvdhqzoZSiCQyp4EybTl
        hQi9zAWTpKIHEZgPCFLZo9E=
X-Google-Smtp-Source: AA0mqf6LkwqQU9h0H5HQVk864rKO/Muc3cQgvHwOfMKXgIRdw5U2W5RvNPCe5EjZKOpdPJjqvMMuSg==
X-Received: by 2002:a17:907:674b:b0:7a2:b352:a0d3 with SMTP id qm11-20020a170907674b00b007a2b352a0d3mr7022393ejc.399.1668330556520;
        Sun, 13 Nov 2022 01:09:16 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id ew13-20020a056402538d00b004642b35f89esm3300203edb.9.2022.11.13.01.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 01:09:15 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] mips: dts: bcm63268: add TWD block timer
Date:   Sun, 13 Nov 2022 10:09:04 +0100
Message-Id: <20221113090904.8784-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

BCM63268 TWD contains block with 3 timers. Add binding for it.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
V2: Add missing ';'
---
 arch/mips/boot/dts/brcm/bcm63268.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index 8926417a8fbc..c663efce91cf 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -110,6 +110,11 @@ timer-mfd@10000080 {
 			reg = <0x10000080 0x30>;
 			ranges = <0x0 0x10000080 0x30>;
 
+			timer@0 {
+				compatible = "brcm,bcm6345-timer";
+				reg = <0x0 0x1c>;
+			};
+
 			wdt: watchdog@1c {
 				compatible = "brcm,bcm7038-wdt";
 				reg = <0x1c 0xc>;
-- 
2.34.1

