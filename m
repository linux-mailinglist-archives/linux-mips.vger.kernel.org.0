Return-Path: <linux-mips+bounces-7545-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E917A16949
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 10:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA841165602
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 09:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83321B87CE;
	Mon, 20 Jan 2025 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VP0gOt4v"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE2E1B6CEC;
	Mon, 20 Jan 2025 09:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364922; cv=none; b=bBNw/0ZDsUxSCkjkTUk1uPtW0G8qaGZbUoIimr4cpI+WrSwZBm7D0/GtHLZrJ9h/UbVs0BvTQvFFXWlrmpgWadCg/0Ey4frYGh8qAvqfkC/nYN1EAsW8EdWydsfhqbAmqezNPUBN2V2ctOYYrer7PFyfA9jFCeMGfW3EsTK8SBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364922; c=relaxed/simple;
	bh=u8xwRiiCuQLkhGAjzAw29/lLxgn/oUBnngKnpNkEa0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C1YDr0fhGZWpxS7PV2OyYpeaz0tYwJH7imzJRPyQdgG/ZFhjz1YYFRXbd1HoaxAnqG+VN+SCV/JWByTjDksLelTv+2NqzEQ4Ag/S3m5kPgLuBMMocJGdvfPjBIn6XKI0RPNmv+zNQyp5nH6EcYKDBHWOblXTfqmC0FegyxMIk40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VP0gOt4v; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436a03197b2so28428375e9.2;
        Mon, 20 Jan 2025 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737364919; x=1737969719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bx/Vz3lnnQGL+fWlhChgYUST4mHwANO098Y8yGy2x8w=;
        b=VP0gOt4vm512ai4zHtZTtFf3SrkiVVmgs0wyju52Axm/2Pb4TJp+dHVnoXFvxTaF0e
         JO3CllK1yX1BXOEbEMGH0/NYoOnvr9kMIRGd45EFnic2IoOuid1H5n1l1nkON00cdebj
         crmv3NKxROuT0VgPSwY57CBZwKd81xnGtSsPEQ++qtm0r0YEHl+ENQX992aNhk/+zR+K
         ZZ5QMBgNyaE08A4GnUEEu/fS62wUDAr/y4er9HjQRCcL6VaEdLXoCnrM0idQ71cCwQFP
         y+qdBJ2OfvhrQCAw5l5KIkRQiucePb0sd1djPhAZIv085pXmB85uyrRgh4kJLx0UxZlh
         97ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364919; x=1737969719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bx/Vz3lnnQGL+fWlhChgYUST4mHwANO098Y8yGy2x8w=;
        b=N2g0HdLfMdNiY6kDeF1AIe+maAAcAN7PQ+Pb72g++0TsepQRK44IiJJtk1wO4qme2K
         1RLYE7ESJXRA6Y7/bvYxYbfaGn2n2Yd8S5HvDIrWsYL/KSrB3/B9PUSCda/YW5A2negU
         3JKv6KruvrZoZD24ClBIak5qvWCdDrHcUR6ixLy1RvLFNxX3BclKz1foANZl3zaQyV27
         zWhL8Missk3EG7228KGvco+fdisxm50eD+85oQM1HuiSQA7WftqvAuUGAaV+uKNcNF+t
         jevg9M/lUZy2v6RcY48Bz31UQGUQdKD8WLxwyq69ntQ2SQYic6+4vLIQT5YP+jp924NV
         AUAg==
X-Forwarded-Encrypted: i=1; AJvYcCVTRcP2nFpzGyQWa8R7z3JebugzjaLNFCrmMzR1bTF5zY3ByTRo8KWTdEUSb/RQcnUevhK5H+09HldHGOUd@vger.kernel.org, AJvYcCXBMyCxjjvK0wSCSK5uEcQyZKmhRpvDUYuDEymfg2Hzamm/YltKkyHRqXCyo/wGScdoIULQBo130AGO@vger.kernel.org, AJvYcCXCD0LS11UXwYfxMRJ556SV4HUkKtrfRQR9s65ELR0xU6OL8HCxWULs2jsq1q198HBVIeBVv7kF+gY4og==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoCE74Zq/dJy8AlLwq6X0OWnrBj9+BAed5aoURjXj5yMxt/TP4
	vmgzHyNCJ1eLlKji41hqkBbFwn/ZR5umtSEHcA2+Yj60//laniofBQcKNw==
X-Gm-Gg: ASbGncu31lSt/+AIzOPVrBRX5fdiAjLBvIracMF7qCssXwdKLXzuMP+eeNcIf0ubik1
	PnzzO/tHsCXtrgCruAjg5xin57d6MDsjkke+DLPNp+HmHv1CfRn4kIA22zljgqAoEFT7bf+mZO9
	eUgvBjZwmITxArYCJsZ++aoJskfDf+3dDFIkFiagaIZ3AdXSuPIwzAgzB8kr/eIdyBOfrG9IxMi
	uPwDYvgoPKZ4+0Gnzga3/C4cLEQ2W6VLLuzUTH0pNL7OJwvSSViXH3TsGyrvUSg5xlwxrHqM2LX
	L54jF+KvnJkufhgv6PuZhDuQmdN1cKEe7RaWyEvNoc3PniRi9il/Y0yZoWBq
X-Google-Smtp-Source: AGHT+IG2TXtO4QB4izfd6gv/dsovfT+xC2gJkwSMgFTsHrp99jubYZkaGFoFiwmAFNlf54gN2P+vdg==
X-Received: by 2002:a05:600c:3d97:b0:436:f960:3427 with SMTP id 5b1f17b1804b1-4389142745amr102033075e9.22.1737364918812;
        Mon, 20 Jan 2025 01:21:58 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438a1ec39a3sm80680175e9.16.2025.01.20.01.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:21:58 -0800 (PST)
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
Subject: [PATCH v3 5/6] mips: dts: ralink: mt7620a: update system controller node and its consumers
Date: Mon, 20 Jan 2025 10:21:45 +0100
Message-Id: <20250120092146.471951-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current MT7620A device tree file system controller node is wrong since it is
not matching bindings. Hence, update it to match current bindings updating
it also to use new introduced clock constants.

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


