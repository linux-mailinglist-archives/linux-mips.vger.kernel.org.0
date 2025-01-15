Return-Path: <linux-mips+bounces-7466-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E26DCA12784
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 16:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11C46161F27
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 15:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26B118A6CE;
	Wed, 15 Jan 2025 15:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHpdlx6G"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8245915957D;
	Wed, 15 Jan 2025 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955031; cv=none; b=H9YGJkjyDKPDpgGw3oeotut9s/B5saup2k8vtO8hx/FA+btCMcb+eLNYvQgDO6QhHapOpGN4YcEhn65a06zm7fy305qeHFZrccDb8nsAEgCg4kp3747WniaBKGNhWMIbbioMBcEZGspN2rkhSKZHEo1kZ9jfS1LE9TtgvfcxJYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955031; c=relaxed/simple;
	bh=UxIXh0BdAmAh6kVTFhPOQkNISd5tg+5xvyErOZQ8WWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZhL61aluJHRQRqHUd1z6d0Bvyboq5sxjiqOSMlzMs/Dszss7lWA1NOWv5Gbnpt1bWSF4kUugThiqK9H41vYGT6Qa2PRxaTcMWqDdny8XVSThKCSRDNMS3eC2mQRhNIJJzLAlGMao871XyC2dpI+uRDQwRuAzggnTi4wMzhISUJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHpdlx6G; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436341f575fso72745785e9.1;
        Wed, 15 Jan 2025 07:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736955027; x=1737559827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPP4R0magTaDOpF+cR8rW/OW6tNza0i6gzCRxmpiBUg=;
        b=ZHpdlx6GUsCMwDYoe0WAp2yceVoAn39P4MjNvh2+8LssAGo1c5LcTC+bTSjdbddj5r
         Z5Y9UnA56tt6WE+j1grkFycRYpFvzUApzje4RhAZLXKKjz14uy/tHHwZA/2KsjH0GZ6K
         5l5+8Qsg7BH6K9RxxST+c6DfJyRMYnwtblg8dLF4cfml5PvduxkPLW6s+AYYmSB5uHFp
         ofMmpfnIHLd2/nLhPIAa/7HXEbXXOlRawAdFpce8/mFfnOeWlesfUiPNCrHLHhLY323q
         7ZZFFnEdyR6+JaVeGo8jfXP7g/B4YCkVONAbHQBYtp6h6rQFcWboin5F4+1RvJ9q/uTG
         t6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955027; x=1737559827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPP4R0magTaDOpF+cR8rW/OW6tNza0i6gzCRxmpiBUg=;
        b=esudHP+Zpqml7aIVk/TkGwOwbi8MTzAmKMV910cWhj2MTOMiMQcidMxfrQ9lS/lH+H
         EQkc8OpV2vZL0+t7JsDDav0Nrgo8bbeqSVxtIy7rNELCvKeEM3V4H8XvbT6PGPc2hLHI
         J3185cvjdj2nw9R8wDaYIIHCKcTvrMcZpHpzTHo0JTpZUVCygj8u+0tmO+ZZ6RqOzxNV
         TGmoUZWNjsvKHWCfYGGVKzAB0Doc+7oaSRKgWvI6mCrWvywgMdFB7TCBe8znrtLTxAiS
         6zycPvLEapmKBrcmZdXXKxr3KCWMRNgpFS6g67V3E+gwst3YupFD4p6r6UOSsue7hI5W
         QLow==
X-Forwarded-Encrypted: i=1; AJvYcCUbwYMiG4+W8sd9OBNGPIdhBXaPVL4y3J/C7euyZw+45t/cwhA3hV6MxtFIczOI9POesRXnN6x0APWU@vger.kernel.org, AJvYcCVWPcH8mhl6eFI3Sg54ney+qHjPHsqizeUC/XrAYQNQPxE0BQ2FOXQbmgDfRzVGP54Sr6FP3I6jYu48mkGm@vger.kernel.org, AJvYcCWAxrdfKzGtGEqzQSCsHajhbWf8ziZGXppj63moR6IMdasPBuB+/uyRZQqJ9WCNqlZjbfyZf9Z2kCw6JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhdlvgqdkTOB7oDOb9l47u5nYwNagxSmT7lL8RmUuy62ncfYYv
	MRHd5+gcZocUZEWLHR24c3UblqcCJAGX9gcbqyi/GerAvuxZwUMiXVnAzQ==
X-Gm-Gg: ASbGncvfmLwt9smnOWeccp7XNHvBEKKkIqpQJeW+kf6Prr96EctKQQ0f9v2b6Ghu2LD
	CteoT12sqIcLupSofWqFX+9OfvpdaBBWAP/aQqogoQGY4gkZmyaHfp98hozDTdHGZg2wkRRObKf
	5QavZgBS2V6Vm1GvBwOmM3x8w+MPdsXLptyhdeBBWyE29TeeAYhOL1rxVQ7xcnuHSSUekU/Czam
	e8atOu76WAzXVRRWOvYUurr6QMqySnbgHeOEgUKG+osZ+n9o8crEFzxm1UFWNnZousLzp/ClzHH
	r02Y2U/6inKFxm9EFdu9A0ZlBc15kHx5a8BidkT7lj4qJSo=
X-Google-Smtp-Source: AGHT+IGmFZSakQsT0xlVDz2T33AOh2WtXifJSExmeDIjyadvMXvrHnsluSEHc8KU3JfeISSEGBLnIQ==
X-Received: by 2002:a05:600c:1987:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-436e2679e05mr280671645e9.4.1736955027015;
        Wed, 15 Jan 2025 07:30:27 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm7440771f8f.43.2025.01.15.07.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 07:30:26 -0800 (PST)
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
Subject: [PATCH 4/6] mips: dts: ralink: rt3883: update system controller node and its consumers
Date: Wed, 15 Jan 2025 16:30:17 +0100
Message-Id: <20250115153019.407646-5-sergio.paracuellos@gmail.com>
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

Current RT3883 device tree file is out of date and must be merged with real
device tree file used in openWRT project [0]. As a first iteration for this
changes, align the current file with the needed changes for system controller
from '6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS SoCs")'.

[0]: https://github.com/openwrt/openwrt/blob/main/target/linux/ramips/dts/rt3883.dtsi

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/rt3883.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/rt3883.dtsi b/arch/mips/boot/dts/ralink/rt3883.dtsi
index 61132cf157e5..11d111a06037 100644
--- a/arch/mips/boot/dts/ralink/rt3883.dtsi
+++ b/arch/mips/boot/dts/ralink/rt3883.dtsi
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
-			compatible = "ralink,rt3883-sysc", "ralink,rt3050-sysc";
+		sysc: syscon@0 {
+			compatible = "ralink,rt3883-sysc", "syscon";
 			reg = <0x0 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		intc: intc@200 {
@@ -50,6 +54,8 @@ uartlite@c00 {
 			compatible = "ralink,rt3883-uart", "ralink,rt2880-uart", "ns16550a";
 			reg = <0xc00 0x100>;
 
+			clocks = <&sysc RT3883_CLK_UARTLITE>;
+
 			interrupt-parent = <&intc>;
 			interrupts = <12>;
 
-- 
2.25.1


