Return-Path: <linux-mips+bounces-14878-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ir5MIy99IWpQHQEAu9opvQ
	(envelope-from <linux-mips+bounces-14878-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 15:27:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 163FC64051C
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 15:27:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=J3m0C6HO;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14878-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14878-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8ABA3311BA7F
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 13:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C8C47D95E;
	Thu,  4 Jun 2026 13:19:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AFF47DF8B
	for <linux-mips@vger.kernel.org>; Thu,  4 Jun 2026 13:19:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579198; cv=none; b=eCAlARbqPCpOEeOfB+JK8CgwZ25UeJBsi1oMANrr6lGONIIsCu7jXqHluDRGdrhiKECFARUE6tBfaF/VJ2fav8XetDfFkQeLROAOPjj1BLIESnpx9drpLZ4rFG0Cpepb6mDhmE8ZFcvY8JfHvv5jCTnMndxgcUEaZps2NZZEcjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579198; c=relaxed/simple;
	bh=G3Fe3cyAD+Z/AwWkMEKc9eOAUojByYfLbTKUe0Guf4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cj13HembxAM5PI71ZbxfP7LAT1oKPdk9YoYwuZSFQ4+3x38cveb0k1vqjQ33ZA+kx9MjZ6+WOhZHSAD3trrhCs2LlrjhSHy5u48jOGQmD439OfhcIK8fPYiNTEmXXBUzj6bS8le9qFoWMxQjZd+jNk/+HlEXJTnlmBkMFk6l+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3m0C6HO; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4602e2a0372so213775f8f.3
        for <linux-mips@vger.kernel.org>; Thu, 04 Jun 2026 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780579191; x=1781183991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlT40SXHIDNPrvJ62EcqbeXntfzy9q6fgJPYwV1Z4jI=;
        b=J3m0C6HO7WZDSe0Ss8rjokQH6/fZB54wybzIDmklEpQH2oBZCqA+qRZr2qAd2xLEn6
         07NuHp+BaxOIRVNtNoPcaAih2qI5CilDwENEvlYD+2NJ5wJx0iH1g8Gb8yUyVly6VMx5
         fUlBqiGJg2LHpINrElR+Km/cgH5Sh8MSn5ELBxsxx2IfwlOqp/UXHZXtZ7HjCPNNJkIj
         yzi0cgGyNNJUYGW1fKcpcumgO/vxRaTnP22HKW9OtFY/FszTTWDCkuWa3XJV0+F9KXZU
         P6lfCSZXq1xJWnPK2GP7DNS8WCuibVopF+R0wUuFDC7cqT06gQfAwThr9n/5Urz6aNmz
         cN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579191; x=1781183991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KlT40SXHIDNPrvJ62EcqbeXntfzy9q6fgJPYwV1Z4jI=;
        b=Ih8cskkPnzy/cVqwHNu47DC2PBQ31zE6En3o3gqWKABtVX9ZSJME9h0Vdok5lhVqIL
         9ZlqCjJ5rCrEx6C/R3XSJv1EZIDRbCLuDHtFWpg1TXuThjiYQksMAoRkeWbFJJn3E9KH
         GC0MgWwfjjDUw0LVsWTW2TCsl0M1cwygjbqk/Egr0yyw1ilf2OxWwe9TElDZggBrSXOQ
         xS5RXvObVQJlicrnBao34kVwkynEp/ybsVqRdw4yk2vMABpxJ9BcbUvMwmMJNYMMb0Ak
         N1Wfjq7Z/3zULa6NAZYzP+GZNLrTp0uX6j1LQ7T7uZ9iiJPDizAzMSjHD5gLRlr1a2Tw
         vX8A==
X-Gm-Message-State: AOJu0YzraTT/+KyNjOTo3P5xwKOZmyK5331QW4CmuO/fAUuoreSbMsxR
	my//MLWDLML/hX5KlhPsHHMmhGprQ03n0bQFZKbX0M/S8X827+/irOOM
X-Gm-Gg: Acq92OFS2gJOw64j1t85wj300pFuNT66a1piKZMnHzzcJk3jnAzbDcUjn1Fq18r8R8S
	SjZuth3tW8sH3wGbHGqtzBu+U9YSfTRoUChM1hK5USIVET9DaDCC8uWvNxIGyEZAO6H8je68p6I
	SFOBhGEMpmeAJ0LE89ZNJv/xAFvjbmXLIzQfRl60SIE2dbQqS0OEzu5ZkK/Ol4hWmmKdFPVgR7w
	azVojhNj7gGLyT68/mHpBuCcxVG9A79iu+8hKrwfQsVVzG4WqrxB7iWZK4E23YYLficvU84lZHU
	X3U6xPd/tVRkwFG3Iv4V0wCpWq/jnkZFFdjNU593zU46b1IIurSU/7hd6AmNJZPLTs+XEmWTlGI
	x7P9NKxrhVB/bJ/Fzutq5y6skjAUQtnHCMolJF55LntLDMiTBLNnZbBBzbNVC4Wm7dw6Fv9dXwl
	SSRCAcG+ZL/x2korF6HQ90chey/lUWEkWrP265CRCoxIQ=
X-Received: by 2002:a05:6000:46d4:b0:460:194d:8df0 with SMTP id ffacd0b85a97d-460216bdec9mr8550288f8f.4.1780579190589;
        Thu, 04 Jun 2026 06:19:50 -0700 (PDT)
Received: from localhost ([94.53.77.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm16338165f8f.9.2026.06.04.06.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:19:50 -0700 (PDT)
From: Catalin Iacob <iacobcatalin@gmail.com>
Date: Thu, 04 Jun 2026 16:20:24 +0300
Subject: [PATCH v3 1/6] scsi: core: Remove remaining reference to the
 pktcdvd driver
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-remove-pktcdvd-references-v3-1-e2f06fb4eef4@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=966; i=iacobcatalin@gmail.com;
 h=from:subject:message-id; bh=G3Fe3cyAD+Z/AwWkMEKc9eOAUojByYfLbTKUe0Guf4M=;
 b=owGbwMvMwCX261qtXAKXKjvjabUkhizF6vVir19FLgtlrTKTWrz/dN+tx8/b3paudEw33v5iw
 bXHKZO0O0pZGMS4GGTFFFlenLvetmHPmYB7SXYtMHNYmUCGMHBxCsBEaq4y/HfOULHXvpc6y/do
 pN6xXynGrT7RcucdVm8Sqkl1P7TlwSJGhu1yi5fZJc4NvBrrpdCoPv3b3qyyTN7Z02ctmdxRfT/
 8LCsA
X-Developer-Key: i=iacobcatalin@gmail.com; a=openpgp;
 fpr=F609BFABD84EB5C9DDDC37EDE89C6A3571CD0E33
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14878-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 163FC64051C

Commit 1cea5180f2f8 ("block: remove pktcdvd driver") left behind an
export that is now dead code. Remove it.

Signed-off-by: Catalin Iacob <iacobcatalin@gmail.com>
---
 drivers/scsi/scsi_lib.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 85eef401925a..b67f0dc79499 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -2224,14 +2224,6 @@ struct scsi_device *scsi_device_from_queue(struct request_queue *q)
 
 	return sdev;
 }
-/*
- * pktcdvd should have been integrated into the SCSI layers, but for historical
- * reasons like the old IDE driver it isn't.  This export allows it to safely
- * probe if a given device is a SCSI one and only attach to that.
- */
-#ifdef CONFIG_CDROM_PKTCDVD_MODULE
-EXPORT_SYMBOL_GPL(scsi_device_from_queue);
-#endif
 
 /**
  * scsi_block_requests - Utility function used by low-level drivers to prevent

-- 
2.54.0


