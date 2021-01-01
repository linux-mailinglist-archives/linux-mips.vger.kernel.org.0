Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE1C2E85C1
	for <lists+linux-mips@lfdr.de>; Fri,  1 Jan 2021 22:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbhAAVi7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Jan 2021 16:38:59 -0500
Received: from mx3.wp.pl ([212.77.101.9]:21876 "EHLO mx3.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727277AbhAAVi7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 1 Jan 2021 16:38:59 -0500
Received: (wp-smtpd smtp.wp.pl 735 invoked from network); 1 Jan 2021 22:38:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1609537086; bh=JpjxtgcoQCj4Jkgnu6Shp3kcG0T2TRzrEKwIxb4dLfk=;
          h=From:To:Cc:Subject;
          b=ZwQOPZ1Z1j5wmYyAwj9Hj97V8ojGLAKY/NkHU9FTQNjodx5su/oGcBHbmmP4qhTzf
           b+VkQ15+wCtuqHakNOXoRBnoRGcKGCR2YzqT3fmc7R93XQPoPWytEm/IGK4T2+OKmy
           I1MaduZaOvDqrSpIBE0zMSHVbLZ4lqiC3g6kl/6A=
Received: from riviera.nat.student.pw.edu.pl (HELO LAPTOP-OLEK.lan) (olek2@wp.pl@[194.29.137.1])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tsbogend@alpha.franken.de>; 1 Jan 2021 22:38:06 +0100
From:   Aleksander Jan Bajkowski <olek2@wp.pl>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org, john@phrozen.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway EBU bindings
Date:   Fri,  1 Jan 2021 22:37:59 +0100
Message-Id: <20210101213759.2070-1-olek2@wp.pl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                      
X-WP-MailID: 9930353f3bddb183dd5187c090468e44
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [YdLX]                               
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document the Lantiq Xway SoC series External Bus Unit (EBU) bindings.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../bindings/mips/lantiq/lantiq,ebu.yaml      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml

diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
new file mode 100644
index 000000000000..0fada1f085a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/lantiq/lantiq,ebu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq Xway SoC series External Bus Unit (EBU)
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - lantiq,ebu-xway
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
+    ebu@105300 {
+        compatible = "lantiq,ebu-xway";
+        reg = <0x105300 0x100>;
+    };
-- 
2.20.1

