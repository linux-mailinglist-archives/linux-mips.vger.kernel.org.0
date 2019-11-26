Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F021098C7
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2019 06:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbfKZFfH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 00:35:07 -0500
Received: from sender4-pp-o97.zoho.com ([136.143.188.97]:25777 "EHLO
        sender4-pp-o97.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfKZFfH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 00:35:07 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574746479; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=V0vcNIwNxSz5QQ0q5I2awZKqfnLUdMmjg73BeY+iFAUb7if8N1UtLGDI2Lxo/sM92NJdlO1pWs4vEQzCmtcFrv+e7yUxXW69AuWKlBv72DDkjhl4YscKfCLjiqB77I6R1dU5iMvw4X0bGfGcYSPx7cLWo2xbVqT5qARLyr7RoU4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574746479; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=JNxb5FvqDaCgDUdyBfWpFH8UKEcwI7mJKsGK0CZV8IY=; 
        b=c2OqJN66MMJi7pzKG3HFRvRl7NZ+l77jGoNpK+omQQPzn4+zEz4ULQIn8BROIhDUYWRVbP/QGSLlNQsBk3YBfmvha0SPi/wUAdP3KcyueHijzv3Fpmyi1KeO/PMCALy9x+Orxj/lGytOIxrCFCfaFmr7Ld0SaBX7imx8P7z5iHs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=Dcd/iMP3/XHomuB/zl2VY0GbbJ52qjB/ysnrPXp49J8CL+7yY9Jsm8q93g+F291mJQZqVggshnk0
    uHLzJiNML/wCZAnd/FFGQy2L0YmXUvP4t/6USR+rlcPB5NeOANPN  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574746479;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=JNxb5FvqDaCgDUdyBfWpFH8UKEcwI7mJKsGK0CZV8IY=;
        b=AS7hnaoFk9GEedfsqjGbWprbSmqh585rYDenE4vDnQzh/TkJAW7aexpe5tzOFhrx
        +Ra0k4KHdOvAZF48GKKpLMrVk4ZzGL3h8hJaQwwdhYGdoIEOJcwfEAVJONA7zBLxNtH
        d7mQBwVAYEmuqchNdqzqLwIra3I32f9iGBwNl2LU=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574746479154100.40234775971282; Mon, 25 Nov 2019 21:34:39 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mark.rutland@arm.com, syq@debian.org
Subject: [PATCH v6 3/4] dt-bindings: pinctrl: Add bindings for Ingenic X1830.
Date:   Tue, 26 Nov 2019 13:33:55 +0800
Message-Id: <1574746436-80066-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574746436-80066-1-git-send-email-zhouyanjie@zoho.com>
References: <1574746436-80066-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the pinctrl bindings for the X1830 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    No change.
    
    v3->v4:
    No change.
    
    v4->v5:
    No change.
    
    v5->v6:
    No change.

 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
index 0014d98..d9b2100 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
@@ -10,9 +10,9 @@ GPIO port configuration registers and it is typical to refer to pins using the
 naming scheme "PxN" where x is a character identifying the GPIO port with
 which the pin is associated and N is an integer from 0 to 31 identifying the
 pin within that GPIO port. For example PA0 is the first pin in GPIO port A, and
-PB31 is the last pin in GPIO port B. The jz4740 and the x1000 contains 4 GPIO
-ports, PA to PD, for a total of 128 pins. The jz4760, the jz4770 and the jz4780
-contains 6 GPIO ports, PA to PF, for a total of 192 pins.
+PB31 is the last pin in GPIO port B. The jz4740, the x1000 and the x1830
+contains 4 GPIO ports, PA to PD, for a total of 128 pins. The jz4760, the
+jz4770 and the jz4780 contains 6 GPIO ports, PA to PF, for a total of 192 pins.
 
 
 Required properties:
@@ -28,6 +28,7 @@ Required properties:
     - "ingenic,x1000-pinctrl"
     - "ingenic,x1000e-pinctrl"
     - "ingenic,x1500-pinctrl"
+    - "ingenic,x1830-pinctrl"
  - reg: Address range of the pinctrl registers.
 
 
@@ -40,6 +41,7 @@ Required properties for sub-nodes (GPIO chips):
     - "ingenic,jz4770-gpio"
     - "ingenic,jz4780-gpio"
     - "ingenic,x1000-gpio"
+    - "ingenic,x1830-gpio"
  - reg: The GPIO bank number.
  - interrupt-controller: Marks the device node as an interrupt controller.
  - interrupts: Interrupt specifier for the controllers interrupt.
-- 
2.7.4


