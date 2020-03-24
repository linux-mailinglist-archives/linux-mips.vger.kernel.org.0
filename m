Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36D0E191508
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 16:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbgCXPkK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 11:40:10 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17891 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727216AbgCXPkK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 11:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585064333;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=VorRDEPWeqnYtf4F2THRNmiIzjtl4UXW7taZV3OXnYM=;
        b=UTbZb8NoEoj65jOvIOLKA6V4VbAf/ndSfM7IMp3XihK+ntw+cRFFqQAcb5GRWmLL
        89WcbU53857Vkevr8r3Hg77golzr25V5gKu40ekpe5n4HEhM79HAnE44k6ZkNyJ2ukV
        fGhJU6FS0ZVACb7O0hXM257DJFaXcOuhnWrz5zt8=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585064331396463.64959543394366; Tue, 24 Mar 2020 23:38:51 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, Rob Herring <robh@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200324153624.23109-9-jiaxun.yang@flygoat.com>
Subject: [PATCH v6 08/11] dt-bindings: mips: Add loongson boards
Date:   Tue, 24 Mar 2020 23:36:05 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200324153624.23109-1-jiaxun.yang@flygoat.com>
References: <20200324153624.23109-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Prepare for later dts.

Co-developed-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Rob Herring <robh@kernel.org>

--
v4-v5:
=09Remove unnecessary kernel details.
v5-v6:
=09Use quad & octa instead of 4 and 8.
---
 .../bindings/mips/loongson/devices.yaml       | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices=
.yaml

diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b=
/Documentation/devicetree/bindings/mips/loongson/devices.yaml
new file mode 100644
index 000000000000..74ed4e397a78
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/loongson/devices.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson based Platforms Device Tree Bindings
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+description: |
+  Devices with a Loongson CPU shall have the following properties.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Generic Loongson3 Quad Core + RS780E
+        items:
+          - const: loongson,loongson3-4core-rs780e
+
+      - description: Generic Loongson3 Octa Core + RS780E
+        items:
+          - const: loongson,loongson3-8core-rs780e
+...
--=20
2.26.0.rc2


