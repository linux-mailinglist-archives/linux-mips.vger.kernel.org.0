Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C0D103CD2
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2019 15:00:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731545AbfKTOAZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Nov 2019 09:00:25 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25860 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbfKTOAZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Nov 2019 09:00:25 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574258392; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=LWoF9u7GwN/ZIZRg8ssx08iQTc+rjXXQZFqJ3cvtg2GvFi2ZpkCFoB8DtxKec7cY1X3jV3604Va/S9sqWbzuWzzyxbmQoOsUHg1BhweMt9mhUTUk+e7zzwQUpoG2W54ww/lMHEM/33qviDgJF/u0GHXfQHGfnM029Y/qJKCiFrA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574258392; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=g3a/uS3jZ22BWDXCg5h4jhLEdvlvnseJjI5K5JF+3VU=; 
        b=Jz1GxefxhI32/+7FFKAQ+MLHMBJiYKCNfYxmP5RbkFvL1uIqwgCGp4hdu6JBn2BDy2lHmrZmmE0I9F4Mm66Z0V8mgFQJKJ7i6Fa1BEcMRbWhKJrITVaS+GHlrTz+stuE2y2eHBM2e9+lg4YQPhe1z3ZIvtNTfBW7oDmYjB1Zzj0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=mcP5dCgm0GKlxIWFrX+51hAQFPiqP0UqK5gO5OHQnuJWa6BvaP7cQqe9gZSrZ6nqUSteVRXEPfAY
    aqNGhTGfVy+DK/5GdO2vuinuxQ0rE3UCV+ztt71XwSMDnaGBb6GG  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574258392;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1932; bh=g3a/uS3jZ22BWDXCg5h4jhLEdvlvnseJjI5K5JF+3VU=;
        b=OSY6b+FNll1VbamGWaK6ITKwX0VWTaEMP2a3W8gX8qkwuMzmDdbLINopUJ7YjzxK
        PCrvbs2KkCq8Rz/6PTY62FCxQwYsHjvTwkGLPEdxa2GH7KkYdZdXfBw5iu4ONDqbM0g
        DuBHwW81OV+MdcTLmEBa8pUFESWl8F3BMg+tcEgo=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.112.99 [171.221.112.99]) by mx.zohomail.com
        with SMTPS id 1574258390783834.3197646662344; Wed, 20 Nov 2019 05:59:50 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, paulburton@kernel.org,
        paul.burton@mips.com, linus.walleij@linaro.org,
        paul@crapouillou.net, robh+dt@kernel.org, mark.rutland@arm.com,
        syq@debian.org
Subject: [PATCH v2 3/4] dt-bindings: pinctrl: Add bindings for Ingenic X1830.
Date:   Wed, 20 Nov 2019 21:59:02 +0800
Message-Id: <1574258343-122458-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574258343-122458-1-git-send-email-zhouyanjie@zoho.com>
References: <1573804011-2176-1-git-send-email-zhouyanjie@zoho.com>
 <1574258343-122458-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the pinctrl bindings for the X1830 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
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


