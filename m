Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 841A51083EE
	for <lists+linux-mips@lfdr.de>; Sun, 24 Nov 2019 16:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfKXPBb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Nov 2019 10:01:31 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25838 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbfKXPBb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 24 Nov 2019 10:01:31 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574607587; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=jZcJDbA+Np7SCO+O1XnA9KYFsX5/J/vw34YPQbm2uuINOtWvvipu459H35pvRYOmft4EGTr6gGiOfC0zJtk28pyf2ke9vttXdrl9gANB3Bn2G6LIu4KwfJeeObsqTTfLIRba6vaNyhfwOOM2k7gQRr7jckAdRBp+E3zck03Culk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574607587; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=NtUgVYhoUaOU2Z2PLcXaTI3wuWVXwpgP6vT5SGfsNtc=; 
        b=gl7lhUdofiBZkAMJ/p4iVudEIGOeyWIqBaKOHhYlrfGtLeGVEuTw8XWR8GsD9LCCNjk49cy2N/8xjEFvPf9TUyLhGZCSUqxyQG186dzcEIsv1AJDtkjl11GGNb2D281WhJEsTnijvbgV08WWUvMmnohEeasl5tsBowklZ5VAlt4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=C4lf+dmHO1i4jjz1MagL9KffYnaP84Pn5y+JI1sbRICSyKwaK/+zirWpOMavBRIclyrUQRkK4dB2
    rQ1JgtbnnemrTh+Sbd9XWB+wzxe00LsKeQ4IZSahxlPZRRb98Gwh  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574607587;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=NtUgVYhoUaOU2Z2PLcXaTI3wuWVXwpgP6vT5SGfsNtc=;
        b=OvNUPZ4aQzQ5xb3h1BZ/QmymdiG6r633R0VuJRhvxoarE8xSRzUqXRocaNhcPAOE
        agdTkAyA+dQsZs1gwmkSKfwxbdLn8bVUN+gttGoxyA/QoY9cwX+6xYGCmBbt39TJAPq
        TdpLuHrBca5yD7qF9CdEX4x11ACB1J97H6nWmKs8=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.112.247 [171.221.112.247]) by mx.zohomail.com
        with SMTPS id 1574607585895214.1092473927324; Sun, 24 Nov 2019 06:59:45 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: [PATCH v3 3/4] dt-bindings: MIPS: Add Ingenic XBurst based boards.
Date:   Sun, 24 Nov 2019 22:59:01 +0800
Message-Id: <1574607542-25670-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574607542-25670-1-git-send-email-zhouyanjie@zoho.com>
References: <1574607542-25670-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add Ingenic XBurst based boards, prepare for later dts.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v1->v2:
    No change.
    
    v2->v3:
    No change.

 .../devicetree/bindings/mips/ingenic/devices.yaml  | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/devices.yaml

diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
new file mode 100644
index 00000000..8bb4b5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/ingenic/devices.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic XBurst based Platforms Device Tree Bindings
+
+maintainers:
+  - Zhou Yanjie <zhouyanjie@zoho.com>
+description: |
+  Devices with a Ingenic XBurst CPU shall have the following properties.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Qi Hardware Ben NanoNote
+        items:
+          - const: qi,lb60
+
+      - description: Game Consoles Worldwide GCW Zero
+        items:
+          - const: gcw,zero
+
+      - description: MIPS Creator CI20
+        items:
+          - const: img,ci20
+
+      - description: YSH & ATIL General Module CU Neo
+        items:
+          - const: yna,cu1000
+...
-- 
2.7.4


