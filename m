Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDB43ED287
	for <lists+linux-mips@lfdr.de>; Mon, 16 Aug 2021 12:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236294AbhHPKyK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Aug 2021 06:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236262AbhHPKyE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Aug 2021 06:54:04 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E8EC0617AE;
        Mon, 16 Aug 2021 03:53:32 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id w21-20020a7bc1150000b02902e69ba66ce6so11332090wmi.1;
        Mon, 16 Aug 2021 03:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oxOatG4DF7XYl9LgqDB0uxXeMKWrkqq1loDCiH5OyG8=;
        b=tIftbxq6xukMGm7k5IVdb3khjkUO3tWoZsnC2Q/sTgcx670dnBOZ9OA8YyuqbyhHfP
         sm5iGcqSHraEVwlgEIbbUbijE7tP9a3QGE9/wEEXw+2GouF+VTXxRcCCqX38QAnE6BpA
         blOqaIZxYt0aolL/p/OuBGeDYlJDV+6FKwOx5JIJzDXIb0cnPEy578hxwOgFiJ3UDMmc
         U57WJfmduamBexTbcuthRdkbrGLHpG+IZ4Z3iKUdP8HW+xrUnllWxBHP3fJtoDRP53mA
         yjSxBJNV14q3jpy2WTjr7ej7xFJUlNv5K6K9sCwdLPVBQAUVYlf29R8E2CvExy0ZWfWQ
         Veug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oxOatG4DF7XYl9LgqDB0uxXeMKWrkqq1loDCiH5OyG8=;
        b=jXfPt/K0wIHxBhdkA3FIdIraztMXtPqEncl/aJbB3r1Rj5PLcn79Venw9ffwVZ5BR3
         tmwZMA916z41DDUBc9vt/ODxACeMzXGEX0iU+mTsl8sLKsBgASlZS6fBTfs8E7KxBQFR
         1Rrz2NMtN0KFDpSH/g2TwxUMLCNJkawaUol9A+K+aYkoEe8DqEaI5zWyseodgNb3dLWw
         oCszhiwbowi0MICjTovDakNte1yzCSCCAxVj1bhzWPIy8itLEFjGb+sDH4ZuWnjvWYls
         DUasjTgtW6UckGgJ3nXXCcXXt321Zf4vewU3eqha2Ejd2s0MfXOqowv97eFK/L8pQUDc
         Nb9A==
X-Gm-Message-State: AOAM5328caVfDJIc4uKcPlcGC9g51sOd5Dw5Px0AiHBZmzmjb/9m92y0
        Yid3TPWSJwSgCeqUJjhrd4w=
X-Google-Smtp-Source: ABdhPJwjou4vsHP2NA59mLGcx7Ox9lb5n8xWulwoxJDcmZ/PekWAPvEOTFbBleQLNbnjFBVIG8ddRg==
X-Received: by 2002:a05:600c:3590:: with SMTP id p16mr14302162wmq.33.1629111210554;
        Mon, 16 Aug 2021 03:53:30 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id k26sm631704wrc.33.2021.08.16.03.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 03:53:29 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rahul Bedarkar <rahulbedarkar89@gmail.com>,
        linux-mips@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2] MAINTAINERS: adjust PISTACHIO SOC SUPPORT after its retirement
Date:   Mon, 16 Aug 2021 12:53:26 +0200
Message-Id: <20210816105326.8050-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 104f942b2832 ("MIPS: Retire MACH_PISTACHIO") removes
./arch/mips/pistachio/ and ./arch/mips/configs/pistachio_defconfig, but
misses to adjust the corresponding section PISTACHIO SOC SUPPORT
in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    arch/mips/configs/pistachio*_defconfig
  warning: no file matches    F:    arch/mips/pistachio/

As James Hartley is not reachable with the provided email address, the
remaining dtsi file, arch/mips/boot/dts/img/pistachio.dtsi, must be
maintained by its only user pistachio_marduk.dts, which is part of MARDUK
(CREATOR CI40) DEVICE TREE SUPPORT.

Add maintenance of pistachio.dtsi to that section and drop the PISTACHIO
SOC SUPPORT after its retirement.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210816

Jiaxun, Rahul, please ack. 
Thomas, please pick this minor non-urgent clean-up patch on mips-next.

 MAINTAINERS | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1a2d3ee2711e..968008105fe7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11088,7 +11088,7 @@ MARDUK (CREATOR CI40) DEVICE TREE SUPPORT
 M:	Rahul Bedarkar <rahulbedarkar89@gmail.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-F:	arch/mips/boot/dts/img/pistachio_marduk.dts
+F:	arch/mips/boot/dts/img/pistachio*
 
 MARVELL 88E6XXX ETHERNET SWITCH FABRIC DRIVER
 M:	Andrew Lunn <andrew@lunn.ch>
@@ -14797,14 +14797,6 @@ S:	Maintained
 W:	http://www.st.com/spear
 F:	drivers/pinctrl/spear/
 
-PISTACHIO SOC SUPPORT
-M:	James Hartley <james.hartley@sondrel.com>
-L:	linux-mips@vger.kernel.org
-S:	Odd Fixes
-F:	arch/mips/boot/dts/img/pistachio*
-F:	arch/mips/configs/pistachio*_defconfig
-F:	arch/mips/pistachio/
-
 PKTCDVD DRIVER
 M:	linux-block@vger.kernel.org
 S:	Orphan
-- 
2.26.2

