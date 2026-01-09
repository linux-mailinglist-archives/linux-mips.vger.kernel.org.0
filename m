Return-Path: <linux-mips+bounces-12799-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8510CD0B5BF
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 17:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 397F2300BF8A
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 16:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2D3364EB6;
	Fri,  9 Jan 2026 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="incpRHfP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qVdje9Pv"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2D43644C9
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 16:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976943; cv=none; b=lRPTQY+9sm8qekkS3OwbcySB+PtvnQ1usmCqpnHl5THTK2YVZjaI91gnzw9KbHNp6F6EQd4853CStW8+WbBGtjh1zNExjRtNacmoxdSNRZgXLY/UNa3nBUfLoXiSBvo//NPUSc90+AfCtSg9ig3MjMufa+i/8HYCjf0WmS7pBH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976943; c=relaxed/simple;
	bh=iCdp8gctkLaPW3D/fei6jxGKlMAA2QOc3/o0wQqctm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uObNLsh7MbwSN/UNACC0N2HeQOUy/S1Ny8ZP+xdik+WI3ZXaQn0YO3xkgPRLLv89wQEvP/zvs9trxo7ivxvwt3YUg+3sJ/LR1FTOwV+RIandgX34WdOUX3aUP5UAKLHqvxv2fwhBPw2435wizsORzcjBM8kDrvqm095sGiRHZu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=incpRHfP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qVdje9Pv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YD4ytu1UC7PeOKKacILQRYf/wWE4kZNXtZ0iRfKR+V8=;
	b=incpRHfPcxi2QFDbURZI2irQ1Hhez8V/brXdcYzUG2CJ5zwkJSUhrnrfjYBFWRAPUttmCX
	AFUfgS4yPoP/fK3PhH3MFz7PxhsN/qpY2TXNOmrXPUTSE2d3NMhAmJHNJbQ37FgdSb/S7U
	CS1+TLxchXDsFAlo8ZpH0IA2YBly3OM=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-aqJbwun-OVS7TpBG7DHhew-1; Fri, 09 Jan 2026 11:42:12 -0500
X-MC-Unique: aqJbwun-OVS7TpBG7DHhew-1
X-Mimecast-MFC-AGG-ID: aqJbwun-OVS7TpBG7DHhew_1767976932
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55fc6725c86so8339805e0c.3
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 08:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976931; x=1768581731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YD4ytu1UC7PeOKKacILQRYf/wWE4kZNXtZ0iRfKR+V8=;
        b=qVdje9PvhGQyhhTGLZV9/FEpGuf4yRUZ44kuMQ7fOvmiygmSYo7s7hwmuA7vjAGIH5
         yP7QRREm/XiiX4468N7beBsDJezuwW34rpMfCXPoyX/M43kgmol37+h0fW/toc59K7CV
         8yjmbsGKDji8xiyttjEaokbQqBSKdS8/yzU1+Goz+HJ+pdXdx8fg+ZiYK5C8qyRnfsoR
         mVUx972Uh/WJ8QWV9ULVAAC/P8/2g+FlXx4dn1S8l5S8cI5qQlerzOXbOilGI8MpFL5m
         +zjtofKEmCwvsewsLd6+Lc/VI9QSIfi0N7nx0sPtyQE5HEmDuIOpuRV1ROK56eMtVT7u
         nR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976931; x=1768581731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YD4ytu1UC7PeOKKacILQRYf/wWE4kZNXtZ0iRfKR+V8=;
        b=P598sJjckeCy9mXcvBDZvdpgL7bfoPsGSi/8OdNclAS/CHoQOtAB+N6AEipo3Qs1TL
         NjI8vGzlUcK4lIFJbKShtb5ljC7oR0K6T7QRtJL94FTVsW7H1VSjuHEzUES5ij7RJcqA
         bbFNGGLkJG9uCu+evqGBEHQE6gbhCOQce0j7cSUL+9IZnJmouonklTXY2AsbdVHbLsVX
         McB0Kfp/FjBz1n75X8ChROnjJfTFM0JoU6j9L7E+n1TDxEOJryImHU7VtrQSqR8Dj04f
         4guB/XJh54+Cs19udFfzr8zdexXr8p0fiG9uSBDFHjGR69D9E3xrl959PMNjiKyutBye
         c3oQ==
X-Gm-Message-State: AOJu0YzpcjOI9iOSmQuPb+ZvFI+dycp44wucEeHAQFusWh9I0BjVoT50
	kpctF/EmMOhHjTp1jMYaARGUHDbzxUnkmzD2VPa/tc9Xc6kxP4jgsrLzg3BaNUjKL/6Tww4h9OP
	S2czwxThDQ0ukayL4GrprqWU9bgPnxbQt27g0fPf0LR9I18rpRk7w6UWfie9QtXw=
X-Gm-Gg: AY/fxX47Mvj/JD4rB0NgZ+FdWutehQWkkSnfoPk1OEGIdfayAMJMwgfL4oCDeyYJQf7
	LQdixv0HrtRmNHaIwxp7OLy+H31+kRm1Ptv4cvudSB5fy0CCZp4tDS/0yAsBVNPcLe8hQKitHQt
	G3ZZM37IZTlOk7ZTQDiFpP8afoLED1/mOoWJoE8wtOY0uHDZkh08x0M83vAlRr6CmqgYLbsR8nk
	XoHKcPA9pDqjcnK7EzxGGlsabQzkqDsg5rxj8OIpSJ+xGVTgYUto2Joh/KduF8nm16wNd1Iem7K
	SNqnhGBxWxB/8XoWhhN1n8ZLQ1hOI/v96nrTSKr3qYkOasOzF4PoslhOV/vWLPd4i931XoEyh3a
	8CY12CI4sxIJ/PlowITlM8bWo/Kybgrz8Ami8CkCngpMfNOR4
X-Received: by 2002:a05:6122:8c8a:b0:559:7077:9a8f with SMTP id 71dfb90a1353d-56347d6c262mr3203138e0c.5.1767976931721;
        Fri, 09 Jan 2026 08:42:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Il0vlFYOMp28oEjoG/ut2hiG8SvIDyOhFAIKIBiIxobLZx0OhzFwbcBRRlK0/0MtFuj8Hg==
X-Received: by 2002:a05:6122:8c8a:b0:559:7077:9a8f with SMTP id 71dfb90a1353d-56347d6c262mr3203128e0c.5.1767976931401;
        Fri, 09 Jan 2026 08:42:11 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:10 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:19 -0500
Subject: [PATCH 06/13] mmc: sdhci-pic32: update include to use pic32.h from
 platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-6-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=iCdp8gctkLaPW3D/fei6jxGKlMAA2QOc3/o0wQqctm0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y/sD5640tDz3Rfr1tkvd8w7w1pxsrxiss4rwf4eP
 ZsfPN/WdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRAzMZGWa2vqlml19y7FNL
 9a38R0/uRV432flh4mMejY9bI8PjWYMYGd4GOofoPS6oSc3PWzT3/bxdd19sVqhn+7d7yZPuiUU
 8vLwA
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


