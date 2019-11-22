Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 583C11072DE
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2019 14:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfKVNOD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 08:14:03 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25850 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfKVNOD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 08:14:03 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574428357; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=kUvnTBogEtehKXVTu32N9QmQTYYC72OLXiENvtEwcaBm1my0h1yAnQzTq04oXvurvd5jqxdK56frK/VOS2aa/2eSdJVQTsN8Zs5/+UOgRSJXAOIjEvfbudxRmHRLqIq+nN1UnXKkFVLvP5X4Q2mibPOazF7/6V0JqlCRO0ZEb00=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574428357; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=bRklaFoOxmxP9GMZKoF/caZtgz5Y0N+iAiJf6Md2EtY=; 
        b=ROMkmUM49xTR39HHZIsrFagEDBujLel6NpY2iltB/lhMxn7QC6WRfQ16WTvQX5RSnBWw0G27Uuicwxi1pHchjRClE02vJEomI0yjFoEmPDaF6pQZntnR1miJLokVSGzf2RWYFQNIqi+J+YrOZbPIcWnjW35Gl9xN54qtWHSsNC4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=DaFX5TSfTn5NEUXKme0cOiuUb87lcD0RbA563wbSrGxkLQScmnw6C9mgskfzGK+gZscnyVc3kGTK
    j+Qm8evyquymOLldlG1t1i5HjpwOG3ObMkTBBnumTtbeiXJLqbFn  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574428357;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=bRklaFoOxmxP9GMZKoF/caZtgz5Y0N+iAiJf6Md2EtY=;
        b=RCp8GBeDarqiISK3NcH2edGu41oa/M8uBOAGZcjFuGgYr+eMax8WSYmY0Ue57Tk8
        FN0zr6F4KxTQbdpr48fyTFfIaSbJMTmM610YnFsRra8JHL4vwqtwobj5Jvw3cBDBRZs
        BX3EtReOz76Jvx1HHKtwzrirMwjY4r2BnYCQXB7k=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.83.158 [171.221.83.158]) by mx.zohomail.com
        with SMTPS id 1574428355069223.9923417000847; Fri, 22 Nov 2019 05:12:35 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com
Subject: [PATCH 3/4] dt-bindings: MIPS: Add Ingenic XBurst based boards.
Date:   Fri, 22 Nov 2019 21:11:28 +0800
Message-Id: <1574428289-21764-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574428289-21764-1-git-send-email-zhouyanjie@zoho.com>
References: <1574428289-21764-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add Ingenic XBurst based boards, prepare for later dts.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 .../devicetree/bindings/mips/ingenic/devices.yaml  | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/devices.yaml

diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
new file mode 100644
index 0000000..8bb4b5d
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


