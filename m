Return-Path: <linux-mips+bounces-14877-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Azv1DiR9IWpKHQEAu9opvQ
	(envelope-from <linux-mips+bounces-14877-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 15:27:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE76640509
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 15:26:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Pf2b2OD9;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14877-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-14877-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB304301A7E8
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 13:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E1647DD70;
	Thu,  4 Jun 2026 13:19:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC33A47DD73
	for <linux-mips@vger.kernel.org>; Thu,  4 Jun 2026 13:19:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579196; cv=none; b=U2FXdIoqI6qUeo6b/B/uNxOVYP/Bv0g8mUhNsgUuai8TX8xk8ZZ9EvKlEOHGS7ZinqbWJoaO7kmiu3VRrbsQaVLMY7IUMwuUCv6VKllUpxpSm+PeUzJqlbl6Mpjs1CIMKafFdMKMiIShQdbmJ6OA4sJD8YYcd18K6pje8glWHrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579196; c=relaxed/simple;
	bh=R4we36p9qeb3bR5yeLPjWMa3iuESdosoLdNbQrwnbbw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 In-Reply-To:References:To:Cc; b=a5a3+YFaKOZt90Z2N4k9xeqblqdVF5pgdzp+4TbiNe00m+8gVK6wtVDV5A7IPi7Z73fpAXAXNezU2HM2Ee+cLcflRMgnZTESYYBKsFO1xXI546lqR8CTOLbPkxzSY0PM1mJic2lF1UfC1IGlSNqvlZpLaVoqLqOzPnD/Dv6X2S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pf2b2OD9; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45efa80e0afso600208f8f.2
        for <linux-mips@vger.kernel.org>; Thu, 04 Jun 2026 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780579188; x=1781183988; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:content-transfer-encoding:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xn1l2TJuksG9hWrI7UNiVITikDxe2DLajifMmxjpHU=;
        b=Pf2b2OD9pC8hs0fTQ+5aZmCNFECAqCJHP0dDB3926pvRYhjmjWMF0IwmMjR1tOGle3
         u2bJegNtAVZFAm5R6mJTR0+CVjqjTpxf4ffevMgM9C2KMpkeF7PIG8cpa7dY1wePxJxP
         IJ08WL0XZ4Cautw9u4DYVWpC2WzedNfTrIZ2BR+MkDhwLhj3sW7JWigw4aS4Rr12YFLP
         SzOCko8R9LPxsLCE6ImAfixwF9gE1W1HP3AxBxNx9mOCdbqpnoKMAUJcvLCGl0cHUfrz
         0ol0OKJyzeAxSTJ/fiPRQAyvidQpArRn9MNrRzBL7kdCsP80jfX7bxX5/dB4jfrfE1Wb
         GSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579188; x=1781183988;
        h=cc:to:references:in-reply-to:content-transfer-encoding:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xn1l2TJuksG9hWrI7UNiVITikDxe2DLajifMmxjpHU=;
        b=VRcK5CYBzFMyQCX673qqTBJAaiHHvNQJhKD26OLzY59d6MdE556bohLu1mNPcXP2Tl
         i7sUCJ+ByL4/RSUYJu0CTUnAqRTIlU7vkoLPZVwrvHUNo0gYeXaMVbepSxhkRj6PuV/k
         lleV/OVvEpKxxYe5F6RxdN56ytzmhhv/vYIcdIocEiIGHIAul5Ip0J58muw0+y+TRQkh
         NpoeEaugL2QkhrHQmrzs1wJQTL8Eu+Ge1qyMHZhwkf5WQmis1QRWJkp0SocIS0s4kR4N
         6gpXJsRC48mm+Gxwq2GlC8l4wHnvoRxIPFu0HnBxru5hZfVj+0gY3iC/c5OCOLIexgsu
         kMgQ==
X-Gm-Message-State: AOJu0YydUQh+xIw+2p2dY6/NZq8V2YJ0Y9yUdkGW6pH1XHSnjjDcGbb4
	Ii7cLWp5ug8ArmjLMVOY+rfpPVPrMLNBqDDfImVU5ddYBuPVtw3ptfgC
X-Gm-Gg: Acq92OFCsoJFoeBmqCyrO3Hz+iTqoIoiRw57Dc7gdPPhUw9A3jm6PgMP3dEGkaf1rAY
	qaQ90cNc6YXDHMsNb+Kziiqe2eGmE7KvkVRA4bTMnJI9cq0YGsyI8dgQQhgWWIhBcuMY+AxEysK
	fM1ks1MZyl1cvYbg6Xr6WM1wlauS5W9vbvOKzEoPmXThOSor2Pho+BbfWFuGedXpPrA1JsgR+GH
	ktVBr/iO2iPk6uckg8tLjJkNe/Y1CVKyMxhCc0RxuqtNL/+royS8Pc86KSg+HurU84Lt5w2FPBw
	lgVfr52okZ080t/i2HC7zESE0i26rPGzHutSHZ2FZgFUf/Yin4igZIKoW/9jkNe4Xz2zplLIR2s
	Hm4dVwC+1ku7iWml1BgcC48HOgc3iUBZRmsTnomcaUVZrtWJ7HIdXXmr1rFr1aeV64glOYSYxvq
	/a2vqmOLbu6fXPCGAkNZAFKtZtYh70wjMd
X-Received: by 2002:a05:6000:40c8:b0:460:1d74:a1b2 with SMTP id ffacd0b85a97d-460216e681dmr12313234f8f.16.1780579187766;
        Thu, 04 Jun 2026 06:19:47 -0700 (PDT)
Received: from localhost ([94.53.77.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm16337889f8f.9.2026.06.04.06.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:19:47 -0700 (PDT)
From: Catalin Iacob <iacobcatalin@gmail.com>
Subject: [PATCH v3 0/6] Remove remaining references to the pktcdvd driver
Date: Thu, 04 Jun 2026 16:20:23 +0300
Message-Id: <20260604-remove-pktcdvd-references-v3-0-e2f06fb4eef4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NzQ7CIBAGX6XhLIb/pJ58D+MBYW1RWxpAomn67
 kI96Ml4nOy3MzOKEBxEtGtmFCC76PxYgG8aZHo9doCdLYwYYYpITnCAwWfA0zUZm23BMwQYDUT
 cWmkUV0xLC6j8T+XmHqv7cHxzvJ8uYFIV1kXvYvLhucYzrbt/OpliirWWqhXUCk7lvhu0u22NH
 1DtZPYxKcJ/mVgxGSEIo1JYyfW3aVmWF8+MvUgeAQAA
X-Change-ID: 20260530-remove-pktcdvd-references-9d5c6362a5de
In-Reply-To: <20260530-remove-pktcdvd-references-v1-1-aa56941d4315@gmail.com>
References: <20260530-remove-pktcdvd-references-v1-1-aa56941d4315@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2996;
 i=iacobcatalin@gmail.com; h=from:subject:message-id;
 bh=R4we36p9qeb3bR5yeLPjWMa3iuESdosoLdNbQrwnbbw=;
 b=owGbwMvMwCX261qtXAKXKjvjabUkhizF6nWWTd8PNG5pa6ncseOD6qKrzIFOLXtr1v1hfSnD2
 7Kir3BaRykLgxgXg6yYIsuLc9fbNuw5E3Avya4FZg4rE8gQBi5OAZhIsCAjQ2tH5sHzGVb84Zqa
 1vs95lneP3w/Z7cBZ+JTpWcfsk4JCDAy7BLNvOpwTvaV8Czn9C3Pz2uIy76cJe3ct+IVW8sRo1U
 f2QA=
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
	TAGGED_FROM(0.00)[bounces-14877-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AE76640509

Found this incidentally while looking at kernel sources to understand
what pktcdvd is

Signed-off-by: Catalin Iacob <iacobcatalin@gmail.com>
---
Changes in v3:
- Split the defconfig changes in one patch per arch
- Add patch to move the declaration of scsi_device_from_queue to the
  private header as suggested by John
- Link to v2: https://patch.msgid.link/20260603-remove-pktcdvd-references-v2-1-c4402154d53a@gmail.com

Changes in v2:
- Reworded commit message on John Paul Adrian's suggestion to be about
  the removed references not the export symbol
- Link to v1: https://patch.msgid.link/20260530-remove-pktcdvd-references-v1-1-aa56941d4315@gmail.com

To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
To: Rich Felker <dalias@libc.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "David S. Miller" <davem@davemloft.net>
To: Andreas Larsson <andreas@gaisler.com>
Cc: linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org

---
Catalin Iacob (6):
      scsi: core: Remove remaining reference to the pktcdvd driver
      scsi: core: Move scsi_device_from_queue() to scsi_priv.h
      mips: Remove remaining defconfig references to the pktcdvd driver
      powerpc: Remove remaining defconfig references to the pktcdvd driver
      sh: Remove remaining defconfig reference to the pktcdvd driver
      sparc: Remove remaining defconfig references to the pktcdvd driver

 arch/mips/configs/fuloong2e_defconfig    | 1 -
 arch/mips/configs/ip22_defconfig         | 1 -
 arch/mips/configs/ip27_defconfig         | 1 -
 arch/mips/configs/ip30_defconfig         | 1 -
 arch/mips/configs/jazz_defconfig         | 1 -
 arch/mips/configs/malta_defconfig        | 1 -
 arch/mips/configs/malta_kvm_defconfig    | 1 -
 arch/mips/configs/maltaup_xpa_defconfig  | 1 -
 arch/mips/configs/rm200_defconfig        | 1 -
 arch/mips/configs/sb1250_swarm_defconfig | 1 -
 arch/powerpc/configs/g5_defconfig        | 1 -
 arch/powerpc/configs/ppc6xx_defconfig    | 1 -
 arch/sh/configs/sh2007_defconfig         | 1 -
 arch/sparc/configs/sparc64_defconfig     | 2 --
 drivers/scsi/scsi_lib.c                  | 8 --------
 drivers/scsi/scsi_priv.h                 | 1 +
 include/scsi/scsi_device.h               | 1 -
 17 files changed, 1 insertion(+), 24 deletions(-)
---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260530-remove-pktcdvd-references-9d5c6362a5de

Best regards,
--  
Catalin Iacob <iacobcatalin@gmail.com>


