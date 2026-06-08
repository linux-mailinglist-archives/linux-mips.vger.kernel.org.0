Return-Path: <linux-mips+bounces-14936-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yaT2HPvWJmoIlgIAu9opvQ
	(envelope-from <linux-mips+bounces-14936-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 16:51:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC46657899
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 16:51:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=c4+PRLYf;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14936-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14936-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6FDD31BBB6C
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A773D9030;
	Mon,  8 Jun 2026 14:28:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F813D7D64
	for <linux-mips@vger.kernel.org>; Mon,  8 Jun 2026 14:28:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928902; cv=none; b=IAH6/jJJPobyepdpAjEGrfyjV7iD/fJKjfRb/Rxf4ahXOrAUYvhsju+Kz8rptYwBeyH5D0+RdZW89spM9bmSPFvuepc+3GRZo+PTuEbOPT4lVaugYWNvFQFteGcZFe5jOcXHFZqzbZM+y2LFdIWY7BlQjPUmShT0d6xiPFQX1AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928902; c=relaxed/simple;
	bh=T2wQkK65vboZ4IeGnr4NbeD+9D8laMYxlcwY9lW95Qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CajqXclDdBJGLyphQJjz+IeKenuRALXYSqUQ/l0ECZDBMHo+jQfdrxJqNej/+Zqz6+b1QX9B7jgzSviclKwEhupdUvO907Rn74htm1FpH9cO7C6XMi0PY5XLacB6ACoHFZruT8oQUEIfPtieUBvxuDziahXKfG+Y5QKaXpZU8gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4+PRLYf; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b9318997so32538845e9.2
        for <linux-mips@vger.kernel.org>; Mon, 08 Jun 2026 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780928900; x=1781533700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCy5icZAFPKbCxn3K3WrZKHkVhOrNfCywaz2Tw/0Yng=;
        b=c4+PRLYfSizK7opXh5cj1qYnHZKBU5HOolrz1/48cF1y3mCOrDbMK1C9CxUfYsJYqw
         nFwyfrpmjtGiv3xlQbKtUv33/6XzyLzmL3hUi3XRHhSrzMAzNwcvmDs11knaw+mCoV5d
         KCR3G79oQrpXz3H/bkx5axQ5AntiOCfnc3ySkzUzQ03qwpFqrpCEx3D4GLCHy5cfFZTq
         JHPwH0Uh0cuHD4e1++rK7KclkVhGSQY69JkC3goefx+MOtsR7qy4YfIeaBy7ZnmKsfBW
         BDxyIqb9RXOFzHPvutpfAj+wnsIMDHbSYCQ7Oev5Jle/z6izykTtfZxFVcpTzUjmFNjy
         okSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928900; x=1781533700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nCy5icZAFPKbCxn3K3WrZKHkVhOrNfCywaz2Tw/0Yng=;
        b=a8sctnb92CrSQPmVvhg5COAjdma3BvX/x2zIukqi3KcI0OWKNm90dxnhNz5jaU1VuE
         SGTnt78x6C51Jqv8E7UbTnOmSMtkA4PO3xKKns4BwNH2uf5qGxq4rJrQPri3EhpsuBeI
         xnQQWohC3zbRDXxM0y2mJn5hB75kxLZNIZokfPp93WUPm07jqu4Cg+OoeWzFYz9+n0QJ
         LWeJU4Mxvtijt6nBUWmdp4xXYehDSnQAjoO9hMLeDqb/ono8/C6ud6abPebVnCaWg8TN
         Ax+NVsJItCvx0YAE9XkQzka9XpaSdnZ+3PhiRROiKETwhHNV8ddvqzUWKeEQW9N/vZPo
         F7Hw==
X-Gm-Message-State: AOJu0YyHTaY/ah5DxthJmTXlwvuKGMvxOPhp7foQ0tQ5ec1324S4K2D3
	6CiUwdkDjKYhKLE9C3A2mcmOJEAFWDvLbTrP0K0WQD0Z4w0RQ8jWwOQP
X-Gm-Gg: Acq92OGogbFY8hxGvipmVaQWLhNHZyyTD3RkIzjOc5Byf+13VKpQ76DAHoAPJ1Xygu9
	Kr/yMaz/kPwQq/8TdiFWEPHzntLGNZt2oDDrS73WPqM/GyCDg+pVjdXEU3XU04mzKPXLeGZqoxV
	9EmVfdWj0B7wdKkZ6x/TYbXlf7xhlois0aiCZANW8DDG/OzmjmVo7DJbfbHgG0s7Kr1TkdedQ7y
	ff8qaPsmXBkerj6WfGnYwlO1DKDamvY4n/hXGJFujgE/5BCfhx/ZFk5mP6VzN8g9MSCL798USOv
	btMUlk/QynhURjz+Q3RDRjFZjzQuGXAlJqE3j+YPNdB/8ATfNg7/Mrw2KkoWZ+JtL6oCZzSp5In
	/q+Xtdt7EdDpUzNeJ1j9kS4guI31p/rBQ8U1dgGHxd2HNZssitaygPEztLHV2xhNar+VThJlPdb
	XsT25agsmCF3RMDfEmYaT3VCpnvN/Ryv0k
X-Received: by 2002:a05:600c:1c13:b0:490:a646:9d75 with SMTP id 5b1f17b1804b1-490c25acd23mr285116345e9.9.1780928899673;
        Mon, 08 Jun 2026 07:28:19 -0700 (PDT)
Received: from localhost ([94.53.77.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm41300869f8f.32.2026.06.08.07.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:28:19 -0700 (PDT)
From: Catalin Iacob <iacobcatalin@gmail.com>
Date: Mon, 08 Jun 2026 17:29:20 +0300
Subject: [PATCH v4 5/5] sparc: Remove remaining defconfig references to the
 pktcdvd driver
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-remove-pktcdvd-references-v4-5-72f88b04cc87@gmail.com>
References: <20260608-remove-pktcdvd-references-v4-0-72f88b04cc87@gmail.com>
In-Reply-To: <20260608-remove-pktcdvd-references-v4-0-72f88b04cc87@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=iacobcatalin@gmail.com;
 h=from:subject:message-id; bh=T2wQkK65vboZ4IeGnr4NbeD+9D8laMYxlcwY9lW95Qo=;
 b=owGbwMvMwCX261qtXAKXKjvjabUkhiy1iwe+fN176W16YWiVeI9314lb07p6Lzj+3W/788muq
 H+7k59N6ShlYRDjYpAVU2R5ce5624Y9ZwLuJdm1wMxhZQIZwsDFKQAT2fWHkWHapXnibIku550W
 mbk6q0jxNRhGT0j+lmLZuitp3hHHL9sYGWbP0NXee8F19p7y7cxsz/zmV57RcN3f5PimMlXv5Um
 OFi4A
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
	TAGGED_FROM(0.00)[bounces-14936-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EC46657899

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


