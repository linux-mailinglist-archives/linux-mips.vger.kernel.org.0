Return-Path: <linux-mips+bounces-9428-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A99AE0EA2
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 22:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E80C71BC641B
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 20:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6256325A631;
	Thu, 19 Jun 2025 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="LOO7vVlK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A3E23BCF2
	for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 20:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750365311; cv=none; b=r7RGGt1EyuGU+IoWd7B3nSL4bJvpxfFhsuBh0+NZ4lTxq83O3Ky0g1kUsYiDbnwzPQKQY1ipqTK2DXIxQh+H6Q2nll/d/2523MLDpsDR3tB0EtdLgOtkCApEa2lY6vzuhMPJ8coTAmfWfA4RYGiklB6QVLGJZ9zfmDxR15WqDqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750365311; c=relaxed/simple;
	bh=h3UPqbe4sHsIOrKmfTrEkvLZUI22mR3WiPaH1WtZ+Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJuGozd5Otrf5IwD0V/01+lf1hRO4Eso7yUyMVM+lWnjkg/L+WOZrMa3VfYYhYp2bEzDmxFstHkXJiiOgmsALAuZbqKRvMj2JER4i2tnswtyaBuvc5mDIaFBVyO7dROXMNvAepI9MikK6w/5XxwEs963/LUgt1kGH/9PVllJOb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=LOO7vVlK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so989391f8f.2
        for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 13:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750365308; x=1750970108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqIJMZJtR2MozSAlBaEIUnoVSAIXjXDAyYywqzDZ/go=;
        b=LOO7vVlK13PddqBStlK86Da86l+wfv9emJaLypWnAiL7AolWaJZHiBYRNZ/vHUJXPx
         PUdjummFJ/DUQq8Y/WUtFcgMWlZLS8ebMa1/bV/uSm7u6J7r9OFjpNSZcycshKXD/W5+
         6ho2tRtneeU28+do8Q94C+fT4G4fYKGYcwGodUBnbLI/g2h/VRA0Hm5mdvSY3xy9Pe8H
         Q/8fLe1bGnb0aeHDQxZWY2VnsIXO7vghYI4GBBOQ5qvATaQaR6z2+OYpSw43csKUloGI
         /E+pUwaYt/TFn3PrhU9GYxw35k1p5S5a1qfBwIbaupVi/oeXmWETnswB3RIIrdEGPx7n
         ghRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750365308; x=1750970108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqIJMZJtR2MozSAlBaEIUnoVSAIXjXDAyYywqzDZ/go=;
        b=SyFxymi99m3jVrBCnmJ/Fj5juv9gQ0jrH0L/qg7JqyL8Vwk/GFwBHSYWn8avL+lkbe
         mGcDKEsDO2HGAYLkpNCdXp7VxTfaBHTQPK7e8IGN8iBR5RWQrgNkSgK+RBA2GAaS9kwE
         tEhsNX5YdZviTObzY2j+CsmIjeaSLqAulRiJc/ugWVCbsk4vZy+EsjWakmaJWPv0JW8r
         qqsDKQid7BiLrpSADsE8plXFt45EuxxXhO3Js4HuopKwtlAQEFJGQy4WeWMKYfzMadle
         WYE6P1UQ87o8YIUywHE5cJnZ22JELuYoLPTt4F+Y/u6nIQgxtwXZGyPMmD+6XlBLzZ6p
         zH1w==
X-Gm-Message-State: AOJu0Yz+qHkS6JbL3Gm6G+Fm5WDsCASW7hnvuviLRjzXYZrWQY4ng7JT
	FXg3FqwS/XrnDEHl/s1HV3GIgh0SXQgsI4Tw4T7nfRGUj/PHihTHWZpihgfS2NBfkKKV5sLfqi4
	tMO9c
X-Gm-Gg: ASbGncu+ZCShRGQRoJ/zov0OfvJaF3X0IiZTzNPrZd6OYWiR4+pIZ1rMMHnH+UgB4d4
	Iga2uKLq8U5JO3PFe6MYLRuKCgpy1HvpZtr7OBS4rkAvwydPtbutZRvZGwo0YZNnVdBBGqKQesm
	OSq3hO70rFIIrikCttYBtg0gdz7iJjhagJgTAxVgFHaW3K6QYyCQhAdP6lMWgP36ZltXHsV4p9m
	6zxqz5dHJMc9mmiz+BfoAEZHSEHplIij55aDyR3l4gtmF4K/IDQcbDCIHl7B7h9a8ruvG67TBA0
	vGuLcd8X1bvH9Gahtx/XNORr9d7fs2CXMI0kA3RaDJfjEYYQC4h68FcXjXtv
X-Google-Smtp-Source: AGHT+IHaa/0DwyjqICRhYqGySJHbrarH+g1ieC9QlV5bX5bc3ypPAuIZ0V2lnIE42rr80V+RNBEoOg==
X-Received: by 2002:a5d:5f4b:0:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3a6d12c1848mr307365f8f.16.1750365307710;
        Thu, 19 Jun 2025 13:35:07 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:a60c:e454:f09e:79d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1d91bsm288495f8f.42.2025.06.19.13.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 13:35:07 -0700 (PDT)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: [PATCH v3 2/4] MIPS: dts: ralink: mt7628a: Fix sysc's compatible property for MT7688
Date: Thu, 19 Jun 2025 22:35:00 +0200
Message-ID: <20250619203502.1293695-3-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619203502.1293695-1-ezra@easyb.ch>
References: <20250619203502.1293695-1-ezra@easyb.ch>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

Otherwise, the MT7688-based GARDENA smart Gateway will fail to boot
printing "Kernel panic - not syncing: unable to get CPU clock, err=-2".

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Reviewed-by: Stefan Roese <sr@denx.de>
---
 arch/mips/boot/dts/ralink/mt7628a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 0212700c4fb4..10221a41f02a 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -33,7 +33,7 @@ palmbus@10000000 {
 		#size-cells = <1>;
 
 		sysc: syscon@0 {
-			compatible = "ralink,mt7628-sysc", "syscon";
+			compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";
 			reg = <0x0 0x60>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.43.0


