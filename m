Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF417107FE1
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2019 19:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfKWSPg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Nov 2019 13:15:36 -0500
Received: from sender4-pp-o97.zoho.com ([136.143.188.97]:25743 "EHLO
        sender4-pp-o97.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKWSPg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 Nov 2019 13:15:36 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574532902; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=JSi6s/qXc3VHsh0KpjDt+lAQHLwNtmk/qK3uL9J25/PTAZB/AykxqBSX2Do42L37m7v10f49nqzL/PeU2Kgt26WhdugfT4sNXTLsQmdOfkwbx2gZs42QMlJzlPZ1xAZ0pba3YcniTfxMYqFigxGGGi/qO3wLuAOZwqTrhlqUEp8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574532902; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=WN/NoUQp3+KIKTRqXiL9cxz4qXpzRVmsOgrE57gDNXQ=; 
        b=ZZ1enu1YmrRGT5/ufpYtU3E2keKMK7S1jcFfRoZq/go2XGUU1E/EYUYULanhS4JQ1CumlW2EwBUkvgSlecfYm3NDSewVK6hOkHyt2lumMatO8kxVJ3m7p6Ek9T9bJ+cU7epxuRfyd4eXOIaRaR/gaS6EoaYlZI/jevHHrddRNsg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=jJbgaWJpVl3fCMMlMBQ1VdOFAoiDvRV65AhIK2UloabHZXrCe9iEoDXNZxWVxFlGZE8dqjGGnhpz
    kycjlLibdOnS23t/ueSN+kZLOz5p1usrOumD0razgVqVB1d6rabj  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574532902;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=WN/NoUQp3+KIKTRqXiL9cxz4qXpzRVmsOgrE57gDNXQ=;
        b=qr6HTE0C88LXpftm/cTJEEz1eAKpfX0QCf0+Xs4JLE187mr5TO4dQF8yPLijrt/+
        bcuMEy5G/+NwuUl3qsEtaWQtzmzzEHmBDhwlj4usou94bndFEF1FudcXXJQ8KqpH9dB
        zIjepqFxv0zaHslql63dUI9+RBKGQokYEihVVfF8=
Received: from localhost.localdomain (171.221.112.247 [171.221.112.247]) by mx.zohomail.com
        with SMTPS id 1574532901699457.9575264672759; Sat, 23 Nov 2019 10:15:01 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, mark.rutland@arm.com,
        linus.walleij@linaro.org, paul@crapouillou.net
Subject: [PATCH v4 3/4] dt-bindings: pinctrl: Add bindings for Ingenic X1830.
Date:   Mon, 18 Nov 2019 02:14:08 +0800
Message-Id: <1574014449-112057-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574014449-112057-1-git-send-email-zhouyanjie@zoho.com>
References: <1574014449-112057-1-git-send-email-zhouyanjie@zoho.com>
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


