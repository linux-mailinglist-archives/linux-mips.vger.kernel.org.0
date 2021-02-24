Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408E93239B6
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 10:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234748AbhBXJlM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 04:41:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234726AbhBXJkY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 04:40:24 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6FEC061797;
        Wed, 24 Feb 2021 01:39:08 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id v21so1189002wml.4;
        Wed, 24 Feb 2021 01:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FYBbMBH+fL0EHuLuycRnLIyJ33fCh/dLZWCxmDgiNdo=;
        b=iYUCW+LlQ0pHYc7wGQ4AL3S+q2MuHX1qb6KxRa3Ek1hOl/beR0OSsMIbhUoYRkQAFy
         cAoGuySfeRqlSuVvwMkGHJhSK1hbQe8Q/KPNQHhawEMo57PsP7KGEnFcmZeEzZiUvzQj
         yBh1IqciseCa+OnTGSSUtWhg9zJHWRlRn8Zu4CnmwX9YgtoaPfa7eq5vthzvOevjVHjW
         v0oE+Yo1g5lBvbAXGEIxcjeivD4IItUb7fyyFBQL/7dysaodHjFTtwOL7F8GUJ1nN9pL
         SmAURmfScZtbbYxz5fmIVTVknMa+GQAdXV5P/8VheXP8iahJz4HjR7tdHYx2e0YChxuX
         4r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FYBbMBH+fL0EHuLuycRnLIyJ33fCh/dLZWCxmDgiNdo=;
        b=hy9isMqCaWSIoA4AwH8XbSl/XlO0CVz/xP4qbD72WiT3oL+lJMQ4DZZVa2H6FFaQgl
         I5/2mGF5UnzQPhMlll/+PYyR9oTgLpyh769LrA6k/74jGwPDbw1vhZ3OMhoL6KcY6lR6
         mHVZjMtcefCYBHhEGA1Ef0y4/DbjaD59n59/M3X57Q7/BYqghsQnnm5qLvjr/IQRbiq4
         0RxdZGukSyGsc245sjtxzDMPJWy9ybcE5A2S7621znfiJVEV8sKWvFaI5UT6B1y06+CI
         erTQ/fxSxPsO7KNGXIVBnNH5In8PUARjISYcDmYotsjYr5i0PNvVOcE2Zf33MTYjW1Db
         gjhQ==
X-Gm-Message-State: AOAM533Xo9TF+ee9Qb/scYB7aY4OgmcMA0zSg9EW6ZYq9IxBALSi0RCU
        bw4jTU/vEkaxkCZ/mZxhXck=
X-Google-Smtp-Source: ABdhPJydI5mO4MXhd8OkzlgXUZnj7o7yZp0Mw06aC/ZAL4+tr36XZwvm133/EmPwUY+x+EQnjyi4Gg==
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr2825100wmi.6.1614159547307;
        Wed, 24 Feb 2021 01:39:07 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y18sm2223919wrq.61.2021.02.24.01.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 01:39:06 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 7/7] mips: bmips: bcm63268: include dt-bindings
Date:   Wed, 24 Feb 2021 10:38:56 +0100
Message-Id: <20210224093856.2021-8-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224093856.2021-1-noltari@gmail.com>
References: <20200812063129.361862-1-noltari@gmail.com>
 <20210224093856.2021-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that there are proper device tree bindings we can start using them.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v2: remove irqs header, add more bindings.

 arch/mips/boot/dts/brcm/bcm63268.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index e0021ff9f144..575c9d3eb4c8 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -1,4 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include "dt-bindings/clock/bcm63268-clock.h"
+#include "dt-bindings/reset/bcm63268-reset.h"
+#include "dt-bindings/soc/bcm63268-pm.h"
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
-- 
2.20.1

