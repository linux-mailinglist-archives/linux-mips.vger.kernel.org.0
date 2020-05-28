Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4D01E63EF
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 16:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391125AbgE1O2P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 10:28:15 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:42336 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390938AbgE1O2O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 10:28:14 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 8B212803083A;
        Thu, 28 May 2020 14:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WHZeebYqNsrb; Thu, 28 May 2020 17:28:10 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/3] hwmon: Add notification support
Date:   Thu, 28 May 2020 17:28:04 +0300
Message-ID: <20200528142805.29115-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200528142805.29115-1-Sergey.Semin@baikalelectronics.ru>
References: <20200528142805.29115-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>

For hwmon drivers using the hwmon_device_register_with_info() API, it
is desirable to have a generic notification mechanism available. This
mechanism can be used to notify userspace as well as the thermal
subsystem if the driver experiences any events, such as warning or
critical alarms.

Implement hwmon_notify_event() to provide this mechanism. The function
generates a sysfs event and a udev event. If the device is registered
with the thermal subsystem and the event is associated with a temperature
sensor, also notify the thermal subsystem that a thermal event occurred.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Guenter: I have no plan to push this since there are currently no users
(and thus no means to test the code). However, I want to make sure that
the patch is available if/when needed.
Serge: There is a user now. It's Baikal-T1 PVT driver. So the patch can
be merged in.

Changelog v2: Skipped

Changelog v3:
- Fix merge conflicts found in struct hwmon_thermal_data and in
  hwmon_thermal_add_sensors().
- Use hwmon_attr_base() to get the hwmon attribute base index.
- Use the base value to get the sysfs-attribute name.
  hwmon_thermal_notify() is supposed to be called with normal index.
---
 drivers/hwmon/hwmon.c | 69 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/hwmon.h |  3 ++
 2 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 6a30fb453f7a..e9bc33c18a33 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -15,6 +15,7 @@
 #include <linux/gfp.h>
 #include <linux/hwmon.h>
 #include <linux/idr.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
@@ -31,7 +32,7 @@ struct hwmon_device {
 	const char *name;
 	struct device dev;
 	const struct hwmon_chip_info *chip;
-
+	struct list_head tzdata;
 	struct attribute_group group;
 	const struct attribute_group **groups;
 };
@@ -55,12 +56,12 @@ struct hwmon_device_attribute {
 
 /*
  * Thermal zone information
- * In addition to the reference to the hwmon device,
- * also provides the sensor index.
  */
 struct hwmon_thermal_data {
+	struct list_head node;		/* hwmon tzdata list entry */
 	struct device *dev;		/* Reference to hwmon device */
 	int index;			/* sensor index */
+	struct thermal_zone_device *tzd;/* thermal zone device */
 };
 
 static ssize_t
@@ -156,10 +157,17 @@ static const struct thermal_zone_of_device_ops hwmon_thermal_ops = {
 	.get_temp = hwmon_thermal_get_temp,
 };
 
+static void hwmon_thermal_remove_sensor(void *data)
+{
+	list_del(data);
+}
+
 static int hwmon_thermal_add_sensor(struct device *dev, int index)
 {
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
 	struct hwmon_thermal_data *tdata;
 	struct thermal_zone_device *tzd;
+	int err;
 
 	tdata = devm_kzalloc(dev, sizeof(*tdata), GFP_KERNEL);
 	if (!tdata)
@@ -177,13 +185,37 @@ static int hwmon_thermal_add_sensor(struct device *dev, int index)
 	if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV))
 		return PTR_ERR(tzd);
 
+	err = devm_add_action(dev, hwmon_thermal_remove_sensor, &tdata->node);
+	if (err)
+		return err;
+
+	tdata->tzd = tzd;
+	list_add(&tdata->node, &hwdev->tzdata);
+
 	return 0;
 }
+
+static void hwmon_thermal_notify(struct device *dev, int index)
+{
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
+	struct hwmon_thermal_data *tzdata;
+
+	list_for_each_entry(tzdata, &hwdev->tzdata, node) {
+		if (tzdata->index == index) {
+			thermal_zone_device_update(tzdata->tzd,
+						   THERMAL_EVENT_UNSPECIFIED);
+		}
+	}
+}
+
 #else
 static int hwmon_thermal_add_sensor(struct device *dev, int index)
 {
 	return 0;
 }
+
+static void hwmon_thermal_notify(struct device *dev, int index) { }
+
 #endif /* IS_REACHABLE(CONFIG_THERMAL) && ... */
 
 static int hwmon_attr_base(enum hwmon_sensor_types type)
@@ -511,6 +543,35 @@ static const int __templates_size[] = {
 	[hwmon_intrusion] = ARRAY_SIZE(hwmon_intrusion_attr_templates),
 };
 
+int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel)
+{
+	char sattr[MAX_SYSFS_ATTR_NAME_LENGTH];
+	const char * const *templates;
+	const char *template;
+	int base;
+
+	if (type >= ARRAY_SIZE(__templates))
+		return -EINVAL;
+	if (attr >= __templates_size[type])
+		return -EINVAL;
+
+	templates = __templates[type];
+	template = templates[attr];
+
+	base = hwmon_attr_base(type);
+
+	scnprintf(sattr, MAX_SYSFS_ATTR_NAME_LENGTH, template, base + channel);
+	sysfs_notify(&dev->kobj, NULL, sattr);
+	kobject_uevent(&dev->kobj, KOBJ_CHANGE);
+
+	if (type == hwmon_temp)
+		hwmon_thermal_notify(dev, channel);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hwmon_notify_event);
+
 static int hwmon_num_channel_attrs(const struct hwmon_channel_info *info)
 {
 	int i, n;
@@ -661,6 +722,8 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 	if (err)
 		goto free_hwmon;
 
+	INIT_LIST_HEAD(&hwdev->tzdata);
+
 	if (dev && dev->of_node && chip && chip->ops->read &&
 	    chip->info[0]->type == hwmon_chip &&
 	    (chip->info[0]->config[0] & HWMON_C_REGISTER_TZ)) {
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 5e609f25878c..363d4a814aa1 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -436,6 +436,9 @@ devm_hwmon_device_register_with_info(struct device *dev,
 void hwmon_device_unregister(struct device *dev);
 void devm_hwmon_device_unregister(struct device *dev);
 
+int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel);
+
 /**
  * hwmon_is_bad_char - Is the char invalid in a hwmon name
  * @ch: the char to be considered
-- 
2.26.2

