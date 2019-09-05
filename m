Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F0FAA64C
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 16:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389551AbfIEOqt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 10:46:49 -0400
Received: from forward100j.mail.yandex.net ([5.45.198.240]:45321 "EHLO
        forward100j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725290AbfIEOqt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 10:46:49 -0400
Received: from mxback11o.mail.yandex.net (mxback11o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::62])
        by forward100j.mail.yandex.net (Yandex) with ESMTP id A96CA50E0CE4;
        Thu,  5 Sep 2019 17:46:47 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback11o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id PdAROH777Q-klNOM4B3;
        Thu, 05 Sep 2019 17:46:47 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567694807;
        bh=/bf2zDpeim9k1iAfS6rVozkZQSqGbfQAnlGiesOxd0U=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=iivXWVafXX1+L7CSwuNZYfMXuT/sOLNc8+CIKMvqgWQ0ZVEfu7ZGHvGoqGyFiqhlu
         Y6nrrSMV/SyrmKu3y38Q7hV6lBybOKqt3MPp6Tn8KFzcDNyazrCQtF9pqNe9yZLfPS
         uqOu93VP55gPNa+AIvSZ6KsrBjWyfvA3QhX6ckbE=
Authentication-Results: mxback11o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id zkoybIaMjG-kTxWTVZr;
        Thu, 05 Sep 2019 17:46:46 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 12/19] dt-bindings: mips: Add loongson boards
Date:   Thu,  5 Sep 2019 22:43:09 +0800
Message-Id: <20190905144316.12527-13-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Prepare for later dts.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../bindings/mips/loongson/devices.yaml       | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml

diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
new file mode 100644
index 000000000000..0665f0f7ec45
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
@@ -0,0 +1,39 @@
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
+      - description: Loongson 3A1000 + RS780E
+        items:
+          - const: loongson,ls3a1000-780e
+
+      - description: Loongson 3A2000 + RS780E
+        items:
+          - const: loongson,ls3a2000-780e
+
+      - description: Loongson 3A3000 + RS780E
+        items:
+          - const: loongson,ls3a3000-780e
+
+      - description: Loongson 3A3000 + 7A
+        items:
+          - const: loongson,ls3a3000-7a
+
+      - description: Loongson 3B1000/1500 + RS780E 2Way
+        items:
+          - const: loongson,ls3b1x00-780e
+...
-- 
2.22.0

