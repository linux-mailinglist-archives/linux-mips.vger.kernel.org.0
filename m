Return-Path: <linux-mips+bounces-4912-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A537A954643
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2024 11:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44C2028205B
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2024 09:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3729316F260;
	Fri, 16 Aug 2024 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="oWxzGh7Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A7C36C
	for <linux-mips@vger.kernel.org>; Fri, 16 Aug 2024 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723802127; cv=none; b=Xc3ofQ2xnoROPDWW3GRHyJXGsqwqmIuWO8D96Vgp8p9N7QKraY8CB6crRGcrxMtAdnvoJNg+pPCJkDEbPDV88I7whwYRXaiSa8OBcneebBGO14yJ+tx9Rcay8oADkqagjR7j4TxfMYARGitfcKHgOpqjZ+xza3fGUuKW0kWI7MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723802127; c=relaxed/simple;
	bh=CC1JIfHvIBAl36w46sBXVBsGIZ5We62PJWHtJs+O8t8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qQUnGe2GWimLG48IxXtaQPpxVkRZ4g/VB0sNAFNgURotGXqwDtE6lM21RTi/10OesFFxQChuFez/mKHKtxO1hfGdLRPESjtHr+LrzFuoAQYdvQPyn5mr+/ZFbBb6In1mxtQezo2uiw61QcDsopviCjEy4XoyDX5B4cqb6XQm19M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=oWxzGh7Q; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7d89bb07e7so208792266b.3
        for <linux-mips@vger.kernel.org>; Fri, 16 Aug 2024 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723802123; x=1724406923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoIvLUfwtlErHQHB2ji6smKiDqBoIASWBt1x369LS4I=;
        b=oWxzGh7Q2J+AKFn64fUlu68dzqhqHS92gaHzGbt3+ih2SU4eRqAL5cYzGJbf29CvlK
         /NedYSeFCxIbT/alrOzwP50VDrpFOFESRMWzUDDyfcnjEras1QPeIBLYU6jMVkE8hL2T
         QQv6Nf9bx5XhCjr42EseRc5l8uzfere65XwZ+MH/SFrNNZJduUXbCn9lTMo+glIERa+E
         zbXh60IbjHk5E6oWPuJH6OKyG+rCaCjZfjHk/5CMy/NkxBd5q/dyA8FSs5px4GyddJLX
         4A5PTKzJ1rgrVUnJTRYnmxKIHp7vJc+phEFE6+bPCvW752LAG36BJEnxjSD6EFRe8Dq7
         3GSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723802123; x=1724406923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoIvLUfwtlErHQHB2ji6smKiDqBoIASWBt1x369LS4I=;
        b=Q1V1x6VO4fHAOOijTOe0Z3pWU6N+x/nUkVSJQvbhPs9G63UKa3oDKkFA7yj37vaNuN
         JIBud4QsEMF7MkuMs8wealfMCnWUDFeuzLhiP8Ip7qiMcRe1kNiA3sWqR01nEbBIVnaV
         aFPEvqxXCdCAoLNsz3XXM31R3S94irlluLaklmkRePYcDlyhSqEBv/awjdK6ei7YzIJb
         Iz3kU/LejlnG9IWxKOwjw6Wt/rU5dLhmCiGmih0I0LOhgzdVHZQ7iP3l7Q+IOQeySBi5
         34Q04XhPXO/neVmOwCZNSZuNWsSV2Wu5RaAvfMkjqjWlPhMUFyIjaau/a90k6go8q7im
         NLTg==
X-Forwarded-Encrypted: i=1; AJvYcCXw1Q8KDggVsCWLnIFPzEjo20V4T8NxBFHAeH+YNLNoD0ld7+g+90Jcodpw+1XfURnQW1jma4jJqtHn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvuv6U9AeSRIVhlLy+NSz1g3m61W4BTTLU+TILd+z9Cza/omAZ
	MeTWCHg8G8Nrc/VEtY8XY0QL44XQ+wg13EnvakFWO+L/vQmLTu0N50bOnMC2nnI=
X-Google-Smtp-Source: AGHT+IEWEn1buqzvrPyI+YLyXqKvY0yYQVZ2BQACp/XQgrDhUOxKmz7wrTINSfs3M48T6a9DY2iabw==
X-Received: by 2002:a17:907:2d10:b0:a7a:a3f7:389f with SMTP id a640c23a62f3a-a8392a49534mr149316266b.66.1723802122185;
        Fri, 16 Aug 2024 02:55:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383935807sm228603466b.134.2024.08.16.02.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 02:55:21 -0700 (PDT)
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
Subject: [PATCH] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Date: Fri, 16 Aug 2024 11:55:21 +0200
Message-ID: <20240816095520.96348-2-ajones@ventanamicro.com>
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
casing and the restriction. This not only simplifies the code but
also resolves an issue with PCI devices finding their MSI controllers
on riscv, as the riscv,imsics binding requires '#msi-cells=<0>'.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/of/irq.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index c94203ce65bb..026b52c8ee63 100644
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
+	while (!of_parse_phandle_with_args(np, "msi-parent",
+					   "#msi-cells",
+					   index, &args)) {
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


