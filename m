Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE9961500CE
	for <lists+linux-mips@lfdr.de>; Mon,  3 Feb 2020 04:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbgBCDqf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Feb 2020 22:46:35 -0500
Received: from [115.28.160.31] ([115.28.160.31]:36210 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1727088AbgBCDqf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 Feb 2020 22:46:35 -0500
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C94B4600BF;
        Mon,  3 Feb 2020 11:46:24 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1580701584; bh=i5XqcqvpXOcVDcAQ/cfvGjewDL60E9oWwr5PaBOEwNA=;
        h=From:To:Cc:Subject:Date:From;
        b=n7F7JRbL0SeKWbbvMlj9FGRfCk9Q+Aja+pMmwSTwPBAHBdnv+HgIsETwK84/mFRqv
         G7rRYDU9lavb/sVEIbggi3sZ4rGFVCr28a4atZFTZg110LmN+FZWQoYF/LCGClhYDp
         20j7/jTVR985KRF6Vi69pJ3IQ2pHj6/M7duQkPs0=
From:   Wang Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     Huacai Chen <chenhc@lemote.com>, Wang Xuerui <git@xen0n.name>
Subject: [PATCH 1/2] MIPS: loongson3-llsc-check: Downgrade failures to notices
Date:   Mon,  3 Feb 2020 01:00:51 +0800
Message-Id: <20200202170052.14012-1-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Huacai Chen <chenhc@lemote.com>

Local ops (and other similar cases) don't need SYNCs before LL/SC
because there is only one writer, so don't always fail on missing SYNCs.
Print a notice instead.

[git@xen0n.name: Massaged commit message and symbol naming.]

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Wang Xuerui <git@xen0n.name>
---
 arch/mips/tools/loongson3-llsc-check.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/mips/tools/loongson3-llsc-check.c b/arch/mips/tools/loongson3-llsc-check.c
index 0ebddd0ae46f..c485950b7a36 100644
--- a/arch/mips/tools/loongson3-llsc-check.c
+++ b/arch/mips/tools/loongson3-llsc-check.c
@@ -138,6 +138,12 @@ static bool is_branch(uint32_t insn, int *off)
 	}
 }
 
+#define REPORT_OK		0x0
+#define REPORT_LL		0x1
+#define REPORT_BRANCH_TARGET	0x2
+
+static int err_report = REPORT_OK;
+
 static int check_ll(uint64_t pc, uint32_t *code, size_t sz)
 {
 	ssize_t i, max, sc_pos;
@@ -149,8 +155,8 @@ static int check_ll(uint64_t pc, uint32_t *code, size_t sz)
 	 * execute after the LL & cause erroneous results.
 	 */
 	if (!is_sync(le32toh(code[-1]))) {
+		err_report |= REPORT_LL;
 		fprintf(stderr, "%" PRIx64 ": LL not preceded by sync\n", pc);
-		return -EINVAL;
 	}
 
 	/* Find the matching SC instruction */
@@ -185,9 +191,9 @@ static int check_ll(uint64_t pc, uint32_t *code, size_t sz)
 			continue;
 
 		/* ...but if not, we have a problem */
+		err_report |= REPORT_BRANCH_TARGET;
 		fprintf(stderr, "%" PRIx64 ": Branch target not a sync\n",
 			pc + (i * 4));
-		return -EINVAL;
 	}
 
 	return 0;
@@ -297,6 +303,13 @@ int main(int argc, char *argv[])
 			goto out_munmap;
 	}
 
+	if (err_report & REPORT_LL)
+		fprintf(stderr, "Notice: there are LLs not preceded by"
+				" syncs, please confirm manually.\n");
+	if (err_report & REPORT_BRANCH_TARGET)
+		fprintf(stderr, "Notice: there are branches within LL/SC blocks"
+				" not targeting syncs, please confirm manually.\n");
+
 	status = EXIT_SUCCESS;
 out_munmap:
 	munmap(vmlinux, st.st_size);
-- 
2.21.0

