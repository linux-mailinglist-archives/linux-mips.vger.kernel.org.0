Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5E928C862
	for <lists+linux-mips@lfdr.de>; Tue, 13 Oct 2020 07:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388548AbgJMFzN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Oct 2020 01:55:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41152 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388506AbgJMFzN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Oct 2020 01:55:13 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX8c3QYVfhPscAA--.14939S4;
        Tue, 13 Oct 2020 13:55:06 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 2/2] Documentation: ABI: Add /sys/firmware/lefi/boardinfo description for Loongson64
Date:   Tue, 13 Oct 2020 13:55:02 +0800
Message-Id: <1602568502-18044-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1602568502-18044-1-git-send-email-yangtiezhu@loongson.cn>
References: <1602568502-18044-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxX8c3QYVfhPscAA--.14939S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KryDXFWfuryUXFW3Ar43Jrb_yoW8Cryfpa
        15Jan8GrZxG3WxXF93WFy8ZFyfZFs5JrWDGanxAr18JryDGFykZr4Uta1rZFW8Cr4rJayF
        9F4xKr1rCF1UC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4rMxAIw2
        8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
        x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
        CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
        42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
        80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUuWlPUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a description for /sys/firmware/lefi/boardinfo on the Loongson
platform.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 .../ABI/testing/sysfs-firmware-lefi-boardinfo      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo

diff --git a/Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo b/Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo
new file mode 100644
index 0000000..5e3f614
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo
@@ -0,0 +1,35 @@
+What:		/sys/firmware/lefi/boardinfo
+Date:		October 2020
+Contact:	Tiezhu Yang <yangtiezhu@loongson.cn>
+Description:
+		Get mainboard and BIOS info easily on the Loongson platform,
+		this is useful to point out the current used mainboard type
+		and BIOS version when there exists problems related with
+		hardware or firmware.
+
+		The related structures are already defined in the interface
+		specification about firmware and kernel which are common
+		requirement and specific for Loongson64, so only add a new
+		boardinfo.c file in arch/mips/loongson64.
+
+		For example:
+
+		[loongson@linux ~]$ cat /sys/firmware/lefi/boardinfo
+		Board Info
+		Manufacturer            : LEMOTE
+		Board Name              : LEMOTE-LS3A4000-7A1000-1w-V01-pc
+		Family                  : LOONGSON3
+
+		BIOS Info
+		Vendor                  : Kunlun
+		Version                 : Kunlun-A1901-V4.1.3-20200414093938
+		ROM Size                : 4 KB
+		Release Date            : 2020-04-14
+
+		By the way, using dmidecode command can get the similar info if there
+		exists SMBIOS in firmware, but the fact is that there is no SMBIOS on
+		some machines, we can see nothing when execute dmidecode, like this:
+
+		[root@linux loongson]# dmidecode
+		# dmidecode 2.12
+		# No SMBIOS nor DMI entry point found, sorry.
-- 
2.1.0

