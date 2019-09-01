Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7702BA4A49
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfIAPyn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:54:43 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:57196 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfIAPyn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:54:43 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 1B7EA3F73E
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:54:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wrS0PBGj-tZX for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:54:41 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 5C96B3F708
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:54:41 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:54:41 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 047/120] MIPS: PS2: Let the system type be Sony PlayStation 2
Message-ID: <cf9924007a0e9515d3bd18bcca44c8908028b90a.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The system type is shown in the /proc/cpuinfo file:

	# grep system' 'type /proc/cpuinfo
	system type		: Sony PlayStation 2

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/ps2/identify.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/ps2/identify.c b/arch/mips/ps2/identify.c
index 264fdc13dc43..579148fb79c4 100644
--- a/arch/mips/ps2/identify.c
+++ b/arch/mips/ps2/identify.c
@@ -9,11 +9,17 @@
 #include <linux/init.h>
 #include <linux/printk.h>
 
+#include <asm/bootinfo.h>
 #include <asm/prom.h>
 
 #include <asm/mach-ps2/rom.h>
 #include <asm/mach-ps2/scmd.h>
 
+const char *get_system_type(void)
+{
+	return "Sony PlayStation 2";
+}
+
 static int __init set_machine_name_by_scmd(void)
 {
 	const struct scmd_machine_name machine = scmd_read_machine_name();
-- 
2.21.0

