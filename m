Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E692AF682
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 17:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbgKKQaZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 11:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727042AbgKKQaW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 11:30:22 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B785DC0613D6;
        Wed, 11 Nov 2020 08:30:21 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id s13so2879816wmh.4;
        Wed, 11 Nov 2020 08:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=++PfnbZC3vsOjTMV4/QIsVDyqBcSjzMP5CR2moKEFno=;
        b=Pn3kYXiFRIsNDIc0VoRvWLQ213hh86evtZHmnOVhVlO7nm+VgjXp/5/s84XQYX1gjS
         YWjoheX+AzClRJFy0JKCxDOctMB6nJQg//fxWWowCETxgjTZyLvNJGcMTWgBUxjOWsmP
         yzSSK8n8wr2ybFbnFcTwdO6n9WVPi59BuoLiU4vstuopoQUhGELzxl+zdvUFe+ofobIJ
         5NYYUVPxk55kl2z1ecOyqOwbTB81tVE6PSMIRWafjdhOCfE4xDtAy73TXvlKY+ybp0k7
         7kT526hF5bNdxhbMVapHeRGAaDze8YoO1KUW1vaikc/AK5Uurcvh3fmE/x0nZVMEdQGi
         ddxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=++PfnbZC3vsOjTMV4/QIsVDyqBcSjzMP5CR2moKEFno=;
        b=TL42/WgScOw/uFoVZ3MoOspVgDY5lhv2PKmx2f/Q5qtxnzmZ0vaZbRsX+pv2RdsMAy
         mTw3gQXg+e9W6X+zKsfX8dVsB6OJkocXc3nti2OdBmyCxQLyFaTTT+5gbMahymd4Y5N5
         Dq6bxC4Ca7zeL3YWZwHTESRYqo4BtU67i7dBxqxTWFc8Thg3SW7G6mSuMs1mJR7b4wxB
         JWSJB8Yq8H0SZZucYI7e5AWqh/cKXZ2uo4WLAni5i4TS0p7y2UZ/iQEAwIwAmBufXuCH
         HUPOs3ix71HuqVODGwc7oJdcPoOGz6fJUDAublW9G6Xc8t3YuvdATNIq+i+mBggDqG15
         ZsSg==
X-Gm-Message-State: AOAM533tUw/GRwjEn/Qyz7PeVQ3RwW7dA81A/8DTEyKijcTeqh7CnF6N
        5AGiwn0SbHenWLFJR/SamV0=
X-Google-Smtp-Source: ABdhPJxRfdS1AHwmhYY7YyRU4ikpEOWoZLDu8QJOrgwRtShVfT2pkZcR2Cg4yJ5jy47XoPkgTYQvgA==
X-Received: by 2002:a1c:1982:: with SMTP id 124mr4970564wmz.74.1605112220494;
        Wed, 11 Nov 2020 08:30:20 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id w186sm3196753wmb.26.2020.11.11.08.30.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:30:19 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH 3/7] dt: bindings: add mt7621-clk device tree binding documentation
Date:   Wed, 11 Nov 2020 17:30:09 +0100
Message-Id: <20201111163013.29412-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adds device tree binding documentation for clock gates in the
MT7621 SOC.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/clock/mediatek,mt7621-clk.yaml   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
new file mode 100644
index 000000000000..89886b066849
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt7621-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT7621 Bus Gates Clock Device Tree Bindings
+
+maintainers:
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description: |
+  The MT7621 can gate SoC device clocks.
+
+  Each clock gate is assigned an identifier and client nodes use this identifier
+  to specify the clock gate which they consume.
+
+  All these identifiers could be found in:
+  [1]: <include/dt-bindings/clock/mt7621-clk.h>.
+
+properties:
+  compatible:
+    const: mediatek,mt7621-clk
+
+  "#clock-cells":
+    description:
+      The first cell indicates the clock gate number, see [1] for available
+      clocks.
+    const: 1
+
+  ralink,sysctl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the syscon which is in the same address area with syscon
+      device.
+
+required:
+  - compatible
+  - '#clock-cells'
+  - ralink,sysctl
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt7621-clk.h>
+
+    clkctrl {
+      compatible = "mediatek,mt7621-clk";
+      #clock-cells = <1>;
+      ralink,sysctl = <&sysc>;
+    };
-- 
2.25.1

