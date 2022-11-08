Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF8C620B7F
	for <lists+linux-mips@lfdr.de>; Tue,  8 Nov 2022 09:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbiKHIuq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Nov 2022 03:50:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233681AbiKHIuj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Nov 2022 03:50:39 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451C42E683;
        Tue,  8 Nov 2022 00:50:38 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id k2so36772524ejr.2;
        Tue, 08 Nov 2022 00:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w0n10CzsZUUxFcmUjhE4yWbFLhcZbhAP4KcpYcEywCY=;
        b=QW0Krfd49YlhRsqSpEJSBDsAV+LXFNv9eZsUyDj6rQjTz8iO/ApJdc7UW7ZEaFfJVt
         MJhKCoceyU+OnaCreV+mqwIG+1L81AOYCAxd2OgMPcF0xfZDQ7bWZHJxL+tyl1GPxTWf
         ham9k3bssv3Xb3DY7MA/lyUtSWzdvah3qnLBE4CPFORYavezFvZWE0WoTNu70rv7CdKE
         T3wbm0YIyR2MYJYs8If+BzmsMXMow9md8yS/9VGHoDB0ArvOyrZO6MCOR2XC2TO0CBgg
         xoFZLEYLunlqQLdqE467aL509jBV+vivSmZj0eS5XfWdy2JeoAIUoEPb1LaQjsnDaDjV
         VBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0n10CzsZUUxFcmUjhE4yWbFLhcZbhAP4KcpYcEywCY=;
        b=hTmLuuqNyNKhugwZU2YCHE6mgL3MfGYmYIgc2T27WHFy08thT86TiA2aZg3OM5pO7Y
         KKYP8bVgQdq0bGn3RRXue/obyGddCI38uq5KeBGii17G1DJeZPC9niD7aV1+vZRNGzJ5
         IPg0FofNkdQv2xjP/z1Xfp0e/ZPY4sU8sMFrBOJfJJz8EhNZwFlqaQ2rx6+MMk+XtGWc
         xof4hGoaNKNe4IwlmkPN8BLF1HNFqxjE3VYzAi9MquChSheyjCyyfmrwmmkoumeQKa21
         zoaKlkPMkKEuUJgrGtwRSgauF6aOAXyTiuQ4FnDsmzr0468qfPobvQk2M1GfM4W9XuwO
         YDiQ==
X-Gm-Message-State: ACrzQf36KUFLOJupjhD9kH6WQlMy4FUnNB+FKqt8I9uKH5caQSWl03ay
        1kbjuuZa613kOn/WfY/QJQw=
X-Google-Smtp-Source: AMsMyM4W1QOPKIz2N+H3NcVKZbRaHXo7P14zKsxtm0HFnMrcXc23Tiyvx6IyS9lbI4zHZF5Te1B7sQ==
X-Received: by 2002:a17:906:9602:b0:78d:b5be:e5f with SMTP id s2-20020a170906960200b0078db5be0e5fmr910771ejx.601.1667897436542;
        Tue, 08 Nov 2022 00:50:36 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id lj18-20020a170906f9d200b007adade0e9easm4368043ejb.85.2022.11.08.00.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 00:50:36 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mips: dts: brcm: bcm7435: add "interrupt-names" for NAND controller
Date:   Tue,  8 Nov 2022 09:50:32 +0100
Message-Id: <20221108085032.4609-1-zajec5@gmail.com>
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

Second interrupt can be DMA or EDU one. Specify it explicitly using
interrupt-names property. This matches documented binding.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/mips/boot/dts/brcm/bcm7435.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index 8c001b944c8b..cfdf9804e126 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -422,6 +422,7 @@ nand: nand@41c800 {
 			reg = <0x41c800 0x600>, <0x41d000 0x100>;
 			interrupt-parent = <&hif_l2_intc>;
 			interrupts = <24>, <4>;
+			interrupt-names = "nand_ctlrdy", "flash_dma_done";
 			status = "disabled";
 		};
 
-- 
2.34.1

