Return-Path: <linux-mips+bounces-4917-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A53A895491D
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2024 14:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4B3B1C2403C
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2024 12:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6941B14F6;
	Fri, 16 Aug 2024 12:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="hnhVzKov"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45431191F84
	for <linux-mips@vger.kernel.org>; Fri, 16 Aug 2024 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723812603; cv=none; b=ekyEup64UL3WgJFNXHOHwMFg6HHrNakpv5FsgPOsBQh0hs0vAs1gkptvfNRLtrlyQ0oV8PNNMYKEjY1eZbwe+rYe8ix0qfY59B1omBsJjr+bRSyu0jSet58SRJ3nluYRxMOhKQkSnMPec4bmYNJvCcHD/a6aTephXYthwjEDaYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723812603; c=relaxed/simple;
	bh=K37drQFBcQe/KPuccp1cUx2OgiWzM+wcBntWujhb3wY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HABhj5X+N2PWqooBhHMg0eeO0E6DEBLNt8O/1yk2Pd6+6RvVJipiJw8NQa4W39v3eqVbiZo8Xhy89CMu3T9R3d/Xi2TNf7/rqQNe0xFa3zOogs/TSbsubA3fXeOmMkQ7ynen6ZO1vNNDPrZzGjWyGQDK8SmWsbZrpHBAkYGT6Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=hnhVzKov; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3687ea0521cso1246189f8f.1
        for <linux-mips@vger.kernel.org>; Fri, 16 Aug 2024 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723812599; x=1724417399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ke0AjxBAncE489wmYzkh+nSMUTPo+pIzRMAmnYnwJNQ=;
        b=hnhVzKovzynDoQAun++O/2psFXoxwrfmAL6FguXikmJuDNYs3SQ9zWNdJcJrKlR1DR
         sctpHAV4oWUVezB+H+qUsieJ3NuUbTcnl/Aq+11aYks95YMgQ4U2xA5i0OtjgONG6D2r
         C00jzf3q4d0kVc4AIxX+fUP1j51qkshg5prgMOvzyLMOt3qOsOfq2baQA8vguhwBoxFW
         pGBuh9L6WKiZ4Cx0Iufjn//tAFzjeWgzufatyFg07Nm4ckgGfj+gENjcn3tE82YUgu5E
         ZkRPL8yFQvjCOb/2xM9cCXdV6K6pe9ck1VhlS/9F3T5kXDuoZDo1i7NgAXDaIfMQq4nJ
         uF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723812599; x=1724417399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ke0AjxBAncE489wmYzkh+nSMUTPo+pIzRMAmnYnwJNQ=;
        b=U7JQVIZJO6lz6bpw71wjJ8t8Qy9f6pwWJCRSzYhIlmY/HdqdQ52mCO/ysK4AjuxmiJ
         sWvAOpoKDwx2FMnT5hiDT3mbY/T8lRTme0HzHgMI9bFAdOX2NMYDp+0E24rFE5Sked2p
         rINL7pgYl0LsshGqW417Ak3T+LblxVMcl1OqnrmYCdLw3YSQt/QKME3QvT7ugrb/acxO
         PHdjYsafVUtwbarY2IvSB5VAxwEJtgAfcomVLEWWYtAQRYJLGM0BhpVeeH22TkAheb8s
         CV18sQulQQ0090QnrBrYPom+kxrF/Xbg8jT7bBhGyA5oILtmkwolF1XILzhXxKZXdNQr
         LIVA==
X-Forwarded-Encrypted: i=1; AJvYcCUeSIjEdxPzFd1mj4xCFms29XAubC3FgmI0WqeM5BX8gmyGcwAgHNZxDagTH2Ghy25UdYk/rk4yS74Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxmsP4sPwwFCvuby0N5jVwL1fQRgxJSD2gGKxFDLJBbGm3O8/sk
	vaeumhjL1RFrGhrrJQ4nQ444eVZ1EYW++WIsNtH3wMvwMxdGqo7x7xjtFADblmk=
X-Google-Smtp-Source: AGHT+IGM4LtUkED1FVNx+BEXnUbZCpfDI0OMEbuSoUR17hoiKqSTIP6vlmoZg/GiQAQSJ3CnFpyexA==
X-Received: by 2002:adf:e907:0:b0:371:8e24:1191 with SMTP id ffacd0b85a97d-371946a4455mr2184543f8f.53.1723812598913;
        Fri, 16 Aug 2024 05:49:58 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aa393sm3570531f8f.90.2024.08.16.05.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:49:58 -0700 (PDT)
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
Subject: [PATCH v2] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Date: Fri, 16 Aug 2024 14:49:58 +0200
Message-ID: <20240816124957.130017-2-ajones@ventanamicro.com>
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
v2:
 - switch to of_parse_phandle_with_optional_args() to ensure the
   absence of #msi-cells means count=0

 drivers/of/irq.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index c94203ce65bb..690df4b71ab9 100644
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
@@ -718,33 +717,19 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 				     struct device_node *np,
 				     enum irq_domain_bus_token token)
 {
-	struct device_node *msi_np;
+	struct of_phandle_args args;
 	struct irq_domain *d;
+	int index = 0;
 
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
+	while (!of_parse_phandle_with_optional_args(np, "msi-parent",
+						    "#msi-cells",
+						    index, &args)) {
+		d = irq_find_matching_host(args.np, token);
+		if (d)
+			return d;
 
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
+		of_node_put(args.np);
+		index++;
 	}
 
 	return NULL;
-- 
2.45.2


