Return-Path: <linux-mips+bounces-14521-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LBi0JL6w/mlYvAAAu9opvQ
	(envelope-from <linux-mips+bounces-14521-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 09 May 2026 05:57:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A6A4FDFAE
	for <lists+linux-mips@lfdr.de>; Sat, 09 May 2026 05:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3690E3006B5E
	for <lists+linux-mips@lfdr.de>; Sat,  9 May 2026 03:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B48D381AFC;
	Sat,  9 May 2026 03:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fabnzXOK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE2E28C2BF
	for <linux-mips@vger.kernel.org>; Sat,  9 May 2026 03:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778299067; cv=none; b=DHFmrdz+GH3ZohwUn2SCA+yIi0zoB2lEcvGtxJ1mMEsGK8EohYMSurianD4BQRZ5PceQjay9cyhIARQGRa2WKEBil198du3ovrcT6OnFRUM/EtuY0Ql7tSHvjFerLQhQbpV6cHPcJSKP3IEgfA0NSKWF/SLNhrdOuhOeGbM4Qao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778299067; c=relaxed/simple;
	bh=E1JjsyrBUmcE2o8yJS00nHWF3nlKfcvDhtNnNgWjLEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hw/mfT7/7au1viq6+/iH9i/5SDWRXx/I4DQHHiy4zTWlR1u/L0L7rxRpqOIRNCrnbbpYMFukk7edsj1P8ycJ32Ztgc2HNllM6xevddevpUJBjptigJc0aO2zm6jo/3yYUfYF/eOH7pSjXVn98b38qf+kewc41gC6z3eoX9Zu6fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fabnzXOK; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so1263374a91.1
        for <linux-mips@vger.kernel.org>; Fri, 08 May 2026 20:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778299065; x=1778903865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IkX8HgWeQjMY00GnmZf8gvg0OU6RXFy05CfYv9ZT5oI=;
        b=fabnzXOKPgdYmguIcsj0Zm06A+BMaU5I8d44cIj2z/fRfZsQqdNckyBDPwSLmrL0xA
         DGisslZ1CuRuq3gAzrI4RDeNS3ZnaWvIDbH5A19/bcRUZ3LRT8ya0ONWLtMOQu4ENcby
         e/HQkzyJx3Q13R2Q42muaQJyfYr7yOtzryXSulZhZb8C1cN+OEP1shZRiCmhx7/xlz8V
         QUMwdrzOZAA/X05zXF9h6/cKcDXtvgnrAcY0EhPtxJQJ25lk7PYSLFu/j/+8RMzj31dX
         mYmSxI/a4zykliwPWXKmINYf/C5m+sW4eifyWzy/AA+p1+fKvxrnR86oZcBiRY3EEp9P
         hpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778299065; x=1778903865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkX8HgWeQjMY00GnmZf8gvg0OU6RXFy05CfYv9ZT5oI=;
        b=j9vErnzO4Hpkn8KHXuzvNesXbItrqkOvb4mggLq+xktJd+Os7PyE9tEGuZ/nKd/76D
         GKe3gLzqkZpR+8Je6Ugbyprq2yHItMR8KSJVAuTEC0g96uLPokpe+zzrwQoXjQpa7PoR
         nn13Q9QpwGirl7knpuvA6Z+EVR9GTp7GKHpulNFWPZ/FOdTo4JppE4P7dQ1AACwhQOnm
         1uZG0G9qCCJ+BWqjO8YWsSu/tGHmyl7qixPyUZCSB3W0gbYEnzcqu/+RFrphgqI/oO5W
         /4MDWBe/iKLxtIIYhKbRkUPrKMfEfyR1F4Y9rSiliFwLNiR7q54bIeszVrjVksg7Z1s9
         Y7Vg==
X-Gm-Message-State: AOJu0YxHoiLWgQtK7vQsEJF6prLD1dKDKWnun9ncu1b8z8OybDB6TAej
	CpNyz4UrY6ch9JEy6gHX7Ap8M/6AYulw/YnB85pq72HloH3s4yRsK+dLFB3OiztI
X-Gm-Gg: Acq92OFAQIUJxqq91i7pbKcglyYueQe9z2k3bVJ7YOh3VXhRB+5kys8+8wILZAzTGtH
	d7FXNflvsQBpjoBzpcihMr7mvkALEWS/SC+PZSxsx1zmpeQpdfe7qeXb8wV6mW/qvSPfYs8Am5E
	0OktvJck08NW8rsbsCoSpkUvP33nEQiTG08H0F9tqgUYQ+7SrEjjPxFwPiTSElFZHa9PSJeVcQp
	M3UCy9PeuwCV31wdtypU/4JCNBYNiTR/fU1bxvXywY8J/ceFykGjaVsmXfhRnatW2qYOJs/fRWA
	C1cPTM1+g3CXxI0O7621UAIoV4mw3GuJaVJlm4Q/9afCMvQDO0x1/2KdOPBuX4eFCCBc6NLYNZk
	JTUR9B4YD/cJk1hbSEQRn/IIiI55umXoFRvXP/4AVjv4Hi53fjngau/J9Af2sz91XhxgPzOlNJz
	vGjMSB7tt+Lcrw7MST8glsjsj0Q1A5hNpemfSQE7xCDIjHI1I0qfO0ZqVhWI109M/w8Qc0W2u4X
	du6epWPosjFiLz0qpT4iXjMqB87Ezy8jYw=
X-Received: by 2002:a17:90b:2648:b0:366:479c:59e8 with SMTP id 98e67ed59e1d1-367d46b8be5mr1268642a91.8.1778299065367;
        Fri, 08 May 2026 20:57:45 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688fe2sm4478127a12.9.2026.05.08.20.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 20:57:44 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Lauri Kasanen <cand@gmx.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mips: n64: add __iomem for writel call
Date: Fri,  8 May 2026 20:57:27 -0700
Message-ID: <20260509035727.1016256-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 29A6A4FDFAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,gmx.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14521-lists,linux-mips=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.995];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

sparse: incorrect type in argument 2 (different address spaces) @@
expected void volatile [noderef] __iomem *mem @@
got unsigned int [usertype] *

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202105261445.AcvPd2EE-lkp@intel.com/
Fixes: baec970aa5ba ("mips: Add N64 machine type")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/n64/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
index dfbd864f4667..66ec28ab41f3 100644
--- a/arch/mips/n64/init.c
+++ b/arch/mips/n64/init.c
@@ -50,7 +50,7 @@ void __init prom_init(void)
 
 #define W 320
 #define H 240
-#define REG_BASE ((u32 *) CKSEG1ADDR(0x4400000))
+#define REG_BASE ((u32 __iomem *) CKSEG1ADDR(0x4400000))
 
 static void __init n64rdp_write_reg(const u8 reg, const u32 value)
 {
-- 
2.54.0


