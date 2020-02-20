Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D14516573F
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 07:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgBTGAr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 01:00:47 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:55158 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbgBTGAr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 20 Feb 2020 01:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GGaI48ID+RANcSnbSgDavldeijLO9g3YzgPX5PpG8fI=; b=ijPjguYP7Zt3epKkXf4L+PGD+o
        c+7c8P7oEmieCGXVUeVhZ101mqBnhqONhJq77kzfHl8hPbqjKpo8xLDgv4o5TGAq69fdqMT2s9ngz
        W09rbd2kuPFK4ID32zV4qssJsccAQbsrg0mY64zEXMykYKf5nYgxRwT3hKFCbaODPYak=;
Received: from [77.247.85.102] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1j4et8-0002hm-8L; Thu, 20 Feb 2020 07:00:42 +0100
Received: from andi by localhost with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1j4et6-0006jD-Nf; Thu, 20 Feb 2020 07:00:40 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH RFC] Bindings: nvmem: add bindings for JZ4780 efuse
Date:   Thu, 20 Feb 2020 07:00:01 +0100
Message-Id: <20200220060001.25807-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CFE9AEF5-FFF9-44A9-90D8-DE6AC7E7DD4F@goldelico.com>
References: <CFE9AEF5-FFF9-44A9-90D8-DE6AC7E7DD4F@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>

This patch brings support for the JZ4780 efuse. Currently it only expose
a read only access to the entire 8K bits efuse memory.

Tested-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
[converted to yaml]
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
I will not update/maintain this, just have the impression that here some
more work is needed to make somebody comfortable with yaml than stick
to the usual pointing to documentation and I have not the ingredients 
for doing
cat  Antihistamines >/dev/brain ;-)
and I do not want to see the other patches get lost.

 .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
new file mode 100644
index 000000000000..ad56c17b0bd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/ingenic,jz4780-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic JZ EFUSE driver bindings
+
+maintainers:
+  - tbd <tbd@tbd>
+
+allOf:
+  - $ref: "nvmem.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - ingenic,jz4780-efuse
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    # Handle for the ahb for the efuse.
+    maxItems: 1
+
+  clock-names:
+   items:
+     - const:  bus_clk
+
+required:
+  - compatible
+  - reg
+  - clock
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+
+    efuse@134100d0 {
+        compatible = "ingenic,jz4780-efuse";
+        reg = <0x134100d0 0x2c>;
+
+        clocks = <&cgu JZ4780_CLK_AHB2>;
+        clock-names = "bus_clk";
+    };
+
+...
-- 
2.20.1

