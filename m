Return-Path: <linux-mips+bounces-3777-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A719910CED
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9722B25B15
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF061BD516;
	Thu, 20 Jun 2024 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knoIvOUE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4714C1B4C3B;
	Thu, 20 Jun 2024 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900766; cv=none; b=L1BKcgwI7j8MX/NblBvEqos5DsJTbNAVxHa6eSh52YHA+ADQXBP9z7j8WBuAAT7c0844GIRKgYPkjgdLsFRkgL8nANqSxCt7l6h9+Vc888Bkk0SZUZX8EHK9V8oSGiXYwQlzeiaFgBInnAyDY858IhuK3RA01/RYuZTEkwNTagg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900766; c=relaxed/simple;
	bh=Ua5Wlts7wNpHZL5hvbWj8KXVM7QOoXJPqG8In6tdSdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EHgDR4s8JjjJ5GV0/m5HK6435MY3G66SD4cZF+CZF3Mh5QkthhmiwmgDn5FabxRBIbvSe4gvPuH3sfXAKE0h4aFCWkOxoRczsKZAzAWRd+YmOnkah4GhCp+kprNP0LNChYmvwz9dzAFWdIWhW+RHKsS39msYAONar+KatFnsgPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knoIvOUE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-361785bfa71so915019f8f.2;
        Thu, 20 Jun 2024 09:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718900762; x=1719505562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyhPAil700VgPIg6DuQD4ahisl4U/95chdTNhKoOxhQ=;
        b=knoIvOUEzwjJAkEudwHK12CcvEuFhurFeXGDAqK5Q6CHHSRlqh4AHOPwtwbow6ohDG
         Fqm19ZllgWhbdeZsBSzOq+x+HdqiUbAvL2BcJVkP3DO8Kus90FzyiPmlft5UMbhPzls2
         hADni9wgq+aV1lJllubiiPgJ5F5awc42z3v2oA/l4MN+pbTbhU9/yKyNFVI9tFv0/7kH
         /MteP3Kt+Z05LBmv8R1Cks9mNiSkX1WeaAeLeqhev5+0mL4ijUmTHhQExJeYaZ7YfTC8
         8HXiGjjFOPinE8TttUw4aZ4Z9yTWUk+2dTrBQqWdxJfXjJwTAaK3Xd8sflNpx8r973vE
         iuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718900762; x=1719505562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyhPAil700VgPIg6DuQD4ahisl4U/95chdTNhKoOxhQ=;
        b=RnLj1/62GYcYrt2nppGfCS1B7JYRrECneRGAeiMKCzRK3BQlG4TsP+p3yDPbwiYhPS
         DGuOXVUfHYBde43a3NSfItFqtdPyUepSHRRHvDF4TuY2c1l9ARvuzb9HEjjYfHR8WCBX
         O/iyNn39OkWXBIwck66rqffGG15oTvM6PJIJN0UWUinOfGipGTHZa6MpcsZr2RTxJ65o
         e8B2v/IYdYGRF1+sZnLDqK8qDXj0iBsASWoxbmTZ4a2bLDQeFg+F2XY8KnrQ3xesV8mO
         40gVGDb9zTfE/LzO0q6RXz1hloyzB9Kk9J4DRt6YpdJJh2DYLO/CAC/GvGabE5MTJPp1
         e+OA==
X-Forwarded-Encrypted: i=1; AJvYcCWfr0XIdPSUD3Kjcd/77ql60IVNV3HAjNr4Iy8dQgTZZ5LWzT1DompuAvol10Phub8dF6Tz9RbUaYWa+jzVnZbnniobmgqkUrztV5nZ5VcR/7Psz4tJ6V1VpPwJ1LpO/gBw0e2FetEer79tD13jIt0jiwzC8VU86aTnj9i6XuUm0ehdn7o=
X-Gm-Message-State: AOJu0Yz87wA9a9hy2AaklVhMYVWnCOBfyx/UaFyJC/xA9i++WRqhdfqS
	26Baz9e5mrGc6AaDTim+rw7v5wUvgn06OU1+IHLteWO6FxX4ctHs
X-Google-Smtp-Source: AGHT+IGIY10g7FmHbibRhqlObKCnHDMnPOxDLE1jTG94vjc+tPuD9nHsAzb92AMmiz35tyYnPaf8cQ==
X-Received: by 2002:a5d:69c8:0:b0:360:8476:678a with SMTP id ffacd0b85a97d-363192ce1camr4012556f8f.45.1718900762401;
        Thu, 20 Jun 2024 09:26:02 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-362c7c2dffdsm6277480f8f.35.2024.06.20.09.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:26:02 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Daniel=20Gonz=C3=A1lez=20Cabanelas?= <dgcbueu@gmail.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH v8 4/4] mips: bmips: enable RAC on BMIPS4350
Date: Thu, 20 Jun 2024 17:26:45 +0200
Message-ID: <20240620152649.994-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240620152649.994-1-ansuelsmth@gmail.com>
References: <20240620152649.994-1-ansuelsmth@gmail.com>
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
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/mips/kernel/smp-bmips.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index a4f84667a901..35b8d810833c 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -592,6 +592,7 @@ asmlinkage void __weak plat_wired_tlb_setup(void)
 void bmips_cpu_setup(void)
 {
 	void __iomem __maybe_unused *cbr = bmips_cbr_addr;
+	u32 __maybe_unused rac_addr;
 	u32 __maybe_unused cfg;
 
 	switch (current_cpu_type()) {
@@ -620,6 +621,23 @@ void bmips_cpu_setup(void)
 		__raw_readl(cbr + BMIPS_RAC_ADDRESS_RANGE);
 		break;
 
+	case CPU_BMIPS4350:
+		rac_addr = BMIPS_RAC_CONFIG_1;
+
+		if (!(read_c0_brcm_cmt_local() & (1 << 31)))
+			rac_addr = BMIPS_RAC_CONFIG;
+
+		/* Enable data RAC */
+		cfg = __raw_readl(cbr + rac_addr);
+		__raw_writel(cfg | 0xf, cbr + rac_addr);
+		__raw_readl(cbr + rac_addr);
+
+		/* Flush stale data out of the readahead cache */
+		cfg = __raw_readl(cbr + BMIPS_RAC_CONFIG);
+		__raw_writel(cfg | 0x100, cbr + BMIPS_RAC_CONFIG);
+		__raw_readl(cbr + BMIPS_RAC_CONFIG);
+		break;
+
 	case CPU_BMIPS4380:
 		/* CBG workaround for early BMIPS4380 CPUs */
 		switch (read_c0_prid()) {
-- 
2.45.1


