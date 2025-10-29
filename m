Return-Path: <linux-mips+bounces-11917-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05624C1C3AB
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 17:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5440B58517D
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 16:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064F134AB0E;
	Wed, 29 Oct 2025 16:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6u7zSRA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480D633F380
	for <linux-mips@vger.kernel.org>; Wed, 29 Oct 2025 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755634; cv=none; b=nnGtdprXFe2evxza0BWd1VTp3ZfvJZLuEaF3cMyq5YXPIfwTuOiVa2+zOCNSnLJl2EFXEdbgbVqu9+jvccMuQeUj/KgLzaiSuQHjcZ+QVX1Xx2Qp7ru9efSvXuA4TvKrotiS7Ch8RUDnM8ZjJU8KdNkUe87Gt8ednGVhB9woNBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755634; c=relaxed/simple;
	bh=T06l1/4GOHE/LpDkePy4eVSTWo0uNva18SmJ0icOHLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=btptMs/kJNmw5MDGkUPocgwSfYFmaoDpK9+TI4VVNcn9RX8VZepB70aUIT9mdU/uUtFYgbZthThMV3bIep0NUGdyBt42FKACMwUmONNphmV/dKJAHKqFRwCwDJwpm0d/9+q5R1x+QlK6PJJwuRTvo6s/jp+KytaF0dpvA3WYJus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6u7zSRA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b6d70df0851so15525066b.1
        for <linux-mips@vger.kernel.org>; Wed, 29 Oct 2025 09:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755630; x=1762360430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=;
        b=a6u7zSRALXcD5cAfl7zziHXqingpPMwA+3HQpLoOUYAN+T4DZYbzvXQku88P5LytsG
         dSepd0zu7KwPEm+SLTpu7V5mZsAQiytCslwBZjiW4yUtTcTJQVUXYl8R4juqoTdj51JI
         hCf1+U2YwclJoZF5yhDg/VxPsE6YKgy2pkmrqgE4KuIgw4dbPiW6aPL5RpFKbASmU9Fr
         AQZoN4oxCVq06kTWykouoPPTYq731ySwec2CxMhlePbiX0q6OgoGOpbNmyKXbrtrsNd6
         Wt1rhpU4kMgjFyK9e0qmJH4LqvKrN/HO0Gl3VvRi3eWCGseFGqkfUaC9te4+Xnky0T79
         IADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755630; x=1762360430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=;
        b=DKJpP7YkkZJL7Xsv1qDYwiSSmU9jyY8xK5HZ8smcmK4nS4VVbCmte2jjzFHBjsW+Tv
         8PMSggpo/2c1HNQTyImE8xN+4ePS0dmy9UGdyuxX6/O6Btz9zeTNaeFWcBbmErwYkbcO
         MhtRl22B+KWf7aeXiQu8WnoVQBzYise9XzGnWnk0WFQN/KPEUmJmnvHiM4IPGVXeV/XY
         6o+lX/usz0+XsA1CE1pqRdHnjFCtoDn+0zTlzEG4poOBAfnc3ti9p4aNb26glRxs8Ku0
         CSJgJgggyIteSjJQ6dOnfmnQALWShu9sClBCi6WDs87Us4RR0sTQAq/nwDx+4qK5vPSu
         cl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJ1am39yncVMjOp++DOufOuYSBnHKIynf1/rKn6DqQeHZNSwEzXQpayfXzWOUSuIoPGNFO9uJNGKfN@vger.kernel.org
X-Gm-Message-State: AOJu0YzSBueZTjKgmGxLSVEEOOCYnLyeS/0z0agTNdmdYfnbJ+INL/Rg
	UPxdt9s3AaGxHCZlPYxXY1oaG0IkmJzJSiWTAnOIgTZxi/pTJmQBApTs
X-Gm-Gg: ASbGncuvWuUoKGEBQsU9iIpoN5hjwX17zrfBEeKzxvhgGJHHkdQnft8UcpWUbgwmA56
	x9miSkVHGWMtMDN5W7Rr4cp4b2z/SoGZeU38AY+zihc4j/XPiyCFXoAGNJRTsaFTAmOojiu9Pt+
	P4il4zVTFWj1nc9/wwfDcT/WZdbLXcizpFzbDoTC7IQg2nFNUnSbUh8NaTQeuUJYR1wBLQjdefp
	ocwOeJjUc0wIf31dN+Q8ae2igFSK+fEd+doaYNouH4g2ZfPwVcRe79jh9dcsxwqez6spX/EtQrP
	1J5iVAc5c8AX0/Q1bkWC2n2ULavsQHbnyHFdCBJencKIeX2lYwL9YQavLUPakGQ94nUGvh1p6mX
	yzphX96qj7UiRGt/S1YfU94wQyeDy4+xWE0Dy1C7ic2eylki2hmDFzGoJUZ6Qadl4lG3Fdl1Qg3
	p6yvvFTQVYW8eJZFO3Bo/CatD3+/RQOgMCsnf7kWtVNPf7ymL/gtC+zf4CcLN/MJQVFpY/
X-Google-Smtp-Source: AGHT+IFQlpirQWvqETIaDsilJH4sjQW05iHSTqO+BVFy04krtNR3muOIO8OYFK3MmzGZwCCaLhUORw==
X-Received: by 2002:a17:907:1c8c:b0:b3e:580a:1842 with SMTP id a640c23a62f3a-b703d557003mr393915166b.48.1761755629552;
        Wed, 29 Oct 2025 09:33:49 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6dad195456sm939661066b.72.2025.10.29.09.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:48 -0700 (PDT)
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
Subject: [PATCH v3 3/7] bus: mvebu-mbus: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:32 +0100
Message-ID: <20251029163336.2785270-4-thierry.reding@gmail.com>
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

 drivers/bus/mvebu-mbus.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index dd94145c9b22..d33c8e42e91c 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -130,6 +130,7 @@ struct mvebu_mbus_win_data {
 };
 
 struct mvebu_mbus_state {
+	struct syscore syscore;
 	void __iomem *mbuswins_base;
 	void __iomem *sdramwins_base;
 	void __iomem *mbusbridge_base;
@@ -1008,7 +1009,7 @@ fs_initcall(mvebu_mbus_debugfs_init);
 
 static int mvebu_mbus_suspend(void *data)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = data;
 	int win;
 
 	if (!s->mbusbridge_base)
@@ -1042,7 +1043,7 @@ static int mvebu_mbus_suspend(void *data)
 
 static void mvebu_mbus_resume(void *data)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = data;
 	int win;
 
 	writel(s->mbus_bridge_ctrl,
@@ -1074,10 +1075,6 @@ static const struct syscore_ops mvebu_mbus_syscore_ops = {
 	.resume = mvebu_mbus_resume,
 };
 
-static struct syscore mvebu_mbus_syscore = {
-	.ops = &mvebu_mbus_syscore_ops,
-};
-
 static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 					 phys_addr_t mbuswins_phys_base,
 					 size_t mbuswins_size,
@@ -1122,7 +1119,9 @@ static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 		writel(UNIT_SYNC_BARRIER_ALL,
 		       mbus->mbuswins_base + UNIT_SYNC_BARRIER_OFF);
 
-	register_syscore(&mvebu_mbus_syscore);
+	mbus->syscore.ops = &mvebu_mbus_syscore_ops;
+	mbus->syscore.data = mbus;
+	register_syscore(&mbus->syscore);
 
 	return 0;
 }
-- 
2.51.0


