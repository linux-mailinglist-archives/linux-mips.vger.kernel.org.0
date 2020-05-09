Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA2C1CBE51
	for <lists+linux-mips@lfdr.de>; Sat,  9 May 2020 09:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgEIHM7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 May 2020 03:12:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44591 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728625AbgEIHM7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 9 May 2020 03:12:59 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf93sV7ZeMnUyAA--.1S3;
        Sat, 09 May 2020 15:12:46 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 1/2] MIPS: Loongson: Cleanup cpu_hwmon.c
Date:   Sat,  9 May 2020 15:12:43 +0800
Message-Id: <1589008364-2294-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1589008364-2294-1-git-send-email-yangtiezhu@loongson.cn>
References: <1589008364-2294-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxf93sV7ZeMnUyAA--.1S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw4xGrW7GF4fWw4xuw48WFg_yoW3ZFW7pr
        WDJay09F4UWFs7Gan7Zw47Cry5ArnIgay7G3sxu3s7AanxXF4jqa42yFWYyrn3KrWFqa1f
        JryDXa1DGa1UWF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF4l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8NtIDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following checkpatch warnings and errors:

ERROR: do not initialise statics to 0
#14: FILE: drivers/platform/mips/cpu_hwmon.c:14:
+static int csr_temp_enable = 0;

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#60: FILE: drivers/platform/mips/cpu_hwmon.c:60:
+static SENSOR_DEVICE_ATTR(name, S_IRUGO, get_hwmon_name, NULL, 0);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#84: FILE: drivers/platform/mips/cpu_hwmon.c:84:
+static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, get_cpu_temp, NULL, 1);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#85: FILE: drivers/platform/mips/cpu_hwmon.c:85:
+static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, cpu_temp_label, NULL, 1);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#86: FILE: drivers/platform/mips/cpu_hwmon.c:86:
+static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, get_cpu_temp, NULL, 2);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#87: FILE: drivers/platform/mips/cpu_hwmon.c:87:
+static SENSOR_DEVICE_ATTR(temp2_label, S_IRUGO, cpu_temp_label, NULL, 2);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#88: FILE: drivers/platform/mips/cpu_hwmon.c:88:
+static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, get_cpu_temp, NULL, 3);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#89: FILE: drivers/platform/mips/cpu_hwmon.c:89:
+static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, cpu_temp_label, NULL, 3);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#90: FILE: drivers/platform/mips/cpu_hwmon.c:90:
+static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, get_cpu_temp, NULL, 4);

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
#91: FILE: drivers/platform/mips/cpu_hwmon.c:91:
+static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, cpu_temp_label, NULL, 4);

WARNING: Missing a blank line after declarations
#120: FILE: drivers/platform/mips/cpu_hwmon.c:120:
+	int id = (to_sensor_dev_attr(attr))->index - 1;
+	return sprintf(buf, "CPU %d Temperature\n", id);

WARNING: Missing a blank line after declarations
#128: FILE: drivers/platform/mips/cpu_hwmon.c:128:
+	int value = loongson3_cpu_temp(id);
+	return sprintf(buf, "%d\n", value);

ERROR: spaces required around that '=' (ctx:VxV)
#135: FILE: drivers/platform/mips/cpu_hwmon.c:135:
+	for (i=0; i<nr_packages; i++)
 	      ^

ERROR: spaces required around that '<' (ctx:VxV)
#135: FILE: drivers/platform/mips/cpu_hwmon.c:135:
+	for (i=0; i<nr_packages; i++)
 	           ^

ERROR: spaces required around that '=' (ctx:VxV)
#145: FILE: drivers/platform/mips/cpu_hwmon.c:145:
+	for (i=0; i<nr_packages; i++)
 	      ^

ERROR: spaces required around that '<' (ctx:VxV)
#145: FILE: drivers/platform/mips/cpu_hwmon.c:145:
+	for (i=0; i<nr_packages; i++)
 	           ^

ERROR: spaces required around that '=' (ctx:VxV)
#156: FILE: drivers/platform/mips/cpu_hwmon.c:156:
+	for (i=0; i<nr_packages; i++) {
 	      ^

ERROR: spaces required around that '<' (ctx:VxV)
#156: FILE: drivers/platform/mips/cpu_hwmon.c:156:
+	for (i=0; i<nr_packages; i++) {
 	           ^

WARNING: line over 80 characters
#175: FILE: drivers/platform/mips/cpu_hwmon.c:175:
+		csr_temp_enable = csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_TEMP;

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
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

