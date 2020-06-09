Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD481F4015
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 18:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731100AbgFIQC4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 12:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731090AbgFIQCw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 12:02:52 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC8B8C08C5C2;
        Tue,  9 Jun 2020 09:02:50 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c3so21896794wru.12;
        Tue, 09 Jun 2020 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jQCktjAhwsdDH0SpUwBS0maLAhUFCTSeJiilbxgLKcY=;
        b=iuM6+0lHJ7AUQQDyj/N5XZmOt7OhNo6duD4sqLLxvKHuaLEoGsSS2yrj/khZw537um
         W+81M9vov9GyIykB8/hyI+VdkIfwDEqpWY589ZXDbMLVAmTSYzSjjJt/fQpXZvK4igYo
         Fw8eqNmsa0+TJadQsoJ6ZYtpid2mgrqmmBlypTTHdgbQImScyg1D1TNqoZ2lgYmtplYA
         nchVe9G6SvKZP3Y8V+kZo6A7B8F8SBp7oQEhitSJJ1+Py370TKelEoHzGLJfPAAh1xu0
         CGD3At7lptPm74pWw74bpFkHsTOLd6XwOxmnXG+DhiXtBQ65uPKW/SrC3mKa3MMdpRYM
         tOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jQCktjAhwsdDH0SpUwBS0maLAhUFCTSeJiilbxgLKcY=;
        b=m0yryEA+88bMm2ozTSzn/UyJFam7Eki6a/0MNpmv+JeuWMWjFxXXMk+dDrJZr3Vnmh
         zzW8zlN8W2JIN/SOJuXwcP2lhP05ImUP28h06rd4E8ecyUuYIcABmBbsXoLvGgaXBqIM
         WomLJsRoqscZUVMTudeNJVXIhemE+J/F/K8kCR9gXwTPiY0YB72qT1F1EQ/rUixC7Bz/
         iMm7tceyK98pgy73SD4zim3bg+5B8/SQzZpj6BKKs9UM9lwKEqr2GHko1XsECuCgU2l6
         RsqhlwuH8k8l6rbpWhFkmTetHrKUCCjAYBSZuqk8qUq2Qq2XESgCGNosrxmoqb5HCQac
         5tGA==
X-Gm-Message-State: AOAM531oWbO9rLubUOR0HCQHiAPiy9a9dPnbM7Ei/U+8mVMQvZOEeEic
        fg5nridEe3JnF59R6y4eXBs=
X-Google-Smtp-Source: ABdhPJxRSt1KSfU3+6L0/kPkfMXR/VHjK0qxWW6OFi0yT+TX0jOvnZiXilAdApO7VAiLMfUorKH5Jg==
X-Received: by 2002:a5d:4a0d:: with SMTP id m13mr5596168wrq.12.1591718569456;
        Tue, 09 Jun 2020 09:02:49 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id y14sm3341864wma.25.2020.06.09.09.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 09:02:49 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 2/7] dt-bindings: reset: add BCM6345 reset controller bindings
Date:   Tue,  9 Jun 2020 18:02:39 +0200
Message-Id: <20200609160244.4139366-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609160244.4139366-1-noltari@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for resetting blocks through the Linux reset controller
subsystem for BCM63xx SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: no changes

 .../bindings/reset/brcm,bcm6345-reset.yaml    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
new file mode 100644
index 000000000000..eb3f2182e631
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
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
+    maxItems: 2
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
2.26.2

