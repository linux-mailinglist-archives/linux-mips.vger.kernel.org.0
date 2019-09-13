Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9BA8B25C5
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 21:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389395AbfIMTKj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 15:10:39 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45090 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389124AbfIMTKf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 15:10:35 -0400
Received: by mail-pl1-f193.google.com with SMTP id x3so13616208plr.12;
        Fri, 13 Sep 2019 12:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BRtSatqLH/MfhNYbSV1CsCvP0aOfEd/XjwPUQaxk57I=;
        b=avso3WPVgG5rVphig3UnJsw1yfQwswLbR+qRqiL2jM+brP6ugDjrCf0WasWpp8cH9h
         qk5ntLMPBZL9SrK+Dw0irFybfmFqatvchwKIrIru+GrRxyGQaADyaAux0S2t3FMJ74gX
         3gsEMdLlvX54X8yqi70bkx0QcIQvPOBWVb2e/J94idmhTTxBb9npUWT4SughZHXtgsqb
         cJnq5x0+ZvULLrNf0x3gch8OyCHIDt1skSxJNUCUTTG1dNn2kU9he14v2bXiogDjk/LQ
         ugsdJUdE8y5mqNCRvFBePoT8j2avazilpFzkpv9VpkfP756bcB3SSSERs5bs9cKm/gd2
         60bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BRtSatqLH/MfhNYbSV1CsCvP0aOfEd/XjwPUQaxk57I=;
        b=ZWj2slDxkfxZdcfhqubZgg6T0yM5xg1HuHzm7xUMlNuLpBM3tfqppsQy1Dk5Eo/tWX
         1q03nueF/4qnomyVlup173ddy/GUIVgJzgHDL+Nq8XH5D1oHP8jwc6xUdCu3jjepRjHr
         5aXzRfpIJN1iTL34RRKm87JkwE8XbNc3zuL/g2K+cYigbsacNyT5NrFS/UaG4ZLPIngd
         hfRyZMqSeSJ3fBd1e/ZdkQHHVsMIwdznKoL0muuQOwwt7Iw/BZTgoexOM5tKj6yUqW85
         /oiQMm42uATZ8NDcZj/Z2H5hHIbGCjp22rbrXVM4AcxjTFR0D1RvwzhS/1QJdl0Hwpj0
         aMrQ==
X-Gm-Message-State: APjAAAUUByUwbZ/4xoDXXbhRxm1rFqjdEQVTEW0gBTJTpQklM0nUB54t
        +rXFUyr/+GKk9VlE3eKeuuwbB600LNE=
X-Google-Smtp-Source: APXvYqyd6cZeH/MXYnssX3D2Bz+40B9rxrGDpSeZ0YcPHYL1WL4HwbxzENau9QoPaQyWulgrm+Khrg==
X-Received: by 2002:a17:902:6b04:: with SMTP id o4mr6389283plk.278.1568401834707;
        Fri, 13 Sep 2019 12:10:34 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r18sm27273779pfc.3.2019.09.13.12.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 12:10:34 -0700 (PDT)
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
Subject: [PATCH 4/6] dt-bindings: Document brcm,int-fwd-mask property for bcm7038-l1-intc
Date:   Fri, 13 Sep 2019 12:10:24 -0700
Message-Id: <20190913191026.8801-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913191026.8801-1-f.fainelli@gmail.com>
References: <20190913191026.8801-1-f.fainelli@gmail.com>
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

