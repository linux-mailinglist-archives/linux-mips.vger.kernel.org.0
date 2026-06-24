Return-Path: <linux-mips+bounces-15178-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ULWwIa+SO2qhZwgAu9opvQ
	(envelope-from <linux-mips+bounces-15178-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 10:17:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CEE6BC830
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 10:17:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15178-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15178-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05021300B130
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 08:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A3339A7FA;
	Wed, 24 Jun 2026 08:17:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19E5346AE3;
	Wed, 24 Jun 2026 08:17:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782289063; cv=none; b=hSbPrEbr7h+n3r496yJlP1h8SXhRkpu+dPe3qWdb1JEU5gAMjixINFlZVIBi0yhK/WOWFAu5EdmOJIgUHs/pEQioQPcN354unyN+vW8Cyq5tgvzmphVi9OkXYyedX09DEn/R7suLyXHDKSPCZigvGBGeEr+VE9lywinz0MrQfnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782289063; c=relaxed/simple;
	bh=IKwWY2KcEnwkx+U8pBgQ9z1BZZhEqdcHk64z/V+kpp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WdYsqo9rCnUkGjQ34YF4K75lDsvCSg6GQliryZ+F7ROGMoc0WO/3ogLY+Y1JmSCzRP2ZbS5aOUhphJZs82AsJtqeIMxgBwhCBmUggIAZPcXGH+9iTATXtGmKif1jHeBNkhJGUaMLK1IOoXZhPF9auEXCgE2CYCGux0ZT7F/nM2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABHW9KjkjtqKA2wFQ--.14729S2;
	Wed, 24 Jun 2026 16:17:39 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: configs: Enable the current Ingenic USB PHY symbol
Date: Wed, 24 Jun 2026 16:17:39 +0800
Message-ID: <20260624081739.1283-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHW9KjkjtqKA2wFQ--.14729S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Wry3JFW8try5ur1DJr1rtFb_yoW8uFW7pw
	1rXa9rJF4kXF1rJFW7ZrWvgrW5tFsxJrWYkF1jyFyUAryrZ3yUAr93trnrJrZrXrZxJF4F
	9as3K3ZIyr4IywUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj9a97UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TAGGED_FROM(0.00)[bounces-15178-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:pengpeng@iscas.ac.cn,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1CEE6BC830

The Ingenic USB PHY provider is now built from phy-ingenic-usb.o under
`CONFIG_PHY_INGENIC_USB`.

The Ingenic defconfigs below still enable the stale `CONFIG_JZ4770_PHY`
symbol.  That symbol no longer carries the provider object, so the
defconfigs lose the intended USB PHY provider after olddefconfig.

Use `CONFIG_PHY_INGENIC_USB` instead.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/mips/configs/cu1000-neo_defconfig | 2 +-
 arch/mips/configs/cu1830-neo_defconfig | 2 +-
 arch/mips/configs/gcw0_defconfig       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -86,7 +86,7 @@ CONFIG_RTC_DRV_JZ4740=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_JZ4780=y
 # CONFIG_INGENIC_TIMER is not set
 CONFIG_INGENIC_SYSOST=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_JZ4770_PHY=y
+CONFIG_PHY_INGENIC_USB=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_AUTOFS_FS=y
diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
--- a/arch/mips/configs/cu1830-neo_defconfig
+++ b/arch/mips/configs/cu1830-neo_defconfig
@@ -89,7 +89,7 @@ CONFIG_RTC_DRV_JZ4740=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_JZ4780=y
 # CONFIG_INGENIC_TIMER is not set
 CONFIG_INGENIC_SYSOST=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_JZ4770_PHY=y
+CONFIG_PHY_INGENIC_USB=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_AUTOFS_FS=y
diff --git a/arch/mips/configs/gcw0_defconfig b/arch/mips/configs/gcw0_defconfig
--- a/arch/mips/configs/gcw0_defconfig
+++ b/arch/mips/configs/gcw0_defconfig
@@ -99,7 +99,7 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_MUSB_HDRC=y
 CONFIG_USB_MUSB_GADGET=y
 CONFIG_USB_MUSB_JZ4740=y
 CONFIG_USB_INVENTRA_DMA=y
-CONFIG_JZ4770_PHY=y
+CONFIG_PHY_INGENIC_USB=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_VBUS_DRAW=500
 CONFIG_USB_ETH=y


