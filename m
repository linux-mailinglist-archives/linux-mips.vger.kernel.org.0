Return-Path: <linux-mips+bounces-7514-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D026A162BE
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 16:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56A973A6218
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 15:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626791DFD9F;
	Sun, 19 Jan 2025 15:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlVdlFZh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9172E1DF995;
	Sun, 19 Jan 2025 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737301501; cv=none; b=uKN7YBCGG8w454TPdPBL3ZoQJsHitXt1ujGceGfCQX3+uaB4QVzO8asF2NaM4tBFi0VYNknRhtmAqHvbLFBsVTXruIRxOjvjewz5qDYmYTsxn0UkY7cyTMIzWQvWcIJR/trSjXPkNAuCCtUlQab1dv5c5BXlc1QTE7VeJXYoGdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737301501; c=relaxed/simple;
	bh=fj6MxMup+5Ya9FrqXJkojWceGQ1l1OmJpY0zT/psZFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oHJrof5jnAPuOrOZh+HnAA7V0Bp6GcgEnwEbmwbnC70EnKL1FM5Mdx+r8Rn2d0nTTXRWOskJcNcU7w4+vxrv15yfBofGuHk/oCEpnIR0yAlIL0/AQd6341DMfXajkGRgaKF/S6Vy8EkZB7Y8zJsAGX9IyCfiT8DPslsBNG6kPtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlVdlFZh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43626213fffso28573385e9.1;
        Sun, 19 Jan 2025 07:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737301497; x=1737906297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VC45fS+EHzOo4eokzsH9DiWrLQSofxt9a5G84Y+GdME=;
        b=TlVdlFZhTDhdeeAmpBpWYjB+090xGbR8VUUdQqJdwofG8FWsXzvv+51dXHbx1qd99t
         aDDPafStPZxZ241QwfVQZEX0bwO4LJeLLjmMLAt0IcytgA/A4Qtnji7CDlwEnGZSoPTf
         GukqsQIHm4olywGxhPW7HdmcGSFexJ8PuiUSLBrBWf6WDZL/H1eftM0I63FcqDmnN8kA
         yVbHyBKiu5YALxjarHF3frAEG0rbIKS3jyan16Y2Gj7zUPLmtftR3zGPrArRa5h5Vgox
         ODm5ocwWd7kEf2ujjSE1ZBmqZ/YRjkhA6kaeLi8v/Jz2/4DdHPkT4aspXebNlTB4PMj0
         BocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737301497; x=1737906297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC45fS+EHzOo4eokzsH9DiWrLQSofxt9a5G84Y+GdME=;
        b=JsC4topd6tOqhoIMzItwIZ1BwbQSu+8nIZEG7i/zx3TJFEyHELwqruvNCQ7GAMH47y
         gMZNICOx9krijN03flVA1PWiPDUfDOBx7vrcvVrGL3cjafX9E+8/x5pbIIGOpoIsusjy
         7FdRxh0ICv0TRdZk27CrU/DPCxREQQRwiJm0Z6W43jnaQfTOGKWPv/GO8BFm+j+wvXfy
         o6hpYjd/R7NcKIB2t6wojJK/jTcIOhYM+C4PPOaueIO8oKVUtryrTkBMdGzSv0KxNOhg
         nfJxUaiWF6iYORYkvvCMVKBEp17qShv2G38xSaIubSdDRCQDfiQoVlKAPpgdMKDhLuXy
         NU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGD0DN26Cj00EVd4OrccbMp00RpEfaAFxswCNBfFueWkmYIeKpuadu/tRGtvw+L0yzh0dRroXAjSLFpSAI@vger.kernel.org, AJvYcCUd6GeBw0xbvZtPzkCaUVIUGaIe4lwN9lHcYMHNFwnB6NiulATgDjZ49NZbbq6iBIyplGOUa9E2c7Yc@vger.kernel.org, AJvYcCXIwqleW2ABBY4RBBP1eCdPJR2Ol/5f/+FbYoaZhsDMV3Pf6zPOIk72ocyMGikhayaYEImqpqlV7a2r3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs5OwGBl9i8jIkS74AQEy5Z5EeHejHmvzTfAC+PdGAmOTm6pqC
	kCplWuDTj4Vl7nWNTqx8ss8FefYbs+WWKdJBIR8n69I8zWUS28BzF9IgYA==
X-Gm-Gg: ASbGncsmgj70g3dhX4s4xikbGa32DfcnsEkupUdCSiJu1jHI3RIm7/Jyn7nXKHe0uou
	pzZctzobPWwyuW+ywwnZgYLmsvBP1+fQwS6pusqG1ixh34H7sqRC0jPbCDLNsuL1t8HcLPTqR2/
	WBdmPMDi8qzwLMnvqPyfw3X3l8bLhp+O4Vdz+qDrzRnsegyFRm2kpflghnraYP5GPdnjRs3V0j3
	iIeORg9A985aUFuA28+tQIlVnf2+D8XHMhVtSG2mO9nfJA4Xp/D5ZrkKtFwd1L5ZWMQyCkD0C21
	0yBniZGPtGSgMNGhIZMoity1zQh8TM0WA1Ld97fLWw5quivaYdPAYQnTamq2
X-Google-Smtp-Source: AGHT+IFe4GMjnqetWKpFs2zdZsy4aHPSHy/dcDgz6QWV4hW1a5kvxTgom7JmvDBTVfEo/1fMRmRQOw==
X-Received: by 2002:a05:600c:348c:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-438918f61acmr83714455e9.11.1737301497014;
        Sun, 19 Jan 2025 07:44:57 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046885esm104532655e9.36.2025.01.19.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 07:44:56 -0800 (PST)
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
Subject: [PATCH v2 3/6] mips: dts: ralink: rt3050: update system controller node and its consumers
Date: Sun, 19 Jan 2025 16:44:44 +0100
Message-Id: <20250119154447.462857-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250119154447.462857-1-sergio.paracuellos@gmail.com>
References: <20250119154447.462857-1-sergio.paracuellos@gmail.com>
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


