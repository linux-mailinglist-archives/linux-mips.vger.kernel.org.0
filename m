Return-Path: <linux-mips+bounces-7467-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6656AA1278C
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 16:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E60D47A2990
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 15:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FCF194A54;
	Wed, 15 Jan 2025 15:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+VRMFQc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735BD16191B;
	Wed, 15 Jan 2025 15:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955032; cv=none; b=E4wvgo6QvKFbiJX1/JAQcX+WUtY6bZ5KZkVNaSrRWTElNk8SarB0vj7YkJKNK5lfwA2yMFB/cX7UBWQfN88uRKNM4jxklThvKeDKHWKrpWBOmeK43cK7PqJqRjhYhtja63uvSx45eLHZwpKEJLNH6C6qDmG0VcEq70D4cYxuXv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955032; c=relaxed/simple;
	bh=wr9X05t3ELhtRYJJMg0J3GU9DqG9HkR1/s0wIptTYq4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DbZ3wg8pIUnod5mgqGGVUNv2mFx0vPBBlR96TbVywWhzgSbf+lNPIR5lugEJa1PKJtJrys1dyjQzoxieTQC3Iupk+OVIsqBSqYZXTnku3BpdfBJSXvcOdWyJDf28kDNtPiV/RlcWKUu6l+mOzTmEAj3s7jFe7sFgtb+zlUhMtHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+VRMFQc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4362f61757fso66161845e9.2;
        Wed, 15 Jan 2025 07:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736955028; x=1737559828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jz3YHO1mIYZei2TBnoHa6j84+LKIbIE5tUu26j+wuXI=;
        b=C+VRMFQcFm/DqPeZFEniJkmNGp81HIBtHtCRdiMAy2JgOvlxYmFHjLbyI3esRTCo5B
         sRG2A9I00WiIA83dtJ0xEFFJ5RXkfmryQ5CISOoe5RV3yiskAMfXoi+niQz3Td36mJGO
         JLRdPDJtKdq7fdcQDbgCigJJsHHirISuayBLwBHyNMAYUlqu+DH/saVKwfzul9kwsiM7
         +DT0JJjm3aqKJFc6FSG/JSdPzOXAqN0ywriq3OTaDC9/cvrqP6iSRuukeBMWko1W0xj9
         2ymlEDNfbyOxo3xPoYFxYqH/ma2YBJCiEHnsOtHlZVf50aJtHByTJIZtdvuIdA6NNpKT
         hnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955028; x=1737559828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz3YHO1mIYZei2TBnoHa6j84+LKIbIE5tUu26j+wuXI=;
        b=PLceMXKGxNvce0OhowIH8M6zl+LjQqkXk25+5639q8aVH59QEE97wyq4QYtIxZrbxn
         W/YTq5sLV02rXu05X1uXgxeaaRA+I+zt9wl7onhghPjlluRzjwJl0w35FwSGkMsjk4lb
         /DnQFFlylum1fPdLXAYF/ApUNlPlVXj3kvEBVfi3iL7Mi76MZpO/7zefZ1bBVBhnISZj
         Fml4XEJOw/d7ejFsO3WsrUb+ffLM3kVntqvemgagLNmoRDsx3rk2rbgWoQGK4jqtJIbV
         1xungQzjqm2JCZhT265etmvtafWqupxNQDahVwpN+mq9zctGbf30khh4Q/QN8dYGrJoG
         okrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAdf9C2PQIoM5703Lj2ihQ83BJ0SuuAZm+N2l2gI4u7RmMUqlas6FY3iraJyVWZ/R38VxB64w4cWpw@vger.kernel.org, AJvYcCWUoY+sYhRHmP+fM2qXI25C675xQF87S4Q+Y8wNxmhQcDYKb+lzV1V0DVHcD0u1i3Um55Ow4FtbGxmIm11x@vger.kernel.org, AJvYcCWlEBVpVyFYiSKJB2Rn8z4L/uinImewmXunPV8AUbWJdQF+diW1/it9ci9cmFRhx+387+s2yDctN2uusQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbMH4TRUEi6z843sVV1XiPHrHN0gS1YYppDtV8Kr62g6cknFRw
	L/E01TQs0LCe0lbDnNJbaoiEOWQpZLFd8bPpP/bsJwT2I/+Cij3Wl8d6Rw==
X-Gm-Gg: ASbGnctbv7fWHhRujfzrtQJ/NEnOrkB+7f5kqAglT0XQBfTKMutNu6gD7JeGz4i63Fu
	ZP/WmQ941hw89HQwDsGgxh+z/wNAEYEvq+MEz7iksO2tC+mh3dP0aq2PrkGn02B7fdk++K5ZLnw
	C2hBSqB/ITjnPgM2rTiJXiY1Kpxs9Kn3HqC40BMG2NcGNWZa7HCzB1PzHV4q2QnD+ERP2JP5NlD
	iojSXT3AE4s0sWUA2QdkXD6XAbH+bWPKTKWCKjjqr3SRuxd2voNswaKX2OFoA6xmZDGbL5KlMpD
	4OJ6XZ+p5VEvNOjAIOnF2+xAx7BRP4QjGSpJXBaw7fOarEM=
X-Google-Smtp-Source: AGHT+IGBBzkQG7Mwed+ivczSnLLZS2BI4onTxxW4G/5zgRXLy6CZgkIgTqFZEPVtjp2nJonKfBXcjA==
X-Received: by 2002:a05:600c:45c3:b0:434:a90b:94fe with SMTP id 5b1f17b1804b1-436e26c3c3fmr304478255e9.10.1736955028324;
        Wed, 15 Jan 2025 07:30:28 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm7440771f8f.43.2025.01.15.07.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 07:30:27 -0800 (PST)
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
Subject: [PATCH 5/6] mips: dts: ralink: mt7620a: update system controller node and its consumers
Date: Wed, 15 Jan 2025 16:30:18 +0100
Message-Id: <20250115153019.407646-6-sergio.paracuellos@gmail.com>
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

Current MT7620A device tree file is out of date and must be merged with real
device tree file used in openWRT project [0]. As a first iteration for this
changes, align the current file with the needed changes for system controller
from '6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS SoCs")'.

[0]: https://github.com/openwrt/openwrt/blob/main/target/linux/ramips/dts/mt7620a.dtsi

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7620a.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7620a.dtsi b/arch/mips/boot/dts/ralink/mt7620a.dtsi
index 1f6e5320f486..d66045948a83 100644
--- a/arch/mips/boot/dts/ralink/mt7620a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7620a.dtsi
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
-			compatible = "ralink,mt7620a-sysc";
+		sysc: syscon@0 {
+			compatible = "ralink,mt7620-sysc", "syscon";
 			reg = <0x0 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		intc: intc@200 {
@@ -50,6 +54,8 @@ uartlite@c00 {
 			compatible = "ralink,mt7620a-uart", "ralink,rt2880-uart", "ns16550a";
 			reg = <0xc00 0x100>;
 
+			clocks = <&sysc MT7620_CLK_UARTLITE>;
+
 			interrupt-parent = <&intc>;
 			interrupts = <12>;
 
-- 
2.25.1


