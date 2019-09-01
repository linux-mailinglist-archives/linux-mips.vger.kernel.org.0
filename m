Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 656B7A4A8C
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbfIAQZ2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:25:28 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:44868 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728877AbfIAQZ2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:25:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 3F72C3F660;
        Sun,  1 Sep 2019 18:25:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EgNUseOu8H_3; Sun,  1 Sep 2019 18:25:25 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 820163F58C;
        Sun,  1 Sep 2019 18:25:25 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:25:25 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>
Subject: [PATCH 092/120] MIPS: PS2: GS: Store privileged registers with sysfs
Message-ID: <0742ac0d622df50b672d8743146a947cac73d2e4.1567326213.git.noring@nocrew.org>
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

One or several bit fields can be written simultaneously. For example,
the PMODE slbg field can be changed with:

    # echo "slbg bgcolor" >/sys/devices/platform/gs/registers/pmode

Written values are integers or enum symbols, depending on the field.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/ps2/gs-sysfs.c | 145 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 140 insertions(+), 5 deletions(-)

diff --git a/drivers/ps2/gs-sysfs.c b/drivers/ps2/gs-sysfs.c
index 2429de3e0094..3c749375aee0 100644
--- a/drivers/ps2/gs-sysfs.c
+++ b/drivers/ps2/gs-sysfs.c
@@ -4,9 +4,9 @@
  *
  * Copyright (C) 2019 Fredrik Noring
  *
- * Reading arbitrary numerical and symbolical privileged GS register
- * bit fields is supported. For example, the PMODE register can be
- * inspected with:
+ * Reading and writing arbitrary numerical and symbolical privileged
+ * GS register bit fields is supported. For example, the PMODE register
+ * can be inspected with:
  *
  *	# cat /sys/devices/platform/gs/registers/pmode
  *	en1 1
@@ -17,6 +17,11 @@
  *	slbg circuit2
  *	alp 0
  *
+ * One or several bit fields can be written simultaneously. For example,
+ * the PMODE slbg field can be changed with:
+ *
+ * 	# echo "slbg bgcolor" >/sys/devices/platform/gs/registers/pmode
+ *
  * The implementation uses a fair amount of macro expansions. This greatly
  * simplifies register definitions, which in the case of PMODE is:
  *
@@ -64,6 +69,76 @@
 
 static struct kobject *registers_kobj;
 
+static size_t line_size(const char *s)
+{
+	const size_t n = strchrnul(s, '\n') - s;
+
+	return s[n] == '\n' ? n + 1 : n;
+}
+
+static const char *trim_line_space(const char *s)
+{
+	while (isspace(*s) && *s != '\n')
+		s++;
+
+	return s;
+}
+
+static bool symbol_match(const char **s, const char *symbol)
+{
+	const size_t length = strlen(symbol);
+	const char *t = *s;
+
+	t = trim_line_space(t);
+	if (strncmp(t, symbol, length) != 0)
+		return false;
+	t += length;
+	t = trim_line_space(t);
+
+	*s = t;
+
+	return true;
+}
+
+static bool number_match(const char **s, u64 *value)
+{
+	const char *t = *s;
+	char *e;
+
+	t = trim_line_space(t);
+	*value = simple_strtoull(t, &e, 0);
+	if (t == e)
+		return false;
+	t = e;
+	t = trim_line_space(t);
+
+	*s = t;
+
+	return true;
+}
+
+static bool end_of_field(const char *s)
+{
+	return *s == '\n' || *s == '\0';
+}
+
+static bool symbol_field(const char *s, const char *field, const char *value)
+{
+	return symbol_match(&s, field) &&
+	       symbol_match(&s, value) &&
+	       end_of_field(s);
+}
+
+static bool number_field(const char *s, const char *field, u64 *value)
+{
+	return symbol_match(&s, field) &&
+	       number_match(&s, value) &&
+	       end_of_field(s);
+}
+
+#define for_each_line(s, n)						\
+	for (n = 0; (s)[n] != '\0'; n += line_size(&(s)[n]))
+
 #define SYSFS_STATEMENT1(prefix_, macro_)				\
 	prefix_##macro_;
 
@@ -231,13 +306,73 @@ static struct kobject *registers_kobj;
 		CONCATENATE(SYSFS_STATEMENT,				\
 			COUNT_ARGS(__VA_ARGS__))(SHOW_, __VA_ARGS__))
 
+#define STORE_SYSFS_DECNUM_FIELD(field_)				\
+	do {								\
+		u64 value_;						\
+		if (number_field(&buf[n], #field_, &value_))		\
+			value.field_ = value_;				\
+	} while (false)
+
+#define STORE_SYSFS_HEXNUM_FIELD(field_)				\
+	STORE_SYSFS_DECNUM_FIELD(field_)
+
+#define STORE_SYSFS_SYMBOL_FIELD_ENTRY(field_, prefix_, value_)		\
+	do {								\
+		if (symbol_field(&buf[n], #field_, #value_))		\
+			value.field_ = prefix_##_##value_;		\
+	} while (false)
+
+#define STORE_SYSFS_SYMBOL_FIELD1(field_, prefix_, value_)		\
+	STORE_SYSFS_SYMBOL_FIELD_ENTRY(field_, prefix_, value_)
+
+#define STORE_SYSFS_SYMBOL_FIELD2(field_, prefix_, value_, ...)		\
+	STORE_SYSFS_SYMBOL_FIELD_ENTRY(field_, prefix_, value_);	\
+	STORE_SYSFS_SYMBOL_FIELD1(field_, prefix_, __VA_ARGS__)
+
+#define STORE_SYSFS_SYMBOL_FIELD3(field_, prefix_, value_, ...)		\
+	STORE_SYSFS_SYMBOL_FIELD_ENTRY(field_, prefix_, value_);	\
+	STORE_SYSFS_SYMBOL_FIELD2(field_, prefix_, __VA_ARGS__)
+
+#define STORE_SYSFS_SYMBOL_FIELD4(field_, prefix_, value_, ...)		\
+	STORE_SYSFS_SYMBOL_FIELD_ENTRY(field_, prefix_, value_);	\
+	STORE_SYSFS_SYMBOL_FIELD3(field_, prefix_, __VA_ARGS__)
+
+#define STORE_SYSFS_SYMBOL_FIELD5(field_, prefix_, value_, ...)		\
+	STORE_SYSFS_SYMBOL_FIELD_ENTRY(field_, prefix_, value_);	\
+	STORE_SYSFS_SYMBOL_FIELD4(field_, prefix_, __VA_ARGS__)
+
+#define STORE_SYSFS_SYMBOL_FIELD(field_, ...)			\
+	CONCATENATE(STORE_SYSFS_SYMBOL_FIELD,				\
+		COUNT_ARGS(__VA_ARGS__))(field_, gs_##field_, __VA_ARGS__)
+
+#define STORE_SYSFS_REGISTER(reg, str, ...)				\
+	static ssize_t store_##reg(struct device *device,		\
+	       struct device_attribute *attr, const char *buf, size_t size) \
+	{								\
+		const bool valid = gs_valid_##reg();			\
+		struct gs_##str value = valid ?			\
+			gs_read_##reg() : (struct gs_##str) { };	\
+		size_t n;						\
+		for_each_line(buf, n) {					\
+			__VA_ARGS__;					\
+		}							\
+		gs_write_##reg(value);					\
+		return size;						\
+	}
+
+#define SYSFS_STORE(reg, str, ...)					\
+	STORE_SYSFS_REGISTER(reg, str,				\
+		CONCATENATE(SYSFS_STATEMENT,				\
+			COUNT_ARGS(__VA_ARGS__))(STORE_, __VA_ARGS__))
+
 #define SYSFS_RO_REG(reg, str, ...)					\
 	SYSFS_SHOW(reg, str, __VA_ARGS__)				\
 	static DEVICE_ATTR(reg, S_IRUGO, show_##reg, NULL)
 
 #define SYSFS_RW_REG(reg, str, ...)					\
 	SYSFS_SHOW(reg, str, __VA_ARGS__)				\
-	static DEVICE_ATTR(reg, S_IRUGO, show_##reg, NULL)
+	SYSFS_STORE(reg, str, __VA_ARGS__)				\
+	static DEVICE_ATTR(reg, S_IRUGO | S_IWUSR, show_##reg, store_##reg)
 
 SYSFS_RW_REG(pmode, pmode,
 	SYSFS_DECNUM_FIELD(en1),
@@ -412,7 +547,7 @@ static struct attribute_group gs_registers_attribute_group = {
 
 static int __init gs_sysfs_init(void)
 {
-	struct device *gs_dev = gs_device();	/* FIXME: Is this method appropriate? */
+	struct device *gs_dev = gs_device_driver();	/* FIXME: Is this method appropriate? */
 	int err;
 
 	if (!gs_dev) {
-- 
2.21.0

