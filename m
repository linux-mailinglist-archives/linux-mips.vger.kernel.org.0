Return-Path: <linux-mips+bounces-3182-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA6C8C029F
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 19:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D7391F239AD
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 17:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9264C12BE86;
	Wed,  8 May 2024 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BS7fFe9L"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBF1128806;
	Wed,  8 May 2024 17:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715188065; cv=none; b=TZqKv4Y6XFpxhI05mZFctPZyh5PsDc1ldPOqHItY96HIR9DiC5vOjJHjJsDPLhe+qB4IoDvOeOX6fX3o2priw3UDiwHMPQDYmgR60gWlll+wzvl1XBXUj43jF91JC0o13TelrV2jG4dXCkfqtdcDX1xNxYD/fPgA5DkM3D7wlXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715188065; c=relaxed/simple;
	bh=jsv8eLzjlbF4u/0Mrmq/BFd2eJZK6yGKo7qJgRpCkys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cFj7oms9ph5T5BkMteGMH9OMdlNS2OCURQLD+pcBjZZR/8Z7f1v9bsDueI3ad4aKda4zILAXF67T7qNbkpSBz0fXGbgVltyTB41tng1IEYnMCq5FUkkujZpK/gY64M8HuzmjaWOhD7DeeG7p4sHQ8vkGXhjJI/EP5ON+C46W5pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BS7fFe9L; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41ebcf01013so149845e9.0;
        Wed, 08 May 2024 10:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715188062; x=1715792862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xbtyC2EsQVkdqMHpm1p6J7lTiGONlDxg+wu3ietGg4=;
        b=BS7fFe9LrqgtdKrc/cZFJl5gfHyuWv0tJxHdwsyAj1zF7NnKKY9sPn1OHD95KekLZz
         oVKAbBA6ftZ0fRlIY0WbNxASaBwxO3mp+PH5q/THB+oMpK0b84Eswd5kVq6EbX7KaAbU
         CmoskPcxy6JP7gUswOOfvsgLNH2uGBViECCv7S1mZ8vQg0/tablR5kCXtRwOYBnmaNgt
         IVUgpIpXRoKLATSN4BCFNAd8uIRr7GUB9m7uWMY4wvX53Rjz5o7/Y+SEGvH1fwa0g/3/
         32ADNwr5M98Z5Oslal59k4tXmBapG+5yxkdJ5RxBGnt3p/A8Ai1nO3wxbrvHGafAvIgZ
         WCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715188062; x=1715792862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xbtyC2EsQVkdqMHpm1p6J7lTiGONlDxg+wu3ietGg4=;
        b=ixe6BlibEWKdto7MP1MIgG1PV3ooT3nPlA/OGrKEpIILz5jUbcoSSinge4W55Ctqx+
         7sYlxo4pI2e6/X3janBjiEXfM0evSBLdXgiT/spLp7hImnmyI+sD5v6YbrjEd2DGtscu
         Q7OaP1r4DPaVgryNbNPndVXwV1WFpTTmirkxZoQ5v/M2sARUCqLfJiLWgkDGT4KT8ucS
         T3BgaC+lwFN0G3cpJfL7Yp8PjrCYCyQjGX+b3yDzEWdtQPxCJN8NhBi5GnP8Yz38xRQG
         TmcSFq8GEBUu9/0uUHfUJI4FlwuA+dflUjpR4iZE7/3Tb/ZoIFrFOkOYYYmant9mUGoC
         Ur0w==
X-Forwarded-Encrypted: i=1; AJvYcCXIDob2bQb+MURRBJeIo8zdSX1MdrSA1Y7RC/NLc/ovcImmJwfCoYIrZazTtqueTbU0FNDwbpGNb8RooTxH+BOSu7nLmJZ2c5ZwA0MVnKpEZVA//1TaxGwZCxx+Vjrp5IwQMyJcXyQ11REwQz9tiReMjjxVxOmncBqoOsBRPJEyo5wWpKk=
X-Gm-Message-State: AOJu0Yyfhk55fXQwklq6hqJkrJJ/8v1O2JWN9EstaiwRgIqjYjrPYUcd
	DQJ9ZnIGtvhojltb3ho9+pUEgtblDVzsL4Y0w0/I8JgPJNpWKc1P
X-Google-Smtp-Source: AGHT+IGHklCw3o2XHxFIadESzyyXM9h0yELRBYJCCmh9peT7r46PQ8WwtWQDAvCB2F0gpxwgav75Cw==
X-Received: by 2002:a05:600c:3144:b0:419:c9e1:70b8 with SMTP id 5b1f17b1804b1-41fbcd7095fmr2135365e9.13.1715188061886;
        Wed, 08 May 2024 10:07:41 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id fk12-20020a05600c0ccc00b0041c130520fbsm2921555wmb.46.2024.05.08.10.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:07:41 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Daniel=20Gonz=C3=A1lez=20Cabanelas?= <dgcbueu@gmail.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH v3 4/4] mips: bmips: enable RAC on BMIPS4350
Date: Wed,  8 May 2024 19:07:20 +0200
Message-ID: <20240508170721.3023-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508170721.3023-1-ansuelsmth@gmail.com>
References: <20240508170721.3023-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Daniel González Cabanelas <dgcbueu@gmail.com>

The data RAC is left disabled by the bootloader in some SoCs, at least in
the core it boots from.
Enabling this feature increases the performance up to +30% depending on the
task.

Signed-off-by: Daniel González Cabanelas <dgcbueu@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
[ rework code and reduce code duplication ]
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/mips/kernel/smp-bmips.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index a4f84667a901..0f93963c08e4 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -620,6 +620,23 @@ void bmips_cpu_setup(void)
 		__raw_readl(cbr + BMIPS_RAC_ADDRESS_RANGE);
 		break;
 
+	case CPU_BMIPS4350:
+		u32 rac_addr = BMIPS_RAC_CONFIG_1;
+
+		if (!(read_c0_brcm_cmt_local() & (1 << 31)))
+			rac_addr = BMIPS_RAC_CONFIG;
+
+		/* Enable data RAC */
+		cfg = __raw_readl(bmips_cbr_addr + rac_addr);
+		__raw_writel(cfg | 0xf, bmips_cbr_addr + rac_addr);
+		__raw_readl(bmips_cbr_addr + rac_addr);
+
+		/* Flush stale data out of the readahead cache */
+		cfg = __raw_readl(bmips_cbr_addr + BMIPS_RAC_CONFIG);
+		__raw_writel(cfg | 0x100, bmips_cbr_addr + BMIPS_RAC_CONFIG);
+		__raw_readl(bmips_cbr_addr + BMIPS_RAC_CONFIG);
+		break;
+
 	case CPU_BMIPS4380:
 		/* CBG workaround for early BMIPS4380 CPUs */
 		switch (read_c0_prid()) {
-- 
2.43.0


