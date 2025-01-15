Return-Path: <linux-mips+bounces-7465-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15239A1277D
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 16:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3617C1621A1
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 15:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC5215B551;
	Wed, 15 Jan 2025 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUSPSxF1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD52B73446;
	Wed, 15 Jan 2025 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955029; cv=none; b=Zqjb2wNrDrV3zx3lAHvjScAofXvm+lA1oFMr+XJi41tbole8GA8riSZ1AiklJ9DAN+bDET3BiRq0KujvWl9vDQl3p3yYN1u/dMbl1Ikfp0nvKG0FmwDzf9mVRylydBv2rbdeT76UtjQl8rhK8qGtF2uEptGHVFummVHhI9ytGes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955029; c=relaxed/simple;
	bh=Mb/N3AoDnNmhhGZ1ovxuHi9a+9kytbcaEXv9RV8d9gY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A2ybV/zts73KZyTSFg87pJTjNm1sNc0JbVRPIfi7wz7hmLtloRly3aposVGZYuJn7E7W9DTwZpD21SlJdfRKVdgoCuAVtTw5m9ncZ8SSzRcUntM/hXB0vlI4bfmLdHrlhCyl/xUbMB/ydlf7tlqce4g5FARg3BQshcEohH3WPJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUSPSxF1; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e0e224cbso3550533f8f.2;
        Wed, 15 Jan 2025 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736955026; x=1737559826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3LiQUy7nqIyAa4C0/kjCRPp30DaudT5SVWChRE0lVs=;
        b=dUSPSxF1cZAihnBc3zpRzmM1Mzoy0D+w5lh+QA84IU1AgiG9JRZR3ZoxHYYxfW1m4I
         tMEhdy5C54ALFFzqG3TS9zfmTAJFmwuliV1/ovwFlOIzPQBPyMHRyQKIAHtLamFS7qw7
         1x18QpHteaqHHNKAeUim54QuoA+2OOYVM5ecd1tpX/YXohwHdES2iRHuu5FFt6zc8m8N
         WspSUQeZAfPUFqo5rdYxtD7no5zydIczHhpTM8JmT40ny6cJB8DRaWIcIy1lwn3Jki6W
         sTEBTfjpja550zV+OJRZ2KJ6taULamRvBCfQ1/SZ2xsYWx8TG0kaTDjntZVvWt3ESfKE
         o+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955026; x=1737559826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3LiQUy7nqIyAa4C0/kjCRPp30DaudT5SVWChRE0lVs=;
        b=HvZbtkdBuw0s4Bl4wYuD1D7OnbBb8sQaNcJAOaFmZVsRTFRMfuNsh/D79c1vvvtiSD
         eyp/ZCz7ChSaCP2jhHVDmAyc6TCgvzVSDjcEGmy37V4Wn4PsZUpoIrgorb2+vDcAxGRZ
         xLbK4dIVztm7THzk3WLXRcs/QFlsn9JAGjLhuX7MFWFTxVD/hLdLh6zOug8I2lblQWH2
         L9CIVIlLt2GdyqjFS9SoCLOhp0ELcleNcYeIJcAvKsCI6HoujO32JypbNpJaoZAXVMFD
         m/AEPjsgLiJeGUKlD6LQpBtUBx5AZ7tXAMDG3/qW5mW8i/HGW+ulu/DXAF078jqTE/1E
         Kg6g==
X-Forwarded-Encrypted: i=1; AJvYcCUS3EygF8Nt1fA+Dv2g1P3dx1hYuuT2Qn3tO3HfeWAx6DQ+VpaHVZtMdKmp30gMFh1NqG7K7nSqr4iZ7J4X@vger.kernel.org, AJvYcCW9O5lyLeeJqmacCuXAiXE3bfrhKj0ZJJffwCTyH6nuTZC1WBCBxqp6wLFWJgCr9qJ7EB3Q02jB1MrNag==@vger.kernel.org, AJvYcCWdSstiGiu8VytZxJwrW0YjD+3LWD2SBgX5VJboDI6cfBAw/uNCUACB/gexHAxeuLJz9AFLk7MEC4hJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwRRKdgQfn6AZnvD/GBUh4G5qOmzobVhcOaM8FLMi9OTlMq7sMA
	vYN1SRhtL4UjlWB68KXh3BGHE+1kTHdS+XD/QFvpVOJVgfSKw2DYy2hC6Q==
X-Gm-Gg: ASbGncuC/hXnm0sMMBZN+HGdl68b/LyuGBvbuc/cw/pAG400RWj9qkUeIkuquwDIV8Q
	PM3dQxw81TCJHSupXd0ln11GeIIBSWhqnzIWyTp1s1nlCBXoHjGUrZnJ/fId5uXOgfD6SV4VWY7
	qPITRy6p0nz3X1H9coA2qSkODgPUd5FOOsKsF03Cpexb25E3h00vSFccF/1rqdrcm5S1ewitJ1e
	9xeSERf8DPKBtbMq8UQBWuyAdY6SSgFnzIxB6KJTDRs04N7MD0Am7jjtSPIexoCEKFbKw4ZgVMu
	/8ZMnwR8VsHb3kCKw64WlmCzuVs0WmXXxTLeCMw+iDAtO1Q=
X-Google-Smtp-Source: AGHT+IES4iYCGOSrqx7W5hJUi8uDJkqdEje74dqjHoPdRBvB+cYG4TUfRjHs1GFulLnhljw67vZYmA==
X-Received: by 2002:a5d:5f52:0:b0:385:e8b0:df13 with SMTP id ffacd0b85a97d-38a87308ab0mr27876762f8f.40.1736955025659;
        Wed, 15 Jan 2025 07:30:25 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm7440771f8f.43.2025.01.15.07.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 07:30:25 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: sboyd@kernel.org,
	mturquette@baylibre.com,
	tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] mips: dts: ralink: rt3050: update system controller node and its consumers
Date: Wed, 15 Jan 2025 16:30:16 +0100
Message-Id: <20250115153019.407646-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115153019.407646-1-sergio.paracuellos@gmail.com>
References: <20250115153019.407646-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current RT3050 device tree file is out of date and must be merged with real
device tree file used in openWRT project [0]. As a first iteration for this
changes, align the current file with the needed changes for system controller
from '6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS SoCs")'.

[0]: https://github.com/openwrt/openwrt/blob/main/target/linux/ramips/dts/rt3050.dtsi

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/rt3050.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/rt3050.dtsi b/arch/mips/boot/dts/ralink/rt3050.dtsi
index 23062333a76d..a7d9bb9bc1af 100644
--- a/arch/mips/boot/dts/ralink/rt3050.dtsi
+++ b/arch/mips/boot/dts/ralink/rt3050.dtsi
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/clock/mediatek,mtmips-sysc.h>
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -25,9 +27,11 @@ palmbus@10000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		sysc@0 {
-			compatible = "ralink,rt3052-sysc", "ralink,rt3050-sysc";
+		sysc: syscon@0 {
+			compatible = "ralink,rt3052-sysc", "ralink,rt3050-sysc", "syscon";
 			reg = <0x0 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		intc: intc@200 {
@@ -50,6 +54,8 @@ uartlite@c00 {
 			compatible = "ralink,rt3052-uart", "ralink,rt2880-uart", "ns16550a";
 			reg = <0xc00 0x100>;
 
+			clocks = <&sysc RT305X_CLK_UARTLITE>;
+
 			interrupt-parent = <&intc>;
 			interrupts = <12>;
 
-- 
2.25.1


