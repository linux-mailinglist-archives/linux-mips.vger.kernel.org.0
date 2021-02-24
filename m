Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585F13239B2
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 10:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234737AbhBXJkx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 04:40:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234721AbhBXJkW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 04:40:22 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3465DC061793;
        Wed, 24 Feb 2021 01:39:06 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id w7so1185045wmb.5;
        Wed, 24 Feb 2021 01:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qttPITUNcyRxPW1RXFwd5PQGpR8S4p6uO05wPYM8YN0=;
        b=YZ+ZfejecUT0imgFQHxLBB+vLWWjjCZMVtQwVKoEQTHus3RcoP1D5G+Khl9u4SKdaS
         3fmIQJvRi3jLlkMYC6Ig5Tz9GmSXSx2O7Lb8UcqnZar18Md+jlgYBHyS2nl4jkMffPkV
         KIFZF4tm1fbeG1xQ0tWRKyDuJsL/DwotxSatrzxKI7CnEKaY0rsbwUuKU7bWS6ZkpBjM
         BhBfW8DMMJ4CTY+FWogU8l+qJ3ec7hP2+FaFEL+0H3OQVIW4kaaqxtRPztKvPt+IFG18
         WKf36eD7vMPdoMdSCBCHak9ctLGW/JTDl+ex+BIja4nFvILXrTqD8j5Vof66SFoplBQP
         KDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qttPITUNcyRxPW1RXFwd5PQGpR8S4p6uO05wPYM8YN0=;
        b=APgG2Zmogb1Dz7oNFnyBmnYQA1iL4yKPW8rB6BSJzDdSa514pSpl7WJiAJEFNOorLE
         Ca9MbWSMm8Txzmy79Q8TIkq+NF0wJS5UpWMzINStORhJCpQuSjzhXv6Y2wo4NWm2AbX5
         Xv9a7xx1icGwnATH1fhgid6jk2pynfv6b5VR775ZbJH3O8ctdZswFazk+Vn9PEk/5meK
         wppsbYgvJ9ciNgM8o1E7bv7/qGBIG1XnJubxdKynSTh7Yt6zo1WWOXHv8xPkLpzC0sSl
         WAkDwaTw/kgtPYPTZnFzYpJRIiS3n0hJjrbEX3pxOq709twxjf6c+lH3knotE9ZLsLFT
         +d5A==
X-Gm-Message-State: AOAM5329T2ahBQ7dRYti1dGBPetnGHVPUmM/Ul5V+QdE1TGzUOXgbSVj
        9Az81G6f8xocqC+hkSK4uHY=
X-Google-Smtp-Source: ABdhPJxmD0mJ3wGde+lOEnb7ZO+7uPCKXk9S1N1ZWFhMqBg+JW8wbuHQ6vCM1gT6UU9EFs3M5mr+MA==
X-Received: by 2002:a05:600c:4f07:: with SMTP id l7mr2804586wmq.141.1614159544930;
        Wed, 24 Feb 2021 01:39:04 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y18sm2223919wrq.61.2021.02.24.01.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 01:39:04 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 5/7] mips: bmips: bcm6362: include dt-bindings
Date:   Wed, 24 Feb 2021 10:38:54 +0100
Message-Id: <20210224093856.2021-6-noltari@gmail.com>
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

 arch/mips/boot/dts/brcm/bcm6362.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index eb10341b75ba..a2dbbf062cd8 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -1,4 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include "dt-bindings/clock/bcm6362-clock.h"
+#include "dt-bindings/reset/bcm6362-reset.h"
+#include "dt-bindings/soc/bcm6362-pm.h"
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
-- 
2.20.1

