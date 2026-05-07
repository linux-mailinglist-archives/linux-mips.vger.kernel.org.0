Return-Path: <linux-mips+bounces-14516-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PSSKggf/WnXXwAAu9opvQ
	(envelope-from <linux-mips+bounces-14516-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 08 May 2026 01:23:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E40EA4F0126
	for <lists+linux-mips@lfdr.de>; Fri, 08 May 2026 01:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF7503036773
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2026 23:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A733537F8;
	Thu,  7 May 2026 23:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsX4Kc4P"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A62F290E
	for <linux-mips@vger.kernel.org>; Thu,  7 May 2026 23:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196223; cv=none; b=UqcuYJDvWHQ5inPjdzw7vtb31pfRKSi5uv4l9O02jWnsFBPImPkFLh2Albyyu4oQKZibdHVemO39RloBsfsM+p1JfytTJ4rV8CnM2ai/Idzl6mXglMVfTCyUsRHbVU98om6YbR++a3ANVdyYzgtQJPC/QzICJZXiLoFP7/0wHus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196223; c=relaxed/simple;
	bh=1KJ2Bvoc6iZawqaQ7SOjwiQHPzA9sUFrhqqMHlRQJLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U/2zRfYuto01ZmyMN6q1ZkAJLMQFxZV8LexdzEVOxdHrJ4CSyY+qcVXnHpAYAn3OhCCLcmahU+/zFdqA/R+7fvVFa8oP8wFVlSfoxV6WRUB62oF8xRH7nxRAg9E5GJvk7Zdx7tf41OWtT2UqRZH6SrrEPBmSqWmC9mfUHpw5MDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsX4Kc4P; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-83659d38e38so620932b3a.1
        for <linux-mips@vger.kernel.org>; Thu, 07 May 2026 16:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778196221; x=1778801021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cGtvlVlMdfXez+6h1mKwdTb1HqPOhxq8X9+6dMnsoCs=;
        b=HsX4Kc4P58y3GcRBh1Ge65VmW/s7fMxk3EvR6/nWM/2omtrhhqxsQvczSXr3/ukVkE
         wOVjeLNJyj6lbU0wgd1ayPyiKYoLunr0OTYEaBD1Y2yKV/Ig+pckm+Ls6Etbljyhe+AT
         ghAPdq033whJzZlo+a4GlvQZcuxQn416KAgskvrHOq1myog2SoWOAUb7Dbd3QrbwcOac
         7L3Gefir2asMr9SEI2MrS5QgKBGp/bTwURBB0ycwLOqPqzupug0u3IkfctIZystXEuZw
         mN2SrHISi2uwv2mWzgEe0oZo6ium8d3LgevuwPWdk5W6sdxGXIFhk/H4SQoePt4gATSq
         SNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778196221; x=1778801021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGtvlVlMdfXez+6h1mKwdTb1HqPOhxq8X9+6dMnsoCs=;
        b=QPb9TBSJc7biHcxc1mVQtlwdGgPWsKzPurckFuffhn1af43bAx8XvD4pvf9kOsYzCf
         FKs0jS9YNFuHyZBt7Q7ovol+tO2MHFVUfeM/6L/egzf/rgqQJG2f/yy2McHrT9HFWUIU
         R2Zs3p6kkn7Mt/GW8ueompyHXwNIkWh2h1PwCfI+97zsIIDm7meomWHyR6TFBBXJHset
         8foiLPaAu/Bh2yRq2FyFlzUzQYnpVXZnPOitVwiPCQaBKsNcI4t1B88MKlzivo8iq2IL
         i5AbwVsFvlEHdgiIsgNbwUcn2yb3yUmBVYpIUjqtngUdcs7UMvwIi+qsKKgOaNliB7mL
         7IVA==
X-Gm-Message-State: AOJu0YzFaC9CTNr6T8JjonThPiQqn+RwPE+miNpGrJA6E4+/SYgjVPgn
	+lGtpCWbWrGwUCHtzNedfYy/uNbMOLsWmJQ9wrklzXboEKf1AmZIy4uxv/HTwj3u
X-Gm-Gg: AeBDievNDsvSeg6br3k4rhZU4+9IGb5wq+PrQOuc5YpbnztAoIp0CT2PHSWYeqnCVfb
	hEF0U2C/O5ZOEKd2J4mU0G/hVajuJl1jr2f2nxEBMSq7t7NxFFPavx80IoVD0VIP/bZmw6Y4K+L
	Ye3y1C3c9LtIs9KQyADdzwBpOgygfr9EuMQOFjfueutIv6u+qoX+aIefZH/+LeXqiCIkGAgY6mU
	EM105gG0nd6QPjdzEtvRc3DNH7reZAvFNBDNBYKxUomS3ce0/LpM89SORI+oeT2sySbGBQQWH5A
	eGrXflL7/XrZ5J48TyWYSa48WBZlAou8F1kEutY6cR20UC7PfqMdnNqS1m2LOJBk3oqRSYTuJhM
	cgT93heitw1rxY/QVEfOMUx23owRPT+Ea8iyrq0qMojNHtGWH9zS2Uq28/cyDAIPGryxz3LtM4k
	fZD8dDEddRqcpA/duRyiJZ1R2XOKgYpR2F5orCY17HfOtapkFDC0cEFAxpW9oBPAicHz+WzpeRt
	gWlz6pwYaFa7f9lK1CysJ3fIRvoLNRMTZc=
X-Received: by 2002:a05:6a00:1a0a:b0:83c:c55f:6dee with SMTP id d2e1a72fcca58-83cc55f6fd4mr867107b3a.11.1778196221065;
        Thu, 07 May 2026 16:23:41 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659487afsm9527213b3a.18.2026.05.07.16.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 16:23:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] mips: cps: Assemble jr.hb with an R2 ISA level
Date: Thu,  7 May 2026 16:23:23 -0700
Message-ID: <20260507232323.489383-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E40EA4F0126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[alpha.franken.de,kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14516-lists,linux-mips=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,lkml];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

A MIPS allmodconfig built with LLVM can select CPU_MIPS32_R1 together
with MIPS_MT_SMP. In that configuration clang invokes the integrated
assembler with -march=mips32, and the MIPS MT path in cps-vec.S fails
to assemble two jr.hb instructions:

  arch/mips/kernel/cps-vec.S:376:2: error: instruction requires
  a CPU feature not currently enabled

  arch/mips/kernel/cps-vec.S:490:4: error: instruction requires
  a CPU feature not currently enabled

The earlier jr.hb in the same file is already assembled inside a .set
MIPS_ISA_LEVEL_RAW scope. The two failing sites are reached after
popping back to the file's base ISA level, so LLVM correctly rejects
them for an R1 target.

Wrap those jr.hb instructions in the same ISA-level push/pop used by
the working site. This keeps the MT code unchanged while making the
required R2 hazard-branch encoding explicit to the assembler.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/kernel/cps-vec.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 2ae7034a3d5c..70413c816eb0 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -373,8 +373,11 @@ LEAF(mips_cps_boot_vpes)
 	.set	pop
 
 	PTR_LA	t1, 1f
+	.set	push
+	.set	MIPS_ISA_LEVEL_RAW
 	jr.hb	t1
 	 nop
+	.set	pop
 1:	mfc0	t1, CP0_MVPCONTROL
 	ori	t1, t1, MVPCONTROL_VPC
 	mtc0	t1, CP0_MVPCONTROL
@@ -487,8 +490,11 @@ LEAF(mips_cps_boot_vpes)
 	li	t0, TCHALT_H
 	mtc0	t0, CP0_TCHALT
 	PTR_LA	t0, 1f
+	.set	push
+	.set	MIPS_ISA_LEVEL_RAW
 1:	jr.hb	t0
 	 nop
+	.set	pop
 
 2:
 
-- 
2.54.0


