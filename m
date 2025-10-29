Return-Path: <linux-mips+bounces-11918-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 044D3C1C590
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 18:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A45B661E26
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 16:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF2834DCC9;
	Wed, 29 Oct 2025 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPTPgjgT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD6E3491E5
	for <linux-mips@vger.kernel.org>; Wed, 29 Oct 2025 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755637; cv=none; b=JkKsqmshZYO06J8nwOdgqM+r/JvdZYt8o5fP6HOOAbeEpXpUoYffJKFNSDabwtBkHObeYHpnbKzCr+rUBL0pMTMK2dcCBf/onHhX7IN1WliVXjNKNRGuUvfLpf05fnxpUSczSMQpZHjjQlhGRD+AMfpRNOderOQWmbtcZ1brDW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755637; c=relaxed/simple;
	bh=x/c8Gau2O3gfj3+358hMm8pmNs7v1wm+QbURDM7KfoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHbE9wtv95WKu1HF/CciF5l6TNBZ+BCpFvqNstdOGBTC0PfDkJ20AqjYS4wa4ti6gkGzrvpedZT6cSdfK7Fa5rNWMulTUxtHg5RagmAKX4W73rH5AERkTpzHsjfsWB8Ly3SyL88t15QyvBIEMlGlrfrDmKxVNRsSfAbFtXvIsWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPTPgjgT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d5c59f2b6so14861666b.2
        for <linux-mips@vger.kernel.org>; Wed, 29 Oct 2025 09:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755632; x=1762360432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=;
        b=nPTPgjgTOV4QvNiw767EkPXP8nZH+vMB95IK/uUyEapExC1xYDWPM9TY7fbFAnRlyR
         5go9001Apeiz1bCEoM9ktB19pnCqBYoMUiyerZmB97OscW9O+xPEWD3Y6x1trevTW6Gl
         gtcCynIa2cisxbIx6H8ZplCo7ErSv7aVeY2Jmyd1HkESnUSaaT5C6jz/K9oiV202/a/O
         ZCLReL5xckIEkVq8agGcgTNlA51Si/lOJzd6MVTxeioWIsLWGosNJ02BzgImHOjNw+nS
         ckb+/uuvh3BfuFZedwV9ZcgQrZ6O8PkRxXJZ+nnx1vURNkUTUuBoe6Rt32URkixI8fci
         PCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755632; x=1762360432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=;
        b=KqJwKXrcqVqWio1Gf7Dh81QPxo+FtDXBiXTCOX0QPPfwDlS32f4JvqBvPFGwiwT3Qo
         enYG9jqXZ0n7Sez2uSOdGVwrrWUfYq7eNnJaa66176GqYNc3KNRgouQc2ZZZfkzMDZRg
         kk8gow38qOroaPEvKVCsKdaSkPpyG0cGZlya2cafkPXjwdw1sA98g7C8NqTHA1+LOS1G
         fmeOc6pu7UnqpkF3GFWCEClvYhaFsiXXqMgrybvhZ5K3yaj0zMK4hz/cvPYAIVU4AutZ
         SPcemSfa54GNkdByR7Drwxz7ae15Vb4zQIvgBZmM8gy6Dw2KkX2nsPCKtrn4wPX2St9V
         r+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB9g3vapQ3I75/v0l00SQkkENF/dPRVN2Z2BSf97abOmX7umZEyOA3CfHYoC5mZrwx8liTBK9f5pMC@vger.kernel.org
X-Gm-Message-State: AOJu0YxktjSch8rBDRgxWMbj9oQbTfgrWkDx8x5314i6M/YjLiqMt82v
	k1jvBxIKIjsGUPFNzJWidOkYeN8nMTp+/q6nGF3Yg9+Jl3LMJB0I15IXuPRGQA==
X-Gm-Gg: ASbGncvGta1Dg7K/u+hmX+Rl296AVjIc1NCn7xltTlhHuDohB99uNIJi/IQCfBMTeQI
	T1jgcpLG/sH5kr7saXeGgWXLSevpymM5VbpidF7EWPtAPPmZpMEcHBLxW4AoFRwo5nMvefnXRBr
	bytZ5WUTI6M/n8amp3zr/PwOp6nWFTfMquhWWLdYTFVO/hIKvRJKnhWZs+nrJa3PZ2wbV74zjgI
	0n/iyBsM+I9xjHPD/V6JhoDiCcUj21W0/pvqRnSzNQSylb1Pm2aljyvE9nChD3ftxsfCNiTWp6T
	XcB43h13Ia8/qI3bzhGfQ96EuCLkbLkr0ANGvfbOA8PH4tJ/6kE2uXG1MvDzWVJvtBxo17n1P1D
	FiKF+bXh+ufsyKg6Z7NNj9XMjpRA1EUhN+vQWKKtJb7f43aVKpBGUBn7qeO40Ugoqve4LPCNSWf
	dSocNCG46+zZA+obgLrlQtpEZJ/Aapn+G41cF8aSSefUccgKurMoUYuHRCtUL1TmG2b7Wz
X-Google-Smtp-Source: AGHT+IHRieiPBGU6MC5P5jZHI6G/6PD4P6RVg3Iggx9u+yanu4koYZOv2T4MUr84z07ifr1PiVwzxA==
X-Received: by 2002:a17:907:3da4:b0:b6d:8da0:9a24 with SMTP id a640c23a62f3a-b703d2dc3fcmr322653366b.9.1761755631652;
        Wed, 29 Oct 2025 09:33:51 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6da1e2226fsm1067814666b.20.2025.10.29.09.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:50 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:33 +0100
Message-ID: <20251029163336.2785270-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/clk/ingenic/tcu.c | 63 +++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index bc6a51da2072..8c6337d8e831 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -53,9 +53,9 @@ struct ingenic_tcu {
 	struct clk *clk;
 
 	struct clk_hw_onecell_data *clocks;
-};
 
-static struct ingenic_tcu *ingenic_tcu;
+	struct syscore syscore;
+};
 
 static inline struct ingenic_tcu_clk *to_tcu_clk(struct clk_hw *hw)
 {
@@ -332,6 +332,29 @@ static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initcon
 	{ /* sentinel */ }
 };
 
+static int __maybe_unused tcu_pm_suspend(void *data)
+{
+	struct ingenic_tcu *tcu = data;
+
+	if (tcu->clk)
+		clk_disable(tcu->clk);
+
+	return 0;
+}
+
+static void __maybe_unused tcu_pm_resume(void *data)
+{
+	struct ingenic_tcu *tcu = data;
+
+	if (tcu->clk)
+		clk_enable(tcu->clk);
+}
+
+static const struct syscore_ops tcu_pm_ops __maybe_unused = {
+	.suspend = tcu_pm_suspend,
+	.resume = tcu_pm_resume,
+};
+
 static int __init ingenic_tcu_probe(struct device_node *np)
 {
 	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
@@ -430,7 +453,11 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 		goto err_unregister_ost_clock;
 	}
 
-	ingenic_tcu = tcu;
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		tcu->syscore.ops = &tcu_pm_ops;
+		tcu->syscore.data = tcu;
+		register_syscore(&tcu->syscore);
+	}
 
 	return 0;
 
@@ -455,42 +482,12 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 	return ret;
 }
 
-static int __maybe_unused tcu_pm_suspend(void *data)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_disable(tcu->clk);
-
-	return 0;
-}
-
-static void __maybe_unused tcu_pm_resume(void *data)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_enable(tcu->clk);
-}
-
-static const struct syscore_ops __maybe_unused tcu_pm_ops = {
-	.suspend = tcu_pm_suspend,
-	.resume = tcu_pm_resume,
-};
-
-static struct syscore __maybe_unused tcu_pm = {
-	.ops = &tcu_pm_ops,
-};
-
 static void __init ingenic_tcu_init(struct device_node *np)
 {
 	int ret = ingenic_tcu_probe(np);
 
 	if (ret)
 		pr_crit("Failed to initialize TCU clocks: %d\n", ret);
-
-	if (IS_ENABLED(CONFIG_PM_SLEEP))
-		register_syscore(&tcu_pm);
 }
 
 CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
-- 
2.51.0


