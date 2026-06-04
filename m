Return-Path: <linux-mips+bounces-14882-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EkiEFnN9IWpqHQEAu9opvQ
	(envelope-from <linux-mips+bounces-14882-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 15:28:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1804B640555
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 15:28:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=i2ujJrb1;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14882-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-14882-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 298B6313A04E
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 13:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940D047ECFD;
	Thu,  4 Jun 2026 13:20:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6639447DFBF
	for <linux-mips@vger.kernel.org>; Thu,  4 Jun 2026 13:20:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579207; cv=none; b=QMDPUyh9z34s6NVZTZyN1eXNgYBNi5jQ4/G7SOKrVNkd5hC1tTtvP6Wah3LFcjTz5YP9Lfqipc/9LJQR8KP3SjRggIzmSmID7XU/LewTCSH2hAIYjH8d2T0SadKg8J2o4W0rZeaSr4bbrBUK91mTGUpOmWOdiP0GMq6tY/JV4Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579207; c=relaxed/simple;
	bh=qLq31BYjVwoita8p3VYbMVHsnGBFQquUbQzcOZAQW8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8eNWahFGehcM7L5r1zjKkzeicql9el3UTFUgGnRNhTHCrRpMf6j1iRY2+HsO7MUhPnNs3oLn8I4Hs7L3HDSlliV5eVpzenlmg1Tfm0A7gEa9iiLSkMrrrBJxz/SYw7wZQgVJrqLQ3iDyQ+PxzNg0EEXFszj2zehCWAQCpv63yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2ujJrb1; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1211937f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 04 Jun 2026 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780579202; x=1781184002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fx/LUhwU/PuBYtkBp+ygwfhlhplOE7zsRH3troT6KA8=;
        b=i2ujJrb1D9nO/hu9cDbPAjhHHqffMnDb38JHEUX+5GcLatPkLsKhFIfYlks2Wl22h4
         dcEUw1W0YE/3jthQ3eg3mZJQlyoC2bliAPxptg0oGLnn7Yy6idbBe1YqbDTerkMfZMpy
         vKCgmT8X2AgSOo7TTewzY/m8VQ/ld/fbrgBrUabZemG8Xa9zfEkrKqUNZENNGGn9EZSR
         C0iHhx/5A798ar2ZDEzvzG2P11xY9BEd1jFIzrBU1YV/inbVmxJIG5pdlAibDoVuuCI0
         k4ske8v9r+xL4MubZsrDnb1WErNVjmyButUPp1D2iV5gFEVreLaJBzDm9hDnwoj5218/
         xzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579202; x=1781184002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fx/LUhwU/PuBYtkBp+ygwfhlhplOE7zsRH3troT6KA8=;
        b=a/yJhYZraNxS0fBwuhjwZf+9sX02FR6+ZEHk7tqBn5/Edieir6EubN9TelO5XcerfA
         FXiZGkAaKELsqqeH8zxd/P9RuxEwbjyTUBVdziSvp6/AfLnofgUNBhoJs3J/m5hxGvD9
         kXJmt7u+ioQXtzB9DygtZQRTOdAU3i89yPNS861Fm0ps0QjJWHL1m+wtB3qE/h+r2XIA
         Ly47+aqJZwPavrN6nBifJdni7yiIn/GC1fBS9Mkuclf1FBPkAK/R8H5uRRlNoymPAcTS
         bT/PzoD9dlWBYs543hYrKEpXeuoJ1H24jQWU3EKuTMphE1MDViJ61FGuvqt7Oe7yIjPy
         QdSw==
X-Gm-Message-State: AOJu0YypfI2UnL4u4RSTnEknKJ8Je70CeVFqNzZODAd5nGICrORFi2Bd
	cEwMTPaVLmJHsR1EpV/idIMkilGybsOwPwDhgQdvPELOZ6g4zC/9T1PJ
X-Gm-Gg: Acq92OE4cSxTuY0R0anFX6KMG3WMkxRHnskUBGWWClsukvk97h77eYt1r3hC47hDgcs
	PAUIfdiQrcZsIwQAu8qcHl0a5yaHHtFDSjL/7lcIW/PAwVtXiZjwSl5/Gn4YQOarf5jB99qgg4r
	pSaHLq4/2RSVyoSRcyMP93tYnkGJfZUiIwwEYBbWCtTZg56bfKgvTxsP/TpBLtEC0o3hXjdYTHF
	f/VgLLDRNuESIcZNpbz0Mi23LZnSs4fXMeToXlWLTf725XEJwM+D7C/eMiok1gf74DjpaObEg35
	4Y9b9JRTfV4NJ3gC1r6KtNQ/ZlDop72eSC8WUr2oSuGE14M87S4bhvgPSzwI3ba/fJxP+trbH6+
	pxOKWpyR7/Dcg4h15IEbQxYCMO7/8dimu5281UoChL9LfLjdJk60SKo6Q7Lbxq/dtP81PjAV2rH
	VBd9miB6gQiH/bo1pQLalbHzNfttUYS0Yt
X-Received: by 2002:adf:f9cb:0:b0:450:ad00:86aa with SMTP id ffacd0b85a97d-46027334f00mr4350905f8f.15.1780579201550;
        Thu, 04 Jun 2026 06:20:01 -0700 (PDT)
Received: from localhost ([94.53.77.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f67c6sm16699144f8f.16.2026.06.04.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:20:01 -0700 (PDT)
From: Catalin Iacob <iacobcatalin@gmail.com>
Date: Thu, 04 Jun 2026 16:20:28 +0300
Subject: [PATCH v3 5/6] sh: Remove remaining defconfig reference to the
 pktcdvd driver
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-remove-pktcdvd-references-v3-5-e2f06fb4eef4@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=686; i=iacobcatalin@gmail.com;
 h=from:subject:message-id; bh=qLq31BYjVwoita8p3VYbMVHsnGBFQquUbQzcOZAQW8k=;
 b=owGbwMvMwCX261qtXAKXKjvjabUkhizF6vUbg4sCfwjVxDoesvyfcbp2wXwO5d1rzS5+q5cTn
 pozz+ZGRykLgxgXg6yYIsuLc9fbNuw5E3Avya4FZg4rE8gQBi5OAZiIMRcjw4LzeSe7T+xV9p50
 z5Yh/ZzHFna1hwXT1+ZHTSp83fXl60FGhj0iy0Jk/1atj4qxP3tw4bVFNxnFYrn//RW9kh8fLuX
 ymhMA
X-Developer-Key: i=iacobcatalin@gmail.com; a=openpgp;
 fpr=F609BFABD84EB5C9DDDC37EDE89C6A3571CD0E33
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14882-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1804B640555

Commit 1cea5180f2f8 ("block: remove pktcdvd driver") left behind a
CONFIG_CONFIG_CDROM_PKTCDVD reference in defconfigs. Remove it.

Signed-off-by: Catalin Iacob <iacobcatalin@gmail.com>
---
 arch/sh/configs/sh2007_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sh/configs/sh2007_defconfig b/arch/sh/configs/sh2007_defconfig
index 5d9080499485..f287a41cd38c 100644
--- a/arch/sh/configs/sh2007_defconfig
+++ b/arch/sh/configs/sh2007_defconfig
@@ -45,7 +45,6 @@ CONFIG_NETWORK_SECMARK=y
 CONFIG_NET_PKTGEN=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_CDROM_PKTCDVD=y
 CONFIG_RAID_ATTRS=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y

-- 
2.54.0


