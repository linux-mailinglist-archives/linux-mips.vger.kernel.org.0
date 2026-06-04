Return-Path: <linux-mips+bounces-14883-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UQ+uEe57IWr3HAEAu9opvQ
	(envelope-from <linux-mips+bounces-14883-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 15:21:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE0640473
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 15:21:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="U/MSGcKj";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14883-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14883-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CB14309D93C
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 13:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4654447F2DE;
	Thu,  4 Jun 2026 13:20:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8BD47ECE7
	for <linux-mips@vger.kernel.org>; Thu,  4 Jun 2026 13:20:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579209; cv=none; b=WcnwCjfe4WtJkb9lWb/Nq0sadPAdKxgjHcBJyHchTZzZt1Ep8YiMA6f4NWD9Wm/6g4F9gxCmUhaD739Cp4XIa8N+pq0ENcgK4plES4cP2BTgveJt/3uDjplOhLNX9Kh4maVBwRjJFWg3xjZNbVxhjD0GuSI2xW006nV0IZD7q40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579209; c=relaxed/simple;
	bh=T2wQkK65vboZ4IeGnr4NbeD+9D8laMYxlcwY9lW95Qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5QIl9TpYe1kAU4sPQs+L1p3iDW27mYRkQUwdbLcq+8iPy2W3EYL6gdoYel7J6zd7cog5Ls0p3TrLplxMqNoMBuT/xdunG5XuZ15E2D/INYz6SQsQA6Lsik3upIOOmBjWJ9CK1sMLWSWnrQF/rYX0GdNSX5LpK2TOfgG1lWi9o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/MSGcKj; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45eec22fab7so389186f8f.3
        for <linux-mips@vger.kernel.org>; Thu, 04 Jun 2026 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780579204; x=1781184004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCy5icZAFPKbCxn3K3WrZKHkVhOrNfCywaz2Tw/0Yng=;
        b=U/MSGcKjCOLpKGiwmb+hS6FzWFLCtJ6wvdYdnHQmDaSBnqFmO05w0ioUV+SrGfOxfF
         XiRqqhlPMZ1EcHJ4AVLYrCWuZ19nM5c9AcKiolBT6t5zfbp3Ka13PBs7LwN+/DLBzrIH
         9YU1JoXrNLqvIMsTiGYf5aaXp9bRVN4b8CClSaEeU3PdL3JnzaAGZy2Sb4kipcA26Pnc
         i0Vli4Vi2svsdclzVrs04iNFpA9+tNH4DTezcyVnlM80DLdidU50PMXNojOfg7OyVIAm
         ZELBI6wVqLhYrQiWM6Ie3WKfuyuUzZaM/DOzmhmzhP6/A+U8vOFeQE4RDz8LuYFmvrcT
         nPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579204; x=1781184004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nCy5icZAFPKbCxn3K3WrZKHkVhOrNfCywaz2Tw/0Yng=;
        b=MmWqCFIRjnE7/BE8b2gg+TgnUYgiI3iNqCjB54nYQUMdeAKK30dIJaIh4QzPiC95bi
         k2/tGQtmXDWV+DSKxQSO12tAItLMHFupe1IFph7Qzspzh7P24Fxs1NKKIPoSaxXVhZi1
         p/h1TrPSDLBgGDLfWGQ96UHEfedDMgYQkXL3dNP6/S+io2yz+F+LP17bfJvO23iIpDsd
         ov8jwFbzRwcAgPkg6Q7yEe/noGnwlM7Y9aMOpWVklUwvTMzHlRD8j1oIDnf251a75Ce7
         rD//CkgtcSxFENmE4xHBnaxBbu3HYQEjOvJgIFyNYf7U5+TkrDgdKQXjZ3yoMZ6YJMOt
         MCmA==
X-Gm-Message-State: AOJu0YxgC4mKgpJn0z557iopxWnnuo6Y5+v12/wXDI9NxwEmuxB8t/Th
	rXPak42TImAi6J98nuFv4ZpOKs7Mvd8aygpcQNTQE8BqSa0d0+UE5IZ+
X-Gm-Gg: Acq92OHWeCBn2G723BlbFQZJ7ec3FaQBFMLHWcu59go73J1SbjZTaqbUrU2X5HrNxeB
	s+xCNL57kjdXbdn3cV/RzpbY0fJtY3byNrz+O7j5AO7tA+pwRROWs+BepUpo5ulCqQo30jxDUpr
	PasgzmRM/GLWGnzh82uPWS64Qrpbe1fVaJwj5s4xAYrrv23Ipx8rFvryJJVpLMzFwOWmfyKL3r6
	Uxu0qeco3nKDJMNxrpIA4LXi4rjRz7FuokB1IJ98UABKNRQWJmWLfTwVHnS6x2FXMDvvuBksbHv
	G+/VrsOSD1tRrH50KkFYfWoKHST56t+ncdKTp+0v7v4Upgft/TDQ15wDfd2nryeZ4neFNYaHPQK
	Rr4HxK0Ndq62oVAWjDTxydDLhP7KFD4wixXih7F7+Wous6i8kclL0PFU9DsUsxTmOa1yE6U9fX/
	OgiN+eEgXTnfaKkDZHTr+Ln4wZC5cCs49L
X-Received: by 2002:a05:6000:299c:20b0:45e:7418:a3f2 with SMTP id ffacd0b85a97d-46021846dc0mr9148505f8f.26.1780579204445;
        Thu, 04 Jun 2026 06:20:04 -0700 (PDT)
Received: from localhost ([94.53.77.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm3398435f8f.32.2026.06.04.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:20:04 -0700 (PDT)
From: Catalin Iacob <iacobcatalin@gmail.com>
Date: Thu, 04 Jun 2026 16:20:29 +0300
Subject: [PATCH v3 6/6] sparc: Remove remaining defconfig references to the
 pktcdvd driver
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-remove-pktcdvd-references-v3-6-e2f06fb4eef4@gmail.com>
References: <20260604-remove-pktcdvd-references-v3-0-e2f06fb4eef4@gmail.com>
In-Reply-To: <20260604-remove-pktcdvd-references-v3-0-e2f06fb4eef4@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Jens Axboe <axboe@kernel.dk>, Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Catalin Iacob <iacobcatalin@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=iacobcatalin@gmail.com;
 h=from:subject:message-id; bh=T2wQkK65vboZ4IeGnr4NbeD+9D8laMYxlcwY9lW95Qo=;
 b=owGbwMvMwCX261qtXAKXKjvjabUkhizF6vUry7hfsO25sPz06cyFgXWfhXOy1B3f+N6v/xxft
 T7rWuWjjlIWBjEuBlkxRZYX5663bdhzJuBekl0LzBxWJpAhDFycAjCRvxkM/8PWMczLnZQ1MVVk
 61zh9Gc8zi+v3191c++BLfadB9vXLZzB8M+6u/j1BddEqaaNtVEqK99Nb7E/mlw1+8ssJ3HGyv3
 3njIAAA==
X-Developer-Key: i=iacobcatalin@gmail.com; a=openpgp;
 fpr=F609BFABD84EB5C9DDDC37EDE89C6A3571CD0E33
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14883-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:axboe@kernel.dk,m:ysato@users.sourceforge.jp,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:iacobcatalin@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[iacobcatalin@gmail.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,libc.org,physik.fu-berlin.de,davemloft.net,gaisler.com,HansenPartnership.com,oracle.com,kernel.dk,users.sourceforge.jp];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[iacobcatalin@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DECE0640473

Commit 1cea5180f2f8 ("block: remove pktcdvd driver") left behind some
CONFIG_CONFIG_CDROM_PKTCDVD* references in defconfigs. Remove them.

Signed-off-by: Catalin Iacob <iacobcatalin@gmail.com>
---
 arch/sparc/configs/sparc64_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/sparc/configs/sparc64_defconfig b/arch/sparc/configs/sparc64_defconfig
index 632081a262ba..4abea39281cd 100644
--- a/arch/sparc/configs/sparc64_defconfig
+++ b/arch/sparc/configs/sparc64_defconfig
@@ -60,8 +60,6 @@ CONFIG_CONNECTOR=m
 CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_CRYPTOLOOP=m
 CONFIG_BLK_DEV_NBD=m
-CONFIG_CDROM_PKTCDVD=m
-CONFIG_CDROM_PKTCDVD_WCACHE=y
 CONFIG_ATA_OVER_ETH=m
 CONFIG_SUNVDC=m
 CONFIG_ATA=y

-- 
2.54.0


