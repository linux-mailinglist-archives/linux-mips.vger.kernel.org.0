Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906741F5922
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 18:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730699AbgFJQdJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 12:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729090AbgFJQdG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 12:33:06 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0938BC03E96F;
        Wed, 10 Jun 2020 09:33:06 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id p5so2983087wrw.9;
        Wed, 10 Jun 2020 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nuTrMyPkP8MX6Ctw/wkm1vrkYcKiiG7dPPujumR0X/U=;
        b=mU/hjbecbmsx+TmGH/jpg89IQXVoFggdbi7MB1DbtKv3rXmOMSi+0mRs6ISX9LAxby
         zEhc3wG4392ERUyjTlV+hqk/v+scR7Usc3i1x4BuVrMX/fs99Ten8MeOWoqe+NENf61B
         u7BiCBjgoNYSaM/cnJvhe5HssaYn/7kNEk0sfrqbhYzB62DKLoqdfK9PSl5fw7imbtVP
         9YpgANzvLUh2sT/lrBJn0K9QSstXqSpcCOqW/gXqjMDKh1qXoX4ym707+xGhKf3hkZxS
         +aCIWiazh/8fABSt8hBsF+zgzSJz/CwVn6ky9ukWq3nuKhTwyLKA0l8KitiEFnSFRNrN
         Ni4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nuTrMyPkP8MX6Ctw/wkm1vrkYcKiiG7dPPujumR0X/U=;
        b=VhQ136FzRHR/thidxLQV5ad4fH7JoMoLWSvgafdFWGHxgl2eq6m/AcSx6DEvlQqI0Q
         bfJM/RVlsgYt2muJEEFdnJa684pxooH9XuLbmkSaCPGrsPgzYvmBx0r38+rZBEnKMgxI
         YJHqIS49zcbqlfD7V5T5IJE0o/i/IbwsSl1eMykZUj0+fHtF8Sq1vkt6yuh3CntUzxu6
         FcRB5eGrugJLYf/2AmX7c+ARFK8sLqdk7sv83KpFN2WS+6HZ/StIP1qShPtDDl1MmAIZ
         ZpdKvH9mT0lrjtF1CKPgbiVqqnYemO6bU7HBVmxjo+HYXFaegB1o4e4CEH90trLZ4syL
         qyzQ==
X-Gm-Message-State: AOAM531e6Igbw4spO+hNXbf/hS7RZUzI508mCVF9AaPGU61k2EyKLCqz
        BYtsTF7x8hfBbVvQKA8KgTs=
X-Google-Smtp-Source: ABdhPJy6FeF0fIzTTPvA7eNZR972kcMsDLstcxKXuRRBGYYZhynPqZ29GEHX9kxA1ZspIZQi8jgSZQ==
X-Received: by 2002:adf:a1d3:: with SMTP id v19mr4609426wrv.245.1591806784588;
        Wed, 10 Jun 2020 09:33:04 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id t7sm414430wrq.41.2020.06.10.09.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 09:33:04 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 1/6] dt-bindings: soc: brcm: add BCM63xx power domain binding
Date:   Wed, 10 Jun 2020 18:32:56 +0200
Message-Id: <20200610163301.461160-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610163301.461160-1-noltari@gmail.com>
References: <20200609105244.4014823-1-noltari@gmail.com>
 <20200610163301.461160-1-noltari@gmail.com>
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
 v2: Add separate YAML file.

 .../bindings/soc/bcm/brcm,bcm63xx-power.yaml  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml
new file mode 100644
index 000000000000..804d8b31679e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/brcm/brcm,bcm63xx-power.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: BCM63xx power domain driver
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+
+description: |
+  BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
+  to enable/disable certain components in order to save power.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - brcm,bcm6318-power-controller
+          - brcm,bcm6328-power-controller
+          - brcm,bcm6362-power-controller
+          - brcm,bcm63268-power-controller
+
+  reg:
+    maxItems: 1
+
+  #power-domain-cells:
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - #power-domain-cells
+
+additionalProperties: false
+
+examples:
+  - |
+    periph_pwr: power-controller@10001848 {
+        compatible = "brcm,bcm6328-power-controller";
+        reg = <0x10001848 0x4>;
+        #power-domain-cells = <1>;
+    };
-- 
2.26.2

