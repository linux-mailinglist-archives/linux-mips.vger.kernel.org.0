Return-Path: <linux-mips+bounces-10347-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A91A9B2932F
	for <lists+linux-mips@lfdr.de>; Sun, 17 Aug 2025 15:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 848F17A9532
	for <lists+linux-mips@lfdr.de>; Sun, 17 Aug 2025 13:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB2221FF58;
	Sun, 17 Aug 2025 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="MAYL03pp"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B600241CB6
	for <linux-mips@vger.kernel.org>; Sun, 17 Aug 2025 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755436241; cv=none; b=WK8n8S0Ar51gLPP0EUtuHmNhhYH7onOygqC4qGozVYQLQEXZxMRk8qRySZK1hD8J3awCan8dKsMmv1zI6Li74DIjcRRB8E1jfDq5dWKIbm+jRPgv3fvUOc+FsEu/7muriB7fJjt1YcSwtAix/VOHun0Y37/GI8Bz1TB1qxLiSzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755436241; c=relaxed/simple;
	bh=tSKPjQWgI9Bxh3qDSdhjw6eM8Xm/Cb5smcXqma73rxc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uX4mFeG2pAaaaX5MWmcKYl9LHt7fym+oKHzNznZ7V/N8kR3SG5LRPxE8MHR5c6Bh4IO+4asJJnK9jA3ThR+6UPM/LoLnu0kB7ahJ62/VaALA7NCn3A42n+V2eVt51b8aa/h0QqVLJIO64MBBPudrhwxUM/gbnDx9gDVBHDKXn3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=MAYL03pp; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 45811 invoked from network); 17 Aug 2025 15:10:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755436233; bh=f3mcEVhqA0qykeTow8LOueZzOYhw8zULyrWKE0mZ8DU=;
          h=From:To:Subject;
          b=MAYL03ppFP9vO2XGU6WffTlNFY+KT7ToacUudGaWy5MXUAoibyCduYWl+n2BSrId7
           RoRkhMDSncM4NpfIqXrKsw1t02zfxjwuKk65EZXmegh/2BpLHLvRsLW/EBGnne4dQH
           CLNXvyIK7hEG5CF1kvbpXrEzOw8ztH5AZof9pRSvKJO/m66zfwFkFkdSA/OwbljxvZ
           fVdRlOFAiHJ9CZJWBMCzM8xHjmMWhWiwdo3fhyRgyECxieZvet41aYLM/PARLF2oeh
           69rUUwSiSFQIzV1fLVAKAE68dB8WpCD6QT8LZBKvd5DjnFEVgomeGIT59SKzpQMNYe
           7kYfhu/fXV/qg==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 17 Aug 2025 15:10:33 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	john@phrozen.org,
	olek2@wp.pl,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/2] mips: lantiq: xway: sysctrl: rename the etop node
Date: Sun, 17 Aug 2025 14:49:07 +0200
Message-ID: <20250817131022.3796476-3-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250817131022.3796476-1-olek2@wp.pl>
References: <20250817131022.3796476-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 5fda69cfe5c5c6b9c1b3de6c156be420
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [MeMx]                               

Bindig requires a node name matching ‘^ethernet@[0-9a-f]+$’. This patch
changes the clock name from “etop” to “ethernet”.

This fixes the following warning:
arch/mips/boot/dts/lantiq/danube_easy50712.dtb: etop@e180000 (lantiq,etop-xway): $nodename:0: 'etop@e180000' does not match '^ethernet@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/net/lantiq,etop-xway.yaml#

Fixes: dac0bad93741 ("dt-bindings: net: lantiq,etop-xway: Document Lantiq Xway ETOP bindings")
Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/boot/dts/lantiq/danube_easy50712.dts |  2 +-
 arch/mips/lantiq/xway/sysctrl.c                | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/boot/dts/lantiq/danube_easy50712.dts b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
index d8b3cd69eda3..c4d7aa5753b0 100644
--- a/arch/mips/boot/dts/lantiq/danube_easy50712.dts
+++ b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
@@ -82,7 +82,7 @@ conf_out {
 			};
 		};
 
-		etop@e180000 {
+		ethernet@e180000 {
 			compatible = "lantiq,etop-xway";
 			reg = <0xe180000 0x40000>;
 			interrupt-parent = <&icu0>;
diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysctrl.c
index 5a75283d17f1..6031a0272d87 100644
--- a/arch/mips/lantiq/xway/sysctrl.c
+++ b/arch/mips/lantiq/xway/sysctrl.c
@@ -497,7 +497,7 @@ void __init ltq_soc_init(void)
 		ifccr = CGU_IFCCR_VR9;
 		pcicr = CGU_PCICR_VR9;
 	} else {
-		clkdev_add_pmu("1e180000.etop", NULL, 1, 0, PMU_PPE);
+		clkdev_add_pmu("1e180000.ethernet", NULL, 1, 0, PMU_PPE);
 	}
 
 	if (!of_machine_is_compatible("lantiq,ase"))
@@ -531,9 +531,9 @@ void __init ltq_soc_init(void)
 						CLOCK_133M, CLOCK_133M);
 		clkdev_add_pmu("1e101000.usb", "otg", 1, 0, PMU_USB0);
 		clkdev_add_pmu("1f203018.usb2-phy", "phy", 1, 0, PMU_USB0_P);
-		clkdev_add_pmu("1e180000.etop", "ppe", 1, 0, PMU_PPE);
-		clkdev_add_cgu("1e180000.etop", "ephycgu", CGU_EPHY);
-		clkdev_add_pmu("1e180000.etop", "ephy", 1, 0, PMU_EPHY);
+		clkdev_add_pmu("1e180000.ethernet", "ppe", 1, 0, PMU_PPE);
+		clkdev_add_cgu("1e180000.ethernet", "ephycgu", CGU_EPHY);
+		clkdev_add_pmu("1e180000.ethernet", "ephy", 1, 0, PMU_EPHY);
 		clkdev_add_pmu("1e103000.sdio", NULL, 1, 0, PMU_ASE_SDIO);
 		clkdev_add_pmu("1e116000.mei", "dfe", 1, 0, PMU_DFE);
 	} else if (of_machine_is_compatible("lantiq,grx390")) {
@@ -592,7 +592,7 @@ void __init ltq_soc_init(void)
 		clkdev_add_pmu("1e101000.usb", "otg", 1, 0, PMU_USB0 | PMU_AHBM);
 		clkdev_add_pmu("1f203034.usb2-phy", "phy", 1, 0, PMU_USB1_P);
 		clkdev_add_pmu("1e106000.usb", "otg", 1, 0, PMU_USB1 | PMU_AHBM);
-		clkdev_add_pmu("1e180000.etop", "switch", 1, 0, PMU_SWITCH);
+		clkdev_add_pmu("1e180000.ethernet", "switch", 1, 0, PMU_SWITCH);
 		clkdev_add_pmu("1e103000.sdio", NULL, 1, 0, PMU_SDIO);
 		clkdev_add_pmu("1e103100.deu", NULL, 1, 0, PMU_DEU);
 		clkdev_add_pmu("1e116000.mei", "dfe", 1, 0, PMU_DFE);
-- 
2.47.2


