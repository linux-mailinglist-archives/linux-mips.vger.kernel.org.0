Return-Path: <linux-mips+bounces-7543-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C0FA16940
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 10:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D69DD7A3B5F
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 09:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11CE1B424A;
	Mon, 20 Jan 2025 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQw+xkB4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DB21B413F;
	Mon, 20 Jan 2025 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364919; cv=none; b=u2lacA+vgeGIDy/AEiqrRmmzvMB0dMGaGZcRHSpuRqAQ6TG4Y6fg0AgeYa7tYPZa1fNBcaL+mOnGCxprF8R60JjCxhYZEwRms0815aOTjqK4SyJ7hTb29aAYzdoUZwn9HXLvlGbLoQMN1KuifSBzR+d5Mub7QAXUyS6P8kGb3Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364919; c=relaxed/simple;
	bh=fj6MxMup+5Ya9FrqXJkojWceGQ1l1OmJpY0zT/psZFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pv7mOM/QYSvV+MC0rInWy8QwyPiL7bZeo2AG5AVe48PrTXml9BsZw2h86nRI+YOF/G5HMv6dMF8Ud4rulPGltewyJczZoEwEcSaA0h3NUYyp67PtNABewQ8/qsAKtISwu5STpO5o6hfnjnT/1OmLjoII2gQn/1Ed1PVoBZ5F2gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQw+xkB4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so43337905e9.1;
        Mon, 20 Jan 2025 01:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737364916; x=1737969716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VC45fS+EHzOo4eokzsH9DiWrLQSofxt9a5G84Y+GdME=;
        b=hQw+xkB4NfvZY1p8KIsUXPuXw02VKD7IKcbu1fYsbYdJ8/NKOwKsDi1Pmb176nE2oa
         wY0VbKM7/d4Oxe7h+Y6vzkQqFITTGVozMRSG2b5DFor0jciy3jUfQtBfekkA71G1cHUa
         InZFfE7dNx5Cg2kK/KUtTDU+qGG5g1r772bfSv1paqeWU9SJ+bPdx9leNVX4mE/NC45F
         +Pr6kuQY8ajkUztTM6yCmilWexWVITXHvQsJPHD9OWcNcwlSMyDx6tPVWIC4zf5srDDC
         4IEGnZqSm+667joTtMTWs0WZyYUmigl1pkMeuTHgI+rnzSPaHh1LN5fbBGcXbOP+d54M
         eTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364916; x=1737969716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC45fS+EHzOo4eokzsH9DiWrLQSofxt9a5G84Y+GdME=;
        b=diMKKwB4sXaIDSMcxYNoVAcDNmO5CjeLoc/xjQ5tH6Lb2rziXMfHELmCwKIoBl5w5O
         WikSE8W/hZjsdNvzX1PKNu+YbJU2ztwGnzpQEzPkguiIhXH8XrRJp3aYU+N37yt6veMa
         5HSnFnC/QiBecGxJVHAmgwKK9Gm2MzbAGYcGlg2etPTaX5K7q4um3OBZfnZOstsQN09Q
         hNuE9lu41YPiv0kj3aIVfys5tCFb3lB8rnEngz81AqtFQjFF3rq9zsy2sVI7rL5PGabw
         TFpFMaR0wvSEAzZkEp/u/EwVrT3umGxSO9zm3qxSnidzRF+xBtL9mmCsA21QDn44bgM+
         KFMg==
X-Forwarded-Encrypted: i=1; AJvYcCU5q4cC2VvhSJL1mi0d00vDQiyieuhbAfLnZyZMQCXp0skbgHUoJFn4ILk6Ppy97nNQm7fDlewqmDgfDQ==@vger.kernel.org, AJvYcCXAQpsyCdRV+w9opzwKHCoLN2WCNRf+uMwIJKs735YD8DK9V06NsxmOCJDktWuQBNu1thSwfFs2h1ri@vger.kernel.org, AJvYcCXCt9CxylPyOBYH+UkDRsRy3TMPJZVRUtUbLP3AkGq36FDoijPRgujIe7EIc2+U0KDxDlAvZPZPpSoENyfR@vger.kernel.org
X-Gm-Message-State: AOJu0YxKJYKmqqz6JBvQsp/erwGO1YpmwfFacsuZS9Qfa0S88wHSXXiT
	ZVxz3NaoX/fpmhjsvKW0tHFxoUfhZoz7QMA6ZKW7ByPkpK1UvIQhotM+Wg==
X-Gm-Gg: ASbGnctXHNFR8cbki5RN4aGmWasL8VdKK0VfAIngQe+1U0bWg9NwTSlCJtiU921uN/n
	P/8pS5skPykphhZMvWrerr6DPNg0YAojaIBi7Y8kCVzg691G8dQpU9PVSFI6aXvuMmgFN4EupXq
	PXRqvY/aZHEhvumczLi9YXo2v7RDC8JygIQFsll7StEz7em4wF01vsVc+qdpES9Uy3tqT6GI2p6
	cd/NMBs3/v7Q2w/uA4Cc5827u2jOZ/CROsOBmRHlUcdQ2a+AyinYoYVHrsY1yWOgyfm/308ilCH
	rCmBq7oKWm+4TWQAOyoRUz3+7aCr0iIjL9u0DpTHe5oz6DuuTiGmhegVSnwc
X-Google-Smtp-Source: AGHT+IFqohmc0kzz613OXb3KoDy7J4hdVJIE7DosZ4lXlYDnnC4C04BDuIXm3+CurX+K+ilaX4Tl/Q==
X-Received: by 2002:a7b:c3d8:0:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-438a0d3c71fmr61724915e9.6.1737364915956;
        Mon, 20 Jan 2025 01:21:55 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438a1ec39a3sm80680175e9.16.2025.01.20.01.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:21:54 -0800 (PST)
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
Subject: [PATCH v3 3/6] mips: dts: ralink: rt3050: update system controller node and its consumers
Date: Mon, 20 Jan 2025 10:21:43 +0100
Message-Id: <20250120092146.471951-4-sergio.paracuellos@gmail.com>
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

Current RT3050 device tree file system controller node is wrong since it is
not matching bindings. Hence, update it to match current bindings updating
it also to use new introduced clock constants.

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


