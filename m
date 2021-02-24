Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2133239A7
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 10:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234696AbhBXJjq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 04:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234676AbhBXJjn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 04:39:43 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35C9C061786;
        Wed, 24 Feb 2021 01:39:02 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id t15so1178613wrx.13;
        Wed, 24 Feb 2021 01:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gI9z5A6kT88B6Td/PsHxXRkA5rM9TWV6yXwUJ0E9avk=;
        b=jkE8ZZ1H5o6lCazMFY1SgTjWDcyarhIvHAgAD2GNBQUKd32El7SEVsIR5qwL9IR7DR
         Vew9eN/vYPkQd2brmkpELf4h2wPCI0Z8LsFAp/iCTx61IwL/WEOCnAfIH9VKeAAxRDH1
         vWL9/MS6gPMaAjCBiqR+PBXK2QHvxq8KWJlbxrOMK5h49Lj3BF8eRGs13uVQFdqanWb6
         91zMYDjokhMb8WyN98zKQ7LJJwQ2/2EFk6N6EDwLwGkwY+zVYEZlNimiwg3DmweTqbqZ
         PAhKaEnh+71Cs7hKmvIzAUh4oXN+k3N5ZFpPJ65L0J9KGw7Xvxquy4gD/D3DFAY2OJvi
         5E4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gI9z5A6kT88B6Td/PsHxXRkA5rM9TWV6yXwUJ0E9avk=;
        b=JBvOwLXPeaTRYYy5mlHSBU5GlSaTuSuW7ZIXfml2LNO0cgFaGAsGPTw5n8bnjYQp43
         TUpAbv2h+gC+MZTiVbCanIkbu8V6SyoUYidOAg6FMmGRJR7ijcctmiWcY+C4ICpHHWCH
         Y+SW1dULToh6oc2Qi2iNqK2L88azmItDHYkYFGUC/farSxm08W8kZ9DlT/m5hfhJJnDV
         Jqz9GoFnn/ih2YKCqDoSocrwFltuPuvK4tCTlqHsOJq4Ap3EAcOPswBVlFm2WJQa4ClS
         jBMpOBGLd2fcbs/dw0R8b4iYmRxvalc3/FozQjfbtaUBiaS6REenBGWxlCWhGDjfJgxD
         AgfQ==
X-Gm-Message-State: AOAM533g1mdakXVnvN2EY8NuSkB2sTvE5IMLoTC6SWeyJTK81vpEAzLL
        OVO9UDTF7qilIcEgQJIlEyA=
X-Google-Smtp-Source: ABdhPJzZL6DUvwhDN+a3OhH0ceHCLZW8fEeMBcYsjza4SzlxGZkPlmzH+9qa4nLdSFGVnhUbcog49Q==
X-Received: by 2002:adf:fd51:: with SMTP id h17mr23352769wrs.420.1614159541713;
        Wed, 24 Feb 2021 01:39:01 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y18sm2223919wrq.61.2021.02.24.01.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 01:39:00 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 2/7] mips: bmips: bcm3368: include dt-bindings
Date:   Wed, 24 Feb 2021 10:38:51 +0100
Message-Id: <20210224093856.2021-3-noltari@gmail.com>
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
 v2: remove irqs header.

 arch/mips/boot/dts/brcm/bcm3368.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm3368.dtsi b/arch/mips/boot/dts/brcm/bcm3368.dtsi
index 69cbef472377..db7e801dad55 100644
--- a/arch/mips/boot/dts/brcm/bcm3368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm3368.dtsi
@@ -1,4 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include "dt-bindings/clock/bcm3368-clock.h"
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
-- 
2.20.1

