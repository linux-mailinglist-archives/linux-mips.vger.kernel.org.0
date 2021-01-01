Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0892E853C
	for <lists+linux-mips@lfdr.de>; Fri,  1 Jan 2021 19:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbhAASCb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Jan 2021 13:02:31 -0500
Received: from mx3.wp.pl ([212.77.101.9]:15288 "EHLO mx3.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727147AbhAASCa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 1 Jan 2021 13:02:30 -0500
Received: (wp-smtpd smtp.wp.pl 851 invoked from network); 1 Jan 2021 19:01:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1609524096; bh=HIpT57loM/D359P/pbmKMG1HGm2fEdWyvmtwCT4HXPY=;
          h=From:To:Cc:Subject;
          b=hMcJ61dW0OK3X54ur2C6/l4tUxoIjcYDBaxf9NMxP0lWrenOAe8kVcHhTJUDMnq3V
           DXOFRTnWg+lrHA2j8IdslXE6U9jDblraWfNoPBOq/mvDHoyIjwYZr7VO+7rIzTS0zQ
           xIVYY3BDXW+xC7DYMCttPuHsZjcmN81UdLzFjM6w=
Received: from riviera.nat.student.pw.edu.pl (HELO LAPTOP-OLEK.lan) (olek2@wp.pl@[194.29.137.1])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tsbogend@alpha.franken.de>; 1 Jan 2021 19:01:36 +0100
From:   Aleksander Jan Bajkowski <olek2@wp.pl>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org, john@phrozen.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway CGU bindings
Date:   Fri,  1 Jan 2021 19:01:18 +0100
Message-Id: <20210101180118.2496-1-olek2@wp.pl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                      
X-WP-MailID: 3a57721e6fe5fdea9d729c632e66e253
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [UeLH]                               
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document the Lantiq Xway SoC series Clock Generation Unit (CGU) bindings.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../bindings/mips/lantiq/lantiq,cgu.yaml      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,cgu.yaml

diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,cgu.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,cgu.yaml
new file mode 100644
index 000000000000..d5805725befb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,cgu.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/lantiq/lantiq,cgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq Xway SoC series Clock Generation Unit (CGU)
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - lantiq,cgu-xway
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
+    cgu@103000 {
+        compatible = "lantiq,cgu-xway";
+        reg = <0x103000 0x1000>;
+    };
-- 
2.20.1

