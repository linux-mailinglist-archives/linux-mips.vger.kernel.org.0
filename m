Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF0AA13A073
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2020 06:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgANFNv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jan 2020 00:13:51 -0500
Received: from mail.loongson.cn ([114.242.206.163]:34640 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725306AbgANFNv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Jan 2020 00:13:51 -0500
Received: from localhost.cn (unknown [10.40.23.12])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj2j4TR1e4dYEAA--.9S2;
        Tue, 14 Jan 2020 13:13:29 +0800 (CST)
From:   Guoyun Sun <sunguoyun@loongson.cn>
To:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Allison Randal <allison@lohutok.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guoyun Sun <sunguoyun@loongson.cn>
Subject: [PATCH]  mips/vdso: Support mremap() for vDSO
Date:   Tue, 14 Jan 2020 13:13:28 +0800
Message-Id: <1578978808-18633-1-git-send-email-sunguoyun@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxj2j4TR1e4dYEAA--.9S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr1UKw4xKFy7Jw1ruFW3Jrb_yoW5GF4xpw
        s8AFn5Kw48Xr1UGrySyr95Za9xW3ykX3y5JrWqq3y5Aw18KryjyF4Fyan7ZrWUCFyvy3WS
        gw45ZFWrK3WYyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        64x0Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI
        0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CE
        Vc8vx2IErcIFxwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUbUGYJUUUUU==
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
 arch/mips/kernel/vdso.c  | 22 ++++++++++++++++++++++
 arch/mips/vdso/genvdso.c |  5 +++++
 2 files changed, 27 insertions(+)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index bc35f84..eac3982 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -38,6 +38,28 @@ static struct vm_special_mapping vdso_vvar_mapping = {
 	.pages = no_pages,
 };
 
+int vdso_mremap(const struct vm_special_mapping *sm,
+		       struct vm_area_struct *new_vma)
+{
+	unsigned long new_size = new_vma->vm_end - new_vma->vm_start;
+
+#ifdef CONFIG_MIPS32_O32
+	if (vdso_image_o32.size != new_size)
+		return -EINVAL;
+#endif
+
+#ifdef CONFIG_MIPS32_N32
+	if (vdso_image_n32.size != new_size)
+		return -EINVAL;
+#endif
+
+	if (vdso_image.size != new_size)
+		return -EINVAL;
+
+	current->mm->context.vdso = (void __user *)(new_vma->vm_start);
+	return 0;
+}
+
 static void __init init_vdso_image(struct mips_vdso_image *image)
 {
 	unsigned long num_pages, i;
diff --git a/arch/mips/vdso/genvdso.c b/arch/mips/vdso/genvdso.c
index b66b6b1..50ea516 100644
--- a/arch/mips/vdso/genvdso.c
+++ b/arch/mips/vdso/genvdso.c
@@ -251,6 +251,10 @@ int main(int argc, char **argv)
 	fprintf(out_file, "#include <linux/linkage.h>\n");
 	fprintf(out_file, "#include <linux/mm.h>\n");
 	fprintf(out_file, "#include <asm/vdso.h>\n");
+	fprintf(out_file, "\n");
+	fprintf(out_file, "extern int vdso_mremap(\n");
+	fprintf(out_file, "	const struct vm_special_mapping *sm,\n");
+	fprintf(out_file, "	struct vm_area_struct *new_vma);\n\n");
 
 	/* Write out the stripped VDSO data. */
 	fprintf(out_file,
@@ -275,6 +279,7 @@ int main(int argc, char **argv)
 	fprintf(out_file, "\t.mapping = {\n");
 	fprintf(out_file, "\t\t.name = \"[vdso]\",\n");
 	fprintf(out_file, "\t\t.pages = vdso_pages,\n");
+	fprintf(out_file, "\t\t.mremap = vdso_mremap,\n");
 	fprintf(out_file, "\t},\n");
 
 	/* Calculate and write symbol offsets to <output file> */
-- 
2.1.0

