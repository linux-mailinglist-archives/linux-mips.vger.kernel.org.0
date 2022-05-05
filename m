Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF0C051B99B
	for <lists+linux-mips@lfdr.de>; Thu,  5 May 2022 10:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346321AbiEEIKV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 May 2022 04:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239748AbiEEIKV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 May 2022 04:10:21 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EB15533E89
        for <linux-mips@vger.kernel.org>; Thu,  5 May 2022 01:06:40 -0700 (PDT)
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxMNqEhXNi6J8KAA--.43533S2;
        Thu, 05 May 2022 16:06:29 +0800 (CST)
From:   Hui Li <lihui@loongson.cn>
To:     Simon Horman <horms@verge.net.au>
Cc:     kexec@lists.infradead.org, linux-mips@vger.kernel.org
Subject: [PATCH v3] kexec-tools:mips:Pass initrd parameter via cmdline
Date:   Thu,  5 May 2022 16:06:28 +0800
Message-Id: <20220505080628.14708-1-lihui@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxMNqEhXNi6J8KAA--.43533S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw1xtw13CF4kur13Cw1UAwb_yoW7Gr1fpw
        43tas8Gr4rAw4xtryfAFs8X3yfXwn3A3WjvFWag34DZ3Z0gFn0q3yfXF15ZryDJrWjvF1I
        yrWYvFykua17Z3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r43MxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07b7D7-UUUUU=
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Under loongson platform,use command:
kexec -l vmlinux... --append="root=UUID=28e1..." --initrd=...
kexec -e
quick restart failed like this:

[    3.420791] VFS: Cannot open root device "UUID=6462a8a4-02fb-49ff-bcb6-54fe53813c2a" or unknown-block(0,0): error -6
[    3.431262] Please append a correct "root=" boot option; here are the available partitions:
...
...
...
[    3.543175]   0801         4194304 sda1 554e69cc-01
[    3.543175]
[    3.549494]   0802        62914560 sda2 554e69cc-02
[    3.549495]
[    3.555818]   0803         8388608 sda3 554e69cc-03
[    3.555819]
[    3.562139]   0804       174553229 sda4 554e69cc-04
[    3.562139]
[    3.568463] 0b00         1048575 sr0
[    3.568464]  driver: sr
[    3.574524] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[    3.582750] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0) ]---

For compatibility with previous platforms,
loongson platform obtain the initrd parameter through cmdline in kernel,
and the kernel also supports the use of cmdline to parse initrd.
But under the mips architecture, kexec-tools pass the initrd through DTB.
So some modifications are made as follows:

(1) in kexec/arch/mips/kexec-elf-mips.c
    Add patch_initrd_info() function, at runtime to distinguish different platforms.
    Only for loongson platform, add initrd parameter to cmdline.

(2) in kexec/arch/mips/crashdump-mips.c
    Because loongson uses a different page_offset,
    it should be modified to ensure that crashdump functionality is correct and reliable.

Signed-off-by: Hui Li <lihui@loongson.cn>
---
 kexec/arch/mips/crashdump-mips.c |  3 ++
 kexec/arch/mips/kexec-elf-mips.c | 73 +++++++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/kexec/arch/mips/crashdump-mips.c b/kexec/arch/mips/crashdump-mips.c
index aa09c83..548aeff 100644
--- a/kexec/arch/mips/crashdump-mips.c
+++ b/kexec/arch/mips/crashdump-mips.c
@@ -335,6 +335,9 @@ static int patch_elf_info(void)
 			/* OCTEON uses a different page_offset. */
 			if (strstr(line, "Octeon"))
 				elf_info64.page_offset = 0x8000000000000000ULL;
+			/* LOONGSON uses a different page_offset. */
+			else if (strstr(line, "Loongson"))
+				elf_info64.page_offset = 0xffffffff80000000ULL;
 			break;
 		}
 	}
diff --git a/kexec/arch/mips/kexec-elf-mips.c b/kexec/arch/mips/kexec-elf-mips.c
index a2d11fc..fcc711c 100644
--- a/kexec/arch/mips/kexec-elf-mips.c
+++ b/kexec/arch/mips/kexec-elf-mips.c
@@ -40,6 +40,74 @@ static const int probe_debug = 0;
 #define CMDLINE_PREFIX "kexec "
 static char cmdline_buf[COMMAND_LINE_SIZE] = CMDLINE_PREFIX;
 
+/* Converts unsigned long to ascii string. */
+static void ultoa(unsigned long i, char *str)
+{
+	int j = 0, k;
+	char tmp;
+
+	do {
+		str[j++] = i % 10 + '0';
+	} while ((i /= 10) > 0);
+	str[j] = '\0';
+
+	/* Reverse the string. */
+	for (j = 0, k = strlen(str) - 1; j < k; j++, k--) {
+		tmp = str[k];
+		str[k] = str[j];
+		str[j] = tmp;
+	}
+}
+
+/* Adds initrd parameters to command line. */
+static int cmdline_add_initrd(char *cmdline, unsigned long addr, char *new_para)
+{
+	int cmdlen, len;
+	char str[30], *ptr;
+
+	ptr = str;
+	strcpy(str, new_para);
+	ptr += strlen(str);
+	ultoa(addr, ptr);
+	len = strlen(str);
+	cmdlen = strlen(cmdline) + len;
+	if (cmdlen > (COMMAND_LINE_SIZE - 1))
+		die("Command line overflow\n");
+	strcat(cmdline, str);
+
+	return 0;
+}
+
+/* add initrd to cmdline to compatible with previous platforms. */
+static int patch_initrd_info(char *cmdline, unsigned long initrd_base, unsigned long initrd_size)
+{
+	const char cpuinfo[] = "/proc/cpuinfo";
+	char line[MAX_LINE];
+	FILE *fp;
+    unsigned long page_offset = PAGE_OFFSET;
+
+	fp = fopen(cpuinfo, "r");
+	if (!fp) {
+		fprintf(stderr, "Cannot open %s: %s\n",
+		cpuinfo, strerror(errno));
+		return -1;
+	}
+	while (fgets(line, sizeof(line), fp) != 0) {
+		if (strncmp(line, "cpu model", 9) == 0) {
+			/* LOONGSON64  uses a different page_offset. */
+		if (strstr(line, "Loongson")) {
+				if (arch_options.core_header_type == CORE_TYPE_ELF64)
+					page_offset = (unsigned long)0xffffffff80000000ULL;
+				cmdline_add_initrd(cmdline, page_offset + initrd_base, " rd_start=");
+				cmdline_add_initrd(cmdline, initrd_size, " rd_size=");
+				break;
+			}
+		}
+	}
+	fclose(fp);
+	return 0;
+}
+
 int elf_mips_probe(const char *buf, off_t len)
 {
 	struct mem_ehdr ehdr;
@@ -171,9 +239,10 @@ int elf_mips_load(int argc, char **argv, const char *buf, off_t len,
 		/* Now that the buffer for initrd is prepared, update the dtb
 		 * with an appropriate location */
 		dtb_set_initrd(&dtb_buf, &dtb_length, initrd_base, initrd_base + initrd_size);
-	}
-
 
+		/* Add the initrd parameters to cmdline */
+		patch_initrd_info(cmdline_buf, initrd_base, initrd_size);
+	}
 	/* This is a legacy method for commandline passing used
 	 * currently by Octeon CPUs only */
 	add_buffer(info, cmdline_buf, sizeof(cmdline_buf),
-- 
2.20.1

