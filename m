Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8994E1F59E4
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgFJRQy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729622AbgFJRQn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:16:43 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255EEC03E96F;
        Wed, 10 Jun 2020 10:16:43 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y17so3151394wrn.11;
        Wed, 10 Jun 2020 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Z5HmDtV/uFdRn9AN/WhBRbcRr/O4rtkluxMrfIJN0s=;
        b=fd37f0BFKkT2dMXloiiCDGGxDqQW2UM1Gqs9hsUCTJHrIMsznCmrphGvKwLWSf09OQ
         FZ/PU8zWotSr3ZdZH7s5eCn52gzfXfr1tjeLXFII3k8ooBcolu00v3pdmXRkZpE/6Eaf
         f+R5cqW6M2mDLdCgRCgsApoEaHi7nq6Z2Jh0J2fq+wz8lsI5sKHAcmsLlfjBNTbUGFJ8
         UlFI4Q5hsHzNVI+Wa9bXfTDbQs+8uGOyAubuoeQFhW6MKjVU7RFOCyVXFAlLQGNmrhkr
         nqOB0STrqyWMkEFMeBGi5OPuxgM7ZMqfgfIfC4BTeaUP3BVZgnMSvkLgiSVs2pOFsU2a
         FFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Z5HmDtV/uFdRn9AN/WhBRbcRr/O4rtkluxMrfIJN0s=;
        b=QDxEuoGrJFDTpRw1fL43m6ElKy1YOxJUS8IB4IuWxXeQj49QSP18kZE8T3141pEVUr
         M4Ov++UiLafyf0Ah4XBP7EHgIWIeWzGJMbRCverdx9RfUwJyR199xArJ6NOkYLeGZRLG
         IFQf9oLfRZXJF0a7GvW8j8cFrZJoiwItsWDXMtCoqdWEKCVwztEs7ari/fWiO63VJ/5m
         YmFzrMiy+OK8MLLIpmvvIhQgtUiIko3XofqEGPWI2Y0YV5rhZ6q5swMrbJLzbPvqQQqJ
         QzbRZQtPPK/j/RvVgY4qvjsu71yNd+iikBJokUAjkMPo+IuarXiFOWt1OcCMFaI1s0SE
         /VIw==
X-Gm-Message-State: AOAM531aoTVXesQPvS/kIfszkDf6TPLn8l5xabL9G9b1hUQBYGPMqHxH
        9zC5UvzrYPxA1jAPtUgqeD8=
X-Google-Smtp-Source: ABdhPJwwhcrMFSDWf49dyge+OJdhoE3YU2B7KXd0sYZzv3guwN9R5Sp6bftxIqpZxmqZXOYSfjIbcQ==
X-Received: by 2002:adf:cd08:: with SMTP id w8mr4763720wrm.36.1591809401794;
        Wed, 10 Jun 2020 10:16:41 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id f11sm589048wrm.13.2020.06.10.10.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:16:41 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 9/9] mips: bmips: dts: add BCM63268 power domain support
Date:   Wed, 10 Jun 2020 19:16:30 +0200
Message-Id: <20200610171630.465579-10-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610171630.465579-1-noltari@gmail.com>
References: <20200610163301.461160-1-noltari@gmail.com>
 <20200610171630.465579-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM63268 SoCs have a power domain controller to enable/disable certain
components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v3: Separate dt-bindings definitions from power domain .dtsi support.
 v2: Add dt-bindings header files.

 arch/mips/boot/dts/brcm/bcm63268.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index beec24145af7..5acb49b61867 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -117,6 +117,12 @@ leds0: led-controller@10001900 {
 			status = "disabled";
 		};
 
+		periph_pwr: power-controller@1000184c {
+			compatible = "brcm,bcm6328-power-controller";
+			reg = <0x1000184c 0x4>;
+			#power-domain-cells = <1>;
+		};
+
 		ehci: usb@10002500 {
 			compatible = "brcm,bcm63268-ehci", "generic-ehci";
 			reg = <0x10002500 0x100>;
-- 
2.26.2

