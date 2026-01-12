Return-Path: <linux-mips+bounces-12876-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81429D15A6A
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50CBD304B965
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAB430BF6B;
	Mon, 12 Jan 2026 22:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BYve7gLJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="m4wJ37Wh"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D909B2C21F7
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258150; cv=none; b=CKjUt4fXotykGfVU1PIRzrbFBFRg/YC3PKQU+xt1moRxnqLICwzmprm1fpz7nxQknAaMiwv+wpMgI7yyXW985S5jCA8UDtpOqgH0i6Afz2axRF97yAAwcssU+8Y1ZP/0kIVekVfwEZVLVWcgHrtFiqyLsxEColdthGXX0c43PH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258150; c=relaxed/simple;
	bh=iCdp8gctkLaPW3D/fei6jxGKlMAA2QOc3/o0wQqctm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhiHrFB++r6JlKDByztj5zzsPXcPvC1CAvEgPgqCSEQcAO7LIvht3TmzyAM6vZCD1N9OSg1/fuEP87lRBFPoS7zibEL+oDztY0Gt6BgNY28cI7jwwOa4QIihNuhQYsG1TMIjnxRv41arV+3NtxMCVf4jvQfSmfsUkS1v9zwk8f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BYve7gLJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=m4wJ37Wh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YD4ytu1UC7PeOKKacILQRYf/wWE4kZNXtZ0iRfKR+V8=;
	b=BYve7gLJrkHfeK5feRE1VT/x654c4gASvX44Vw4qfqyxr5f5rstBTf38LYNFXITElhId+o
	KgboPCHcNLhwPEB/z5Hl6c/ZtT1QRLljlOBQ/sztYypxr9u/uSUszy2mJ51h20LSp3S3th
	PsnfjVoyIkXt3k9ySPEK8TzYyM3KCd4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-ewO8_U61M6SIlV9jMgyzug-1; Mon, 12 Jan 2026 17:49:00 -0500
X-MC-Unique: ewO8_U61M6SIlV9jMgyzug-1
X-Mimecast-MFC-AGG-ID: ewO8_U61M6SIlV9jMgyzug_1768258140
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22ab98226so1964061785a.2
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258140; x=1768862940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YD4ytu1UC7PeOKKacILQRYf/wWE4kZNXtZ0iRfKR+V8=;
        b=m4wJ37WhhPaCKUPOpoK5fqS/rng3r+lGtLvgtxOGsouNIDVI6SAibGVzrsO1zQvdbW
         lMkeU/i0ZXl5uj2uPpSUsJhHeaLkDbdoQgON2DAFpWKJ1/W1lvDP7bJx4QZIQntnk5Pm
         ZuOMC753NZTOyLfN3o/cP0fsapvv8nv52/QDdoK+vWJPzxKYJugW8NgtY4VilER3wJea
         RGSV5huF6iw+u+vekm8WTpjMpkHfU5Szb358OwbM9F2RApl4ZO3w2s+iiOsJPoTTWAJ8
         GceA1Q+FwSgZ5cgfXlrult5qJxbHZiTmVFFAV6zExqQylTAnsLRRSrTKRWU17iskvKDQ
         x8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258140; x=1768862940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YD4ytu1UC7PeOKKacILQRYf/wWE4kZNXtZ0iRfKR+V8=;
        b=lkXAHEU3FolopsF8cuM2r4iHbUrjmusYHmOV4Q4ZzEs5x2yV4+AClchMjnhJIs1L/l
         9k9bMDLCP+wZ+L/LHwy+qId4PL682bwKRBa2PoaZZKPgb7SfdI1VqqwEuhlDHMr+sggP
         OYJjFcceJW+OGKlvogjIGQV+1T5QZrKhtbKFPlXb27ZSOqHLM8uS0H/5j660VErXfWm9
         zpQlSRFMd7o7rf8KItXP/4QnULxWQ+0sglJg8alSRnQHbLPS/VLWXVphW4MiunQ+9U8G
         9asiHV/QNn4jP+o3FMyrj/CqheA5AUIl9LG8IWVnj9Y8zyzjcnpq6NPiUfd3uaiErGaX
         5mDQ==
X-Gm-Message-State: AOJu0Yz/XBVaTF2jrX4NRKDUqHfb/bKbGQYV9yLnAMqXS0wiYqLB+E+A
	zs/skG0GKrI/qXMPBEHrDbWJ57QSYcV7vwy25A+LIoQrqPddr6b/y6vgAVgGzGRSNPaxa/wn9Q+
	dL84rXoBYKfdzitwPM++CEL652LWSy5tciZVIzDbprH3qUQRiGhYXIz6Phv0VVf36XS8lpPg=
X-Gm-Gg: AY/fxX6Mso9zbb+kfc3GlJnlYYRWIXkez10o7hGPs07vm8Y2sTDHSUBee9pGNnYGIGM
	LVq/qIX4VdLuWrmAaA5R6pFDACJBv/5YFWo2NXUiIay4YkbpGYkgZfFBXECdVRwqYIuI+5TavcH
	s7uCQgH6OX/jbeos8hPNFFt2p7M3sLSbt2B7mB4pyJhqfgJ9VBOaWboi3ynFxjKglYXJHC15RMS
	Y4FvlnctgudU3MLMroDed/1WqZp9ukHTEl45m5lQtZA+QiZ5b7iSBBSmzsvRwJDQ6lg1qbgkXLC
	AgzhTf07Fl1LfKKP5+eVeobYpa4a6v0aZyVjl5Rv2XVOjOVz8HHAwzO2p+zImHZPrYATTg5RxKB
	bFTE9LI2q+A0wboKhVD9yeyGsnALlzguPRe2jC2xHanJwDEU5Xg==
X-Received: by 2002:a05:620a:4108:b0:891:ff1e:f6ad with SMTP id af79cd13be357-8c3894074b8mr2453278185a.69.1768258140186;
        Mon, 12 Jan 2026 14:49:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG201o4ExC/9sZW9hmJWN6Sg/WNrAeO7v2m8Isi7OqtUUCnuLGIBG6+RVNvUpMuFweqnF6Qcg==
X-Received: by 2002:a05:620a:4108:b0:891:ff1e:f6ad with SMTP id af79cd13be357-8c3894074b8mr2453276785a.69.1768258139846;
        Mon, 12 Jan 2026 14:48:59 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:48:59 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:03 -0500
Subject: [PATCH v2 09/16] mmc: sdhci-pic32: update include to use pic32.h
 from platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-9-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=iCdp8gctkLaPW3D/fei6jxGKlMAA2QOc3/o0wQqctm0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq7y/57X/4i3dN2fFy5u7fHKs/TKqBd2DFpzsU71/X
 WPVzTV3O0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI3s2MDFeK3/4+sMcj+4xY
 0qTsysWH+KfNDPOwdw/On8oUyqJQsoKR4XBdg3NARmvz74KEfSsLDotMnrOx+UjObaaN15WtIxp
 T+QA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Adrian Hunter <adrian.hunter@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mmc/host/sdhci-pic32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-pic32.c b/drivers/mmc/host/sdhci-pic32.c
index 7ddac0befed87e6e46acfa7593203a5b540558bf..2cc632e91fe454bf29c1da22e45135d5d0267f54 100644
--- a/drivers/mmc/host/sdhci-pic32.c
+++ b/drivers/mmc/host/sdhci-pic32.c
@@ -18,6 +18,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/of.h>
+#include <linux/platform_data/sdhci-pic32.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
@@ -25,7 +26,6 @@
 #include <linux/io.h>
 #include "sdhci.h"
 #include "sdhci-pltfm.h"
-#include <linux/platform_data/sdhci-pic32.h>
 
 #define SDH_SHARED_BUS_CTRL		0x000000E0
 #define SDH_SHARED_BUS_NR_CLK_PINS_MASK	0x7

-- 
2.52.0


