Return-Path: <linux-mips+bounces-7525-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFCBA163A3
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 19:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47C593A5E37
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 18:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96071DFE0C;
	Sun, 19 Jan 2025 18:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="oQmIvtBA"
X-Original-To: linux-mips@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BBB1DFD8F
	for <linux-mips@vger.kernel.org>; Sun, 19 Jan 2025 18:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737312270; cv=none; b=ifCvEcSjkYrxHdR+9eEC2U9OBj2JDWx+AbYEcC46AYelQpwdY/fUGVinPRzDQ+GG5MR8BWzCw1Ea1+1LuYwCXLYEiF8RwpMQDRLGH+ZkmwYyU7TxWdWgC5pbeZgkk+tW9V+YXNAFr6h40nSPWn92u8lZP7VM0MCmR1TCjOqd4c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737312270; c=relaxed/simple;
	bh=ON6PJKUcYmYMg0l3TDey9gKncPo/NlnG4KjDFUIdpDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E3s7ifW+GXFnL/IX1MGOrEap4UJdLmzo5J6ah/1Lu3BMWV0OCVE188eWFC6kBTX1w0fuUIRdrp+91p71cOxggQpjL3ynH510Hp8Vl1q2eZcCWR9pzf79jXJKUkZ0NOp+DVXvUTf1ij4PriovFvNwFM2rTyfEs2i8B15W7aeB17o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=oQmIvtBA; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 96FB75A7E4D;
	Sun, 19 Jan 2025 19:34:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1737311690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmnlXKkw6WYoqwfymcm3ceL6H3zSYoIfS+V2I2wrFc8=;
	b=oQmIvtBAZQknoMlSpM1tlit8GrRhyvwkpb0/HBeSTjwI6O8uw0oERSjkrkVT07/vHCmYKb
	7r7gS+OwWRTNqe+HWxDj0xiQDpGF7IJ1wBU+P6ZuV9WOM4iUHlOMKKdmy7DtulWafGWiDb
	YkFeAei+BCvLdVcItCUELpwnP33SuQu7ltIgr5ToKcVwSI4VMI56I6l9C48NoCi+NoT64o
	VFXS0/xMJ0ihGYSZqtM44X4liIVtzVcQ6l4xC81mK51LnTNMzxjcYUV0SyTnthlLvH8vTe
	WAkGQ3X0qJ4gekGfKP8ul4tqzmg8gEWMtEe9+kvUDdb2Chvx2v6HsjcoITcbmA==
From: Sander Vanheule <sander@svanheule.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 2/9] mips: dts: realtek: Clean up CPU clocks
Date: Sun, 19 Jan 2025 19:34:17 +0100
Message-ID: <20250119183424.259353-3-sander@svanheule.net>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119183424.259353-1-sander@svanheule.net>
References: <20250119183424.259353-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The referenced CPU clock does not require any additional #clock-cells,
so drop the extraneous '0' in the referenced CPU clock.

The binding for MIPS cpus also does not allow for the clock-names
property, so just drop it.

This resolves some error message from 'dtbs_check':
    cpu@0: clocks: [[4], [0]] is too long
    'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 arch/mips/boot/dts/realtek/rtl838x.dtsi | 3 +--
 arch/mips/boot/dts/realtek/rtl930x.dtsi | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/realtek/rtl838x.dtsi b/arch/mips/boot/dts/realtek/rtl838x.dtsi
index 722106e39194..d2c6baabb38c 100644
--- a/arch/mips/boot/dts/realtek/rtl838x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl838x.dtsi
@@ -9,8 +9,7 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "mips,mips4KEc";
 			reg = <0>;
-			clocks = <&baseclk 0>;
-			clock-names = "cpu";
+			clocks = <&baseclk>;
 		};
 	};
 
diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts/realtek/rtl930x.dtsi
index 67261d6fcaa7..f2e57ea3a60c 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -26,8 +26,7 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "mips,mips34Kc";
 			reg = <0>;
-			clocks = <&baseclk 0>;
-			clock-names = "cpu";
+			clocks = <&baseclk>;
 		};
 	};
 
-- 
2.48.1


