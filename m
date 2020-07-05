Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC60E214BEA
	for <lists+linux-mips@lfdr.de>; Sun,  5 Jul 2020 13:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgGELGH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Jul 2020 07:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgGELGH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Jul 2020 07:06:07 -0400
X-Greylist: delayed 2020 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Jul 2020 04:06:07 PDT
Received: from srv1.deutnet.info (srv1.deutnet.info [IPv6:2a01:4f8:c2c:6846::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284E5C061794;
        Sun,  5 Jul 2020 04:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deutnet.info; s=default; h=Message-Id:Date:Subject:Cc:To:From:in-reply-to;
         bh=9RqakjcOQ0iT13dXU3AtCLGvxpvLbBZxWkbFyKKM6Wk=; b=OVAwJdwvpjjDKvO4X41HVqre7
        vnlrz+TK6m2jaaf18M/f71P6I8c7jJpgN9UiINOm1rk11wUuv2WZksMPNKazptCJZZG67RX3VBOSA
        sYuK/qMZtun73cKHAXpDUROMv1zwwGQhrGn8nD1koFH2tVCMbjzZrpZLJrre/R6cQOdFOBysRFmTD
        iiEJPGgHe3PshYJWIpHe/gCqzBa7CqgOMAFRVjUXFrF8WSUz0fPCIyF4QFxWGSQY6ulRsAe1bwVWj
        1V6tJooeqhMQisMiDNVc201hWgOiUN3fMRJsT1YdOpOEnSi4jHPoV1UawZX802XC281B0q0mD2ay/
        CGPQL4E9A==;
Received: from [2001:bc8:3dc9::1] (helo=srv100.deutnet.info)
        by srv1.deutnet.info with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1js1wa-0002f7-Ta; Sun, 05 Jul 2020 12:32:20 +0200
Received: from agriveaux by srv100.deutnet.info with local (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1js1wa-000P9z-DI; Sun, 05 Jul 2020 12:32:20 +0200
From:   agriveaux@deutnet.info
To:     robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, agriveaux@deutnet.info
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] MIPS: CI20: DTS: Correcting IW8103 Wifi binding
Date:   Sun,  5 Jul 2020 12:32:15 +0200
Message-Id: <20200705103215.96672-1-agriveaux@deutnet.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexandre GRIVEAUX <agriveaux@deutnet.info>

Use brcm,bcm4329-fmac instead of brcm,bcm4330-fmac.

Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 75f5bfbf2c37..82a1f126b778 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -116,8 +116,8 @@
 	pinctrl-0 = <&pins_mmc1>;
 
 	brcmf: wifi@1 {
-/*		reg = <4>;*/
-		compatible = "brcm,bcm4330-fmac";
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
 		vcc-supply = <&wlan0_power>;
 		device-wakeup-gpios = <&gpd 9 GPIO_ACTIVE_HIGH>;
 		shutdown-gpios = <&gpf 7 GPIO_ACTIVE_LOW>;
-- 
2.20.1

