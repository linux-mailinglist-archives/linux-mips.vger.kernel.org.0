Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E873239B0
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 10:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234497AbhBXJke (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 04:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234722AbhBXJkW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 04:40:22 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05955C06178C;
        Wed, 24 Feb 2021 01:39:05 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id p3so1197397wmc.2;
        Wed, 24 Feb 2021 01:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UvtwaCbdOeATVHcZU9nUlIZ/xhmS1zi6+GSO2Sfa4q4=;
        b=GvHedvrhXwB1ZdlxYt4YVejnkjMatS6l/dn/FSNa8YT4MkL7F+Mran3RVaVoLoeJIX
         Io1CFP2uK7QI6VNrOErGGlTsLCYJClB34bnPjLH72oqCBEKWEoWboFuIuv+JBwZ0WEDz
         f+zEa+FRtDABCB3gftzTD8sDAAdkv94neqDC0TbqB27xa4/cqG/yLYcGQJ3uWtW5+kCA
         7ySA6Eyz01SEy99f21ocjVrnkMVwBvsKMtc5OZwdYocmFmwZzLeM4JOCeJUgeEwpfXaY
         Q3GdorvNdSh0OiirKopitY/OM7S3vifjeBHGfD9Pw0C20S8c5qHHChl9UYYXCnNmxlUC
         63pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UvtwaCbdOeATVHcZU9nUlIZ/xhmS1zi6+GSO2Sfa4q4=;
        b=l00mQ2F7Ncuxw2ef9v6akGTb0NtsbHiMCliF/E9HVk3ZT/orLqDXZ6cJ08tLP9eXoX
         VHiXjh/M6HqIv7E5ykut6Yo0qXUwrLRxacBkOFHVFwDZ/OQdf3CfzX+0nrI9QcaoL+7E
         EL81NzYtndL3nH74cca/wUGbiUYIPVvmnqO8keZhv5TAhbi+oqHNgAuhUDB6IEI8Lga5
         RVsc30HIIxI7VDUcilw0OQdQJCWYIgATvsTHDACfKO86FQnImWVVSV0oTlyArurx/PCK
         VYK+mBB76qvFvVEnDb/qz8J6Aecnu0YfN00Eob/8R3CIoT/ES2Q6xQBAZUKjZ02gKtRW
         btFw==
X-Gm-Message-State: AOAM530rhbmFihSrPU/O/otSh1w5yxRvqBrBsV57yEp49ICey4YLrI7Q
        0a9KWY1WsvJpXHovvsfX1Xg=
X-Google-Smtp-Source: ABdhPJz+eBmJ86ox7AfGupA1zaD0KT4BnxytDzx1XmQjOs8kkSQznj5TrlCKkjWcd0XrSZTw3YYCNw==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr2977988wmj.42.1614159543799;
        Wed, 24 Feb 2021 01:39:03 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y18sm2223919wrq.61.2021.02.24.01.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 01:39:03 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 4/7] mips: bmips: bcm6358: include dt-bindings
Date:   Wed, 24 Feb 2021 10:38:53 +0100
Message-Id: <20210224093856.2021-5-noltari@gmail.com>
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

 arch/mips/boot/dts/brcm/bcm6358.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/brcm/bcm6358.dtsi
index 9d93e7f5e6fc..f8753becc164 100644
--- a/arch/mips/boot/dts/brcm/bcm6358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -1,4 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include "dt-bindings/clock/bcm6358-clock.h"
+#include "dt-bindings/reset/bcm6358-reset.h"
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
-- 
2.20.1

