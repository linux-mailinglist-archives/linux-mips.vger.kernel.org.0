Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3935519A82F
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 11:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731958AbgDAJDw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 05:03:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34534 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730821AbgDAJDw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 Apr 2020 05:03:52 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH9zsWIRe13wiAA--.11S3;
        Wed, 01 Apr 2020 17:03:41 +0800 (CST)
Subject: Re: [PATCH 02/39] MIPS: loongson64: Add header files path prefix
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
References: <1585557531-18849-1-git-send-email-maobibo@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   maobibo <maobibo@loongson.cn>
Message-ID: <6be02099-4cbe-078b-4b2a-a80d3ed6237a@loongson.cn>
Date:   Wed, 1 Apr 2020 17:03:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1585557531-18849-1-git-send-email-maobibo@loongson.cn>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxH9zsWIRe13wiAA--.11S3
X-Coremail-Antispam: 1UD129KBjvAXoWftryfCF17ur43CFykGry8Xwb_yoW5WrWfKo
        Z2kFnrKr48XFWUJF4jgF15C3W8WFnYqr4Fyw1fXrWUJF9Iy3sxJ3409w42gF18C3Wxtwnx
        GrW5urW8Xr4Iyaykn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUY47k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
        MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
        Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
        7IU5PpnJUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Jiaxun,

how about adding dir arch/mips/include/asm/loongson64/mach and add
common header files on it, headers with platform itself keep unchanged?
By so, the patch size will be smaller like this.


Thomas,
what is your option?

Regards
bibo,mao

---
 arch/mips/Kconfig
| 1 +
 .../mips/include/asm/mach-loongson64/{ => mach}/cpu-feature-overrides.h | 0
 arch/mips/include/asm/mach-loongson64/mach/floppy.h
| 2 ++
 arch/mips/include/asm/mach-loongson64/mach/ide.h
| 2 ++
 arch/mips/include/asm/mach-loongson64/mach/ioremap.h
| 2 ++
 arch/mips/include/asm/mach-loongson64/{ => mach}/irq.h                  | 0
 arch/mips/include/asm/mach-loongson64/{ => mach}/kernel-entry-init.h    | 0
 arch/mips/include/asm/mach-loongson64/mach/kmalloc.h
| 2 ++
 arch/mips/include/asm/mach-loongson64/mach/mangle-port.h
| 2 ++
 arch/mips/include/asm/mach-loongson64/{ => mach}/mc146818rtc.h          | 0
 arch/mips/include/asm/mach-loongson64/{ => mach}/mmzone.h               | 0
 arch/mips/include/asm/mach-loongson64/{ => mach}/spaces.h               | 0
 arch/mips/include/asm/mach-loongson64/{ => mach}/topology.h             | 0
 arch/mips/include/asm/mach-loongson64/mach/war.h
| 2 ++
 arch/mips/loongson64/smp.c
| 2 +-
 15 files changed, 14 insertions(+), 1 deletion(-)
 rename arch/mips/include/asm/mach-loongson64/{ =>
mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/include/asm/mach-loongson64/mach/floppy.h
 create mode 100644 arch/mips/include/asm/mach-loongson64/mach/ide.h
 create mode 100644 arch/mips/include/asm/mach-loongson64/mach/ioremap.h
 rename arch/mips/include/asm/mach-loongson64/{ => mach}/irq.h (100%)
 rename arch/mips/include/asm/mach-loongson64/{ =>
mach}/kernel-entry-init.h (100%)
 create mode 100644 arch/mips/include/asm/mach-loongson64/mach/kmalloc.h
 create mode 100644 arch/mips/include/asm/mach-loongson64/mach/mangle-port.h
 rename arch/mips/include/asm/mach-loongson64/{ => mach}/mc146818rtc.h
(100%)
 rename arch/mips/include/asm/mach-loongson64/{ => mach}/mmzone.h (100%)
 rename arch/mips/include/asm/mach-loongson64/{ => mach}/spaces.h (100%)
 rename arch/mips/include/asm/mach-loongson64/{ => mach}/topology.h (100%)
 create mode 100644 arch/mips/include/asm/mach-loongson64/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 12f05bb..a3e34eb 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1469,6 +1469,7 @@ config CPU_LOONGSON64
 	select MIPS_L1_CACHE_SHIFT_6
 	select GPIOLIB
 	select SWIOTLB
+	select HAVE_MACH_HEAD_FILES
 	help
 		The Loongson GSx64(GS264/GS464/GS464E/GS464V) series of processor
 		cores implements the MIPS64R2 instruction set with many extensions,
diff --git
a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
b/arch/mips/include/asm/mach-loongson64/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
rename to arch/mips/include/asm/mach-loongson64/mach/cpu-feature-overrides.h
diff --git a/arch/mips/include/asm/mach-loongson64/mach/floppy.h
b/arch/mips/include/asm/mach-loongson64/mach/floppy.h
new file mode 100644
index 0000000..8e17183
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/mach/floppy.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/floppy.h>
diff --git a/arch/mips/include/asm/mach-loongson64/mach/ide.h
b/arch/mips/include/asm/mach-loongson64/mach/ide.h
new file mode 100644
index 0000000..1251c0c
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/mach/ide.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ide.h>
diff --git a/arch/mips/include/asm/mach-loongson64/mach/ioremap.h
b/arch/mips/include/asm/mach-loongson64/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-loongson64/irq.h
b/arch/mips/include/asm/mach-loongson64/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/irq.h
rename to arch/mips/include/asm/mach-loongson64/mach/irq.h
diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
b/arch/mips/include/asm/mach-loongson64/mach/kernel-entry-init.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
rename to arch/mips/include/asm/mach-loongson64/mach/kernel-entry-init.h
diff --git a/arch/mips/include/asm/mach-loongson64/mach/kmalloc.h
b/arch/mips/include/asm/mach-loongson64/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/include/asm/mach-loongson64/mach/mangle-port.h
b/arch/mips/include/asm/mach-loongson64/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h
b/arch/mips/include/asm/mach-loongson64/mach/mc146818rtc.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/mc146818rtc.h
rename to arch/mips/include/asm/mach-loongson64/mach/mc146818rtc.h
diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h
b/arch/mips/include/asm/mach-loongson64/mach/mmzone.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/mmzone.h
rename to arch/mips/include/asm/mach-loongson64/mach/mmzone.h
diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h
b/arch/mips/include/asm/mach-loongson64/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/spaces.h
rename to arch/mips/include/asm/mach-loongson64/mach/spaces.h
diff --git a/arch/mips/include/asm/mach-loongson64/topology.h
b/arch/mips/include/asm/mach-loongson64/mach/topology.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/topology.h
rename to arch/mips/include/asm/mach-loongson64/mach/topology.h
diff --git a/arch/mips/include/asm/mach-loongson64/mach/war.h
b/arch/mips/include/asm/mach-loongson64/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index e1fe8bb..2529dcb 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -4,7 +4,7 @@
  * Author: Chen Huacai, chenhc@lemote.com
  */

-#include <irq.h>
+#include <mach/irq.h>
 #include <linux/init.h>
 #include <linux/cpu.h>
 #include <linux/sched.h>
-- 
1.8.3.1




On 03/30/2020 04:38 PM, bibo mao wrote:
> Remove header files from arch/mips/include/asm/mach-loongson64
> to arch/mips/loongson64/include/mach
> 
> Signed-off-by: bibo mao <maobibo@loongson.cn>
> ---
>  arch/mips/Kconfig                                                 | 1 +
>  arch/mips/loongson64/Platform                                     | 2 +-
>  arch/mips/loongson64/env.c                                        | 8 ++++----
>  .../asm/mach-loongson64 => loongson64/include/mach}/boot_param.h  | 0
>  .../mach-loongson64 => loongson64/include/mach}/builtin_dtbs.h    | 0
>  .../include/mach}/cpu-feature-overrides.h                         | 0
>  arch/mips/loongson64/include/mach/floppy.h                        | 2 ++
>  arch/mips/loongson64/include/mach/ide.h                           | 2 ++
>  arch/mips/loongson64/include/mach/ioremap.h                       | 2 ++
>  .../asm/mach-loongson64 => loongson64/include/mach}/irq.h         | 2 +-
>  .../include/mach}/kernel-entry-init.h                             | 0
>  arch/mips/loongson64/include/mach/kmalloc.h                       | 2 ++
>  .../asm/mach-loongson64 => loongson64/include/mach}/loongson.h    | 2 +-
>  .../mach-loongson64 => loongson64/include/mach}/loongson_hwmon.h  | 0
>  .../mach-loongson64 => loongson64/include/mach}/loongson_regs.h   | 0
>  arch/mips/loongson64/include/mach/mangle-port.h                   | 2 ++
>  .../asm/mach-loongson64 => loongson64/include/mach}/mc146818rtc.h | 0
>  .../asm/mach-loongson64 => loongson64/include/mach}/mmzone.h      | 2 +-
>  .../asm/mach-loongson64 => loongson64/include/mach}/pci.h         | 0
>  .../asm/mach-loongson64 => loongson64/include/mach}/spaces.h      | 0
>  .../asm/mach-loongson64 => loongson64/include/mach}/topology.h    | 0
>  arch/mips/loongson64/include/mach/war.h                           | 2 ++
>  .../asm/mach-loongson64 => loongson64/include/mach}/workarounds.h | 0
>  arch/mips/loongson64/init.c                                       | 2 +-
>  arch/mips/loongson64/numa.c                                       | 2 +-
>  arch/mips/loongson64/pci.c                                        | 6 +++---
>  arch/mips/loongson64/platform.c                                   | 6 +++---
>  arch/mips/loongson64/pm.c                                         | 2 +-
>  arch/mips/loongson64/reset.c                                      | 4 ++--
>  arch/mips/loongson64/setup.c                                      | 2 +-
>  arch/mips/loongson64/smp.c                                        | 8 ++++----
>  arch/mips/loongson64/time.c                                       | 2 +-
>  arch/mips/oprofile/op_model_loongson3.c                           | 4 ++--
>  arch/mips/pci/fixup-loongson3.c                                   | 2 +-
>  arch/mips/pci/ops-loongson3.c                                     | 2 +-
>  drivers/gpio/gpio-loongson.c                                      | 4 ++++
>  drivers/irqchip/irq-loongson-liointc.c                            | 2 +-
>  drivers/platform/mips/cpu_hwmon.c                                 | 8 ++++----
>  38 files changed, 51 insertions(+), 34 deletions(-)
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/boot_param.h (100%)
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/builtin_dtbs.h (100%)
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/cpu-feature-overrides.h (100%)
>  create mode 100644 arch/mips/loongson64/include/mach/floppy.h
>  create mode 100644 arch/mips/loongson64/include/mach/ide.h
>  create mode 100644 arch/mips/loongson64/include/mach/ioremap.h
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/irq.h (89%)
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/kernel-entry-init.h (100%)
>  create mode 100644 arch/mips/loongson64/include/mach/kmalloc.h
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/loongson.h (99%)
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/loongson_hwmon.h (100%)
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/loongson_regs.h (100%)
>  create mode 100644 arch/mips/loongson64/include/mach/mangle-port.h
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/mc146818rtc.h (100%)
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/mmzone.h (96%)
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/pci.h (100%)
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/spaces.h (100%)
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/topology.h (100%)
>  create mode 100644 arch/mips/loongson64/include/mach/war.h
>  rename arch/mips/{include/asm/mach-loongson64 => loongson64/include/mach}/workarounds.h (100%)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 12f05bb..a7f821d 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -491,6 +491,7 @@ config MACH_LOONGSON64
>  	select COMMON_CLK
>  	select USE_OF
>  	select BUILTIN_DTB
> +	select HAVE_MACH_HEAD_FILES
>  	help
>  	  This enables the support of Loongson-2/3 family of machines.
>  
> diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
> index d5eb94c..aa0e112 100644
> --- a/arch/mips/loongson64/Platform
> +++ b/arch/mips/loongson64/Platform
> @@ -56,5 +56,5 @@ cflags-y += $(call cc-option,-mno-loongson-mmi)
>  #
>  
>  platform-$(CONFIG_MACH_LOONGSON64) += loongson64/
> -cflags-$(CONFIG_MACH_LOONGSON64) += -I$(srctree)/arch/mips/include/asm/mach-loongson64 -mno-branch-likely
> +cflags-$(CONFIG_MACH_LOONGSON64) += -I$(srctree)/arch/mips/loongson64/include -mno-branch-likely
>  load-$(CONFIG_CPU_LOONGSON64) += 0xffffffff80200000
> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> index 2554ef1..6c73614 100644
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -15,10 +15,10 @@
>   */
>  #include <linux/export.h>
>  #include <asm/bootinfo.h>
> -#include <loongson.h>
> -#include <boot_param.h>
> -#include <builtin_dtbs.h>
> -#include <workarounds.h>
> +#include <mach/loongson.h>
> +#include <mach/boot_param.h>
> +#include <mach/builtin_dtbs.h>
> +#include <mach/workarounds.h>
>  
>  u32 cpu_clock_freq;
>  EXPORT_SYMBOL(cpu_clock_freq);
> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/loongson64/include/mach/boot_param.h
> similarity index 100%
> rename from arch/mips/include/asm/mach-loongson64/boot_param.h
> rename to arch/mips/loongson64/include/mach/boot_param.h
> diff --git a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h b/arch/mips/loongson64/include/mach/builtin_dtbs.h
> similarity index 100%
> rename from arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
> rename to arch/mips/loongson64/include/mach/builtin_dtbs.h
> diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h b/arch/mips/loongson64/include/mach/cpu-feature-overrides.h
> similarity index 100%
> rename from arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
> rename to arch/mips/loongson64/include/mach/cpu-feature-overrides.h
> diff --git a/arch/mips/loongson64/include/mach/floppy.h b/arch/mips/loongson64/include/mach/floppy.h
> new file mode 100644
> index 0000000..8e17183
> --- /dev/null
> +++ b/arch/mips/loongson64/include/mach/floppy.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/mach-generic/floppy.h>
> diff --git a/arch/mips/loongson64/include/mach/ide.h b/arch/mips/loongson64/include/mach/ide.h
> new file mode 100644
> index 0000000..1251c0c
> --- /dev/null
> +++ b/arch/mips/loongson64/include/mach/ide.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/mach-generic/ide.h>
> diff --git a/arch/mips/loongson64/include/mach/ioremap.h b/arch/mips/loongson64/include/mach/ioremap.h
> new file mode 100644
> index 0000000..2369393
> --- /dev/null
> +++ b/arch/mips/loongson64/include/mach/ioremap.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/mach-generic/ioremap.h>
> diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/loongson64/include/mach/irq.h
> similarity index 89%
> rename from arch/mips/include/asm/mach-loongson64/irq.h
> rename to arch/mips/loongson64/include/mach/irq.h
> index d41dc4a..55bafce 100644
> --- a/arch/mips/include/asm/mach-loongson64/irq.h
> +++ b/arch/mips/loongson64/include/mach/irq.h
> @@ -2,7 +2,7 @@
>  #ifndef __ASM_MACH_LOONGSON64_IRQ_H_
>  #define __ASM_MACH_LOONGSON64_IRQ_H_
>  
> -#include <boot_param.h>
> +#include <mach/boot_param.h>
>  
>  /* cpu core interrupt numbers */
>  #define MIPS_CPU_IRQ_BASE 56
> diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/loongson64/include/mach/kernel-entry-init.h
> similarity index 100%
> rename from arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
> rename to arch/mips/loongson64/include/mach/kernel-entry-init.h
> diff --git a/arch/mips/loongson64/include/mach/kmalloc.h b/arch/mips/loongson64/include/mach/kmalloc.h
> new file mode 100644
> index 0000000..4f056db
> --- /dev/null
> +++ b/arch/mips/loongson64/include/mach/kmalloc.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/mach-generic/kmalloc.h>
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/loongson64/include/mach/loongson.h
> similarity index 99%
> rename from arch/mips/include/asm/mach-loongson64/loongson.h
> rename to arch/mips/loongson64/include/mach/loongson.h
> index fde1b75..9d719b9 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson.h
> +++ b/arch/mips/loongson64/include/mach/loongson.h
> @@ -10,7 +10,7 @@
>  #include <linux/io.h>
>  #include <linux/init.h>
>  #include <linux/irq.h>
> -#include <boot_param.h>
> +#include <mach/boot_param.h>
>  
>  
>  /* machine-specific reboot/halt operation */
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson_hwmon.h b/arch/mips/loongson64/include/mach/loongson_hwmon.h
> similarity index 100%
> rename from arch/mips/include/asm/mach-loongson64/loongson_hwmon.h
> rename to arch/mips/loongson64/include/mach/loongson_hwmon.h
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/loongson64/include/mach/loongson_regs.h
> similarity index 100%
> rename from arch/mips/include/asm/mach-loongson64/loongson_regs.h
> rename to arch/mips/loongson64/include/mach/loongson_regs.h
> diff --git a/arch/mips/loongson64/include/mach/mangle-port.h b/arch/mips/loongson64/include/mach/mangle-port.h
> new file mode 100644
> index 0000000..b9736e3
> --- /dev/null
> +++ b/arch/mips/loongson64/include/mach/mangle-port.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/mach-generic/mangle-port.h>
> diff --git a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h b/arch/mips/loongson64/include/mach/mc146818rtc.h
> similarity index 100%
> rename from arch/mips/include/asm/mach-loongson64/mc146818rtc.h
> rename to arch/mips/loongson64/include/mach/mc146818rtc.h
> diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/loongson64/include/mach/mmzone.h
> similarity index 96%
> rename from arch/mips/include/asm/mach-loongson64/mmzone.h
> rename to arch/mips/loongson64/include/mach/mmzone.h
> index 3a25dbd..57f7375 100644
> --- a/arch/mips/include/asm/mach-loongson64/mmzone.h
> +++ b/arch/mips/loongson64/include/mach/mmzone.h
> @@ -9,7 +9,7 @@
>  #ifndef _ASM_MACH_LOONGSON64_MMZONE_H
>  #define _ASM_MACH_LOONGSON64_MMZONE_H
>  
> -#include <boot_param.h>
> +#include <mach/boot_param.h>
>  #define NODE_ADDRSPACE_SHIFT 44
>  #define NODE0_ADDRSPACE_OFFSET 0x000000000000UL
>  #define NODE1_ADDRSPACE_OFFSET 0x100000000000UL
> diff --git a/arch/mips/include/asm/mach-loongson64/pci.h b/arch/mips/loongson64/include/mach/pci.h
> similarity index 100%
> rename from arch/mips/include/asm/mach-loongson64/pci.h
> rename to arch/mips/loongson64/include/mach/pci.h
> diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/loongson64/include/mach/spaces.h
> similarity index 100%
> rename from arch/mips/include/asm/mach-loongson64/spaces.h
> rename to arch/mips/loongson64/include/mach/spaces.h
> diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/loongson64/include/mach/topology.h
> similarity index 100%
> rename from arch/mips/include/asm/mach-loongson64/topology.h
> rename to arch/mips/loongson64/include/mach/topology.h
> diff --git a/arch/mips/loongson64/include/mach/war.h b/arch/mips/loongson64/include/mach/war.h
> new file mode 100644
> index 0000000..5b0422a
> --- /dev/null
> +++ b/arch/mips/loongson64/include/mach/war.h
> @@ -0,0 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/mach-generic/war.h>
> diff --git a/arch/mips/include/asm/mach-loongson64/workarounds.h b/arch/mips/loongson64/include/mach/workarounds.h
> similarity index 100%
> rename from arch/mips/include/asm/mach-loongson64/workarounds.h
> rename to arch/mips/loongson64/include/mach/workarounds.h
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index da38944..debbb75 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -12,7 +12,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/fw/fw.h>
>  
> -#include <loongson.h>
> +#include <mach/loongson.h>
>  
>  static void __init mips_nmi_setup(void)
>  {
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index 1ae072d..e852535 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -24,7 +24,7 @@
>  #include <asm/mc146818-time.h>
>  #include <asm/time.h>
>  #include <asm/wbflush.h>
> -#include <boot_param.h>
> +#include <mach/boot_param.h>
>  
>  static struct pglist_data prealloc__node_data[MAX_NUMNODES];
>  unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
> diff --git a/arch/mips/loongson64/pci.c b/arch/mips/loongson64/pci.c
> index e84ae20..7011d88 100644
> --- a/arch/mips/loongson64/pci.c
> +++ b/arch/mips/loongson64/pci.c
> @@ -5,9 +5,9 @@
>   */
>  #include <linux/pci.h>
>  
> -#include <pci.h>
> -#include <loongson.h>
> -#include <boot_param.h>
> +#include <mach/pci.h>
> +#include <mach/loongson.h>
> +#include <mach/boot_param.h>
>  
>  static struct resource loongson_pci_mem_resource = {
>  	.name	= "pci memory space",
> diff --git a/arch/mips/loongson64/platform.c b/arch/mips/loongson64/platform.c
> index 9674ae1..2cd8b9b 100644
> --- a/arch/mips/loongson64/platform.c
> +++ b/arch/mips/loongson64/platform.c
> @@ -10,9 +10,9 @@
>  #include <linux/slab.h>
>  #include <linux/platform_device.h>
>  #include <asm/bootinfo.h>
> -#include <boot_param.h>
> -#include <loongson_hwmon.h>
> -#include <workarounds.h>
> +#include <mach/boot_param.h>
> +#include <mach/loongson_hwmon.h>
> +#include <mach/workarounds.h>
>  
>  static int __init loongson3_platform_init(void)
>  {
> diff --git a/arch/mips/loongson64/pm.c b/arch/mips/loongson64/pm.c
> index 7c8556f..b05c6dd 100644
> --- a/arch/mips/loongson64/pm.c
> +++ b/arch/mips/loongson64/pm.c
> @@ -12,7 +12,7 @@
>  #include <asm/i8259.h>
>  #include <asm/mipsregs.h>
>  
> -#include <loongson.h>
> +#include <mach/loongson.h>
>  
>  static unsigned int __maybe_unused cached_master_mask;	/* i8259A */
>  static unsigned int __maybe_unused cached_slave_mask;
> diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
> index bc76710..0fd1d50 100644
> --- a/arch/mips/loongson64/reset.c
> +++ b/arch/mips/loongson64/reset.c
> @@ -12,8 +12,8 @@
>  #include <asm/idle.h>
>  #include <asm/reboot.h>
>  
> -#include <loongson.h>
> -#include <boot_param.h>
> +#include <mach/loongson.h>
> +#include <mach/boot_param.h>
>  
>  static inline void loongson_reboot(void)
>  {
> diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
> index 6fe3fff..4e7e3a4 100644
> --- a/arch/mips/loongson64/setup.c
> +++ b/arch/mips/loongson64/setup.c
> @@ -13,7 +13,7 @@
>  
>  #include <asm/prom.h>
>  
> -#include <loongson.h>
> +#include <mach/loongson.h>
>  
>  void *loongson_fdt_blob;
>  
> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> index e1fe8bb..d0fc0fc 100644
> --- a/arch/mips/loongson64/smp.c
> +++ b/arch/mips/loongson64/smp.c
> @@ -4,7 +4,7 @@
>   * Author: Chen Huacai, chenhc@lemote.com
>   */
>  
> -#include <irq.h>
> +#include <mach/irq.h>
>  #include <linux/init.h>
>  #include <linux/cpu.h>
>  #include <linux/sched.h>
> @@ -18,9 +18,9 @@
>  #include <asm/clock.h>
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
> -#include <loongson.h>
> -#include <loongson_regs.h>
> -#include <workarounds.h>
> +#include <mach/loongson.h>
> +#include <mach/loongson_regs.h>
> +#include <mach/workarounds.h>
>  
>  #include "smp.h"
>  
> diff --git a/arch/mips/loongson64/time.c b/arch/mips/loongson64/time.c
> index 1245f22..4f8fdf8 100644
> --- a/arch/mips/loongson64/time.c
> +++ b/arch/mips/loongson64/time.c
> @@ -10,7 +10,7 @@
>  #include <asm/time.h>
>  #include <asm/hpet.h>
>  
> -#include <loongson.h>
> +#include <mach/loongson.h>
>  
>  void __init plat_time_init(void)
>  {
> diff --git a/arch/mips/oprofile/op_model_loongson3.c b/arch/mips/oprofile/op_model_loongson3.c
> index 436b1fc..9ca6432 100644
> --- a/arch/mips/oprofile/op_model_loongson3.c
> +++ b/arch/mips/oprofile/op_model_loongson3.c
> @@ -12,8 +12,8 @@
>  #include <linux/spinlock.h>
>  #include <linux/interrupt.h>
>  #include <linux/uaccess.h>
> -#include <irq.h>
> -#include <loongson.h>
> +#include <mach/irq.h>
> +#include <mach/loongson.h>
>  #include "op_impl.h"
>  
>  #define LOONGSON3_PERFCNT_OVERFLOW	(1ULL << 63)
> diff --git a/arch/mips/pci/fixup-loongson3.c b/arch/mips/pci/fixup-loongson3.c
> index 8a741c2..6c63c30 100644
> --- a/arch/mips/pci/fixup-loongson3.c
> +++ b/arch/mips/pci/fixup-loongson3.c
> @@ -24,7 +24,7 @@
>   */
>  
>  #include <linux/pci.h>
> -#include <boot_param.h>
> +#include <mach/boot_param.h>
>  
>  static void print_fixup_info(const struct pci_dev *pdev)
>  {
> diff --git a/arch/mips/pci/ops-loongson3.c b/arch/mips/pci/ops-loongson3.c
> index 2f6ad36..f40b805 100644
> --- a/arch/mips/pci/ops-loongson3.c
> +++ b/arch/mips/pci/ops-loongson3.c
> @@ -5,7 +5,7 @@
>  
>  #include <asm/mips-boards/bonito64.h>
>  
> -#include <loongson.h>
> +#include <mach/loongson.h>
>  
>  #define PCI_ACCESS_READ  0
>  #define PCI_ACCESS_WRITE 1
> diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
> index a421458..ebcd75a 100644
> --- a/drivers/gpio/gpio-loongson.c
> +++ b/drivers/gpio/gpio-loongson.c
> @@ -17,7 +17,11 @@
>  #include <linux/platform_device.h>
>  #include <linux/bitops.h>
>  #include <asm/types.h>
> +#ifdef CONFIG_HAVE_MACH_HEAD_FILES
> +#include <mach/loongson.h>
> +#else
>  #include <loongson.h>
> +#endif
>  
>  #define STLS2F_N_GPIO		4
>  #define STLS3A_N_GPIO		16
> diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
> index 63b6147..fb23eb1 100644
> --- a/drivers/irqchip/irq-loongson-liointc.c
> +++ b/drivers/irqchip/irq-loongson-liointc.c
> @@ -16,7 +16,7 @@
>  #include <linux/smp.h>
>  #include <linux/irqchip/chained_irq.h>
>  
> -#include <boot_param.h>
> +#include <mach/boot_param.h>
>  
>  #define LIOINTC_CHIP_IRQ	32
>  #define LIOINTC_NUM_PARENT 4
> diff --git a/drivers/platform/mips/cpu_hwmon.c b/drivers/platform/mips/cpu_hwmon.c
> index 0d27cb7..4bb71af 100644
> --- a/drivers/platform/mips/cpu_hwmon.c
> +++ b/drivers/platform/mips/cpu_hwmon.c
> @@ -6,10 +6,10 @@
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
>  
> -#include <loongson.h>
> -#include <boot_param.h>
> -#include <loongson_hwmon.h>
> -#include <loongson_regs.h>
> +#include <mach/loongson.h>
> +#include <mach/boot_param.h>
> +#include <mach/loongson_hwmon.h>
> +#include <mach/loongson_regs.h>
>  
>  static int csr_temp_enable = 0;
>  
> 

