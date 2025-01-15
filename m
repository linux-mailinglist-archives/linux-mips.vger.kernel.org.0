Return-Path: <linux-mips+bounces-7464-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD81A1277C
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 16:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BA8E3A1CAC
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 15:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83201598EE;
	Wed, 15 Jan 2025 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3ghdy1T"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2791524B0;
	Wed, 15 Jan 2025 15:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955029; cv=none; b=Ime0ngTULfoygxWlecuXfs9yJ95FCeV7n68BIROIpTvSj0u+R+LWJThPe7J2xOrygGea8ITtLnkhJUbNPJJJAmEPflOjvz9d0g9sNahHs78wITiXu99xibZNdq5VqYFrdvtFCUUg1+vcij02mwWsBOP4d6qqLPGN88Py8DgLP6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955029; c=relaxed/simple;
	bh=COkg5yK/M1FB1vhiHcaYET2A3y9Wg+C4URfazJ4Le8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MukSnTLMwYm8aKkg4nvW1I+pU/F0YepEWyjNRGnOzUpocddw4iEel7d0eSMO128YdG1z9/UOurk6Q/DXK2Hz1oJpVQFUcO4Sd/pDOOZ+HiTu79u+At7JvHRD0h2J1PJhdjDrbCi2BxS7jioFr1tkxlF69PVieXA2HX/65gsbaYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3ghdy1T; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43635796b48so6698475e9.0;
        Wed, 15 Jan 2025 07:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736955025; x=1737559825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76EF9Ia1cxHNI9capiV8Ow/32o4R7C+LVmyijfOQKEM=;
        b=c3ghdy1TmJtObum/CpKLvjL1Iqlz7rz6raUkfEEaku1vvDnvTw7FrjcfTl9goDUVd+
         qOT105TEG4/q+zeEJHEDx1h+WGpRCVKzHJ34JsazxSSCz4PodJSApJdA8eaypCyEOzK/
         /koYVYqJKZDjOXIWUuRig+Ujb/sV8ml5xvtd1CHBdJ3PWJ35DmJYxSJmJ4Wn2U9lhJX/
         BqWmnCII7U/Dq0jGhIlgiiFLZ8B+iudX0nfbSqQfIinHFZhmeXyu878a6SZrkB4lU50S
         tYPP79g6FhdfuaS2gUc9gaCwf9pT0tIHBt71h294JPlVpFbqU7AcgwvvmeDW9E/9d2fT
         Dexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955025; x=1737559825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76EF9Ia1cxHNI9capiV8Ow/32o4R7C+LVmyijfOQKEM=;
        b=gR/p2y8yd1Sf82tBmezpOpfkjiUK5bWeTP0onFDEFX3bbTLQpWIO8VbPAJLiqz71Xj
         49SY/qTXiGL9GFSw44L8etBWTS0XKNQ/d7hadD3GcUAaE3JHmel2ZAbfbHyN5WWI3FI+
         vLT2pw60TxseynuSfFRE54/GfQHzSiMkGEVlX3KktmWXLV4DHbDB6/TMgHbWxVgDt+eO
         RR/lWPmlVyeCsDMv1PgKNicgTQpownohybFgo2R5fc/vc2DkTc2nqW71N1zbqZtykbAs
         LphNU/A6Sv8oPeA1q/oxGOhre2YPTndPh/K0dyW3VYB3uX4ouyBNtZfgv6+FA37fHLVU
         x20A==
X-Forwarded-Encrypted: i=1; AJvYcCUpeDbxL8NdoUvMb09QHaAzXo9Gofx3jfsNFESQ0zmwZhMNA/Hr0BGF0IwW1/jZvZBue/m680JEYXzWjqYt@vger.kernel.org, AJvYcCUrL0szRsNy03On5JzPoYCxaKzo4VTNYmYD6V/mGpGIRy+PSBUPawaiYEclc+shm0G0vTMQC6j5FhZS@vger.kernel.org, AJvYcCWMAiqZk+KEUcMx12p/6TlOibni6AEpxZGXUJbIhOV4j9Teu8H7GU86bdDc33MDQasn+S2CIidKmwqQwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqBiwedt1UNSnDicnWt4c1t3JPYm+C+qy6fEAGZKBtK7EUg05a
	sXYZmamErQ20sCnod+ip0I/QaRRfS4J/GU+TLl2XCVsEI/shszTNZL+T3w==
X-Gm-Gg: ASbGncv/SSvTaSxN2FXVpTGv7mQZo8ROXx3wHZQehNuO4ZLiZTHVvrmcrrshAL742pF
	A31lENqDqWjBLVTNRjXuvwyQDwBwWsLL+/zrE/RjR/+6vOGQJvqB9vfM7ifgWlWrBev5pe0t/76
	vP9XutFvcUGNmVO5vJ8VOrXbyubkppTIalPaiqhEH+XlS3XRxnDu/ZqYgqdFMJEJcUALSu3eNF+
	QTf2bD96d5WRC7SBn9aT6/OYMVH4sHH2B3aFJTQVnBi+sQXs3cUf2JMGDMoGoUTfsxybUWcjM5r
	s0IQ9k30YgFN4tuEKPBBOofSRgrAivPpciH8WX/HkyS501o=
X-Google-Smtp-Source: AGHT+IFpqId96NVeX6uv7aaKrrvxLNyBUOu/QVTUaNHmUyIkDZh4+o1egk54YUKIaQMf52wgyjDSmw==
X-Received: by 2002:a7b:cc94:0:b0:434:f2af:6e74 with SMTP id 5b1f17b1804b1-437c6b2ff46mr31612665e9.15.1736955024422;
        Wed, 15 Jan 2025 07:30:24 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm7440771f8f.43.2025.01.15.07.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 07:30:23 -0800 (PST)
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
Subject: [PATCH 2/6] mips: dts: ralink: rt2880: update system controller node and its consumers
Date: Wed, 15 Jan 2025 16:30:15 +0100
Message-Id: <20250115153019.407646-3-sergio.paracuellos@gmail.com>
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

Current RT2880 device tree file is out of date and must be merged with real
device tree file used in openWRT project [0]. As a first iteration for this
changes, align the current file with the needed changes for system controller
from '6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS SoCs")'.

[0]: https://github.com/openwrt/openwrt/blob/main/target/linux/ramips/dts/rt2880.dtsi

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/rt2880.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/rt2880.dtsi b/arch/mips/boot/dts/ralink/rt2880.dtsi
index 8fc1987d9063..1f2ea3434324 100644
--- a/arch/mips/boot/dts/ralink/rt2880.dtsi
+++ b/arch/mips/boot/dts/ralink/rt2880.dtsi
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/clock/mediatek,mtmips-sysc.h>
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -25,9 +27,11 @@ palmbus@300000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		sysc@0 {
-			compatible = "ralink,rt2880-sysc";
+		sysc: syscon@0 {
+			compatible = "ralink,rt2880-sysc", "syscon";
 			reg = <0x0 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		intc: intc@200 {
@@ -50,6 +54,8 @@ uartlite@c00 {
 			compatible = "ralink,rt2880-uart", "ns16550a";
 			reg = <0xc00 0x100>;
 
+			clocks = <&sysc RT2880_CLK_UARTLITE>;
+
 			interrupt-parent = <&intc>;
 			interrupts = <8>;
 
-- 
2.25.1


