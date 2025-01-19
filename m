Return-Path: <linux-mips+bounces-7515-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF9AA162C2
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 16:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D67F7188574A
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 15:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43E11DFE15;
	Sun, 19 Jan 2025 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQz0rx1p"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08061DFD95;
	Sun, 19 Jan 2025 15:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737301502; cv=none; b=ERUbIyiQ9mWyqRDG25ADkd8lL7UxnJz6LfrJyJGC9m0A4TvBBCU38raXC1CRbfIOAt88Z6MbsIJ6mSm9biH1gO1QKA5nv6fWqANfXoVkGyHjZSsVaMJr9WSjknk2n3PZ+fHgqHL78AGCv/AEd5inKHliwYtzv60o9JQXuIrQHik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737301502; c=relaxed/simple;
	bh=j1bB0LohY6Q4ZWswaHmpsEMNIOAEiiDhiYORQ5U0qBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PeMMuN+op/mUiGx1w3MGAqUbgRqow45XjKebpN8mwnVc+vSQjrF29NpF3tSxmsY4TJOizB6kJII8eYeBvrJyj+p+BYGVsa5AKL4hdWP6UzLgfXA+D9JRaO1h/XTH2ScZEmXSIYP44Jr8VKsVlbpdO4Ew0/uYXAtiDzPHTQ5GEyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQz0rx1p; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso24577935e9.0;
        Sun, 19 Jan 2025 07:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737301498; x=1737906298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MK30M1/4LGOcL0ZrPE9gPryc2MA/RdOwp1GOptQnIo=;
        b=jQz0rx1pIWFmyGcDqt1ZIOJOhhil8HTIXdUACMgRogE4rPR1LiVThuUofgbR8MNLvL
         jsE8O0SbmIcNus5r+Epku34m3bt9CgzCVOPt0fn6rRyzw6FkUpzYrIrAOB3CBy2SvZnr
         sZ1fIcpm1B60RnN1DA8ZButkBXuJTVBtmFuowsLqIAWAQ3gZJw/bvJH1/Rb+RIbNE62Y
         FVY25FBbLfUVpWTG2F5+3eBJlxVNS1BbObLGpudV+4GqVhVT7KQqjtyoEKbUlKH2Aspl
         kEpzIsJ/GipqKC0KyEPRtC+jqx8Q+rGGtMryu9Sz+kslCchnkvUEzrsbbEeWIWyY2Z0x
         4mQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737301498; x=1737906298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MK30M1/4LGOcL0ZrPE9gPryc2MA/RdOwp1GOptQnIo=;
        b=X3FeACjBMx/80/87IZ5qTczQOGc7OilKcNvRVRpyXiQ9KSFWHCBsmbrHlDz8RcCw1f
         +cJ7h90LiW4SvoUpXkA/VDcaL1jGdr9LzhIOd486w32ApAwZwTa4SeNK3P6WRwTDMGd4
         LDvJO7eg3dXQJ7gASHI3nNpHSrL0cw/IAegHOhQ3Cv60bbmx1vgKLZk1JVAtC3DvYCo/
         r/Scnm232bHehLd4xn/sXHXesXE64up+sBViuEjrklVX+nEH5KRYZALTL9ueSSCU99mx
         g++z4RJtPQQa1kGHj40HkZ15ld/S9DtZ4uYjX0CeRGE9JGHl8JfDc1wed275JpsrmQv6
         OTbg==
X-Forwarded-Encrypted: i=1; AJvYcCW4Ue79orwUP5sW+mur3/JMPcAFTgqT1wnQgHklpVhuG3DX9JR7sRVntuC4Fgh6+Q+5ynuqYGb61NVJA8qq@vger.kernel.org, AJvYcCWBMkpU5VmOK8Z+UkoE1RG5LX6XprjAgBW7A/T1ok5xZDj7E/yYFKN6lK9giQhXZpBjezb/wmHbTpBS@vger.kernel.org, AJvYcCWzdqQGMTSslhPyp6JAmIU+9bM4XQG/zqXnA1rrnOAxLP+594/NvzZfk27GuF6QlTJNLXy+l7T8egOUPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfbfif2yINmN9Zpunh83myIuipr4CQobrV+wP1HKjX2xtMjwWU
	Fnwe5cTpquu8YPhy8xUg6SM1Kc8LHSOgFhHTCp3/w5fqSgomPI651P4WpQ==
X-Gm-Gg: ASbGncv+HGh0wDCF+5g3vVgQ6Wlz2qC+1rDU3tdpr3EJQENDLL2DRf2FpKYj4GLI+r0
	tZaJslbXG7iBLw4beEPINbVXWEweo/D0EBpO7p5L9vW7AtLoxCDgr8uJ30el8KhZdcd5bx1V5Ib
	i4lVQ6pjzOGIAOFZ/4pDFm6LB882KRhqynmHzjvHGNcISIdejI1QtBcHLRE+mBs5kKtLW8Uz8wE
	xTeki7XQU24P0jLRy6tYVxN077JaEyrg9v1ae15meaJK/yhJG9uHm8G6ZPeE58C0R8yZRQBWVn5
	qrU/kdEHB8vcLuzY2gs2d66CRcncbCLrhkXxKJrH8BUU2PhC/pg9WoNz+iym
X-Google-Smtp-Source: AGHT+IEpuOcwhndfyvWYPRAI3p1i6MxAq5drgewlnyxnKTDOpi0mw1sBE9reqq+g/zwydm07CMJssg==
X-Received: by 2002:a05:600c:1c93:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-43891426ebcmr78545355e9.21.1737301498564;
        Sun, 19 Jan 2025 07:44:58 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046885esm104532655e9.36.2025.01.19.07.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 07:44:57 -0800 (PST)
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
Subject: [PATCH v2 4/6] mips: dts: ralink: rt3883: update system controller node and its consumers
Date: Sun, 19 Jan 2025 16:44:45 +0100
Message-Id: <20250119154447.462857-5-sergio.paracuellos@gmail.com>
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

Current RT3883 device tree file system controller node is wrong since it is
not matching bindings. Hence, update it to match current bindings updating
it also to use new introduced clock constants.

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


