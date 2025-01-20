Return-Path: <linux-mips+bounces-7542-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 527FFA16938
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 10:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0936188121C
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 09:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B306D1B3936;
	Mon, 20 Jan 2025 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGi8uHf1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACA51AF4E9;
	Mon, 20 Jan 2025 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364917; cv=none; b=OkWpTPzoP6UpNEj9lg8L95SNeGKB6BtahoyxKFScCFMlsX0Pd0wuVogPTi9mXXnjJqG75Uk3nCqiiBs59DFAZFs2jzQpoLRWF/T6Ke+TTw3/TyqPR2kzUw3df8sW9mgZAUQfYJf8SueP0QDDww/qlfU2OYziG0K0qHkIaoowVvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364917; c=relaxed/simple;
	bh=QXtKB6jNj1hMEwRy5f7ewX4xxN397kqMFyiJ7Eb/sCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KppTMrRkKJDBkk/9Jk15rLZM0zvgu+aP5z7aN0JCtKDuZwyvhDjfTg8dRlb1Nm4GcElOJAdWbCq+5znjQF+LrZ+6c1GApel+g3jfppRD55JjOIDQPOGtpdxI6aB4+T5/BECmkldeVaD20iMrKI6UbPnPTL5UvvpsNAlzkObOymw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGi8uHf1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436281c8a38so29479535e9.3;
        Mon, 20 Jan 2025 01:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737364914; x=1737969714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoamquXOCnAAaRWeOvWzV9A8HnHrnKqCSO9m8sNi1fo=;
        b=dGi8uHf1uCFEkZOnzNaKVHiVjiCS8wQ6OCw8H8qI5OYfg/BQSCibirBabfHPXAajVK
         X/Ys07mubvgr0HuvBNJP4DZNtDlV44o+ESTNIXv4BAPiZExb33cWV+olKNB7mdZRk7CI
         7LF+009FTJpZ/Va8V9GJydUglygjAgDP514/WFGdapOzpeICoppGllm0HyRsiXDtMgcx
         EHUo6dzjcjP3Xt2KlNwmZdJ7D3Sstg2bnzW8loJ5jFI6QmuMLk0zkRrqAvmhMAH7Xz7A
         1PHKoyXA48xpNehM5NZgTq00gDmQ7IkBuJg1z389EbHCwx6HWwhqhuraDFe9MyDccDbc
         V2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364914; x=1737969714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoamquXOCnAAaRWeOvWzV9A8HnHrnKqCSO9m8sNi1fo=;
        b=IwZqlxaXLMAE5zhhGxWq0foHA3e7IonAJYWPIhifk8LnSP9E+6sT436z2uBwHlZwBo
         VznEK+qgHcR5LCCR59fZKn4+mTFi7dFmee42SUIr1/X2qwv5Bcf1KLv3K3SAVaDbORiy
         qLQOBYqRnUkz4AlWp9DVNJda9NTzgEp17XBXQL+bxErxECxiUaA/E8TZJ4iu3JHMH9vt
         WmQ58AO/xbZ58oOMBpJ1eTg2l2Y+vgLW4DqkaAAVJDlRYQGgZ4pRn1OMWtC0bYG87YBd
         SpdHjPBVYdFk26zB2DqseAtqEQYEt/kATkNFXWvgzMIYLzYIp7bLA2xm/+eRXcCBgxVY
         kKFA==
X-Forwarded-Encrypted: i=1; AJvYcCWmf9Bbv+deVsV2RYnmz/Id/Ll6LfcwtAiAuGEYwWwqqP1ItG1DZOTjR9b3yUssagdSB/GpmbQymtxz@vger.kernel.org, AJvYcCWn3EilMAbl0/Qe2juJ7geMbRRvHX8jnkB2qBqBBTKRUbd+xvOj+Q9IJUoJW0VA4SgPuYoeIL19/9C8tOH0@vger.kernel.org, AJvYcCX/64AcJIzPa1P0VaFYR3srTzQEU+E5KioFOFWTFt3VhxKyrx7x1VGODUo9OkrlMwE+SwZ2PjX6HsYFLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL5LqCms2iVfr4CQGoJoFU5TBLfjvMAgkJmkJ+WltaVyJLJcBE
	dHZPF2YdX45Kqb8OJ7nohZD8S1Asm1c/isNnl0QffzBRZW1ynvy5B9caYQ==
X-Gm-Gg: ASbGncvJS/ogEQ48opct/HoTci/rjRwZ7MEKynJqqwDPGC3FK6XrgQUOv3J/QQdDbOw
	43/+gHcTFsnhScbFboGgTtMoexOZSZw1RDd7UpZFeNkan9HPIHXOkf4wvZfMFUqAtBZ2MyEibKx
	0i/GijCsUg+zeAQdzn08oTQFbPvnd+4HjSqM0GlOkIftaEOM1YUTuNozaISsPgref3DA7cR10G4
	J8qQKP5GQxVlzPggPEghrxugY5U2jyfp2HcO+Z1hLviPGZcjvob+sNBqU5feY0Lvko5BmC3gUGU
	IiY7pCF6aVW3Ts/4T66UU7Ju3zPAQLXDoUW7BKQBKMftVkupVbGpGQGnXWFw
X-Google-Smtp-Source: AGHT+IHbo5jhqFJFNx1za7nz/wkN3HVisK5HEE+XxJhTcBPOU85BbcBdy7+oj4N/BwqjM9mVJ912AQ==
X-Received: by 2002:a05:600c:3d06:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-438912d91admr123607765e9.0.1737364913575;
        Mon, 20 Jan 2025 01:21:53 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438a1ec39a3sm80680175e9.16.2025.01.20.01.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:21:51 -0800 (PST)
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
Subject: [PATCH v3 2/6] mips: dts: ralink: rt2880: update system controller node and its consumers
Date: Mon, 20 Jan 2025 10:21:42 +0100
Message-Id: <20250120092146.471951-3-sergio.paracuellos@gmail.com>
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


