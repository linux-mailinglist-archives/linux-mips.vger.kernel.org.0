Return-Path: <linux-mips+bounces-14931-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C4hfL6zUJmpllQIAu9opvQ
	(envelope-from <linux-mips+bounces-14931-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 16:41:48 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E32657688
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 16:41:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IoIQwmOp;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14931-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14931-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10DFC31A8B0A
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FE53D34BB;
	Mon,  8 Jun 2026 14:28:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0FF3D3339
	for <linux-mips@vger.kernel.org>; Mon,  8 Jun 2026 14:28:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928895; cv=none; b=Ks7UCKt0jTmSX4h1DYigSnHUbSJU4th091H9a6WBChoXfZ7HJ/frXZwxMjAEsntWJU2rCWA2KiOIFQI6ZSeZ3kRt1RVo7rp4snDc1lj4HUlUVcj1uGwn0GmMjgQtEjs53VBfOu6lDj7CvV/OoEB8sp56yllL4D7Ug4k8zsXggwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928895; c=relaxed/simple;
	bh=+ZZ7cFq5dwFJfX2qzMhubJAhfsGyZm3Hq/4kBQpei7Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 In-Reply-To:References:To:Cc; b=D3/lKpyeeCFCLYEfnY1w0QXD0ECQ8tAZ2Rt8eBuyS4XFfvnxlN1IDSFAivEFvz66ldNrKp5LS9ZWsqoT/rB0tJ56ELE4C5MQKUdrHDm8L4QTXiMlCxXOyizYAF6BNXs67JRbnJJa1HNSaVb9nm/+NUqoaQ4q5DE8/CxUPKAUUa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoIQwmOp; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso6072345e9.1
        for <linux-mips@vger.kernel.org>; Mon, 08 Jun 2026 07:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780928892; x=1781533692; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:content-transfer-encoding:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmsMCsySwkboeE/wYirejWrkdI8tJ+BFCA1yM7dXRi4=;
        b=IoIQwmOpitYCWf1Fbq/XWSjEnmtqWy4WXJRV4UN6yIJ5GWSUFJws3A7IwzfWhpdftL
         JgOL/KyS9Sw5/u9nUsO7EMDSPgfSKsfPtp2SPsqamtDKMKuxn+OhLLMQtr2i90ZVNbGx
         282TxW+4AhVX2BGZWk4Rs1uIin8GHedGz7HVe+hI3o7UxXfG9Fxip5UTQWBU4H8RQUhw
         LS9LxIRYsO+wsEBgCemOvhV+l3addkWQtYKeFEQ/5stpUyd2l1daoTBnvrB4sbKyJoqh
         nZOLx4dizF6Fk6e1kSZP+ijixSkkaWjnvNavI0dmbc4WlwPxj+ost+X/pfBuiookxr+8
         1wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928892; x=1781533692;
        h=cc:to:references:in-reply-to:content-transfer-encoding:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmsMCsySwkboeE/wYirejWrkdI8tJ+BFCA1yM7dXRi4=;
        b=C4ueN4AE5aStvATfcMIl3xTLPGG2GeP3k1x1uSP8LSQ5r/MLFYPFgQUnqNrbpc69He
         jhvEiY1OdUVcWmwiuyO+g6OC56drbCjAet/N2/9l7XK4px0uD+NMz6npFDv5hjyECc0o
         GA77Bwv53UPCvHUFS3F4HCzABVzK74VNjVtY3bXKAE49MDDw+vbVOHmZGtoXNfxyPpQ9
         mlEfWS3MVduHe2SEBW3MZWJXjJqsB6LiPu1/j3vmRs8hW4K7sMJrgr7qkwlmG8+clSH8
         sK5WwvabZkrkp/BGi89r8dfkrois5knwMVzKzwRRXYjEcThYIpZPyxMXj37YAcWyiDvE
         XtFA==
X-Gm-Message-State: AOJu0YxcAQjmX3ag49VlVzbXlqFy2PE9jimgMF49oCZuR63dnXbGQbRS
	nzSqcpa9PZMR4O3b2A+RFK7HrYhKvacG6FM5mu9GMGUOPCh8itkCAdMm
X-Gm-Gg: Acq92OEegPH7tIFjn6rCXCVnEUEBLgCGWDm248XRxOOOvZ+EAIUXJdbaQySteTnxVdh
	1pJ1l0KyRxmyKapCyeY+1LSzli4jq7DNy74aBLXRdeK54PZfHgQ+6l2r0nZk3PAKsmF/DLKTa3t
	voKWq4LAwDo35CSqhth+IeQQQH6Bzrj9I6pNeKDQDXHb+XmGrERHQKoiBhlaKaMCygnTS48VjhG
	mX7bYqiXK+wvg88x+QoundxMviKDv2AM9kVI72Yz1wcvXT8Fq9KpBT2EMYAmZqArjsuLvHfy6kR
	d2GAY9/AtcRr1ROKkafBGuWrMjT9hiS6Z6uBA23vdJ3vRh5C6rMpzuRTzljK3KR/GbFLO9g7rGh
	F9sFJPqRvT6AmL2XafdjmOAI8jzic/Y08OYn3UCWYPx6eEvPlV2cLi06ncf2wpqXkTuGy2syUWx
	CUb/l3MRZ5/1wB80+RtDA/flvuB4JBRKw+
X-Received: by 2002:a05:600c:8b0c:b0:490:ba61:7981 with SMTP id 5b1f17b1804b1-490c25c1e4amr261216285e9.23.1780928891973;
        Mon, 08 Jun 2026 07:28:11 -0700 (PDT)
Received: from localhost ([94.53.77.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3a87dasm384624305e9.7.2026.06.08.07.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:28:11 -0700 (PDT)
From: Catalin Iacob <iacobcatalin@gmail.com>
Subject: [PATCH v4 0/5] Remove remaining references to the pktcdvd driver
Date: Mon, 08 Jun 2026 17:29:15 +0300
Message-Id: <20260608-remove-pktcdvd-references-v4-0-72f88b04cc87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43Ny4oCMRCF4VcJtbaGXCoBe+V7yCxiUtHM2BeSn
 qBIv7u0LkZmIbM8cPj+G1QumSt04gaFW655HKATtBEQTn44MuYInQAttZPWSCzcj41x+p5DbBE
 LJy48BK64jTY447S3kWEjYCqc8uVh7z+fu/4cvjjMK7g+TrnOY7k+4k2tv/90mkKF3lu3JRXJK
 Ls79j6fP8LYw9pp+ldy0ryTNCoMRFIrS9Ea/1cyrxK9kwxKZJ2kSwdiTvQqLctyB3V1sixoAQA
 A
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
 Jens Axboe <axboe@kernel.dk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Catalin Iacob <iacobcatalin@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3149;
 i=iacobcatalin@gmail.com; h=from:subject:message-id;
 bh=+ZZ7cFq5dwFJfX2qzMhubJAhfsGyZm3Hq/4kBQpei7Y=;
 b=owGbwMvMwCX261qtXAKXKjvjabUkhiy1i/vDZ3kkXfQ6eyQ6d6J4Eb/bGbG7W3VcZA8ZBvt2Z
 ezoy9vWUcrCIMbFICumyPLi3PW2DXvOBNxLsmuBmcPKBDKEgYtTACbCm8rwTy9bLUjZ98ixmcoV
 jbfvrmcqDFy6bsHa0zufu5kynAsrNmP4xbxzhuSHTS1CS8RM37mtmmTYV/139uHnc4rvTq8MNdx
 RzwQA
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
	TAGGED_FROM(0.00)[bounces-14931-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:axboe@kernel.dk,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:iacobcatalin@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[iacobcatalin@gmail.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,libc.org,physik.fu-berlin.de,davemloft.net,gaisler.com,HansenPartnership.com,oracle.com,kernel.dk];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35E32657688

Found this incidentally while looking at kernel sources to understand
what pktcdvd is

Signed-off-by: Catalin Iacob <iacobcatalin@gmail.com>
---
Changes in v4:
- Combined the removal of the export and moving the declaration to the
  private header info the same patch as requested by Bart. No code
  change.
- Link to v3: https://patch.msgid.link/20260604-remove-pktcdvd-references-v3-0-e2f06fb4eef4@gmail.com

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
Catalin Iacob (5):
      scsi: core: Remove export for scsi_device_from_queue()
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
base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
change-id: 20260530-remove-pktcdvd-references-9d5c6362a5de

Best regards,
--  
Catalin Iacob <iacobcatalin@gmail.com>


