Return-Path: <linux-mips+bounces-11916-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C65C1C27A
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 17:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4877318891D1
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 16:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15076348446;
	Wed, 29 Oct 2025 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1cXr0Cg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5459E3469FF
	for <linux-mips@vger.kernel.org>; Wed, 29 Oct 2025 16:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755632; cv=none; b=m74u/85XpWtu0PxOyovHvfa+Wd2GeYbxci6OmKXK4FkVm7WaQwOmTxRXp8JsWPDjfF0G8Z83NFwwR9/2vG84z+/uIbsn82znobvB6OMvMp+MjHpgW39GshWL0hnElRwH2cpU0blu+6nzT+44GRsa/ex8W9B7iwFSFmnPpsQXRH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755632; c=relaxed/simple;
	bh=nyc2pqrGN622czbqL752mZIP4IX12KOgaXiQ7fJqL2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFrWIsJ860M+4TVK5UiE6Lxc9MhXMYjuhWr/9DU5PPnOSAI46bZZ1eSUm331XAsYWHc/7USD3UJW3J1VgktxwDVvL0HrOKSqWYk7lzrP5qrb20FCu1rDNQnJogkkWfdSy/NsTL69ZaQ9OHBnKa0PjzXXvzwQ+dkgvGYyZYzKIBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1cXr0Cg; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6dbb4a209aso13354966b.1
        for <linux-mips@vger.kernel.org>; Wed, 29 Oct 2025 09:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755627; x=1762360427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=;
        b=V1cXr0Cg4ndM3jkEqoKK7pNLVxhQk83ylbmOK1yybH4dhBvP2jBWNzp0YPmRroBAGH
         1C8nigmWcOOU6slSWGloIo6Xlxj6Ju1HFho9VQneYSUAQAWxSoGdeiSbhaehOgKT/HJh
         VYlUoF0tWEoy+LQYHFZMyx8b/odFx88aDHOLTCIpfh8uaKSRkX50lPFfNTw/awl+AZF5
         Be59+EQJhUqcClA1BnAJ60+5SWtfDNKGW/umX1s9ajOIjeaizK7ET9Dl7HNBpbNgj10u
         uB/XoucPzqjuXmN0cQhpEYcD57DqTuSrLNF5V6RxZpaFdrVRjt0o+/uFNalLViR+OpCq
         oA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755628; x=1762360428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=;
        b=ZfqyCTMXvjQLsJTiTbPToFPTZ2d/gNPA6WcIYWm+/rgVMxYhDjARovsPG+qhsVTesd
         dUqox7M4JfP4WPxgcjlFulJ4RPK/wCP6Bo9DwogMkOTgVcqagoZbm2B7WjX+G2cZr9ad
         kAcPk4xLd/Seo2EIxEYXJkiCAkIbcmeymPsRG07kxQP5etju08ksi+Tt7rw6eLNr6mOQ
         cHBwzfhmm6oUDNp13ax15xDqCRjCaNe9iEd2y9ZFXm3XEsM/ivowQm64GtMob+pWt3st
         p3L8mmO4oU4qw32pjRmEPl2vngtheiHgLdonX4f1fVvJjzI5b9qWZs4EenjnKxRrE4cG
         SZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSLMbSH0z/Ky1z1IWJ7BWpijDVT05kFhCnsVQce0bhgZFYWud4sncgSE0H6C4cjilOiPOucjaC95A+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa3GNK3HPcw0L5f1daG4e1QTfS+YTgCT4PuggUD1eKAY/tSr3x
	lfPXZNwVEJ8ZBIAWG3H4vgZQEvPvDTL6pLfBth2kdxy/kUAWa+sh+TOY
X-Gm-Gg: ASbGncteK8jNAzGuMsTVZBT0iLQrtiRwLduHPnIb7lBf/N3Fyv2pfKi2EctpMpoE9Ye
	E1DhWgoSknkfhPXG70mL+CjA87mW5x0idOnPRTRDzy10KagORVzSrHTPiPgk+vXZ1H0wGXmWRoA
	uboUnBZqE6jaCD6jAqVVSWnl/cd05thTn2onMzQdERnthei5m2+C7/SRytO4ypSlZ7fCvUMbVRz
	mjXeAg2p6ilbvDcgU4C/KUux3r+oeZX4hEuCPLVb2NuXqM5yEu16Mfrg47mZP2wGjJLnI2bYC7M
	jZGqYC+XdvbjvCiChud2l4qFtpE+fs5biYItWapUkx4lUncNHt1vd3h43Bb+sVcz1YDSaPD2vvA
	eNOy0s+3VtPaR2sHiVMbd4QCgVi9F6MBd4jU84XG2yLHCBbvgagjbcaJV+HcAjUqGlvcf5W3iLS
	ymCFne6i1ArzQaxsb7yT047XM2hqjQK4klVA+nL551OcKj+it1/UeLpg==
X-Google-Smtp-Source: AGHT+IFucoSpcC/sMHQ4BHPU2Sj/4WR5SsWuPVRxpOY+Rb83Lsjw7eIU5fItk/Z3WAxH0T7dO6D6kQ==
X-Received: by 2002:a17:906:ee81:b0:b6d:7e01:cbc5 with SMTP id a640c23a62f3a-b703d55289bmr367879066b.53.1761755627345;
        Wed, 29 Oct 2025 09:33:47 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d853e5138sm1485764866b.44.2025.10.29.09.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:46 -0700 (PDT)
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
Subject: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:31 +0100
Message-ID: <20251029163336.2785270-3-thierry.reding@gmail.com>
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

Changes in v2:
- remove unused global variable

 arch/mips/pci/pci-alchemy.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 6bfee0f71803..f73bf60bd069 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -33,6 +33,7 @@
 
 struct alchemy_pci_context {
 	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
+	struct syscore syscore;
 	void __iomem *regs;			/* ctrl base */
 	/* tools for wired entry for config space access */
 	unsigned long last_elo0;
@@ -46,12 +47,6 @@ struct alchemy_pci_context {
 	int (*board_pci_idsel)(unsigned int devsel, int assert);
 };
 
-/* for syscore_ops. There's only one PCI controller on Alchemy chips, so this
- * should suffice for now.
- */
-static struct alchemy_pci_context *__alchemy_pci_ctx;
-
-
 /* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphys_addr
  * in arch/mips/alchemy/common/setup.c
  */
@@ -306,9 +301,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
 /* save PCI controller register contents. */
 static int alchemy_pci_suspend(void *data)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return 0;
+	struct alchemy_pci_context *ctx = data;
 
 	ctx->pm[0]  = __raw_readl(ctx->regs + PCI_REG_CMEM);
 	ctx->pm[1]  = __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
@@ -328,9 +321,7 @@ static int alchemy_pci_suspend(void *data)
 
 static void alchemy_pci_resume(void *data)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return;
+	struct alchemy_pci_context *ctx = data;
 
 	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
 	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
@@ -359,10 +350,6 @@ static const struct syscore_ops alchemy_pci_syscore_ops = {
 	.resume = alchemy_pci_resume,
 };
 
-static struct syscore alchemy_pci_syscore = {
-	.ops = &alchemy_pci_syscore_ops,
-};
-
 static int alchemy_pci_probe(struct platform_device *pdev)
 {
 	struct alchemy_pci_platdata *pd = pdev->dev.platform_data;
@@ -480,9 +467,10 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 	__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
 	wmb();
 
-	__alchemy_pci_ctx = ctx;
 	platform_set_drvdata(pdev, ctx);
-	register_syscore(&alchemy_pci_syscore);
+	ctx->syscore.ops = &alchemy_pci_syscore_ops;
+	ctx->syscore.data = ctx;
+	register_syscore(&ctx->syscore);
 	register_pci_controller(&ctx->alchemy_pci_ctrl);
 
 	dev_info(&pdev->dev, "PCI controller at %ld MHz\n",
-- 
2.51.0


