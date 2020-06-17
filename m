Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B901FCB66
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 12:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgFQKva (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 06:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgFQKur (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 06:50:47 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C18C061573;
        Wed, 17 Jun 2020 03:50:47 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b6so1798083wrs.11;
        Wed, 17 Jun 2020 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qQJgp5b20r5k0LA/LVVPpe+99DLC0mJjRrQE7xjRrQQ=;
        b=g7L/xEGV+EKnA5f9Z5rXhGpZID7ctLiQoraF/ztZa9a69HCsJTPWahi6B5pa9xegSU
         jXbyE8Nq6WJPG/EWU0iCwrRMQUA/zGf7RTWzl7sY6b7vo2gE3NiCUbJ39H9MxW/uueHk
         F7jfTIWIgns/ZQOefWjsFNgKMmh3/K29WV1tjZ9fYroAdgUiDQK//ucQXgG74xi0NdAX
         pqLSDpo5ACmkVcxUl6Hd5jK99m79ccLLj6EBmwn39dJHFklBtzeTe5lrZfYq/8KA1OAa
         Wggpgc+Kg0zi6lm1HW9t3Lr12zp3q+g1jO5Gvgf9RDpxHCKb6ovbQZNLGLCpsCoNeZl5
         Zj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qQJgp5b20r5k0LA/LVVPpe+99DLC0mJjRrQE7xjRrQQ=;
        b=fCxgL1sQ11nopr105VHribEALNLxao6Ax3IfiOzd5sAZCfqN9YqbEadlU/xt2zjTRl
         K46d2LOIqw6gDpk+fb6zJJg0j1pb9qfSvcnxSIJjHeGH2fsF/tbsgwjSMBQnmcJKalBo
         473zBxc2Kj7ZeCpFq+KpEDReDlxYddSTwcSlpTaONnF5b4mNTX7kKaiyqWH//APFIaMq
         CbeQ/bKFJt7rBg+fiV+4/AowQQxV03gN/1eHrSPn1myVzy8Bl2kglvSUduxHUMM8xOho
         meoEdZUYBuKf+mvxlX+JLV7zfKdP9fsObqrsUBXmbLPnSsQ0yP5oZ/ihoKnVwOyDCxdF
         O+Iw==
X-Gm-Message-State: AOAM530ZHj0eXpowuRRTOLBkMA6Jb+u6/3dt8ktNZep+xGwvvyOVPP5Y
        j41HK2U/Ch0kCYge0rW4eyY=
X-Google-Smtp-Source: ABdhPJzprWvXqQ1HU2QZnhKEZj6jDziADTekaMLEOaEzPXRIBGtdMYLtluaGzPSpZKUSEFBos8kXvw==
X-Received: by 2002:adf:f5d0:: with SMTP id k16mr8279380wrp.288.1592391046041;
        Wed, 17 Jun 2020 03:50:46 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id u12sm33331927wrq.90.2020.06.17.03.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:50:45 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v7 2/9] dt-bindings: reset: add BCM6345 reset controller bindings
Date:   Wed, 17 Jun 2020 12:50:34 +0200
Message-Id: <20200617105042.3824116-3-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617105042.3824116-1-noltari@gmail.com>
References: <20200617105042.3824116-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add device tree binding documentation for BCM6345 reset controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v7: no changes
 v6: no changes
 v5: no changes
 v4: change license and fix maxItems.
 v3: no changes
 v2: no changes

 .../bindings/reset/brcm,bcm6345-reset.yaml    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
new file mode 100644
index 000000000000..560cf6522cb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/reset/brcm,bcm6345-reset.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: BCM6345 reset controller
+
+description: This document describes the BCM6345 reset controller.
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+
+properties:
+  compatible:
+    const: brcm,bcm6345-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@10000010 {
+      compatible = "brcm,bcm6345-reset";
+      reg = <0x10000010 0x4>;
+      #reset-cells = <1>;
+    };
-- 
2.27.0

