Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 316D3104AB4
	for <lists+linux-mips@lfdr.de>; Thu, 21 Nov 2019 07:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfKUGVL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Nov 2019 01:21:11 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25858 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfKUGVK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Nov 2019 01:21:10 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574317253; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=ZgyZGOvTbGGTeLHtG2Ebos3E21UXT7hM+U7qdeBlVA6sTjOVHyKF5LLktIBSJ/B8pLnpJT8KD9eSad521x5NeYr9mIvsqo6K5K4vuuqpsQ1PO3n2WoULOEDCmIFAqyJe6kMyZBApcHnKPnMALuiN6OtJaMgnbMW2qHxVM3Y4d9M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574317253; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=iDAgtAsY+xKfB6e0hZ/2w6tKFaBXoZ43FabKYQdJsZg=; 
        b=GOi/ez+syVvEbHOTkhsYZ2Zwk9O54FBxK6MpWRdih9uehc9t6xzSGea4aPzedPxT2ZkcVtgOYW3NuVmTXuaHQSZtim6W2WrvbXAgdeZMA8jTiarKGThNshcicGVbvDjcoQtu97wwulatPrMJEu2LaytjXy3Q8FfpCNQ/mnSXDHo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=l0but9lN4n81cfeDbnWtHdd/ZkFbcTbpmsAi51y9JMvtUoKFEQ3ougHRNhKS3+OqwwK9FQaYax6L
    bcf+Q7JqSjMutUGcSyIkSq3KQftzitqZoieMXEOM2HbL+5NO3JIM  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574317253;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1988; bh=iDAgtAsY+xKfB6e0hZ/2w6tKFaBXoZ43FabKYQdJsZg=;
        b=pOS/aptyXPFSeuYKdDjuLRFlkXZsxxYgmpsw/Wh6d1XLuQ7sNMnwJOzYCgt3Gm+s
        juBFlx+rZc1s0E2ohzwyGq6Vbzr4zWp4FdeEVdMBbazHcfij3IKazI2XlqD/yU0+vaH
        lOCl24/3DBhFg3ve+IGXF9C+E53ip8dY5LoWiFS4=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574317251612617.8232601597084; Wed, 20 Nov 2019 22:20:51 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, paulburton@kernel.org,
        paul.burton@mips.com, linus.walleij@linaro.org,
        paul@crapouillou.net, robh+dt@kernel.org, mark.rutland@arm.com,
        syq@debian.org
Subject: [PATCH v3 3/4] dt-bindings: pinctrl: Add bindings for Ingenic X1830.
Date:   Thu, 21 Nov 2019 14:19:42 +0800
Message-Id: <1574317183-126374-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574317183-126374-1-git-send-email-zhouyanjie@zoho.com>
References: <1574317183-126374-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the pinctrl bindings for the X1830 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v2:
    New patch.

	v2->v3:
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


