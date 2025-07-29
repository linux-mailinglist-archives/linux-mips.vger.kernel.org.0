Return-Path: <linux-mips+bounces-9935-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C72B1547F
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jul 2025 22:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01DE7560668
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jul 2025 20:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89542797BE;
	Tue, 29 Jul 2025 20:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ezKidRNI"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F927816B;
	Tue, 29 Jul 2025 20:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753822765; cv=none; b=HCN3x7iEIJjyfQ4IJNoaMhX1xxL8xJvui+uuXSySU1qo98vBRN3aKhutCKnluF7r8yTzf3cm2YrJvYWoiC3dkXSZa5JhLf9/bQXfRiwaMhkIPcvH3NfLTBbC1aQskB5H8QAuDthQMVzHXqloRmg7CMW7y5LkMyrtcuphEncQZNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753822765; c=relaxed/simple;
	bh=zBLNmvKbrgqGs0Ax1UJG+EsEMkfc9OigzsQ9bQodKqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DaBjoaEqT5KnbkyhwQtf5sJb5ubSYumgRso8FNDmJPnaKJmaHhPpW5kabh5Z6YJ295p5CTyN7a65hdnDK8xR35aaqb6NybYLtqGRS1zH7AXXc4jsZ4aY5wbhOm1ITruNy/64iirn/KS1aiFzh40fGi9AnoU/RFD7ZZJYcUuruWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ezKidRNI; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 2EBCDC0000DE;
	Tue, 29 Jul 2025 13:52:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 2EBCDC0000DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1753822354;
	bh=zBLNmvKbrgqGs0Ax1UJG+EsEMkfc9OigzsQ9bQodKqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ezKidRNIXtoGCcD6clzhbrvdA/DJLghN+Expet6wd+5G3jO0PR0Ivj7vnJevuDqFo
	 WuWIilnQBZN+ZRJRmcDjB49cxkbh+GnPmeFBByCGmvcX8UMbyZiHuQkySFxzNay3lZ
	 VwXHpQqS38HuclrMNGiWPYFalG8k47LH3U6+9SL8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 10C05180004FC;
	Tue, 29 Jul 2025 13:52:34 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 2/2] MIPS: BMIPS: Properly define memory controller compatible
Date: Tue, 29 Jul 2025 13:52:13 -0700
Message-ID: <20250729205213.3392481-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the DT binding updated with 501be7cecec9 ("dt-bindings:
memory-controller: Define fallback compatible") we need to define a
proper compatible string for the memory controller node(s).

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/mips/boot/dts/brcm/bcm7346.dtsi | 3 ++-
 arch/mips/boot/dts/brcm/bcm7360.dtsi | 3 ++-
 arch/mips/boot/dts/brcm/bcm7362.dtsi | 3 ++-
 arch/mips/boot/dts/brcm/bcm7425.dtsi | 6 ++++--
 arch/mips/boot/dts/brcm/bcm7435.dtsi | 6 ++++--
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
index 2afa0dada575..9d6f97e02ff9 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
@@ -531,7 +531,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index a57cacea91cf..a7f60f059e50 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -450,7 +450,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
index 728b9e9f84b8..2d483cbf254f 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -446,7 +446,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 62588c53d356..c3bb020ff2b5 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -542,7 +542,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
@@ -569,7 +570,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index cfdf9804e126..60cfa4074cce 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -558,7 +558,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
@@ -585,7 +586,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
-- 
2.43.0


