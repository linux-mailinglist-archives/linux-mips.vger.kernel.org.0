Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E79A192693
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2019 16:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfHSOXr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Aug 2019 10:23:47 -0400
Received: from forward100o.mail.yandex.net ([37.140.190.180]:55283 "EHLO
        forward100o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbfHSOXr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Aug 2019 10:23:47 -0400
Received: from mxback9j.mail.yandex.net (mxback9j.mail.yandex.net [IPv6:2a02:6b8:0:1619::112])
        by forward100o.mail.yandex.net (Yandex) with ESMTP id 9BB144AC0712;
        Mon, 19 Aug 2019 17:23:44 +0300 (MSK)
Received: from smtp1o.mail.yandex.net (smtp1o.mail.yandex.net [2a02:6b8:0:1a2d::25])
        by mxback9j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id fncYk6eTLV-Ni2ut26A;
        Mon, 19 Aug 2019 17:23:44 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566224624;
        bh=xZubcjYlFdlf74xJxF7aDv1FUk3454Da8DuPkW5Zta0=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=HcMBv610hXYmSaSjMVvyfBJCqUSFsZt/3GjsTBFeh3l56bM5i+Jc2mMI1cUfR17e7
         DnNBi9QwlLfuQAEXtnRtnNEQKj5zFbBGgipaA4PAfBcQrTG4jyH5p3tIyNvDsJ5yvx
         8LeVUf93OdDmCIxxHdKij7VFoGW4AdaSxQfi8Q8k=
Authentication-Results: mxback9j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id StE3L42zOl-NeUmGVOw;
        Mon, 19 Aug 2019 17:23:43 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 3/8] MIPS: malta: Drop prom_free_prom_memory
Date:   Mon, 19 Aug 2019 22:23:08 +0800
Message-Id: <20190819142313.3535-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
References: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Current prom_free_prom_memory is freeing maps marked
as BOOT_MEM_ROM_DATA, however, nobody is exactly setting
this type for malta.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/mti-malta/malta-memory.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/mips/mti-malta/malta-memory.c b/arch/mips/mti-malta/malta-memory.c
index 868921adef1d..7c25a0a2345c 100644
--- a/arch/mips/mti-malta/malta-memory.c
+++ b/arch/mips/mti-malta/malta-memory.c
@@ -39,17 +39,6 @@ void __init fw_meminit(void)
 
 void __init prom_free_prom_memory(void)
 {
-	unsigned long addr;
-	int i;
-
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		if (boot_mem_map.map[i].type != BOOT_MEM_ROM_DATA)
-			continue;
-
-		addr = boot_mem_map.map[i].addr;
-		free_init_pages("YAMON memory",
-				addr, addr + boot_mem_map.map[i].size);
-	}
 }
 
 phys_addr_t mips_cdmm_phys_base(void)
-- 
2.22.0

