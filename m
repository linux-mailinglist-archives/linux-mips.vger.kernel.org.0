Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF5F13B82A
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2020 04:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbgAODfS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jan 2020 22:35:18 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59598 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728884AbgAODfS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Jan 2020 22:35:18 -0500
Received: from localhost.cn (unknown [10.40.23.12])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx39lkiB5e_EQFAA--.3S2;
        Wed, 15 Jan 2020 11:35:01 +0800 (CST)
From:   Guoyun Sun <sunguoyun@loongson.cn>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guoyun Sun <sunguoyun@loongson.cn>
Subject: [PATCH V2] mips/vdso: Support mremap() for vDSO
Date:   Wed, 15 Jan 2020 11:35:00 +0800
Message-Id: <1579059300-6636-1-git-send-email-sunguoyun@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx39lkiB5e_EQFAA--.3S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWfWFWrAr1xWw4fGFyrCrg_yoW8uF17pw
        nIyF1qg3ykZw1UGr9rtr4rZa98Jw48JFW5Jryjqr1Yyw48GrWUArWFya1xurykCFyqya1F
        gw45AFyrGF98CF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VACjcxG62k0Y48FwI0_Jr0_Gr1lYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14
        v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E
        6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
        VjvjDU0xZFpf9x0JUDrcfUUUUU=
X-CM-SenderInfo: 5vxqw3hr1x0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

vDSO VMA address is saved in mm_context for the purpose of using
restorer from vDSO page to return to userspace after signal handling.

In Checkpoint Restore in Userspace (CRIU) project we place vDSO VMA
on restore back to the place where it was on the dump.

Make vDSO code track the VMA address by supplying .mremap() fops
the same way it's done for x86 and arm by:
commit b059a453b1cf ("x86/vdso: Add mremap hook to vm_special_mapping")
commit 739586951b8a ("arm64/vdso: Support mremap() for vDSO").

Signed-off-by: Guoyun Sun <sunguoyun@loongson.cn>
---
 arch/mips/vdso/genvdso.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/vdso/genvdso.c b/arch/mips/vdso/genvdso.c
index b66b6b1..be57b83 100644
--- a/arch/mips/vdso/genvdso.c
+++ b/arch/mips/vdso/genvdso.c
@@ -251,6 +251,18 @@ int main(int argc, char **argv)
 	fprintf(out_file, "#include <linux/linkage.h>\n");
 	fprintf(out_file, "#include <linux/mm.h>\n");
 	fprintf(out_file, "#include <asm/vdso.h>\n");
+	fprintf(out_file, "static int vdso_mremap(\n");
+	fprintf(out_file, "	const struct vm_special_mapping *sm,\n");
+	fprintf(out_file, "	struct vm_area_struct *new_vma)\n");
+	fprintf(out_file, "{\n");
+	fprintf(out_file, "	unsigned long new_size =\n");
+	fprintf(out_file, "	new_vma->vm_end - new_vma->vm_start;\n");
+	fprintf(out_file, "	if (vdso_image.size != new_size)\n");
+	fprintf(out_file, "		return -EINVAL;\n");
+	fprintf(out_file, "	current->mm->context.vdso =\n");
+	fprintf(out_file, "	(void __user *)(new_vma->vm_start);\n");
+	fprintf(out_file, "	return 0;\n");
+	fprintf(out_file, "}\n");
 
 	/* Write out the stripped VDSO data. */
 	fprintf(out_file,
@@ -275,6 +287,7 @@ int main(int argc, char **argv)
 	fprintf(out_file, "\t.mapping = {\n");
 	fprintf(out_file, "\t\t.name = \"[vdso]\",\n");
 	fprintf(out_file, "\t\t.pages = vdso_pages,\n");
+	fprintf(out_file, "\t\t.mremap = vdso_mremap,\n");
 	fprintf(out_file, "\t},\n");
 
 	/* Calculate and write symbol offsets to <output file> */
-- 
2.1.0

