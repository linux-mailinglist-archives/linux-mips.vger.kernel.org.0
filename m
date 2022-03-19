Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 952814DE6A3
	for <lists+linux-mips@lfdr.de>; Sat, 19 Mar 2022 08:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242344AbiCSHMk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Mar 2022 03:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234579AbiCSHMk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Mar 2022 03:12:40 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B05A2689B7
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 00:11:19 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id c2so6585218pga.10
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BfGRnf/z7W5ArUlF62xSoPtZ6L15hObjWG1DHqomhrA=;
        b=nMpz+AAFX9c4HxUAxMrJX9zfN12HcpTFOE6syrfVzF1VFHOSzC4CTuB4TR1UnU0a+i
         VWapFDhHw3Xo+017WIA/i5aXYYSh/8Ql8lukfl5rrklpC79CA2UyyKXauU3vxmP92eQQ
         nsTX1R8TbcR49Hz1ZkU4phEwDy4Q4EADTJw1B+4JvSDpVIpNPvTs8CfTMCEgvAizD+IE
         uXNLi5KvrTCT92CPJ5iMrRBgDVWKW/FV+3OfaGIqcbB0sr4TDBTE72lIlLoiJp1ulfBi
         SsvUPtB0Vy6t1BscfOul4wWRLWYu7kIyGMtPRmxbdg8Qi+KQ8LDJoUYmlC3nmSp4i5yv
         fTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BfGRnf/z7W5ArUlF62xSoPtZ6L15hObjWG1DHqomhrA=;
        b=T6J5wiFRNv8BzKrTPpI+7T0eJ9xiu9Ta6D1mOS49AaSJvctH0bZgs1PWJVkZFR8Wc2
         b+Y54Dfy7RqIGOj64xQ/70/CROrURWZFQmugTZybNKGWldjDLsZYkQa7SJkfAg5cY0MJ
         RfmewWFocR6Pp4Ic27Bo5Bto14IzwJ7ufGYBKWZZJB6EBO7gglMUMWUV+kPg0gbJekuK
         N9c3vuRM9oPMP4A3BbNmcM4texuWffAJovLiYgKdbItR7qW3yOaijuviF2VcOCwAqRu3
         /kjQ9ZxQr/7lhNBWYyml1WJQTKxSx6IYmuTCXD4lXySsRuEwqpT1HX0LForDNLbxdrK9
         1fxg==
X-Gm-Message-State: AOAM533avVqva4claqLPE9ieBdIoJM/k5TGKK/sVPyVkf+QXB0WLilZx
        wcXl0e/qEWZD2q9Od/JdqGw=
X-Google-Smtp-Source: ABdhPJwJ20ooARuExH+Ikwtors6q+luM9RqiClU80SEaxw1FRKBfFF9IbjByWDfXkpBtiF/djg3Iaw==
X-Received: by 2002:a63:501d:0:b0:382:56b1:9a01 with SMTP id e29-20020a63501d000000b0038256b19a01mr94756pgb.393.1647673879199;
        Sat, 19 Mar 2022 00:11:19 -0700 (PDT)
Received: from localhost.localdomain ([155.94.198.189])
        by smtp.gmail.com with ESMTPSA id u25-20020a62ed19000000b004f140515d56sm11497103pfh.46.2022.03.19.00.11.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Mar 2022 00:11:18 -0700 (PDT)
From:   Feiyang Chen <chris.chenfeiyang@gmail.com>
X-Google-Original-From: Feiyang Chen <chenfeiyang@loongson.cn>
To:     tsbogend@alpha.franken.de
Cc:     Feiyang Chen <chenfeiyang@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Subject: [PATCH 2/2] MIPS: sgi-ip27: Fix build error
Date:   Sat, 19 Mar 2022 15:11:04 +0800
Message-Id: <70de3680b4c9d0eabaca03dc0140a1ca3a246a5e.1647671808.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647671808.git.chenfeiyang@loongson.cn>
References: <cover.1647671808.git.chenfeiyang@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Select HAVE_ARCH_NODEDATA_EXTENSION for sgi-ip27 to fix build error:

mips64el-unknown-linux-gnu-ld: mm/page_alloc.o: in function `free_area_init':
page_alloc.c:(.init.text+0x1ba8): undefined reference to `node_data'
mips64el-unknown-linux-gnu-ld: page_alloc.c:(.init.text+0x1bcc): undefined reference to `node_data'
mips64el-unknown-linux-gnu-ld: page_alloc.c:(.init.text+0x1be4): undefined reference to `node_data'
mips64el-unknown-linux-gnu-ld: page_alloc.c:(.init.text+0x1bf4): undefined reference to `node_data'

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 arch/mips/Kconfig                |  4 ++++
 arch/mips/sgi-ip27/ip27-memory.c | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0dae5f1e61cc..beaa2aa08c59 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -709,6 +709,7 @@ config SGI_IP27
 	select WAR_R10000_LLSC
 	select MIPS_L1_CACHE_SHIFT_7
 	select NUMA
+	select HAVE_ARCH_NODEDATA_EXTENSION
 	help
 	  This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
 	  workstations.  To compile a Linux kernel that runs on these, say Y
@@ -2708,6 +2709,9 @@ config NUMA
 config SYS_SUPPORTS_NUMA
 	bool
 
+config HAVE_ARCH_NODEDATA_EXTENSION
+	bool
+
 config RELOCATABLE
 	bool "Relocatable kernel"
 	depends on SYS_SUPPORTS_RELOCATABLE
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index adc2faeecf7c..f79c48393716 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -422,3 +422,13 @@ void __init mem_init(void)
 	memblock_free_all();
 	setup_zero_pages();	/* This comes from node 0 */
 }
+
+pg_data_t * __init arch_alloc_nodedata(int nid)
+{
+	return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
+}
+
+void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
+{
+	__node_data[nid] = (struct node_data *)pgdat;
+}
-- 
2.27.0

