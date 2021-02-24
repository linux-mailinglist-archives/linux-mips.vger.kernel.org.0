Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36273239B5
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 10:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234744AbhBXJlI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 04:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234727AbhBXJkZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 04:40:25 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F77C061794;
        Wed, 24 Feb 2021 01:39:07 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id f137so1218291wmf.3;
        Wed, 24 Feb 2021 01:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BXhbirZQ1boTtRnhTGkEuiZJm4lSRDpv90gVvKhRKqg=;
        b=EqviWE3zFbOSRjv8UiA95VpJnMX7zk5MT4SgCz1EmNMFX8GWFYSJFTvpyhonQb0bKa
         y4jzy5R9rcPvO+vI2DEO8AxFQ9Vx8Zrr/5XjCmQMvTaKGQJTu+ff/ip8Jgjzn6yeHTf4
         Xnpw7bZ+AbaioO0+wTZNYwpcIbw0m/LfKZcS2Zfe6znfY84ZKRNDQVHk7d4c4zHtVRI2
         kBV7YWiRh91d9OHdEj170/aDvmB5Z1MNDZcuTqT+/bIFYddrZ31yGFl5gXT9z/qZ3kEe
         i398yQzwVighlH5IKqpQJjljtWzyZP0rP87KgnBtQEvBv13OkqXiXCKMCHe5dYhR0WN7
         DTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BXhbirZQ1boTtRnhTGkEuiZJm4lSRDpv90gVvKhRKqg=;
        b=GAIWILF6ZZduX6xfYY8Q0zVh8H/r/gkAlOxg/cMyItSHPd1JVd8Y+EFKT6KW1qW5D9
         F952hNSxenZ2/Mv2pHSkmvB0OHe5hCaRXt6md6a2KTLXkDwTK5Q0Q24MJGhT51IAnSpT
         cbnGgwUOnFNhiPNtQ04gTaaOc3P2+h1g/kaRa/ReNAG9sOfoElgocL6ISl0aT8iKlotM
         WbTqJepR6MsQunFLYFHpl9hVoOjnmuyff0Y5vfZ8sC/0ykRcJZXnQIgwmbUvpBRJvX8l
         FiGGomnLk5Lp3VbRRLdwpCA53WvQPh1CsSeyKr2oVf2gK3C5cl2wQczl7kaGZExk1W3y
         CExA==
X-Gm-Message-State: AOAM532MCdNKcDhmvSfMWGkLC3RfGXLDSLt8ehnOCJzkBrv5PhixrxAL
        U/MJOWrMwKjGbQD72bn0vTM=
X-Google-Smtp-Source: ABdhPJxWmg8ccez0ttRvggdTKR58iRLd5Ivcz55VQ1Zt+5H+FF1pi8maz3RJnlXjcMG02CaXano5+g==
X-Received: by 2002:a1c:dc56:: with SMTP id t83mr2861751wmg.176.1614159546132;
        Wed, 24 Feb 2021 01:39:06 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y18sm2223919wrq.61.2021.02.24.01.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 01:39:05 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 6/7] mips: bmips: bcm6368: include dt-bindings
Date:   Wed, 24 Feb 2021 10:38:55 +0100
Message-Id: <20210224093856.2021-7-noltari@gmail.com>
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

 arch/mips/boot/dts/brcm/bcm6368.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/brcm/bcm6368.dtsi
index 52c19f40b9cc..c4eb4b67ecbd 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
@@ -1,4 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include "dt-bindings/clock/bcm6368-clock.h"
+#include "dt-bindings/reset/bcm6368-reset.h"
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
-- 
2.20.1

