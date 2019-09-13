Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5B4B25E7
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 21:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390071AbfIMTPz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 15:15:55 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39101 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390051AbfIMTPx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 15:15:53 -0400
Received: by mail-pf1-f195.google.com with SMTP id i1so9820764pfa.6;
        Fri, 13 Sep 2019 12:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BRtSatqLH/MfhNYbSV1CsCvP0aOfEd/XjwPUQaxk57I=;
        b=jtbuwLj4zNgb1GtpmdFk0gc5/kOlfHWykktKB/RyfHGZlZ1uNNSe///SsSsOJUQYFF
         Q9razuSg4mXJrOS3/UL7LsOqJCRQ3kwJ61kXoB9GaoWUMuk39DPbAje3201ECWIP6foO
         5tvjebWmEksOAdijtNIJCgdo0QIt76FT2Cu4Uc8LjA7mpoLUgAeE7lJMuIXTsSOiR8TU
         ZiJDd2lV4KYp8fZRljygwB/gZbxkKw2lXiLxI95TPPvR+hxQP5vhRdb5JGiCSBmj6VzY
         uhkJTeOlUCpYzsaVOJtrHduNmkwVa2XZuljaU0dT/4SI5WtVmLAHjoR6E+SeaSvCf12j
         Bw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BRtSatqLH/MfhNYbSV1CsCvP0aOfEd/XjwPUQaxk57I=;
        b=Yoy9HlDON14GqNsJo+5BSOs+AxuzkvUBPfXwRf6QaZ6odYR4Lqz2xMkwhKkYjikbWo
         hh5HrspqpG+7mEPhKaW+jbr9ROVTrGU33N1s6EhJH0w+GsjJmirdpVSy9GtmHTWVmenO
         Rv/CoxY7cCMMfCI7+XHqmXzHC9U06QwSIQW3gFRiStVmmwHbZ1AsNA8Ul1p89t6wunpL
         dMuCvvBjOnemfLlfCQQz30RRicSpxUYNNgBFhTrzBvca5uZtREMx7LGD7qlLpnld1eDB
         kLgdz1PZL6vddIsEqVuTPwdx8RLeCbEVTaszr+M9mVrFHTr0zQyC2Gq5GLV4Si1jALxe
         pXLQ==
X-Gm-Message-State: APjAAAVIiyEucjhGThvLUPrrt6DZEKWw2zFrxHF3dpzXBGX1kYZ+oPZl
        T8mm8M+hJ1HYTiMZgQUPeGd8d/LgUAo=
X-Google-Smtp-Source: APXvYqzxO0qzlIQtB7mDNY47JFE1/g8cLqnGE+hjEzq3cLN7pORngII31PI7vqJXoRIRninpX2wrJQ==
X-Received: by 2002:a63:e44b:: with SMTP id i11mr7318696pgk.297.1568402152112;
        Fri, 13 Sep 2019 12:15:52 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m24sm6988149pgj.71.2019.09.13.12.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 12:15:51 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM BMIPS MIPS
        ARCHITECTURE),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE)
Subject: [PATCH v2 4/5] dt-bindings: Document brcm,int-fwd-mask property for bcm7038-l1-intc
Date:   Fri, 13 Sep 2019 12:15:41 -0700
Message-Id: <20190913191542.9908-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913191542.9908-1-f.fainelli@gmail.com>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Indicate that the brcm,int-fwd-mask property is optional and can be
optionaly set on platforms which require to leave specific interrupts
untouched from Linux and retain the firmware configuration.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
index 4eb043270f5b..31d31af408c5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
@@ -36,6 +36,10 @@ Optional properties:
 - brcm,irq-can-wake: If present, this means the L1 controller can be used as a
   wakeup source for system suspend/resume.
 
+- brcm,int-fwd-mask: if present, a bit mask to indicate which interrupts
+  have already been configured by the firmware and should be left untouched.
+  This should have one 32-bit word per status/set/clear/mask group.
+
 If multiple reg ranges and interrupt-parent entries are present on an SMP
 system, the driver will allow IRQ SMP affinity to be set up through the
 /proc/irq/ interface.  In the simplest possible configuration, only one
-- 
2.17.1

