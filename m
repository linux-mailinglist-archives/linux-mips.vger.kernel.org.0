Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9D91D3079
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 14:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgENM7p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 08:59:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34862 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726056AbgENM7p (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 08:59:45 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxL+i+QL1e66o0AA--.19S2;
        Thu, 14 May 2020 20:59:42 +0800 (CST)
From:   Kaige Li <likaige@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: tools: Fix resource leak in elf-entry.c
Date:   Thu, 14 May 2020 20:59:41 +0800
Message-Id: <1589461181-29695-1-git-send-email-likaige@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxL+i+QL1e66o0AA--.19S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFy3ZFyrAFW3tFykJF4DCFg_yoW8GrWDpa
        13C3sYkrWfWr15Jry7Jw4DGrZ5ZF92qFWFvFya934DZFs3A34fKw4ftFyIqa47G3s8KayU
        ZF1agFyfCFn2yF7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
        AVWUtwCY02Avz4vE14v_Xr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjfUba0PDUUUU
X-CM-SenderInfo: 5olntxtjh6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is a file descriptor resource leak in elf-entry.c, fix this
by adding fclose() before return and die.

Signed-off-by: Kaige Li <likaige@loongson.cn>
---
 arch/mips/tools/elf-entry.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/mips/tools/elf-entry.c b/arch/mips/tools/elf-entry.c
index adde79c..dbd14ff 100644
--- a/arch/mips/tools/elf-entry.c
+++ b/arch/mips/tools/elf-entry.c
@@ -51,11 +51,14 @@ int main(int argc, const char *argv[])
 	nread = fread(&hdr, 1, sizeof(hdr), file);
 	if (nread != sizeof(hdr)) {
 		perror("Unable to read input file");
+		fclose(file);
 		return EXIT_FAILURE;
 	}
 
-	if (memcmp(hdr.ehdr32.e_ident, ELFMAG, SELFMAG))
+	if (memcmp(hdr.ehdr32.e_ident, ELFMAG, SELFMAG)) {
+		fclose(file);
 		die("Input is not an ELF\n");
+	}
 
 	switch (hdr.ehdr32.e_ident[EI_CLASS]) {
 	case ELFCLASS32:
@@ -67,6 +70,7 @@ int main(int argc, const char *argv[])
 			entry = be32toh(hdr.ehdr32.e_entry);
 			break;
 		default:
+			fclose(file);
 			die("Invalid ELF encoding\n");
 		}
 
@@ -83,14 +87,17 @@ int main(int argc, const char *argv[])
 			entry = be64toh(hdr.ehdr64.e_entry);
 			break;
 		default:
+			fclose(file);
 			die("Invalid ELF encoding\n");
 		}
 		break;
 
 	default:
+		fclose(file);
 		die("Invalid ELF class\n");
 	}
 
 	printf("0x%016" PRIx64 "\n", entry);
+	fclose(file);
 	return EXIT_SUCCESS;
 }
-- 
2.1.0

