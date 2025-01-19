Return-Path: <linux-mips+bounces-7513-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1865A162B9
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 16:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 240ED164587
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 15:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9E61DF99F;
	Sun, 19 Jan 2025 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFEKk3Wg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325F31DF980;
	Sun, 19 Jan 2025 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737301499; cv=none; b=DKXnUrHM7cIaEGt0e+/UQpaMsgOS4vipyaQedmZPsaQuK5hy28AQz8BZL9Z4EiKmofj2Y3KZHlAMx4UXPZLEIVNEUP9cDNDdE3MxVnQckcw7CK2UG2DkzvEDTg+rgRo7uMBxBtSENLSpjL/IDW2bw5/r2nJdmZOYXsH1Jmbtz1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737301499; c=relaxed/simple;
	bh=QXtKB6jNj1hMEwRy5f7ewX4xxN397kqMFyiJ7Eb/sCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k7CELqIFIjUgfD98DbxE0dKezf37EhjY0TneuvOGLQeFy7Qlz010tNyjn3wRoS2o38kE1r5ZY9hg6OenkaObL4JD7tgPhEu9MdgaiI1boAgFNk5u3qgayYPhPPBS+fvUWuZLmvrMTXbVTvhw092RdS5juvzUtrlAjC2icW/jtYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFEKk3Wg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-438a39e659cso5170405e9.2;
        Sun, 19 Jan 2025 07:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737301496; x=1737906296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoamquXOCnAAaRWeOvWzV9A8HnHrnKqCSO9m8sNi1fo=;
        b=lFEKk3Wg6XI9a1BUY3gV1OS0OTIxQBx3SX8CFVzv2pESNEWsfC44cbZCeZnDuTLC8u
         1ab3gxkxsxNRhPkYM1oIzDPMhBIOZ155lVjWFxzR+Be9pAzSogVqTKrDd/xbEP+DUFx6
         nZQRek1Bq6RleAX8pDAGJY+ujoKSZgKusPUw1PKmKojFwDI4iOZS8wVA2wWIuLoSYift
         hg25xMKrC9gLtD+Xdb+hB3lg6P2kCJZsBR8xv84lXPpojEeRrBFyM+fFjCwifKTiUdyq
         m86BIjkLc7VhjEBKCYQKf4PpmqndLzQnKTtjsyMTo/VE6cvBifzNSoopTO5NuCUKFIav
         xgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737301496; x=1737906296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoamquXOCnAAaRWeOvWzV9A8HnHrnKqCSO9m8sNi1fo=;
        b=en76TJVc7pmv4an0zQjeyDNlBCLCEzGnUqWvnh9j5JMOs9Ttf2shHl7koH7tWfOxjk
         qefoE/lsmKDQxrcILzXXkhIIryvFj/ctAJGo65SZ9NZGwwAz0BzUWmX+bDcMGlAhb+Bx
         ULnOedNT2BztFRkufJFfHYXFDTXJ+nrGRYqDfWOQsazdH1b7ROLjCjQ2KzXdF3YlJPY5
         sM4TElBNbOQFBBLfApmFuzI7ap5L5ZRoq4eQ/uRITIqq/WN6D2egbVl9PoQwKnn3zKEL
         U6T/Aw9y//V8SDkf7DYSMiVjnhTFDG5cUllZpGYxfWt+Ggr9lO0DYK45zvR6rDqxX5ah
         LHUw==
X-Forwarded-Encrypted: i=1; AJvYcCVRr82MlgDPPZAYu1JUpIg84N3MGWv4b5MScoQvE85BhOD7Vuo4+/JGFbvrGU/RUwN0oFGy6EbP7m6zFw==@vger.kernel.org, AJvYcCXGdmOo2A9WbbO+zgICQxaUqxyoHJzxKNBFshg4NmRs9D6efFGS9f7RNN1cIox5UsaxHcJP1kel/kpGFgJQ@vger.kernel.org, AJvYcCXRBY3bZOrmv/oQrbjrSI/ijqWy9NHu+4CuqsRWqwO9fTCCUeP4HlfuuVzFIC0HZCbSl95hj05mX8se@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdu0AwnE3Q0mkGxoJyfqT461eey1qKB+rli7oonThF8ZqOkaPB
	IGqKUKq7kPrS6XgGFdU5HpfBAscrNHhqIXTdeKgHXhrAfqN1dWQb92nW0g==
X-Gm-Gg: ASbGncvfa3pbN/bdAZ0YFr4muWWYa8wzjhkO/nrbAH32PR3qZBZMuSjpIDIFz2wtWuH
	oBrs3gAMrPzKll8+etJKBqngR6SWknMyEP3bLocri0QDHf6Au1s+2lfm3qPtYEtTYVC8/vtbyKH
	tUkRDJKrUZAdxeYD82JETrUNJUizglm/+mqMOg9cG3/jQlOtW2GQUIoedB6Iz/ijTltu/U6IsiH
	OG90WO7fyDnIBFZRDsepXDmbHkYhNt8mr8wrEsdsCJDGpllLx9mUmfpMc7zEbW/COGajlEDrJ0A
	ZsP7jNfqakTDxAY8l18LLl0dN43rRkEbnsMLQIRP+90rJi/XFWnDT9l/J6/E
X-Google-Smtp-Source: AGHT+IEqWdAWETHQ/lb0yG0uQwt5TSiZmx096IYkr75dK6NzyPYHZAdhifKxqR+YuXSdw30faxKM9w==
X-Received: by 2002:a05:600c:1c93:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-43891429c77mr82388415e9.24.1737301495590;
        Sun, 19 Jan 2025 07:44:55 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046885esm104532655e9.36.2025.01.19.07.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 07:44:54 -0800 (PST)
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
Subject: [PATCH v2 2/6] mips: dts: ralink: rt2880: update system controller node and its consumers
Date: Sun, 19 Jan 2025 16:44:43 +0100
Message-Id: <20250119154447.462857-3-sergio.paracuellos@gmail.com>
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

Current RT2880 device tree file system controller node is wrong since it is
not matching bindings. Hence, update it to match current bindings updating
it also to use new introduced clock constants.

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


