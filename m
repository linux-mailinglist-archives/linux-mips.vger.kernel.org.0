Return-Path: <linux-mips+bounces-12880-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8AAD15A19
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE3FA303AAD0
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D95C33D518;
	Mon, 12 Jan 2026 22:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fbYFWxWO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jtjKjelZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9002C235B
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258153; cv=none; b=FxZvnx5Pnu9fHU8S44lknqbj7fRE+Gu2j4t6zCRMMbxPC1jCXmvhR5GB0goEU842b9uOuRfKG10pseR8/6120+UCiuRAd1b47+8h53srkxgHdzTJw44PentBQTxSKdY89RPNZDnjlMiRxQFcMDl11Cfh/2ppqfEDrg7LTXKW3tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258153; c=relaxed/simple;
	bh=uHbUcQcKKvGe1BFcAYok+JS6gnWtVtAMhu75HYbomMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n5mVbQ7Y2bxIz29fROSBjsHviuf8God5PSQAy8x+vVpCSBqiiwQty9ymPgD9z+mMbZjlSQUan4DVSRdKnn5qQ6kiGBJ226Tof0uv4pskJUr1eRon2hQrCU8NetJMvWms2o9Dglz8mKSZJ/FmlJWkHJ8A6wUse85trXJW/cpOiaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fbYFWxWO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jtjKjelZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2YwZ5v+CfA1/gRWwxPiSArY3UzvwglxspI/rdabYSA=;
	b=fbYFWxWOKQDk15SWnrQb/s/se+WQm14+CFb48kiPtQFWWtt0DkXlpxjdwDfECilCQYLYoo
	K09ydlKFqrOReqwWDxSWYE/66Ah/yh4v8SvMvqhkmsTR/vYyIlcq1FHRNGbUtYQJ0EP7xX
	os1JDblOV0W09RhaJjfmdwbACyu6a+Q=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-QJFPftf1MGqxpq0Yh23nKg-1; Mon, 12 Jan 2026 17:48:55 -0500
X-MC-Unique: QJFPftf1MGqxpq0Yh23nKg-1
X-Mimecast-MFC-AGG-ID: QJFPftf1MGqxpq0Yh23nKg_1768258135
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b24a25cff5so2221533385a.2
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258135; x=1768862935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2YwZ5v+CfA1/gRWwxPiSArY3UzvwglxspI/rdabYSA=;
        b=jtjKjelZIT/CSgTPqJheTm0XXi8x7LMJjbjmqYVra8X60kYwfJKJUuD4+UxzMqPrjl
         mYHuVaJjZ+njta41DZYi/LPVHZuUP1g21R53iADXdfQZ1CSMVFHy4xtdjHLGtwrD7TdJ
         n14BGh8kVg9wBgUPffviUmiu9hc0npN3STGTjfzEF6tUeFSAruWHb6R6myZEJAuTR7/v
         tx39iGc/Jq4z8WokednVzfzXFxwSondgotU8hAVANLPEBceZLbr6Z0MATN3tirFAjcBY
         EIa6cN4/QFmplel+TxjnTl43qsUXQnaYHgMpPW5s5/UKjlVkayiOvY/sKZRZsfRl0eIA
         y6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258135; x=1768862935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M2YwZ5v+CfA1/gRWwxPiSArY3UzvwglxspI/rdabYSA=;
        b=J9vOEanGnRYjnRiGDj+cdC1poP1fu+eHhd8DCtcG5htvKXbowu6+hcipYOLO8gV517
         +Mt0ehD/PwptNqJXvUczYxAOdrowjwrQUhcDmfrrC4vwcs6sF4ci6VMdWrTJvnJ/RpNw
         LFGUWkWOqmWnIw/LNPXXtX/F3rH3pf9w+oHrTOc14gT+1KDxCJgi4gQn8tjg+3Yqr/l8
         fslMrL847t5QXWk72zPHkUE5wjiClPFxoD2mnWtYDjgnVU7eN+zLh5yglAe+npEwti1S
         BjLCQyS1kYBkBUksuGlwkXCOsBuB2UXysAXef9zqUVbNMTRZrzZTIQ7KmpMTRaPS8uoq
         7NEA==
X-Gm-Message-State: AOJu0YxTFkpJvEQAsZ3fe3nJ8RXMbSghG2aMNavTU+O3G31yjhcG3KA8
	oA3qSG2GD0r2g+CxVzjlNiUgCJJy2EJl3G8RehHPEHnaAKsDpuyTFZDJ/DfjsALEYHHzM4bg0Ul
	rx653ZbkkOXA1aR1pmsf6d/Pd/AYZG9sp9KKT3xecRBphz8a6Rlp1LWZXJ3agojs=
X-Gm-Gg: AY/fxX5iKvN4yZJ4t3I/1Hoccz9I8i9G650bBHyx12pMQ72h09yhxz6UL6YXAHgNXUj
	EbsCkIGq8OzeJeSXGAxJu0xptwNzmBUPzww/l8c8K9tUhrh2ORyta5lZpeFOZ13L5RItuyjvB2b
	ICYHlyJghSgfiu+BWohBvjjDBHhoF12jjRWot3MN4rMUyGm17mhYQa0JgJFFbubxhIP0fd0EenD
	k7lqYGG4QvPH2cCz+6aykPbgSS+vS4Zn6xD/bAN9VSQXqYx6eUfqSXXQNZFjdp7fjuiKMMdfF4H
	e4T1KOfHHwVgF9K5ZG6/w7FgtFHtKOquLKx3Ka53OmAypOsTdvJqP475Tt7cDHuXA9bEAWx6m9j
	GMQRj6+BweZK2s5qGp7m7+d6R29rV1Gbvo8i9ffbWWFQSu2ObPw==
X-Received: by 2002:a05:620a:4094:b0:8c3:5ddd:dcf0 with SMTP id af79cd13be357-8c389422df3mr2724183085a.89.1768258135275;
        Mon, 12 Jan 2026 14:48:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/7g9Ukug1xIvYJcpXIWbtf9m6KdwxdNC+Z1lMLP4ci7/h14VmB/eD5WCU0Df/BkP4G0ilpg==
X-Received: by 2002:a05:620a:4094:b0:8c3:5ddd:dcf0 with SMTP id af79cd13be357-8c389422df3mr2724181285a.89.1768258134845;
        Mon, 12 Jan 2026 14:48:54 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:48:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:00 -0500
Subject: [PATCH v2 06/16] MIPS: update include to use pic32.h from
 platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-6-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=uHbUcQcKKvGe1BFcAYok+JS6gnWtVtAMhu75HYbomMU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq7y+a8c6RKnvEvZklvMvuJzIn5XIV8wruXnb5pAth
 g+TVW50lLIwiHExyIopsizJNSqISF1le++OJgvMHFYmkCEMXJwCMJGQcEaGuU3MMrH9rs6y2pN1
 97Nnf1Q/tFz/svKUfYfmH7t4Mf0fL8P/KLlIo9SSK3edPitrJNtqC61z3Xz1d7Ro7j7BddJVdZs
 4AA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/pic32/common/reset.c            | 2 +-
 arch/mips/pic32/pic32mzda/config.c        | 3 +--
 arch/mips/pic32/pic32mzda/early_clk.c     | 2 +-
 arch/mips/pic32/pic32mzda/early_console.c | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/pic32/common/reset.c b/arch/mips/pic32/common/reset.c
index 19db57bfffbd314b6e75d2eb9237540c4139dd83..230db4bad1dd14de1bc23e5ac417e890dec7bf31 100644
--- a/arch/mips/pic32/common/reset.c
+++ b/arch/mips/pic32/common/reset.c
@@ -5,9 +5,9 @@
  */
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/pm.h>
 #include <asm/reboot.h>
-#include <asm/mach-pic32/pic32.h>
 
 #define PIC32_RSWRST		0x10
 
diff --git a/arch/mips/pic32/pic32mzda/config.c b/arch/mips/pic32/pic32mzda/config.c
index 73be5689e0dfb8b18c0a44ee860ca2786201471e..fc21cbc11f7d6b75b15e5c6747a1a5f34c1d5d8e 100644
--- a/arch/mips/pic32/pic32mzda/config.c
+++ b/arch/mips/pic32/pic32mzda/config.c
@@ -5,10 +5,9 @@
  */
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/spinlock.h>
 
-#include <asm/mach-pic32/pic32.h>
-
 #include "pic32mzda.h"
 
 #define PIC32_CFGCON	0x0000
diff --git a/arch/mips/pic32/pic32mzda/early_clk.c b/arch/mips/pic32/pic32mzda/early_clk.c
index 63727799d49a963d3b0d47d39ec5770c283047dc..21a9f6687f6d7129cc271e7a4aae0bbca6f94630 100644
--- a/arch/mips/pic32/pic32mzda/early_clk.c
+++ b/arch/mips/pic32/pic32mzda/early_clk.c
@@ -4,7 +4,7 @@
  * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
  */
 #include <linux/io.h>
-#include <asm/mach-pic32/pic32.h>
+#include <linux/platform_data/pic32.h>
 
 #include "pic32mzda.h"
 
diff --git a/arch/mips/pic32/pic32mzda/early_console.c b/arch/mips/pic32/pic32mzda/early_console.c
index 8afe4e636ace20b1e4269a6172fa5763afebc980..1b7631d12d1f29d580ef9087e20fd92aa99fb497 100644
--- a/arch/mips/pic32/pic32mzda/early_console.c
+++ b/arch/mips/pic32/pic32mzda/early_console.c
@@ -4,7 +4,7 @@
  * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
  */
 #include <linux/io.h>
-#include <asm/mach-pic32/pic32.h>
+#include <linux/platform_data/pic32.h>
 #include <asm/fw/fw.h>
 #include <asm/setup.h>
 

-- 
2.52.0


