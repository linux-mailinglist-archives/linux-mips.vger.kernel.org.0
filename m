Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF132196EE
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 05:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgGIDzo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Jul 2020 23:55:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49392 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726263AbgGIDzj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Jul 2020 23:55:39 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxqdQplQZfXJUAAA--.714S5;
        Thu, 09 Jul 2020 11:55:34 +0800 (CST)
From:   Zhi Li <lizhi01@loongson.cn>
To:     chenhc@lemote.com, jiaxun.yang@flygoat.com,
        tsbogend@alpha.franken.de, lixuefeng@loongson.cn
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] MIPS: Loongson: Fix boot warning about hwmon_device_register()
Date:   Thu,  9 Jul 2020 11:55:21 +0800
Message-Id: <1594266921-28971-4-git-send-email-lizhi01@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1594266921-28971-1-git-send-email-lizhi01@loongson.cn>
References: <1594266921-28971-1-git-send-email-lizhi01@loongson.cn>
X-CM-TRANSID: AQAAf9CxqdQplQZfXJUAAA--.714S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1DGr4DGFyxKw13ur4Durg_yoW5Wr43pF
        WxGayYgry8Wr4DXa1kZa1qqa45Grn5K34xZFn7Cw1vkFnrW345Xa4rJFy5Ary7ArW8Ga15
        XrykJ34UCF43Wr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
        kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm
        72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
        C7MxkF7I0En4kS14v26r126r1DMxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
        Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRyGQkUUUUU=
X-CM-SenderInfo: xol2xxqqr6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace hwmon_device_register() with hwmon_device_register_with_info()
to fix the following boot warning :

[    9.029924] Loongson Hwmon Enter...
[    9.106850] (NULL device *): hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().

Signed-off-by: Zhi Li <lizhi01@loongson.cn>
---
 drivers/platform/mips/cpu_hwmon.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/mips/cpu_hwmon.c b/drivers/platform/mips/cpu_hwmon.c
index c9f35e5..386389f 100644
--- a/drivers/platform/mips/cpu_hwmon.c
+++ b/drivers/platform/mips/cpu_hwmon.c
@@ -55,9 +55,7 @@ int loongson3_cpu_temp(int cpu)
 static int nr_packages;
 static struct device *cpu_hwmon_dev;
 
-static ssize_t get_hwmon_name(struct device *dev,
-			struct device_attribute *attr, char *buf);
-static SENSOR_DEVICE_ATTR(name, 0444, get_hwmon_name, NULL, 0);
+static SENSOR_DEVICE_ATTR(name, 0444, NULL, NULL, 0);
 
 static struct attribute *cpu_hwmon_attributes[] = {
 	&sensor_dev_attr_name.dev_attr.attr,
@@ -69,13 +67,6 @@ static struct attribute_group cpu_hwmon_attribute_group = {
 	.attrs = cpu_hwmon_attributes,
 };
 
-/* Hwmon device get name */
-static ssize_t get_hwmon_name(struct device *dev,
-			struct device_attribute *attr, char *buf)
-{
-	return sprintf(buf, "cpu-hwmon\n");
-}
-
 static ssize_t get_cpu_temp(struct device *dev,
 			struct device_attribute *attr, char *buf);
 static ssize_t cpu_temp_label(struct device *dev,
@@ -176,7 +167,7 @@ static int __init loongson_hwmon_init(void)
 		csr_temp_enable = csr_readl(LOONGSON_CSR_FEATURES) &
 				  LOONGSON_CSRF_TEMP;
 
-	cpu_hwmon_dev = hwmon_device_register(NULL);
+	cpu_hwmon_dev = hwmon_device_register_with_info(NULL, "cpu_hwmon", NULL, NULL, NULL);
 	if (IS_ERR(cpu_hwmon_dev)) {
 		ret = PTR_ERR(cpu_hwmon_dev);
 		pr_err("hwmon_device_register fail!\n");
@@ -186,13 +177,6 @@ static int __init loongson_hwmon_init(void)
 	nr_packages = loongson_sysconf.nr_cpus /
 		loongson_sysconf.cores_per_package;
 
-	ret = sysfs_create_group(&cpu_hwmon_dev->kobj,
-				&cpu_hwmon_attribute_group);
-	if (ret) {
-		pr_err("fail to create loongson hwmon!\n");
-		goto fail_sysfs_create_group_hwmon;
-	}
-
 	ret = create_sysfs_cputemp_files(&cpu_hwmon_dev->kobj);
 	if (ret) {
 		pr_err("fail to create cpu temperature interface!\n");
@@ -207,8 +191,6 @@ static int __init loongson_hwmon_init(void)
 fail_create_sysfs_cputemp_files:
 	sysfs_remove_group(&cpu_hwmon_dev->kobj,
 				&cpu_hwmon_attribute_group);
-
-fail_sysfs_create_group_hwmon:
 	hwmon_device_unregister(cpu_hwmon_dev);
 
 fail_hwmon_device_register:
-- 
2.1.0

