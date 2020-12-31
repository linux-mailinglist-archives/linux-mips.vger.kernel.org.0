Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 764482E814D
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 17:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgLaQwj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Dec 2020 11:52:39 -0500
Received: from mx4.wp.pl ([212.77.101.11]:9861 "EHLO mx4.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726550AbgLaQwj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 31 Dec 2020 11:52:39 -0500
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Thu, 31 Dec 2020 11:52:38 EST
Received: (wp-smtpd smtp.wp.pl 38758 invoked from network); 31 Dec 2020 17:45:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1609433106; bh=qKYUAWch0jVyKMYNOmfsYKPYB5U88iU0KQ9NboXS05I=;
          h=From:To:Cc:Subject;
          b=oTbOphPln8ydFOImuTgAcXyFd3DXKzbAqIMnBaiK1cSovPpp5kV9efR7dZckUMoqk
           U3UAGWAH7RbAnrWDl1Mw12o28lBUmj7/JxZ2V94gjJSNf5EwtwVUBRg+OOfOGSK/3o
           CjYzLSE8tqOsmc22NidiSKtF+hOlfWqc1Ll+mtps=
Received: from afrk207.neoplus.adsl.tpnet.pl (HELO LAPTOP-OLEK.lan) (olek2@wp.pl@[178.42.192.207])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tsbogend@alpha.franken.de>; 31 Dec 2020 17:45:06 +0100
From:   Aleksander Jan Bajkowski <olek2@wp.pl>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org, john@phrozen.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway PMU bindings
Date:   Thu, 31 Dec 2020 17:31:53 +0100
Message-Id: <20201231163153.4512-1-olek2@wp.pl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                      
X-WP-MailID: e441b184dc06375e847228df27a8767d
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [YbK3]                               
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document the Lantiq Xway SoC series Power Management Unit (PMU) bindings.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../bindings/mips/lantiq/lantiq,pmu.yaml      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,pmu.yaml

diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,pmu.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,pmu.yaml
new file mode 100644
index 000000000000..4982b458ac12
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,pmu.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/lantiq/lantiq,pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq Xway SoC series Power Management Unit (PMU)
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - lantiq,pmu-xway
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@102000 {
+        compatible = "lantiq,pmu-xway";
+        reg = <0x102000 0x1000>;
+    };
-- 
2.20.1

