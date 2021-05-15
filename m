Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAA838181E
	for <lists+linux-mips@lfdr.de>; Sat, 15 May 2021 13:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbhEOLGF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 May 2021 07:06:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48252 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231300AbhEOLDT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 15 May 2021 07:03:19 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axrcgpqp9g598WAA--.13691S3;
        Sat, 15 May 2021 19:02:02 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 1/2] MIPS: Loongson64: Update loongson3_defconfig
Date:   Sat, 15 May 2021 19:02:00 +0800
Message-Id: <1621076521-22412-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1621076521-22412-1-git-send-email-yangtiezhu@loongson.cn>
References: <1621076521-22412-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Axrcgpqp9g598WAA--.13691S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWxXFy5AFW5Jw1UtF1kKrg_yoW8KFW3pw
        1rGrs7JayrAF1YyrWrCrWkGrZ5tF9rJF9rCF1UJr15Zr1rA3yUXr1vgryUJr4UXFZrJw4r
        Xas3GF13Zay7G37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8KwCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
        3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
        AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
        cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
        IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUIkshUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some configs in loongson3_defconfig is invalid or needless,
use the following steps to update it:

make loongson3_defconfig
make savedefconfig
cp defconfig arch/mips/configs/loongson3_defconfig

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/configs/loongson3_defconfig | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index a18609c..f02101f 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -13,7 +13,6 @@ CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_MEMCG=y
-CONFIG_MEMCG_SWAP=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
@@ -31,9 +30,8 @@ CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 CONFIG_MACH_LOONGSON64=y
 CONFIG_CPU_HAS_MSA=y
-CONFIG_NR_CPUS=16
 CONFIG_NUMA=y
-CONFIG_SMP=y
+CONFIG_NR_CPUS=16
 CONFIG_HZ_256=y
 CONFIG_KEXEC=y
 CONFIG_MIPS32_O32=y
@@ -206,7 +204,6 @@ CONFIG_VIRTIO_NET=m
 # CONFIG_NET_VENDOR_DEC is not set
 # CONFIG_NET_VENDOR_DLINK is not set
 # CONFIG_NET_VENDOR_EMULEX is not set
-# CONFIG_NET_VENDOR_HP is not set
 # CONFIG_NET_VENDOR_I825XX is not set
 CONFIG_E1000=y
 CONFIG_E1000E=y
@@ -248,7 +245,6 @@ CONFIG_PPP_ASYNC=m
 CONFIG_PPP_SYNC_TTY=m
 CONFIG_ATH9K=m
 CONFIG_HOSTAP=m
-CONFIG_INPUT_POLLDEV=m
 CONFIG_INPUT_SPARSEKMAP=y
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_INPUT_MOUSEDEV_PSAUX=y
@@ -280,7 +276,6 @@ CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM93=m
 CONFIG_SENSORS_W83627HF=m
 CONFIG_MEDIA_SUPPORT=m
-CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_DRM=y
@@ -391,18 +386,13 @@ CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_SELINUX_BOOTPARAM=y
 CONFIG_SECURITY_SELINUX_DISABLE=y
 CONFIG_DEFAULT_SECURITY_DAC=y
-CONFIG_CRYPTO_AUTHENC=m
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_KHAZAD=m
 CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_DEFLATE=m
 CONFIG_PRINTK_TIME=y
-- 
2.1.0

