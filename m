Return-Path: <linux-mips+bounces-4922-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6046D955630
	for <lists+linux-mips@lfdr.de>; Sat, 17 Aug 2024 09:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BB452833B4
	for <lists+linux-mips@lfdr.de>; Sat, 17 Aug 2024 07:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174391428F3;
	Sat, 17 Aug 2024 07:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="gDKEVVT3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAFB13D265
	for <linux-mips@vger.kernel.org>; Sat, 17 Aug 2024 07:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723880474; cv=none; b=Ub3b7gaEmz2R+tTGctrPtwZ7c3zNJh5WdTaZiZL25Fr16GiuLe1QoUow01BNr9hJyopIJitAQTvHufNnIoqRb3xMu2qNDg9CiKdUt6xbyAblQBLVq6SZRMwn07uM2xegDB9NXYueRfEpBBjOF7uMPGvl0401ZWWtSzRq59KxRq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723880474; c=relaxed/simple;
	bh=rPfPuGfh1UW1S1e0N3zz+OLUk/Jea98BE7sqKkvRG/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7eHfpJegwZFSWupyBcQmTqJs6+u1f3QNdDmVIrGNRRC4jIJHRwRIfIGsgEJzJpJ9nyNYGmxKTrOEjuJjZXPrkG0y/jCcZH+yFI9+w/OpvKbnag+Dyi5rrZxSWHzKgMpLK4Vyt3nwHJ5oAVybY4kQH4dpddvNhjfOCZLaD2O5a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=gDKEVVT3; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a728f74c23dso350072866b.1
        for <linux-mips@vger.kernel.org>; Sat, 17 Aug 2024 00:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723880470; x=1724485270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBORzQsZTXM1LbW/643seFKYzIpgNc2kY1JCnCvH3JE=;
        b=gDKEVVT3O+M8so4/nawWrPmAlj8arktrdoQ98EolSnyfXx/Vn8yYz8n+lW4kAepdej
         tc8jV3/no1RboqSsJNbhiOdT0OLiajpKM1adzNnLCPLRnW9ovsOCY2jK2+1BBluQ4Vk5
         44B0ElhSZWTlIT7dMrXvW3kvog4A4mGAdksCcpsn4F1YWubJVn+ZFjswTf1FybaidPag
         4akBcWBNQqyQ4tGMmMqeMl+DCI+It1KDOPtx9jTx0TsKJHbYItIBJ5EDEMeFiBSUO5XQ
         7syRoK7eNL+I5T6ZRgm0pkZiyDyYOi0Ldm7LcPygpPpE80SvLOVpEQLs5xD35vAR7nM2
         oonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723880470; x=1724485270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBORzQsZTXM1LbW/643seFKYzIpgNc2kY1JCnCvH3JE=;
        b=qf22byMKKzC+cqxrVRjTv0xDEQAbdj6xhnOg+LEEhUafCECNzLpI5lah/6sgDtGlP0
         mIrNgfRZO7F6zhynm3p/rF5fvgspmNUqSoBtRu+Np8UgkkTpHeoH/aAiiCr1JHQ08Euu
         sat+ClnM6kFJY18QYC0WHGL8GS5wJOrKgvdLm9+UEGc+YP4+OVQXi73GpXSFQzRzdkK1
         4rDkpZe9xwpsCyJk1MOuHuHkq8gSu4N6IOyNipBlrcCzxUb/visEmLBkVSokJDh3euVp
         ePdf6GC/M8Nt7MqFtjQFKiYxwxkdeY85Gs7O1dT+2fh4CZcQP3PQxLSuuALAio3bq+Qv
         WLyw==
X-Forwarded-Encrypted: i=1; AJvYcCUC/vp8dkGHv+x7Ss7wVwpoGq05vbEg7oTXXGBNvHswABnbjxqkIisr7VBBfEroKG9fB7m7T6Dz5XGeaPunteWIk2t28BMiIvLBDQ==
X-Gm-Message-State: AOJu0YyGNJn0jPwVsjLzwx86o2hhxfffr/+Gl6hNkS+kvgeTonSKnsGF
	m645swCt1pQmK4egicWuchuu7jwd8MUg4gCZsbAAnLX4eQnysl00H7+aYdzb2VE=
X-Google-Smtp-Source: AGHT+IENhmqi+DxLc2mz1SydD0A7p9AlI66nGERR3UWKR5q1emYV4OIEyUSKUHefLCRrMdx9ictRhg==
X-Received: by 2002:a17:907:e2ce:b0:a7a:a4be:2f99 with SMTP id a640c23a62f3a-a839292f4d3mr321245066b.22.1723880469146;
        Sat, 17 Aug 2024 00:41:09 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83aeb6eb4dsm66950666b.35.2024.08.17.00.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 00:41:08 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Cc: maz@kernel.org,
	mark.rutland@arm.com,
	robh@kernel.org,
	saravanak@google.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Date: Sat, 17 Aug 2024 09:41:08 +0200
Message-ID: <20240817074107.31153-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An 'msi-parent' property with a single entry and no accompanying
'#msi-cells' property is considered the legacy definition as opposed
to its definition after being expanded with commit 126b16e2ad98
("Docs: dt: add generic MSI bindings"). However, the legacy
definition is completely compatible with the current definition and,
since of_phandle_iterator_next() tolerates missing and present-but-
zero *cells properties since commit e42ee61017f5 ("of: Let
of_for_each_phandle fallback to non-negative cell_count"), there's no
need anymore to special case the legacy definition in
of_msi_get_domain().

Indeed, special casing has turned out to be harmful, because, as of
commit 7c025238b47a ("dt-bindings: irqchip: Describe the IMX MU block
as a MSI controller"), MSI controller DT bindings have started
specifying '#msi-cells' as a required property (even when the value
must be zero) as an effort to make the bindings more explicit. But,
since the special casing of 'msi-parent' only uses the existence of
'#msi-cells' for its heuristic, and not whether or not it's also
nonzero, the legacy path is not taken. Furthermore, the path to
support the new, broader definition isn't taken either since that
path has been restricted to the platform-msi bus.

But, neither the definition of 'msi-parent' nor the definition of
'#msi-cells' is platform-msi-specific (the platform-msi bus was just
the first bus that needed '#msi-cells'), so remove both the special
casing and the restriction. The code removal also requires changing
to of_parse_phandle_with_optional_args() in order to ensure the
legacy (but compatible) use of 'msi-parent' remains supported. This
not only simplifies the code but also resolves an issue with PCI
devices finding their MSI controllers on riscv, as the riscv,imsics
binding requires '#msi-cells=<0>'.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
v3:
 - switch to of_for_each_phandle() to further cleanup/simplify the
   code [Rob]
v2:
 - switch to of_parse_phandle_with_optional_args() to ensure the
   absence of #msi-cells means count=0

 drivers/of/irq.c | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index c94203ce65bb..b74a3f5fc4e2 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -709,8 +709,7 @@ struct irq_domain *of_msi_map_get_device_domain(struct device *dev, u32 id,
  * @np: device node for @dev
  * @token: bus type for this domain
  *
- * Parse the msi-parent property (both the simple and the complex
- * versions), and returns the corresponding MSI domain.
+ * Parse the msi-parent property and returns the corresponding MSI domain.
  *
  * Returns: the MSI domain for this device (or NULL on failure).
  */
@@ -718,33 +717,15 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 				     struct device_node *np,
 				     enum irq_domain_bus_token token)
 {
-	struct device_node *msi_np;
+	struct of_phandle_iterator it;
 	struct irq_domain *d;
+	int err;
 
-	/* Check for a single msi-parent property */
-	msi_np = of_parse_phandle(np, "msi-parent", 0);
-	if (msi_np && !of_property_read_bool(msi_np, "#msi-cells")) {
-		d = irq_find_matching_host(msi_np, token);
-		if (!d)
-			of_node_put(msi_np);
-		return d;
-	}
-
-	if (token == DOMAIN_BUS_PLATFORM_MSI) {
-		/* Check for the complex msi-parent version */
-		struct of_phandle_args args;
-		int index = 0;
-
-		while (!of_parse_phandle_with_args(np, "msi-parent",
-						   "#msi-cells",
-						   index, &args)) {
-			d = irq_find_matching_host(args.np, token);
-			if (d)
-				return d;
-
-			of_node_put(args.np);
-			index++;
-		}
+	of_for_each_phandle(&it, err, np, "msi-parent", "#msi-cells", 0) {
+		d = irq_find_matching_host(it.node, token);
+		if (d)
+			return d;
+		of_node_put(it.node);
 	}
 
 	return NULL;
-- 
2.45.2


