Return-Path: <linux-mips+bounces-9342-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3B3ADC855
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 12:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18024179142
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 10:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAA32D12EF;
	Tue, 17 Jun 2025 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="DW8PsgBk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCB32C0331
	for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156268; cv=none; b=XrzB0Wi2+Gg5vRNYolU9rnGoNV58IVGEyEsy3Zx74FC3kfcPxsvNYO5ACFD0sq2t1RHS3kHeipelrJ0dGUfRVgoOTKHKxbr26WkwSnSTtl+9FnGDIOCY37sx5OxsCEfQqJKcJpJEOSn7jUQawLRbmhZLKQta4bAgGMmBm8beszc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156268; c=relaxed/simple;
	bh=xXOn0HsXOLMhwrK8hxGYgemk6ajiFApPGs1BV9Yy8Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ukkICthv6mV01JqVJXlpYma2OM0Z7Z7B+IKTUzW9s/RzkDQxvpkl4fgGzX8roTKz7xxoPPhj7ppDC+OGM1FY8NiwRySapnTC3hJNT+3dZWiLbhtZeOeFNA7fzXFk3Ybuc/t50gtX5kiZZvn/ReeQVhIh5p+lXGi6drtseeV9D1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=DW8PsgBk; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4f379662cso4798200f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 03:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750156264; x=1750761064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGE4KFMiA3w+V5SFnoNxn7J/yaSX/gETYA3wlTGQnvE=;
        b=DW8PsgBkOktu4zdMZQLQZ3gyVWzwpDPODzMeQ8erhVVyMYQckTMy1iZBOuR9ZWCl/+
         AD/ukxcfDCFsyGvbSFVGwwE9mmc/8G5n9YwjtNzjPDgVRHVgDY7I2X+2AzZ9yoTnFW5B
         RXYqLqLNF5WEku+uFm1SF0vDtyrP4Fil56CuWdy89NmwWDcqpDUwqKKgNlsEiiyqGdtT
         wndYrl12+jENSZ1R09SmjRfhb9eAQEHgajSeprlPNJ0w0AX7Y8ZoHZ5/t3f9dznm1cHB
         x/FsnGpCoWjY1WHT/0QUluYQZ3F5RGDs1bfjbpN/xPNEOlOfN5Z2d5Y7AOzsuFDoZLd+
         o/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750156264; x=1750761064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGE4KFMiA3w+V5SFnoNxn7J/yaSX/gETYA3wlTGQnvE=;
        b=CzVHQl1JiJhTjGUKl90tO7aXUUTrk5mowCS4argrEHDL6zcgPDtESmCgOzaTeB7VRw
         WHBPuCYHDiJymV2MzJFEsevAWkEnWLAfRqBl7iTB2FgPiW0oMWhSk4sD9D8N0WM/DE31
         gPnGzSo4VuX+Rl0S28A8YZU2J50jjPJMzoSdKQMTm8MsuDrIfuc6X4KO9xD+MXRZpr4s
         2Vnb4QkeX89xx5pg8AjGHC3H+Kbv3GlrBuacmGiQ6E+GHl1L3H2Be8Dj+nCNcnLYPRU6
         4XyIqe1W4LFVhf+SnFaIy+RY7VAK6d+mn5qj1OyvFDke83MYR5FcBa54Ex5Iy5taQ6OR
         1USg==
X-Gm-Message-State: AOJu0YwC/L9xfHvFu4BglX4thYLM2M00u3qmig9oZ4hPTKLPDA6LAqqu
	1nBZy9MPnjpvaa5lukgmrqL1v2SfIvPcUuWBFXB4RpbOoTCSlzH3KhV2AU54F3aAilCtz+w+9NA
	9eYAI
X-Gm-Gg: ASbGnctruFaIOtx07enl0yRsfmgsr26GR3C62Y+3m3FA33fkLwrQE4b1Q0nzQOxd7Z3
	D/p/XDqs/iIL0rk2KlLRivdu7ixF9QPAURe8OoTpZclUkY2LIkVpkYuyeo9VpFGN4usabTyiX0a
	h/1ZxwbzrWuZfPPLrFWSiQORYdBr3ski9XENvdxo42El7sEEhJYiMgrJP+C0Vk2ERqpJlghNoFq
	enVeatfD3krKReBjRV5/LV+BI1Z5BxYQZZU5nA6Jagp0pnSQH5mTmHZ47JliklwxiOJNWqbacrD
	FQjHM92PULA/TL+D0CsSBRsDMWamte/4sERPEdp8BiFAoruMb5LB1cWe6Ps=
X-Google-Smtp-Source: AGHT+IFHcS5n1VGqyWuh2PNciIHKcGsucx+wMujbDTv29g65JK3wiRosN8FEjLg1U23Jn13HPM2oRQ==
X-Received: by 2002:a05:6000:2582:b0:3a4:eda1:f64f with SMTP id ffacd0b85a97d-3a5723a3b64mr8676988f8f.30.1750156264439;
        Tue, 17 Jun 2025 03:31:04 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:b1a7:bc8:262a:3102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e16a097sm176749215e9.33.2025.06.17.03.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 03:31:04 -0700 (PDT)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mips@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: [PATCH v2 3/4] MIPS: dts: ralink: mt7628a: Update watchdog node according to bindings
Date: Tue, 17 Jun 2025 12:30:57 +0200
Message-ID: <20250617103058.1125836-4-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617103058.1125836-1-ezra@easyb.ch>
References: <20250617103058.1125836-1-ezra@easyb.ch>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

Most notably, add the mediatek,sysctl phandle and remove the redundant
reset/interrupt-related properties from the watchdog node. This is in
line with the corresponding devicetree (mt7628an.dtsi) used by the
OpenWrt project.

This has been tested on the MT7688-based GARDENA smart Gateway.

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Reviewed-by: Stefan Roese <sr@denx.de>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7628a.dtsi | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 10221a41f02a..5d7a6cfa9e2b 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -134,13 +134,8 @@ pinmux_p4led_an_gpio: p4led-an-gpio-pins {
 
 		watchdog: watchdog@100 {
 			compatible = "mediatek,mt7621-wdt";
-			reg = <0x100 0x30>;
-
-			resets = <&sysc 8>;
-			reset-names = "wdt";
-
-			interrupt-parent = <&intc>;
-			interrupts = <24>;
+			reg = <0x100 0x100>;
+			mediatek,sysctl = <&sysc>;
 
 			status = "disabled";
 		};
-- 
2.43.0


