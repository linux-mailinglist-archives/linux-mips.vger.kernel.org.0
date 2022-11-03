Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23738617B58
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 12:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiKCLHI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Nov 2022 07:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbiKCLHG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Nov 2022 07:07:06 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC33CBE18;
        Thu,  3 Nov 2022 04:06:57 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id s24so1706035ljs.11;
        Thu, 03 Nov 2022 04:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/BTcWVjtXSZSkCQ1GALEBnjM9+/hwTFKKg35iMvIMGY=;
        b=oud1g9ZMqLDjFKnJw3i6rvN0O4t7lBu/3LHPl3VqpSNLNxAfYh163km8ZYY8kZaSIF
         BN280xffsYQ0VuhCepliSlEiUADM0HAiwykfvKkJ2XV7XeQzM0CkIwp9gmGmKog58q5B
         GsJ3TpN0gCIXw1nWa+ANf+E7M7AU2i5fS8ZJ1axQRwVXDhSBz4G4byYtEOpKqsRT9naX
         Uud5LZypcMJzgZ37SjcGwvw20GwH3l2Mc/fV+YUyvZQw9k/F+qyNX6i4YMdJYjiHXkxs
         wkg4uQCd7es1fowvp2JTVvupaF+nF5DE5RvpoLXk03NFN5biaX35ks7Ld/wUg21j6Vq3
         Jqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BTcWVjtXSZSkCQ1GALEBnjM9+/hwTFKKg35iMvIMGY=;
        b=Vg52wjmRqFISKyosX66XcXqnPTCESPv6DJqewIjXpAWkwzou4gdWs7Lk3yQ3mrfUu9
         cp3s2b9NXhPSSvTnLMfld4ifAQ6pa+DNjNp5p0BYxSgQAi3Tk2x3bfZgkvMS0DHWKa2h
         TrFvVhMkg0MJQ7M0hcvGpSSpJvQGXhV4mfWTRrtlGjpzcT5J3JhhXo8Q/zbsT2hnesoH
         4jLM9EO6NSK59KphJwLgQv3lSMX2pgsu7hX+yYKjM9LNqK3Ta4KR3+uH2MKNLTH+yRMz
         16t1wvPFnGsJCVujuP5Wim9RtSVDu7jgA+iqVCxRUFre7ZMHw4wYloLTPMCKQxP+YiGS
         IhgA==
X-Gm-Message-State: ACrzQf2zM5PXXY6jXeFe5BgEZ5X7J7jKe4TzzwQsJR/ANBuwzqjRoF6A
        I63EY7toN/hHuFEQXfDBoPQ=
X-Google-Smtp-Source: AMsMyM43QOm7yilsbK6QKwf2hny+JmUTPdBUCm8RW/zJJKj54JuHUVLK0zMH45002kgfr1MNhvBvLw==
X-Received: by 2002:a05:651c:12c6:b0:277:124e:ce05 with SMTP id 6-20020a05651c12c600b00277124ece05mr11757310lje.38.1667473616170;
        Thu, 03 Nov 2022 04:06:56 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id 2-20020a2eb942000000b002773a9b5898sm52611ljs.138.2022.11.03.04.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 04:06:55 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mips: dts: bcm63268: add TWD block timer
Date:   Thu,  3 Nov 2022 12:06:41 +0100
Message-Id: <20221103110641.22305-1-zajec5@gmail.com>
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
---
 arch/mips/boot/dts/brcm/bcm63268.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index 8926417a8fbc..b55cf84ba114 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -110,6 +110,11 @@ timer-mfd@10000080 {
 			reg = <0x10000080 0x30>;
 			ranges = <0x0 0x10000080 0x30>;
 
+			timer@0 {
+				compatible = "brcm,bcm6345-timer";
+				reg = <0x0 0x1c>;
+			}
+
 			wdt: watchdog@1c {
 				compatible = "brcm,bcm7038-wdt";
 				reg = <0x1c 0xc>;
-- 
2.34.1

