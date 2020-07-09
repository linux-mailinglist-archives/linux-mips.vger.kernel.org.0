Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88AB2196EA
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 05:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgGIDzh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Jul 2020 23:55:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49342 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726119AbgGIDzg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Jul 2020 23:55:36 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxqdQplQZfXJUAAA--.714S3;
        Thu, 09 Jul 2020 11:55:31 +0800 (CST)
From:   Zhi Li <lizhi01@loongson.cn>
To:     chenhc@lemote.com, jiaxun.yang@flygoat.com,
        tsbogend@alpha.franken.de, lixuefeng@loongson.cn
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v3 1/3] MIPS: Loongson: Cleanup cpu_hwmon.c
Date:   Thu,  9 Jul 2020 11:55:19 +0800
Message-Id: <1594266921-28971-2-git-send-email-lizhi01@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1594266921-28971-1-git-send-email-lizhi01@loongson.cn>
References: <1594266921-28971-1-git-send-email-lizhi01@loongson.cn>
X-CM-TRANSID: AQAAf9CxqdQplQZfXJUAAA--.714S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtw1UAw13tryDKFWxtryrWFg_yoWxtFy8pr
        Z8JayF9FWUWF97Gan2vw47ury5ArnIgay7J3sxC34xAanxWr1Yq3W2yFWYyr1kK39Yqws3
        X3srWa1DJa1UWw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
        kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm
        72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
        C7MxkF7I0En4kS14v26r126r1DMxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1I6r4UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
        Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUb2-OUUUUU=
X-CM-SenderInfo: xol2xxqqr6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Tiezhu Yang <yangtiezhu@loongson.cn>

Fix the following checkpatch warnings and errors:

ERROR: do not initialise statics to 0
+static int csr_temp_enable = 0;

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+static SENSOR_DEVICE_ATTR(name, S_IRUGO, get_hwmon_name, NULL, 0);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, get_cpu_temp, NULL, 1);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, cpu_temp_label, NULL, 1);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, get_cpu_temp, NULL, 2);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+static SENSOR_DEVICE_ATTR(temp2_label, S_IRUGO, cpu_temp_label, NULL, 2);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, get_cpu_temp, NULL, 3);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, cpu_temp_label, NULL, 3);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, get_cpu_temp, NULL, 4);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, cpu_temp_label, NULL, 4);

WARNING: Missing a blank line after declarations
+	int id = (to_sensor_dev_attr(attr))->index - 1;
+	return sprintf(buf, "CPU %d Temperature\n", id);

WARNING: Missing a blank line after declarations
+	int value = loongson3_cpu_temp(id);
+	return sprintf(buf, "%d\n", value);

ERROR: spaces required around that '=' (ctx:VxV)
+	for (i=0; i<nr_packages; i++)
 	      ^

ERROR: spaces required around that '<' (ctx:VxV)
+	for (i=0; i<nr_packages; i++)
 	           ^

ERROR: spaces required around that '=' (ctx:VxV)
+	for (i=0; i<nr_packages; i++)
 	      ^

ERROR: spaces required around that '<' (ctx:VxV)
+	for (i=0; i<nr_packages; i++)
 	           ^

ERROR: spaces required around that '=' (ctx:VxV)
+	for (i=0; i<nr_packages; i++) {
 	      ^

ERROR: spaces required around that '<' (ctx:VxV)
+	for (i=0; i<nr_packages; i++) {
 	           ^

WARNING: line over 80 characters
+		csr_temp_enable = csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_TEMP;

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Zhi Li <lizhi01@loongson.cn>
---
 drivers/platform/mips/cpu_hwmon.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/mips/cpu_hwmon.c b/drivers/platform/mips/cpu_hwmon.c
index 0d27cb7..fa42b13 100644
--- a/drivers/platform/mips/cpu_hwmon.c
+++ b/drivers/platform/mips/cpu_hwmon.c
@@ -11,7 +11,7 @@
 #include <loongson_hwmon.h>
 #include <loongson_regs.h>
 
-static int csr_temp_enable = 0;
+static int csr_temp_enable;
 
 /*
  * Loongson-3 series cpu has two sensors inside,
@@ -44,7 +44,7 @@ int loongson3_cpu_temp(int cpu)
 	case PRID_REV_LOONGSON3A_R3_0:
 	case PRID_REV_LOONGSON3A_R3_1:
 	default:
-		reg = (reg & 0xffff)*731/0x4000 - 273;
+		reg = (reg & 0xffff) * 731 / 0x4000 - 273;
 		break;
 	}
 
@@ -57,7 +57,7 @@ static struct device *cpu_hwmon_dev;
 
 static ssize_t get_hwmon_name(struct device *dev,
 			struct device_attribute *attr, char *buf);
-static SENSOR_DEVICE_ATTR(name, S_IRUGO, get_hwmon_name, NULL, 0);
+static SENSOR_DEVICE_ATTR(name, 0444, get_hwmon_name, NULL, 0);
 
 static struct attribute *cpu_hwmon_attributes[] = {
 	&sensor_dev_attr_name.dev_attr.attr,
@@ -81,14 +81,14 @@ static ssize_t get_cpu_temp(struct device *dev,
 static ssize_t cpu_temp_label(struct device *dev,
 			struct device_attribute *attr, char *buf);
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, get_cpu_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, cpu_temp_label, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, get_cpu_temp, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp2_label, S_IRUGO, cpu_temp_label, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, get_cpu_temp, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, cpu_temp_label, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, get_cpu_temp, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, cpu_temp_label, NULL, 4);
+static SENSOR_DEVICE_ATTR(temp1_input, 0444, get_cpu_temp, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp1_label, 0444, cpu_temp_label, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp2_input, 0444, get_cpu_temp, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp2_label, 0444, cpu_temp_label, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp3_input, 0444, get_cpu_temp, NULL, 3);
+static SENSOR_DEVICE_ATTR(temp3_label, 0444, cpu_temp_label, NULL, 3);
+static SENSOR_DEVICE_ATTR(temp4_input, 0444, get_cpu_temp, NULL, 4);
+static SENSOR_DEVICE_ATTR(temp4_label, 0444, cpu_temp_label, NULL, 4);
 
 static const struct attribute *hwmon_cputemp[4][3] = {
 	{
@@ -117,6 +117,7 @@ static ssize_t cpu_temp_label(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
 	int id = (to_sensor_dev_attr(attr))->index - 1;
+
 	return sprintf(buf, "CPU %d Temperature\n", id);
 }
 
@@ -125,6 +126,7 @@ static ssize_t get_cpu_temp(struct device *dev,
 {
 	int id = (to_sensor_dev_attr(attr))->index - 1;
 	int value = loongson3_cpu_temp(id);
+
 	return sprintf(buf, "%d\n", value);
 }
 
@@ -132,7 +134,7 @@ static int create_sysfs_cputemp_files(struct kobject *kobj)
 {
 	int i, ret = 0;
 
-	for (i=0; i<nr_packages; i++)
+	for (i = 0; i < nr_packages; i++)
 		ret = sysfs_create_files(kobj, hwmon_cputemp[i]);
 
 	return ret;
@@ -142,7 +144,7 @@ static void remove_sysfs_cputemp_files(struct kobject *kobj)
 {
 	int i;
 
-	for (i=0; i<nr_packages; i++)
+	for (i = 0; i < nr_packages; i++)
 		sysfs_remove_files(kobj, hwmon_cputemp[i]);
 }
 
@@ -153,7 +155,7 @@ static void do_thermal_timer(struct work_struct *work)
 {
 	int i, value, temp_max = 0;
 
-	for (i=0; i<nr_packages; i++) {
+	for (i = 0; i < nr_packages; i++) {
 		value = loongson3_cpu_temp(i);
 		if (value > temp_max)
 			temp_max = value;
@@ -172,7 +174,8 @@ static int __init loongson_hwmon_init(void)
 	pr_info("Loongson Hwmon Enter...\n");
 
 	if (cpu_has_csr())
-		csr_temp_enable = csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_TEMP;
+		csr_temp_enable = csr_readl(LOONGSON_CSR_FEATURES) &
+				  LOONGSON_CSRF_TEMP;
 
 	cpu_hwmon_dev = hwmon_device_register(NULL);
 	if (IS_ERR(cpu_hwmon_dev)) {
-- 
2.1.0

