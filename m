Return-Path: <linux-mips+bounces-15065-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nMv1BcLTLmrE3wQAu9opvQ
	(envelope-from <linux-mips+bounces-15065-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2026 18:16:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A66546817FE
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2026 18:16:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="e4/uXrgZ";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15065-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15065-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F6B83002885
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2026 16:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC89138A710;
	Sun, 14 Jun 2026 16:15:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86B4285CA2
	for <linux-mips@vger.kernel.org>; Sun, 14 Jun 2026 16:15:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453759; cv=none; b=FFZTrB9OVq4sgnyUQfO1FH//KYKVAe1vgEgL0rZWMXNmRM3gdKfCEsCL1CyPVxAtWHGB9ZW5doZEWB/U1dLt0uoyMs6eI2C+PQ5u9N+ZPDDnwogkTsrr8/lha2S5+S6C8Y8Qmjgs0AV2qaOw4yo9rcGh1kL89pU/UR6O3A4vE1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453759; c=relaxed/simple;
	bh=ofwx4zf3yY/vPpZiXyWfjiOYKTW2xVZryZrU3kAs4eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPIXGh69p9+R2d8oNp9QgsDK41RSKKyO6GdpHlOXS3Sv+1LfYXlSxZ8+mA3JbRuujx/AB+euXEWJUKf2ERxZeSU8DQlJSku8SCBkMn1K6NWwU59D3KvCfj/nmRsP9OEADbh1K4B9RduxhzlwKnDRC6BbIWEyAk5cG4/RE0tlir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4/uXrgZ; arc=none smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36b900f350fso2240528a91.0
        for <linux-mips@vger.kernel.org>; Sun, 14 Jun 2026 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781453758; x=1782058558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ch+S3rbykedr2z6bsw5Hh8zutORUt4eMMB5mYUulTJs=;
        b=e4/uXrgZ2bzPriWGVb6S5iy/wtLOfz9B/JHjf72EFQ9wd3DdsVW/VYTm9pEcjsbFNs
         5oMm/JEN7TOStzi9i45dEdJmOal3iQuR9p4olWejDtd8fvIM+CAHUbjpBJoH2GyZm83H
         baRQENsxyvaILq/Ydeg854ULbHvw+XMSReoVn1fNSH3mmOwWAOOMY4LgwVFmmyCRC8ZP
         6gmqo3VNkDdLc+1oZy8hRTt6dEQriiEXF8K/KnqM/Nl0lNgn5ern0WqY2EB4VRTqNgr/
         fEar+HmUN0rG5dBkVBpgQ6/nS0hnmMFO78fhY6QzSaT6BoMlOh9tBYUuu/p4XucqQjsD
         xrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781453758; x=1782058558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ch+S3rbykedr2z6bsw5Hh8zutORUt4eMMB5mYUulTJs=;
        b=lgp4T1ek1kVRGLoG9O5xOOAVS5x7svlWSFjl6Rv3kXBwNcczvettMH81faiZnOxKC/
         f+pCO3+1sXwCEk6THMCzqSxMtrCDYSq8OWLfeQHlaMMEgTQjDuSbzn4h7JoNWUopkB07
         Ce1WYqFvfP37g54gFYERnCpE9wBtS6zt1kS5d9pmRBP445JQ9aOMUiSUiD5LkmXuJs6L
         xIim/0gO9JvDYD0NRdi9kjx80AdNDoMAnF1JeVGBoub4UM9+p1KLhde9EIxPaz7rDamI
         UJNJRDCvA++9qfd2+Tfb+xTpvJS3dDxUo9Jmr/xj1QPxxyiOgjGUGNloncBTzfnxucKE
         uYLw==
X-Forwarded-Encrypted: i=1; AFNElJ86GGxFP/AWyQtTmQCHlpaaElt+EaIA2WdRU+r48S7+d+GdxFgTgZjcJZ/Mmhy1+43qjmg3JyRUSCc8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9nZ2cLdIWjY+64hi7Yxn2gE/gjNEvfrYYyZkB0/oUBov3RL5y
	Qd3QQ7jyJwsssqpYsUC0uJYhHL3ZIC9K17tvv91eMAQrqK+K9kASfhlf
X-Gm-Gg: Acq92OGrL2yivK6hn26MM1vlEEHXHEex+kwaR/HHo2O4jKndYPwjpGhKeHHO909A0FO
	71Rij0b3mOpH/0Iojo7Q+SRl3dxvizLG/ubTF2jncG7vk6ZL9F/DtYTvWSlQnStCTcad8cAQCk6
	foQWezhj33rqbAwi4qsXPvuMcYmIPN9L2TpWhVsvcYNc05G9s49E4acrLMhtTD5EXxlCGhugCjd
	2oqRJmUHl/ItvshLZ5+M1AjrFTgLcafBN0lYrMzyKuwEcQLQBxxlaa+F3+FazIIRDhUCvFUoV9t
	u//PRQyxtLw0EZvt6zftFDp6M/eqiFArGbqFWxFW4kHNDDcIBf2IM2ZkT2hkxkcZQHQaT+oYKwB
	VmTQShDUzgrFgyw6GpZYJQAlh387UWbsBA6s9AydVoULJOLK8qRYwgZUVfhq54t2PV9ggznKO2F
	Li2Cgm1wGmlOw9foiv6Q==
X-Received: by 2002:a17:90b:57ee:b0:36a:d51d:42ef with SMTP id 98e67ed59e1d1-37c2bd033b4mr7411267a91.13.1781453758174;
        Sun, 14 Jun 2026 09:15:58 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm6505293a12.11.2026.06.14.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:15:57 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH 3/3] MIPS: fix misleading elfcorehdr reservation success message
Date: Mon, 15 Jun 2026 01:15:03 +0900
Message-ID: <20260614161503.2219681-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614161503.2219681-1-ekffu200098@gmail.com>
References: <20260614161503.2219681-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15065-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:saravanak@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tsbogend@alpha.franken.de,m:devicetree@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:ekffu200098@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ekffu200098@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekffu200098@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A66546817FE

mips_reserve_vmcore() does not check the return value of
memblock_reserve(), so a success message is falsely printed when the
reservation fails.

Reserve before printing the success message. Check the return value and
warn on failure instead.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/mips/kernel/setup.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 1ae6d0c0e1d6..c7769ed882e8 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -437,10 +437,13 @@ static void __init mips_reserve_vmcore(void)
 		}
 	}
 
+	if (memblock_reserve(elfcorehdr_addr, elfcorehdr_size)) {
+		pr_warn("Failed to reserve memory for kdump\n");
+		return;
+	}
+
 	pr_info("Reserving %ldKB of memory at %ldKB for kdump\n",
 		(unsigned long)elfcorehdr_size >> 10, (unsigned long)elfcorehdr_addr >> 10);
-
-	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
 #endif
 }
 
-- 
2.43.0


