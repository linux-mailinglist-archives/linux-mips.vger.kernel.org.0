Return-Path: <linux-mips+bounces-9340-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D14CADC850
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 12:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07DA818990AB
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 10:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E631F2C159F;
	Tue, 17 Jun 2025 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="HFYNO20N"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B301289E2D
	for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156266; cv=none; b=o3H/2hTdOWsXf4IN8XMD7PUMHfsXWZd1O2zv+9pDO/hxhUcxE8pU3dyOg4YStmoJg709N01uQlH5k5YA5UgqBSC/Df4CrEAG+kDurLwNgEoj78r9weje2ohgWxTw2M32zCP8sB7uvIebRIPHLrWXAcKojdkmsMiPRcSQ4tav+RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156266; c=relaxed/simple;
	bh=h3UPqbe4sHsIOrKmfTrEkvLZUI22mR3WiPaH1WtZ+Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wmchw8ghWB33JWPLyiQNil9I22dKbpd6dHyyWHZFLoIPdU238Kfyn+hEUiFriMr7XeaEX0cXvD5/UHv0NlQr4jLhL/ziRZME3U/9G5+Ri9fMXwIF0DJkFLD2fZd6kPIqI+eVi4C7NIaQHhQli+Wf5cWf5LVqnwjapDmk/8bBzDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=HFYNO20N; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so40805815e9.0
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 03:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750156263; x=1750761063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqIJMZJtR2MozSAlBaEIUnoVSAIXjXDAyYywqzDZ/go=;
        b=HFYNO20Nej9tmolIz56r9+n7s1pJzU21ti5c3eKAj0bESw6A+H+1JWTj1/bWbAWwec
         Zi3DcfPHM7dnLs/plIdSh8ShVhWAPKU1k/zFB8bD4h5OMj/UqtL+ZyOyzVUYHYo+FKeg
         IFyjxXlCX9pMthLkm9Gj6rpZ0wYIQ7QGPJ5z1akFvSmSztHix9xBPrw3PjJ6OLVwousT
         85w/eTfj2IQYKFohlLfJxRIKn1vANULBc5hvU2dYwSNI74fLz/K3k9xLhqXwc0YpQKhb
         awYgcLjChtwLhBS5BOocdo3Zg6hs9cvIEnEnFtlYi0/ourOaQ2TjAjgfFfSxy04svwKh
         +A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750156263; x=1750761063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqIJMZJtR2MozSAlBaEIUnoVSAIXjXDAyYywqzDZ/go=;
        b=Gc4PRUyiq8odHiRbRfasswiJs4eNmW6Sy5wyedZvuua8QoBr3zP91LttNdKtCX8dm6
         5GRTDh+CulF4e0h0vfF+sLrA24EKvfyjSOm69Ln/l1OFIAu+O9v84m1D25jrIO46KaKM
         3MgyaSytJZjfBmLW3kgp5YCGy27rUIHvF1cnqPpa9TiBF/WPMK2ra3eQmYoB6h2+3/Wh
         g5SijcOs0pzYEdXPMh31Eho0RAAUzQtjnutqEx9AXuAW+F+urHqwE+1Yq4pwXfdVXMQz
         iLtv0NL5SX842CnsA0KKRObO6p2D/mKLeGF2pSaNTjK9d21XSr1GGHZEzNBnJVsORFkQ
         UbOA==
X-Gm-Message-State: AOJu0YwFTCCAKcPlx8t6Ak2++ST81M7CRBzkn4lVg74NYtEn4JZ24Mne
	98n900v5CmfNouOOxHxQZEIGykPz2QKtcbvrPQAWcW1EOAC9tZBkcHbTav9jmBuDXMs8bhDuyU1
	efqSb
X-Gm-Gg: ASbGncvNE7Is8Jjo6nHe1GJbe0J8f4EfTBPe0yWlKaAlViwYFyllWV/TvZ9QqzG9SlY
	gZioG1x6L+FE22DNU+AqV4U+JZJf9qIzQF8A7l2R7Eyv/Vu0SUArLen/DAMUR0rjsaP4H797P1s
	MAjYReXdQO5ASWjjNlYG1Z9UvILJ3fwzN3uoHMSosbXOM09gwGQaaZ5C4zMGJIwNcVZdo/oW+oC
	VtfR5MB4URBnRGKUMc/6lz5SlXnDn5/B2QzOFXO35gIPVsZ+LgqQmS7fQOjZl4iX1tf5ufO8nPM
	irD4fBziBVGOSCZBgfQmtmLij5sxolT746TGehajqLJKnYlLz3YyW0a1q3s=
X-Google-Smtp-Source: AGHT+IFckKe3byVNm1QEfEuvovCTkRMrtIRrkEAwuikE34eUnr0Dr4YPk54ws5E2rachMpTIg39dGg==
X-Received: by 2002:a05:600c:1c28:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-4533cb4bc8fmr94802615e9.22.1750156263263;
        Tue, 17 Jun 2025 03:31:03 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:b1a7:bc8:262a:3102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e16a097sm176749215e9.33.2025.06.17.03.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 03:31:02 -0700 (PDT)
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
Subject: [PATCH v2 2/4] MIPS: dts: ralink: mt7628a: Fix sysc's compatible property for MT7688
Date: Tue, 17 Jun 2025 12:30:56 +0200
Message-ID: <20250617103058.1125836-3-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617103058.1125836-1-ezra@easyb.ch>
References: <20250617103058.1125836-1-ezra@easyb.ch>
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


