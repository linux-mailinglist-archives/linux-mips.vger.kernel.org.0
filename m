Return-Path: <linux-mips+bounces-7516-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D28A162C7
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 16:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B1893A6327
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 15:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4041B1E009B;
	Sun, 19 Jan 2025 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EO5hGU+y"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550721DF74B;
	Sun, 19 Jan 2025 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737301504; cv=none; b=lr5MPY7sKY21mgUnjPEpYIzhNTDL7mN4wKBkwe1J4i4Y2Rb6fU2e/kqECU6IwU906GN9TguToqbFmbPsn4/E3NDwvn9zxS8cbOKlLLE0DpW5NjZdhfNxeTgib4YnjMPn/7o3svdAK60mRGnMdb1Ev7QmfOkVlb8Vd8xhT/DrcIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737301504; c=relaxed/simple;
	bh=u8xwRiiCuQLkhGAjzAw29/lLxgn/oUBnngKnpNkEa0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p+i7sUcFB93fpiZreqbvrjpY17PHvNBUQVLedknNAPrpE8tZsGDsX0XwYUpAk5O1eK/i/rEKwaR/2h35Del7EFKIKgru6uPbq2SaY1YxIzq34rS+gThaCSyBWqOsaVNtjZP3f+8npBA1WS3j53fsBjZ0u8xQoGn2btTi0mGhNPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EO5hGU+y; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385df53e559so2822062f8f.3;
        Sun, 19 Jan 2025 07:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737301500; x=1737906300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bx/Vz3lnnQGL+fWlhChgYUST4mHwANO098Y8yGy2x8w=;
        b=EO5hGU+y40QpCoJvSKDGgwXw6HGLAlkcZB0APa2GQXPOnLpCINfzlb4CR5PKJpqOfG
         vR76MKCSKT2ngojFQfbsuIg6561DfLtzH3OuWhxPX3Od/HPeDL6nVTo4xQsHVNfFvS+C
         eCMpirXgpk+ria0DOfZEFtWe0Wg3lvyLs5gEzh7Z5LlAngqLZD4ZQeftVxM5WWigtSQa
         2tYavCzuSSwzVEayjmivld7EAtnWD3QLd2/ALFwd7xjjRAm1SIcURH4/0WzLYRrjw9Hj
         vUdkF1IHt6oOUWojURx3Wqvf2tjvBeq0PHXB1YwlRil5JXHqw22QuE6WFANztI+y4q4C
         d5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737301500; x=1737906300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bx/Vz3lnnQGL+fWlhChgYUST4mHwANO098Y8yGy2x8w=;
        b=com/awLPik5biJC4QmDfbrq2TwrP10o91TtruTNnYyoAqSrwoOX+YNYnABEPqtmLGy
         AMC9i6DIO5vY4bEX6SmGOBLm5j0B8wfXDArWB6HAUtATwknZCx5xr4zgz4z/CijTS5L/
         QaHX3vzJGWUv/hzg8MJ57WQIyzGYxx5Vv6oC+s/w9kjb0sbKoljyuaxuBG6UVvu+1gEu
         863NzaepFAtvKa8nv2DRnQPQd7+DaueasfSd0UBXJYg16ZzZg4Z/s3rE+e00bedXdHwP
         pg6ESzjH+rIWQXWmFvPCEX6zxn4vQMBvj+Er/6VxMllQvJjrej8rSdx2yhEcwRBHYecd
         30ew==
X-Forwarded-Encrypted: i=1; AJvYcCVky0a+LmIRz2kud3XlefxJNoCvK118Fj6OpcDvBo4WHPbG1SP52PJQiB2+1FvCSPoUwWRQf0UyaRI9@vger.kernel.org, AJvYcCWZ8RVvDf1eJsURAfNquXoEcWCHv44MST8yL8U5DZ339VWySNP+v3Kz7gtramovIFXpu5N6Iz9pnzaTnLbE@vger.kernel.org, AJvYcCXiFZeBgaGgE9ALXa8Ovy+XBoDxtHvcJzmEBeZaWM98t8QPjdJYRWbq0NsX2Rf2A1/yfqFGfzRYMxxvHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0xPPGXbjIr85mdOfTHpGxSPty7b9ez1NCyfwml0s/0XKMboqu
	BuoGPkHwLoc3lz1EsSRKi669a1WhpX9u+68KHCjfMpYT6G+s72Y3fMOInw==
X-Gm-Gg: ASbGnctOZWY1S++hmE8Nq+Xu1FbzaoHaymNcTPzhJ79ziezHWk9RYwXB6QIGybVWMHi
	kjqRNyNeLVIzLwWhkYsBKmCyEfz6sv2lUOyU0tIR1h/lfxq+02FKjlJWgtN4URr2946CBtzKQdJ
	tLPHkEzx19DSE4FgUPCQNkKO0HFzx+dxzAWMPDWykkBTkLmohcaVcukzYcRi5WSHAy/LDtUHHiv
	y4GoLO2aRPoSwqBX4yFQTIEvWNLctzPTp2tv2/B422IQcgayniAC2RQag/9wL3fI8OO3XPcxNJ2
	LqfHUC0dQNY57+Pg5sQPaZEbd5uRCUOC98q7xPP3bkG5l93fZleUHcRANgd9
X-Google-Smtp-Source: AGHT+IHNjv6tIXcJHFJJCtwYlJ7zWvZ9G3rS4DULFBXzvZw22e2N1RTUgmcUtBZ893WfMDTRyk/MTw==
X-Received: by 2002:a5d:64e4:0:b0:385:e35e:9da8 with SMTP id ffacd0b85a97d-38bf56635bemr9449648f8f.18.1737301499960;
        Sun, 19 Jan 2025 07:44:59 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046885esm104532655e9.36.2025.01.19.07.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 07:44:59 -0800 (PST)
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
Subject: [PATCH v2 5/6] mips: dts: ralink: mt7620a: update system controller node and its consumers
Date: Sun, 19 Jan 2025 16:44:46 +0100
Message-Id: <20250119154447.462857-6-sergio.paracuellos@gmail.com>
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


