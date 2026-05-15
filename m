Return-Path: <linux-mips+bounces-14600-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM5SJi9pB2oJ2QIAu9opvQ
	(envelope-from <linux-mips+bounces-14600-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2026 20:42:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73D5566D6
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2026 20:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A0703001310
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2026 18:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1189F3FF1BE;
	Fri, 15 May 2026 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FtIp9pPU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nSUF8YIS"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7823A99F
	for <linux-mips@vger.kernel.org>; Fri, 15 May 2026 18:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778870571; cv=none; b=TEK6VZktGysW2w99B1c9lz02tCQZzGf8lWSJ2KvA5d12jAbXnm3bGkfhmK26EM/3vqUSZdL/YSsKfOiauVfY75ocizLqyibE/niiSLZNy3eTwl46pEw2zgB1SRepW6YQrzLBcXUrHExKTqLe8Q62FfGBe7t+mSQ0GuHsOD/AyQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778870571; c=relaxed/simple;
	bh=RKGxbIFR9RrAEDVfvgpZAz2K8ClXbgRgiRpcxVVH90o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TalP18vAN092C++1Pdcl1SWfnoQRzZSp4PCmKAnbIj5Aq4fX/yZ86+MR1NRLq42W9IGNj1omGJvfnAcBzX+l4lz5n77oYJ4p8CQt0TBsTks5nqOGnEBoYrHI0rZteAX4O9juYiyD81hm6HM0hSgC77kR6TFu8Zfy3vXyMr4f7dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FtIp9pPU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nSUF8YIS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778870566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xeHI1hVf9pd2jL74QJxPksaD/1NNvfM98iKDx89+7bI=;
	b=FtIp9pPUwhWPqc6lgtW7baobHC2aslU1RLT/DaODZEqA9aVYfAU0ASgxAFOqbwpWBjf+Z3
	6vGYkwHFY4AgeZ05pgQTAzo0sbSmBczzH2AV/9vq+zIgaXdr3ZuBkcl9kfsHAoEVDr4dZi
	+VsTievcxBKKGfoP038+R80Q0xSq1lM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-DSJT-IFiNdmkhwDFTCns6A-1; Fri, 15 May 2026 14:42:45 -0400
X-MC-Unique: DSJT-IFiNdmkhwDFTCns6A-1
X-Mimecast-MFC-AGG-ID: DSJT-IFiNdmkhwDFTCns6A_1778870564
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48fed2519daso682805e9.0
        for <linux-mips@vger.kernel.org>; Fri, 15 May 2026 11:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778870564; x=1779475364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xeHI1hVf9pd2jL74QJxPksaD/1NNvfM98iKDx89+7bI=;
        b=nSUF8YISFjS2HUEcE/xFshdGoQDERv4VIfWXnkbNWtdIpMGcEFolCcT7D9vzN/tukf
         rfKTlefRccEbYiqKj+Ofp5+DwrJvo0k1Y62d+NGEIAdK1eDd5DhXA+lye5OXBCsLS+HT
         +UUGDSRV5pT18LE3wIr92RfiPEiX8BhUYDjYhvSlo5MLzp/2MBiHJEy1FyuPx5lfDD/N
         tO6vUFnjHtlBFtEd8pdlrljINSoexZcbL+/Qti9lw6xbzs+Y+4sPr2avh8LLz7yv5FW/
         ftjUI2qwEGiipMcrgQN/09pJKUxmCBapaiF9NUCw/Bs/nb3iuT5Hl6aaigOg40eLTyv2
         NX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778870564; x=1779475364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeHI1hVf9pd2jL74QJxPksaD/1NNvfM98iKDx89+7bI=;
        b=P8c3/g9A1BPtg1CaVLATkfOQNpxhN4J3UO4Rnf2gN68POnNiClDip9W/h6AbpRWPHe
         B9CVMjtCn3o/jfDgyltoANO13bmPfWvPeGR9D6ryuDyidIFSrbH8TIgMAXkH1cyQTWkh
         JRYkorV/Lf4E+QJf/6IXgVOuhYfRzNeB6aYXTolubprWLA7BeXz7EyhKFPfWqRxz0iIy
         rR86MFC+nA2ADP4tDOGqXcT7+1YB+59lqDpKjzHTPG6U5z4y8B7b1Ev2gTERfJw8Vtb2
         Jq1uBSrBkHXpAptmCBW4PkjDa0RIvI2tMjj9uEB0dhN83nk0GPYhz8hHghxoFDBNGAqg
         eLHg==
X-Gm-Message-State: AOJu0Yz+0Ak73IjVDhF0lpMiuDea0eC+Mh4rXcUn63N7h+aE1O/ac6ED
	g/3LKuIWlJyij2Nn9G27OSqqzxlyDtkzGX3m9tddC18v5QE0Ajvk+nGtMyeICfFxHP//ADgq25F
	vC9wIoR2RA0yxjUhQ8EAJZ5R7PQcYmmTr+UfNsRihqVsTZReFuUlfvyPvffGhbFI=
X-Gm-Gg: Acq92OGAEbEkdYIuU7QShH20jmijbyFnoYVQH4nCmlZsI7ijjYsqXLPEUe1liI2U3mU
	Qn1ptCHQd1aBS92BpfN8OhuR4gylMClJ2ncFYA6gmrCZrmWJNUMjlp51gmZoaO0mqsCMtg5vFa9
	jCVCXAIKqnZ8Lqp1oN/byf/z0ZsWt8W9JJuw5rPXkMdwE/PQXSD66VMeDk0EBxCFAn4yzTFvHBW
	RfxNhuFNx3dpeQvZisSIo5S7UGFFvU0uPM/VKsrIIyAsMTuheLW4P7JXMsMt2RdEUU/HG5uL/If
	VNY8nv2I7neZJC09ePeNtJtKzqHTwP4RDc6giGRVw18mAJfpzWoUGRNXtGEX11SZHjBQqTFadfR
	1YWDniLxFgew3QKX5f7ubDqc6vvBNjJp8olo=
X-Received: by 2002:a05:600c:a11c:b0:48f:e230:8cac with SMTP id 5b1f17b1804b1-48fe662a1cbmr50777105e9.32.1778870564010;
        Fri, 15 May 2026 11:42:44 -0700 (PDT)
X-Received: by 2002:a05:600c:a11c:b0:48f:e230:8cac with SMTP id 5b1f17b1804b1-48fe662a1cbmr50776875e9.32.1778870563593;
        Fri, 15 May 2026 11:42:43 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm42630115e9.4.2026.05.15.11.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 11:42:42 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Paul Cercueil <paul@crapouillou.net>,
	linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] include: Remove unused jz4740-adc.h
Date: Fri, 15 May 2026 21:42:23 +0300
Message-ID: <20260515184229.1513380-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C73D5566D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14600-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[costa.shul@redhat.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The last user was the JZ4740 MFD ADC driver, removed in commit
ff71266aa490 ("mfd: Drop obsolete JZ4740 driver") and replaced
by a self-contained IIO driver. No file includes or references
this header.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 include/linux/jz4740-adc.h | 33 ---------------------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 include/linux/jz4740-adc.h

diff --git a/include/linux/jz4740-adc.h b/include/linux/jz4740-adc.h
deleted file mode 100644
index 19d995c8bf06..000000000000
--- a/include/linux/jz4740-adc.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __LINUX_JZ4740_ADC
-#define __LINUX_JZ4740_ADC
-
-struct device;
-
-/*
- * jz4740_adc_set_config - Configure a JZ4740 adc device
- * @dev: Pointer to a jz4740-adc device
- * @mask: Mask for the config value to be set
- * @val: Value to be set
- *
- * This function can be used by the JZ4740 ADC mfd cells to configure their
- * options in the shared config register.
-*/
-int jz4740_adc_set_config(struct device *dev, uint32_t mask, uint32_t val);
-
-#define JZ_ADC_CONFIG_SPZZ		BIT(31)
-#define JZ_ADC_CONFIG_EX_IN		BIT(30)
-#define JZ_ADC_CONFIG_DNUM_MASK		(0x7 << 16)
-#define JZ_ADC_CONFIG_DMA_ENABLE	BIT(15)
-#define JZ_ADC_CONFIG_XYZ_MASK		(0x2 << 13)
-#define JZ_ADC_CONFIG_SAMPLE_NUM_MASK	(0x7 << 10)
-#define JZ_ADC_CONFIG_CLKDIV_MASK	(0xf << 5)
-#define JZ_ADC_CONFIG_BAT_MB		BIT(4)
-
-#define JZ_ADC_CONFIG_DNUM(dnum)	((dnum) << 16)
-#define JZ_ADC_CONFIG_XYZ_OFFSET(dnum)	((xyz) << 13)
-#define JZ_ADC_CONFIG_SAMPLE_NUM(x)	((x) << 10)
-#define JZ_ADC_CONFIG_CLKDIV(div)	((div) << 5)
-
-#endif
-- 
2.53.0


