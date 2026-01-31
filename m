Return-Path: <linux-mips+bounces-13073-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDwKNMp2fmlZZQIAu9opvQ
	(envelope-from <linux-mips+bounces-13073-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 22:40:26 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F18C4092
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 22:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A68113004C8B
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 21:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE50B378D8A;
	Sat, 31 Jan 2026 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b="DpvBFOwn"
X-Original-To: linux-mips@vger.kernel.org
Received: from sg-1-12.ptr.blmpb.com (sg-1-12.ptr.blmpb.com [118.26.132.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB85D366802
	for <linux-mips@vger.kernel.org>; Sat, 31 Jan 2026 21:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769895622; cv=none; b=tPYjyB88FxNjfuckj82jfl982HpwOsjpjYH6tPCTMXg1ZwfcaSz3tEOfKe1Hmmu+me0n3QKuREKxMxqX0d29XEpHLSGzh/lIePnmia+436gfLwhbaQ192K52eFNCSaT6K9aT0e+kIBZMYsPwKI1nCDLtyixH1mCGjwASfg7ZKyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769895622; c=relaxed/simple;
	bh=j4jlOc5cR+G+NdEBmQzjDU8zWQIjODiRtQswDvv0TkA=;
	h=From:Date:To:Mime-Version:Subject:Message-Id:Content-Type:Cc; b=XNSQ80BbvQveVQz9bkZ8/7Me4k892sxKYMsDxKv2pnX0LlJ04Q2tF6Tdk1FczRY7lAl/+aotsZi8ZS87SlRj96aRbYfZnkP8oDEOjjyUCOQbt6GxZiDz2J5xwedh6aFikIDUy/1fFsqdmGJH6wMN17yL62U25NYkTijPxwEa4rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com; spf=pass smtp.mailfrom=oss.cipunited.com; dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b=DpvBFOwn; arc=none smtp.client-ip=118.26.132.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1769895607;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=NnABy4zV692xOKKFU/DGtL2JlSYlyuPO3ZWGMc1iDR0=;
 b=DpvBFOwnPFRUrZRce1HTcmOiWzICXNOUmPwYm+wWHbN1/+qN4qOp5CyNAE9d1Z946MFh+Y
 JiqmTN1DfsEZoMjy+t4smZQuOV+APQkMyX+Eh33dT8bpe0beGtxoUhKl+kGNlXMwE4A1IJ
 phzF7LZRSUcBduXcNL6Bt4SAR/q3+z8p4AQ6LFcS8rpsiYjYSNp3JvIR7fEL4X8tjISWkL
 t8M8PKUZO+hV81C8mgoBQOrGuuapA4DkJZGAzyh/5XyLna5JzHip4rsO44zuDn3v6+wA9N
 lY4qdW7PeOaY2lJ1Ceoys8tnlP4QcjbO59PtBp1LEuvZDHSK115/tGluSbdXMw==
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Date: Sun,  1 Feb 2026 05:32:57 +0800
Received: from tb.lan ([223.88.91.217]) by smtp.feishu.cn with ESMTPS; Sun, 01 Feb 2026 05:40:04 +0800
X-Mailer: git-send-email 2.51.0
X-Lms-Return-Path: <lba+2697e76b5+6d96fe+vger.kernel.org+rongrong@oss.cipunited.com>
To: "Jiaxun Yang" <jiaxun.yang@flygoat.com>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Subject: [PATCH 0/2] MIPS: Loongson2ef: Use pcibios_align_resource() to block io range
Message-Id: <20260131214003.833520-1-rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
Cc: "Rong Zhang" <rongrong@oss.cipunited.com>, "Rong Zhang" <i@rong.moe>, 
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	<linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oss.cipunited.com,none];
	R_DKIM_ALLOW(-0.20)[oss.cipunited.com:s=feishu2303200042];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13073-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rongrong@oss.cipunited.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[oss.cipunited.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.cipunited.com:mid,oss.cipunited.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0F18C4092
X-Rspamd-Action: no action

Loongson2ef reserves io range below 0x4000 (LOONGSON_PCI_IO_START) while
ISA-mode only IDE controller on the south bridge still has a hard
dependency on ISA IO ports.

The reservation was done by lifting loongson_pci_io_resource.start onto
0x4000. Prior to commit ae81aad5c2e1 ("MIPS: PCI: Use
pci_enable_resources()"), the arch specific pcibios_enable_resources()
did not check if the resources were claimed, which diverges from what
PCI core checks, effectively hiding the fact that IDE IO resources were
not properly within the resource tree. After starting to use
pcibios_enable_resources() from PCI core, enabling IDE controller fails:

  pata_cs5536 0000:00:0e.2: BAR 0 [io  0x01f0-0x01f7]: not claimed; can't enable device
  pata_cs5536 0000:00:0e.2: probe with driver pata_cs5536 failed with error -22

MIPS PCI code already has support for enforcing lower bounds using
PCIBIOS_MIN_IO in pcibios_align_resource() without altering the IO
window start address itself. Register PCI controller in plat_mem_setup()
instead of arch_initcall() to make it the root of other resources (e.g.,
i8259) and prevent resource conflicts. Then, make Loongson2ef PCI code
use PCIBIOS_MIN_IO too.

Rong Zhang (2):
  MIPS: Loongson2ef: Register PCI controller in early stage
  MIPS: Loongson2ef: Use pcibios_align_resource() to block io range

 .../include/asm/mach-loongson2ef/loongson.h    |  6 ++++++
 arch/mips/loongson2ef/common/pci.c             | 18 +++++++++++-------
 arch/mips/loongson2ef/common/setup.c           |  1 +
 3 files changed, 18 insertions(+), 7 deletions(-)


base-commit: ad9a728a3388dc5f66eab6b7135e0154249e9403
-- 
2.51.0

