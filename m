Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48D623AB40
	for <lists+linux-mips@lfdr.de>; Mon,  3 Aug 2020 19:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgHCRC0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Aug 2020 13:02:26 -0400
Received: from crapouillou.net ([89.234.176.41]:37512 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgHCRCZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Aug 2020 13:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1596474107; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0DyTW3Alvq2rzufl7mfU1Fgl0tMj1QF82GiVpDq0woo=;
        b=HOKVERbAulMpCJeAzT80uH24NGyY1RDNVb3RRIRD94MdIe+cjRsd5f4m331zjGZdtBi01C
        LErNbbdhvlf4JjnhTiOtTWszz7dT2BxHOBzGvdIPgvJjOVzhvB2YqgbVvsStGxIzdlt+lh
        pqb7xwP3Spi2OTzUxo7qkoJOYsU8WJM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 05/13] MIPS: machine: Add get_system_type callback
Date:   Mon,  3 Aug 2020 19:01:16 +0200
Message-Id: <20200803170124.231110-6-paul@crapouillou.net>
In-Reply-To: <20200803170124.231110-1-paul@crapouillou.net>
References: <20200803170124.231110-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The global get_system_type() function in arch/mips/generic/ will then be
modified in a subsequent patch to call this callback if provided.

This change will allow mips_machine implementations to override the
behaviour of the global get_system_type() function.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/include/asm/machine.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/machine.h b/arch/mips/include/asm/machine.h
index 29ca344a8cab..433257e08d83 100644
--- a/arch/mips/include/asm/machine.h
+++ b/arch/mips/include/asm/machine.h
@@ -16,6 +16,7 @@ struct mips_machine {
 	bool (*detect)(void);
 	const void *(*fixup_fdt)(const void *fdt, const void *match_data);
 	unsigned int (*measure_hpt_freq)(void);
+	const char *(*get_system_type)(struct device_node *dtb);
 };
 
 extern long __mips_machines_start;
-- 
2.27.0

