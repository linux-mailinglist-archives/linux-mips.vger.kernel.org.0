Return-Path: <linux-mips+bounces-9121-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DE5AC7669
	for <lists+linux-mips@lfdr.de>; Thu, 29 May 2025 05:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3237416575E
	for <lists+linux-mips@lfdr.de>; Thu, 29 May 2025 03:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CBC19B3EC;
	Thu, 29 May 2025 03:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wsHkUp2I"
X-Original-To: linux-mips@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C862629C;
	Thu, 29 May 2025 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748488801; cv=none; b=Ahe5A0ywN8FH4QWTDGl8ZCdVHBbB57VgYNztqMcjzBc+V1/wX7i1LEr1bdeIcUkaxiFsA4alRDfOs+e4AhXa62tPECIQTNdB+2mEiMD/VmNqTzQUe+7uDISW9rY5Np6hBoH/ePQ/jDFvzAeMP1sGY8GZwYaMG1g1gxXwWU+YsRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748488801; c=relaxed/simple;
	bh=b2wXd1XxZ872pz6LwSUXlLKEagUiF+6lVeALdahMFvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o2umkz7HAfrWBht6u5eWgXfmanCWOeytxpkC7PJuM5RpZ6roMK0jeuglvsTOlDtRMnXaxxeU9/bQZ7bpOeD15Q3H/7GxD7mis3JxcVjs2Qw+MRpQF577D0UKSsLZDN8eqltCI6uXFgWV+OB4+aaXkXV/0kYUP4wfQxmOiua3nME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wsHkUp2I; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=yNMsYmfB5FViVoXhtI5l6hDctxvV+4QqVzMu0oJ9wLY=; b=wsHkUp2IkZRsKYVarcI13+U4ui
	WoQBh3xuwrg4ETP50z7OL+j289cZw1Cx80YIcbzceVW8148eU6sLFVoIg+SJQmH6h9y+TW4CiKMTT
	cRd4O5lYIhXt3upwyTxRATzCtvcsnflZ9Uqve4PCDfZ2Fx4kQa6YtKaj2g+WVtHHgJoPdjyJ/8Hya
	x48H5Q943xC1wYhZskkQ3i7emJMWOx5tAKpxjd8HzoFFYwGcYFGFuwhR3kvUqbbnp/7tg7/4hHYZM
	F9hx7qxtK1srHsrHZsr4hEr+KTHMyxyNIRSPN6Ks27hsEK/zE0kRMlpOH0+DwWQ5fkQR6aMHuwACO
	ORecIsaw==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKToD-0000000EoGX-0kjb;
	Thu, 29 May 2025 03:19:57 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] MIPS: loongson2ef: cs5536: add missing function prototypes
Date: Wed, 28 May 2025 20:19:56 -0700
Message-ID: <20250529031956.3993115-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing function prototypes for cs5536, mostly for PCI functions,
and for init_mfgpt_clocksource().

arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:15:6: warning: no previous prototype for 'pci_ide_write_reg' [-Wmissing-prototypes]
   15 | void pci_ide_write_reg(int reg, u32 value)
arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:96:5: warning: no previous prototype for 'pci_ide_read_reg' [-Wmissing-prototypes]
   96 | u32 pci_ide_read_reg(int reg)

arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:15:6: warning: no previous prototype for 'pci_ehci_write_reg' [-Wmissing-prototypes]
   15 | void pci_ehci_write_reg(int reg, u32 value)
arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:75:5: warning: no previous prototype for 'pci_ehci_read_reg' [-Wmissing-prototypes]
   75 | u32 pci_ehci_read_reg(int reg)

arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:15:6: warning: no previous prototype for 'pci_acc_write_reg' [-Wmissing-prototypes]
   15 | void pci_acc_write_reg(int reg, u32 value)
arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:62:5: warning: no previous prototype for 'pci_acc_read_reg' [-Wmissing-prototypes]
   62 | u32 pci_acc_read_reg(int reg)

arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:15:6: warning: no previous prototype for 'pci_ohci_write_reg' [-Wmissing-prototypes]
   15 | void pci_ohci_write_reg(int reg, u32 value)
arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:70:5: warning: no previous prototype for 'pci_ohci_read_reg' [-Wmissing-prototypes]
   70 | u32 pci_ohci_read_reg(int reg)

arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:84:6: warning: no previous prototype for 'pci_isa_write_bar' [-Wmissing-prototypes]
   84 | void pci_isa_write_bar(int n, u32 value)
arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:110:5: warning: no previous prototype for 'pci_isa_read_bar' [-Wmissing-prototypes]
  110 | u32 pci_isa_read_bar(int n)
arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:134:6: warning: no previous prototype for 'pci_isa_write_reg' [-Wmissing-prototypes]
  134 | void pci_isa_write_reg(int reg, u32 value)
arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:228:5: warning: no previous prototype for 'pci_isa_read_reg' [-Wmissing-prototypes]
  228 | u32 pci_isa_read_reg(int reg)

arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c:195:12: warning: no previous prototype for 'init_mfgpt_clocksource' [-Wmissing-prototypes]
  195 | int __init init_mfgpt_clocksource(void)

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_pci.h |   20 ++++++++++
 1 file changed, 20 insertions(+)

--- linux-next-20250522.orig/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_pci.h
+++ linux-next-20250522/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_pci.h
@@ -12,12 +12,32 @@
 #ifndef _CS5536_PCI_H
 #define _CS5536_PCI_H
 
+#include <linux/init.h>
 #include <linux/types.h>
 #include <linux/pci_regs.h>
 
 extern void cs5536_pci_conf_write4(int function, int reg, u32 value);
 extern u32 cs5536_pci_conf_read4(int function, int reg);
 
+extern void pci_ehci_write_reg(int reg, u32 value);
+extern u32 pci_ehci_read_reg(int reg);
+
+extern void pci_ide_write_reg(int reg, u32 value);
+extern u32 pci_ide_read_reg(int reg);
+
+extern void pci_acc_write_reg(int reg, u32 value);
+extern u32 pci_acc_read_reg(int reg);
+
+extern void pci_ohci_write_reg(int reg, u32 value);
+extern u32 pci_ohci_read_reg(int reg);
+
+extern void pci_isa_write_bar(int n, u32 value);
+extern u32 pci_isa_read_bar(int n);
+extern void pci_isa_write_reg(int reg, u32 value);
+extern u32 pci_isa_read_reg(int reg);
+
+extern int __init init_mfgpt_clocksource(void);
+
 #define CS5536_ACC_INTR		9
 #define CS5536_IDE_INTR		14
 #define CS5536_USB_INTR		11

