Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD2DF139321
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 15:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgAMOHw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 09:07:52 -0500
Received: from forward102j.mail.yandex.net ([5.45.198.243]:58861 "EHLO
        forward102j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728801AbgAMOHw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 09:07:52 -0500
Received: from mxback13j.mail.yandex.net (mxback13j.mail.yandex.net [IPv6:2a02:6b8:0:1619::88])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id 54AD9F21435;
        Mon, 13 Jan 2020 17:07:49 +0300 (MSK)
Received: from myt2-ea6a2e0cbf34.qloud-c.yandex.net (myt2-ea6a2e0cbf34.qloud-c.yandex.net [2a02:6b8:c00:2e8e:0:640:ea6a:2e0c])
        by mxback13j.mail.yandex.net (mxback/Yandex) with ESMTP id 7umar6yfM8-7n6888lG;
        Mon, 13 Jan 2020 17:07:49 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578924469;
        bh=RmsVJbxfmJIPyEANphpuUuv7UaSpvPm9q6Y+Misk4d8=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=qZF6AX80hM491dl4ZurWUU4lIMkEHWZ2xq6wH4E+iLY5NJlzHN7IPzV5B65nwm7W3
         QZ1ChF6oqNs/jIs+8zVyiGAhK6lKva7bSvYf5NWYpzdQsZ/49rItwIoBvBmDq2tIP4
         7I+umMjtruhdpvIoUBWt+AOooerJVq3NyBDMuj+Q=
Authentication-Results: mxback13j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt2-ea6a2e0cbf34.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id pGFN2nLtP9-7aV4FhvH;
        Mon, 13 Jan 2020 17:07:45 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        linux-kernel@vger.kernel.org, hch@lst.de,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] MIPS: Define pgprot_dmacoherent according to coherentio status
Date:   Mon, 13 Jan 2020 22:07:04 +0800
Message-Id: <20200113140705.74605-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For MIPS chips that support coherentio DMA, it's always safe
to make DMA requests cached.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/dma-coherence.h | 14 ++++++++++++++
 arch/mips/kernel/setup.c              |  1 +
 2 files changed, 15 insertions(+)

diff --git a/arch/mips/include/asm/dma-coherence.h b/arch/mips/include/asm/dma-coherence.h
index 5eaa1fcc878a..bc0df7684cae 100644
--- a/arch/mips/include/asm/dma-coherence.h
+++ b/arch/mips/include/asm/dma-coherence.h
@@ -9,6 +9,8 @@
 #ifndef __ASM_DMA_COHERENCE_H
 #define __ASM_DMA_COHERENCE_H
 
+#include <asm/pgtable.h>
+
 enum coherent_io_user_state {
 	IO_COHERENCE_DEFAULT,
 	IO_COHERENCE_ENABLED,
@@ -35,4 +37,16 @@ static inline bool dev_is_dma_coherent(struct device *dev)
 #define hw_coherentio	0
 #endif /* CONFIG_DMA_MAYBE_COHERENT */
 
+#if !defined(CONFIG_DMA_PERDEV_COHERENT)
+#define pgprot_dmacoherent pgprot_dmacoherent
+static inline pgprot_t pgprot_dmacoherent(pgprot_t prot)
+{
+	if (coherentio == IO_COHERENCE_ENABLED ||
+		(coherentio == IO_COHERENCE_DEFAULT && hw_coherentio))
+		return prot;
+
+	return pgprot_noncached(prot);
+}
+#endif
+
 #endif
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 701f4bc3046f..01f725819df7 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -831,6 +831,7 @@ arch_initcall(debugfs_mips);
 enum coherent_io_user_state coherentio = IO_COHERENCE_DEFAULT;
 EXPORT_SYMBOL_GPL(coherentio);
 int hw_coherentio = 0;	/* Actual hardware supported DMA coherency setting. */
+EXPORT_SYMBOL_GPL(hw_coherentio);
 
 static int __init setcoherentio(char *str)
 {
-- 
2.24.1

