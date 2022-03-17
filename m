Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1A24DC50B
	for <lists+linux-mips@lfdr.de>; Thu, 17 Mar 2022 12:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbiCQLyY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Mar 2022 07:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiCQLyX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Mar 2022 07:54:23 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E0B1E3E36
        for <linux-mips@vger.kernel.org>; Thu, 17 Mar 2022 04:53:05 -0700 (PDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DBA4B3F499
        for <linux-mips@vger.kernel.org>; Thu, 17 Mar 2022 11:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647517983;
        bh=GjViklxymlU9oUxXKXReSCbCv0V/xFiwY5UUrPDATe4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=vAAd6IWaOt4QUZcApT2vABV+/FwRZHLb8W1dNubntdygx93k1qlKGdEiMGYWP8ZGN
         +SagSRoEFc5KorD6SS0rcBumPdZcRXmKgjLxL5cF1oB32BHi+fLy8B2mTZroABNXn6
         zDlgRWJmECFgufwODrqaWjYk9YzQ7RnbUo4tTPQgoHXpP2EPd5Wb9foiLLMn3i1LJg
         7NrzjtxZ3dbBpELlI1E2EK5KjSyICJCFQuCWQ2xBUzw1AWzNdHDlHyAO/KLeD8AbsG
         /4UuJSYJCZi5nDm28kcEN3pNKXwqb6MDqayb040liHiYqqk1HUDKhvqYTICCYxnlnR
         j8a1VnaZMYsKQ==
Received: by mail-wr1-f69.google.com with SMTP id 15-20020adf808f000000b00203e488fa4eso989581wrl.3
        for <linux-mips@vger.kernel.org>; Thu, 17 Mar 2022 04:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GjViklxymlU9oUxXKXReSCbCv0V/xFiwY5UUrPDATe4=;
        b=f65h4V5+JBFkiG4qmUj8YWG+5TMIRWMtaceRJmest/jW2yckOWpByfBVyoZc61GgUO
         gi8fo+q4ONET9qyRKJCKlXNncpAZkGqqH+B0V1Lbj4JMFX4lnzzNoNZ+XGHy52oPoe4i
         tkNWvzrUpIbTXwPCbbcxzmsrfzzLDRngvahsPXr66JUd3sgmcv5+wVOx4/dqUt9RxG5W
         PGtvzGaxkf5xPr9t5g61ji26C2jQCxJTK8j3DC7AhEsMzITvNIIVkk+8rminXl5jTfzP
         W3L7JRcJMSVCtk92yMK7majw0oD+3POmvkROIsafmEzFwHwQ9RV74zFBd4qHWSsedmVA
         V1EA==
X-Gm-Message-State: AOAM532unAcW8DUarumbI+CCaMvhv1i+urPc1fOcxfRMOWYQV/RUeL39
        ac2CmeSq8jS7jwkQq/U8TeZRTnOIjXM+5wfQzm3Zqu1KBrywEZRcCoT9EEwHQUuovs+dBQcgmNU
        L+pn6LJBP4st+4vndikDE7vPWH2fXQ4TVZfd4PZo=
X-Received: by 2002:a05:6000:1a8b:b0:1f1:d8f4:4aa with SMTP id f11-20020a0560001a8b00b001f1d8f404aamr3854710wry.238.1647517983560;
        Thu, 17 Mar 2022 04:53:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/DM8yJ+E/5dtwBBWinZJdW8tjig7HKoZ0ZwEWjp3EJbHwbEfzlppwLm7ESNbDHke+EN+0lQ==
X-Received: by 2002:a05:6000:1a8b:b0:1f1:d8f4:4aa with SMTP id f11-20020a0560001a8b00b001f1d8f404aamr3854693wry.238.1647517983347;
        Thu, 17 Mar 2022 04:53:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d698c000000b001f1d8bb4618sm5397351wru.36.2022.03.17.04.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:53:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] MIPS: ingenic: correct unit node address
Date:   Thu, 17 Mar 2022 12:52:59 +0100
Message-Id: <20220317115259.448868-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Unit node addresses should not have leading 0x:

  Warning (unit_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should not have leading "0x"

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 3f9ea47a10cd..b998301f179c 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -510,7 +510,7 @@ efuse: efuse@d0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			eth0_addr: eth-mac-addr@0x22 {
+			eth0_addr: eth-mac-addr@22 {
 				reg = <0x22 0x6>;
 			};
 		};
-- 
2.32.0

