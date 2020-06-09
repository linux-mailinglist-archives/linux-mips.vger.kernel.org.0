Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B33A1F38B7
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 12:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgFIKxB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 06:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726886AbgFIKwt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 06:52:49 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C1FCC03E97C;
        Tue,  9 Jun 2020 03:52:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id q11so20790432wrp.3;
        Tue, 09 Jun 2020 03:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RN8qA9KeRPApUC9s9M9mqLxO489K/MfoAz940jHP23Y=;
        b=KQ/bjzvZAfoLGfoT12i5X6Z0l3Dwg03CsiU22jQmf6WO4U3kjZL6jNOLH3pVVe5Tnt
         RgELItRui03zlzAWxLo/jV5rJxyxBOuFMyhHq95/oZE+QMScFX8PFN05KO+6vMrd/Ykv
         Qn7A/jpMmd9UUj55yUg8OULwYyGSEvlRXeY5nh8S8XLpVk74TUNBRfPzrhlsZDukx7Ui
         RiVziKKAInDR5h0GQ/NjNmQhJadTxgBwgVwdw0Dzo3GZRWFRzyokoufLUNKWfOmrUKQf
         sqVPTK069lREajkxb04vUVcDRFSaGBrZA8DL8pbReeLepaXr4RVEEJclUttXLpYzFZ2h
         hWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RN8qA9KeRPApUC9s9M9mqLxO489K/MfoAz940jHP23Y=;
        b=F4wLR/KQ+8RTxmfwLkU8ExDEShJFVQMn40Eo3PaUUJKv0jp2I0/GUyvsMQoNRVdVia
         zkVAwZ3MQuNm32vhyKGJp/EWXj69baUaF8Upe+LDCurlTGRRzktDjQcaldhBRpye2FBP
         STf/br4SVnZKEz43uYtgHZg9VWvO+HW+GPlXlgekyRztcXgD0hZP0KPsof67ySxMgA1O
         3x3XMEI3WWPF5gcdjt3tuQtIr9DtfF9sBrGRrn5NMXOg3bdtnRrzPYEUxIXwSU6fmwJK
         aEn/xezto1IBG3sKEPR4gbhqHZsywiZWq6w0tZcbrUfMM5vyPYlrV0Kim1REROtaG9ma
         qibQ==
X-Gm-Message-State: AOAM531aQ+C6I2KDQGbmkljy5tQVmQeydtbyhMmfRVmEeXSaMEMMtx0z
        Ea4AHN7NyaWm7zsLXi7XJY9aByDbxM7P7Q==
X-Google-Smtp-Source: ABdhPJz4YtWMdIQH3Ns4x4rDx6zL4PJImYd9panLoTN08va8Aq47KKkXfkMIGis/Zhdd8xQK0JiL0A==
X-Received: by 2002:adf:ee47:: with SMTP id w7mr3661475wro.171.1591699967688;
        Tue, 09 Jun 2020 03:52:47 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id h5sm2949931wrw.85.2020.06.09.03.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 03:52:47 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 1/4] dt-bindings: soc: brcm: add BCM63xx power domain binding
Date:   Tue,  9 Jun 2020 12:52:41 +0200
Message-Id: <20200609105244.4014823-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609105244.4014823-1-noltari@gmail.com>
References: <20200609105244.4014823-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
to enable/disable certain components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 .../devicetree/bindings/mips/brcm/soc.txt       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Documentation/devicetree/bindings/mips/brcm/soc.txt
index 3a66d3c483e1..22ec9e39bff7 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
@@ -164,3 +164,20 @@ Example:
 		reg = <0x4067c0 0x40>;
 		interrupts = <&periph_intc 19>;
 	};
+
+BCM63xx
+-------
+
+= Power domain controller
+
+BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
+to enable/disable certain components in order to save power.
+
+- compatible		: should contain one of:
+			  "brcm,bcm6318-power-controller"
+			  "brcm,bcm6328-power-controller"
+			  "brcm,bcm6362-power-controller"
+			  "brcm,bcm63268-power-controller"
+- reg 			: the register start and length for the power domain
+			  controller block
+- #power-domain-cells	: must be 1
-- 
2.26.2

