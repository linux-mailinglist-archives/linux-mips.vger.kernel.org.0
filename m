Return-Path: <linux-mips+bounces-9260-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB45AD5F42
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 21:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80321178E44
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 19:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000DA29B211;
	Wed, 11 Jun 2025 19:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="Qqv/RXuU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE90286D57
	for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 19:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749671244; cv=none; b=EiLWLYAMIM3JU8dc6JGwqkCzHCIBSiRxu9bq0cUWXOBWhf/wArRKeX1TDkzjTqE2WZ0unaCO0cBXzEEeGMfbrMtwMyDVAkc9cQz4c4UTedAYksDLRqTHvoBCzV66gCsFAVgUo//EoSfOqS/zzz3jREczdFdJINXgfl7rReja0GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749671244; c=relaxed/simple;
	bh=xuQ4tkzms9bKNEQVlJHRVKLLYWYfUbJJIDum7kazoxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dk9MhBm+QTSDx7dHO0tNn/MU3FhM6doBdowAQwO2JDcXAbUouOsAbdMmIYB1zDw+gWIOYhAH59djvv8C3XB0uGrhGYnzx9AAI5y3vczzv6ETWq91xvC4rflN1pyqg0E1caaGtAq5ytNeR3mCY77QXUXX3pENh90pAMwHLjLmF9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=Qqv/RXuU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so1199515e9.3
        for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 12:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1749671241; x=1750276041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7GVtpZ6iE81NgvtPTNxRxTee37FZbTTen/4vv4ZEU8=;
        b=Qqv/RXuUq3zNhlH6vArZ5LMRiDeAs05aq4IQKcLIOS7ImMANexymLH/9w1k7u/IBEF
         ukZYeZPUtRB1hBoIeFUWxGdV2C3cYJZArYAIyq50S3P79SX7YO74WRVYfgmZt63yDVvO
         P6GyBJaMxKoHIR7uWGlABogRX0F0XEO93cWdalsLeV6PqiHvEhQBX73mu5C1QssMi78C
         vX9zu0lYBSpLa1Y06Ek8KPiy9EGglisEo1V4MlZO7ZRxH960e35RTEFWLKQhoPHq2oHJ
         1+zRH3BhJynU2R3vQ5Wgdo68nVn59x05WWzB85XYyi6hYzoINl0FQh0LUmMaRn6LWMNh
         Pszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749671241; x=1750276041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7GVtpZ6iE81NgvtPTNxRxTee37FZbTTen/4vv4ZEU8=;
        b=frjjGmClhg4JEDYuEI1MleY5ww7Sk7MLGY281q/pR2xkdV8/ti4Wc30wejMg5Q2tie
         BnyYulHc/Ub8cMYsXJanW+9Zx9R92D7I88m97LucYMpOEXm4C0yJJIMaiXr0d3uDDZtT
         45OUYYtp49A/AHmhjfQ3lkKIag1hEM7M4VT99ODFJc2Ztcpf61wDoEy+LaPUuSXTi76f
         l0OtLnVBteSpk8arRfpjphDUFQ4oFooWMq2Lv0+mNxZXY3tHoaUIF7SZ59ad42Jh2jfF
         TRkue+oN8iV+1PvJ/sZUy1+1WOzmalv4pcyQcREdwCLZCLmxuo096tL4Zl4QqGgrIOLF
         fy+A==
X-Gm-Message-State: AOJu0Yy7wDJKw1yuMWQRjt1SE9ntvgsMMI/yyJyei+IK4/5Z2Tp1CUoe
	NaBLPJrD+HFweCimjVVeHEkBkraNpBBEodNvUI7RXZ6LHDObA3/d/6ZrB7QnaFn/U66eCkdCOkc
	SWWjb
X-Gm-Gg: ASbGncvCBwKhaBTzcUCnjuvH1BS1c0IxvCnxegRiIrsgpTgn6jsHE5YB3H83mgqznb4
	Py6pSjfQJdoU8rRnNck45NdcqBkLDxYWA+5Lyejb/pwyXlqqqbFuwleFexBe0X+mXRg1iXlTZFQ
	kLKLSfO11dVsP1K7X1vEGRjLyclpWByN9GtpbKjSTQ3vgUplxQVffasx7g6V99xXimr/+kI52Y2
	YSuGwLtG24e8WUEEMSnfJDBxA4PnHaFPPOGeWuBXdiEge+VudvbFlLoo+Aa1jZBujhEChdakgBS
	krYX8oigeJOu/qiyCObceHBSIw0pwqwUPjFacK4aOj3vXQwGRWrMVB9x86UOaxcfmedz9cA=
X-Google-Smtp-Source: AGHT+IFeGIOxieLn2IG9n9WAey2SBlsZjUlsWsM1FL/RI6eLin1kuV9FgURpBmnPTDskqkgWvwJUzA==
X-Received: by 2002:a05:600c:c16a:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-4532d37700emr2012025e9.4.1749671241184;
        Wed, 11 Jun 2025 12:47:21 -0700 (PDT)
Received: from fraxinus.home ([2a02:21b4:9a83:1500:4cac:8ba0:e616:6d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244fceasm15949433f8f.82.2025.06.11.12.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 12:47:20 -0700 (PDT)
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
Subject: [PATCH v1 1/3] MIPS: dts: ralink: mt7628a: Fix sysc's compatible property for MT7688
Date: Wed, 11 Jun 2025 21:47:14 +0200
Message-ID: <20250611194716.302126-2-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611194716.302126-1-ezra@easyb.ch>
References: <20250611194716.302126-1-ezra@easyb.ch>
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


