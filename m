Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5B2A4A47
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfIAPyJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:54:09 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:57174 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfIAPyJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:54:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 997A13F73E
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:54:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aglGtmeKr8Fl for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:54:06 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id DAECF3F708
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:54:06 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:54:06 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 045/120] MIPS: PS2: ROM: Provide extended file information
 via sysfs
Message-ID: <c30645dd7d026349106111123f86301fc5577379.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The extended ROM file information can be viewed with sysfs:

	# ls /sys/rom/rom0/file/8/extinfo
	comment  data     date     size     version
	# cat /sys/rom/rom0/file/8/extinfo/*
	System_Memory_Manager
	0x1fc02df4
	2002-04-03
	40
	0x0101

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/ps2/rom-sysfs.c | 104 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/mips/ps2/rom-sysfs.c b/arch/mips/ps2/rom-sysfs.c
index 158d36763af5..804644a931e8 100644
--- a/arch/mips/ps2/rom-sysfs.c
+++ b/arch/mips/ps2/rom-sysfs.c
@@ -28,6 +28,8 @@
 //	# grep -l ROMVER /sys/rom/rom0/file/*/name
 //	/sys/rom/rom0/file/3/name
 //	# cd /sys/rom/rom0/file/3
+//	# ls
+//	data     extinfo  name     size
 //	# dd if=/dev/mem bs=$(cat size) iflag=skip_bytes
 //		skip=$(( $(cat data) )) count=1 status=none
 //	0170EC20030227
@@ -45,6 +47,17 @@
 // The CEX type indicates that it is a retail machine, as opposed to for
 // example DEX that would be a debug machine.
 //
+// The extended ROM file information can also be viewed with sysfs::
+//
+// 	# ls /sys/rom/rom0/file/8/extinfo
+// 	comment  data     date     size     version
+// 	# cat /sys/rom/rom0/file/8/extinfo/*
+// 	System_Memory_Manager
+// 	0x1fc02df4
+// 	2002-04-03
+// 	40
+// 	0x0101
+//
 
 #include <linux/ctype.h>
 #include <linux/device.h>
@@ -102,6 +115,14 @@ static struct rom_file rom_file_from_kobj(const struct kobject *kobj)
 	return (struct rom_file) { .name = "<undefined>" };
 }
 
+static struct rom_extinfo rom_extinfo_from_kobj(const struct kobject *kobj)
+{
+	const struct rom_file file = rom_file_from_kobj(kobj->parent);
+
+	return rom_read_extinfo(file.name,
+		file.extinfo.data, file.extinfo.size);
+}
+
 static ssize_t rom_version_number_show(struct kobject *kobj,
 	struct kobj_attribute *attr, char *buf)
 {
@@ -131,6 +152,54 @@ static ssize_t rom_version_date_show(struct kobject *kobj,
 		v.date.year, v.date.month, v.date.day);
 }
 
+static ssize_t rom_extinfo_size_show(struct kobject *kobj,
+	struct kobj_attribute *attr, char *buf)
+{
+	return scnprintf(buf, PAGE_SIZE, "%zu\n",
+		rom_file_from_kobj(kobj->parent).extinfo.size);
+}
+
+static ssize_t rom_extinfo_data_show(struct kobject *kobj,
+	struct kobj_attribute *attr, char *buf)
+{
+	return scnprintf(buf, PAGE_SIZE, "0x%lx\n",
+		virt_to_phys(rom_file_from_kobj(kobj->parent).extinfo.data));
+}
+
+static ssize_t rom_extinfo_version_show(struct kobject *kobj,
+	struct kobj_attribute *attr, char *buf)
+{
+	const struct rom_extinfo ei = rom_extinfo_from_kobj(kobj);
+
+	if (!ei.version)
+		return 0;
+
+	return scnprintf(buf, PAGE_SIZE, "0x%04x\n", ei.version);
+}
+
+static ssize_t rom_extinfo_date_show(struct kobject *kobj,
+	struct kobj_attribute *attr, char *buf)
+{
+	const struct rom_extinfo ei = rom_extinfo_from_kobj(kobj);
+
+	if (!ei.date.year && !ei.date.month && !ei.date.day)
+		return 0;
+
+	return scnprintf(buf, PAGE_SIZE, "%04d-%02d-%02d\n",
+		ei.date.year, ei.date.month, ei.date.day);
+}
+
+static ssize_t rom_extinfo_comment_show(struct kobject *kobj,
+	struct kobj_attribute *attr, char *buf)
+{
+	const struct rom_extinfo ei = rom_extinfo_from_kobj(kobj);
+
+	if (ei.comment[0] == '\0')
+		return 0;
+
+	return scnprintf(buf, PAGE_SIZE, "%s\n", ei.comment);
+}
+
 static ssize_t rom_file_name_show(struct kobject *kobj,
 	struct kobj_attribute *attr, char *buf)
 {
@@ -173,6 +242,25 @@ static struct attribute_group rom_version_attribute_group = {
 	.attrs = rom_version_attributes
 };
 
+DEFINE_ROM_FIELD_ATTR(extinfo, size);
+DEFINE_ROM_FIELD_ATTR(extinfo, data);
+DEFINE_ROM_FIELD_ATTR(extinfo, version);
+DEFINE_ROM_FIELD_ATTR(extinfo, date);
+DEFINE_ROM_FIELD_ATTR(extinfo, comment);
+
+static struct attribute *rom_extinfo_attributes[] = {
+	&rom_attribute_extinfo_size.attr,
+	&rom_attribute_extinfo_data.attr,
+	&rom_attribute_extinfo_version.attr,
+	&rom_attribute_extinfo_date.attr,
+	&rom_attribute_extinfo_comment.attr,
+	NULL
+};
+
+static struct attribute_group rom_extinfo_attribute_group = {
+	.attrs = rom_extinfo_attributes
+};
+
 DEFINE_ROM_FIELD_ATTR(file, name);
 DEFINE_ROM_FIELD_ATTR(file, size);
 DEFINE_ROM_FIELD_ATTR(file, data);
@@ -199,6 +287,18 @@ static int rom0_sysfs(struct kobject *rom0_kobj)
 	return sysfs_create_group(version_kobj, &rom_version_attribute_group);
 }
 
+static int __init rom_init_file_extinfo(struct kobject *index_kobj,
+	const struct rom_file file)
+{
+	struct kobject *extinfo_kobj;
+
+	extinfo_kobj = kobject_create_and_add("extinfo", index_kobj);
+	if (!extinfo_kobj)
+		return -ENOMEM;
+
+	return sysfs_create_group(extinfo_kobj, &rom_extinfo_attribute_group);
+}
+
 static int __init rom_init_file(struct kobject *file_kobj, size_t index,
 	const struct rom_file file)
 {
@@ -212,6 +312,10 @@ static int __init rom_init_file(struct kobject *file_kobj, size_t index,
 	if (!index_kobj)
 		return -ENOMEM;
 
+	err = rom_init_file_extinfo(index_kobj, file);
+	if (err)
+		return err;
+
 	return sysfs_create_group(index_kobj, &rom_file_attribute_group);
 }
 
-- 
2.21.0

