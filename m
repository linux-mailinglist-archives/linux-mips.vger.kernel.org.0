Return-Path: <linux-mips+bounces-7831-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0939BA3A774
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 20:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A2C6188FF76
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 19:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A701E833B;
	Tue, 18 Feb 2025 19:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QitoUgnU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2514517A2FD
	for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 19:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907039; cv=none; b=FnUJtuUkmRRe30JdlcBcdt2jGRFrjEy0tq1tNRNnLhfwBXh0Y7YBwMSLe6E6ZHzjitMA5g9vU7ee3TK1n+saplPOzSIiXM3rNC9fNvaXqjLyTDQLWLj0Cu8CyX/c8ljhkfxOVDrhuOkuzxwyANzoXzWI/tj4LXpITSYcWhik/Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907039; c=relaxed/simple;
	bh=PkjdIaC56eTrgW6J5aLTcTBWZbxgsIMKj1P2361ZPvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHCDXNmDl2kvyJji4r3RYB/vtDapMhzh24FwjLWYW4yj8z//pXQd+V0/bZv66/Ve5JNF43AKH+MDKszh17Px2BJ5bPzRVW5pw9WJevsy3hYuccwzw+K8xF7fkQmjV5hc7beeTDHB6W1xBkvNmlXV8d4XXfzvIeAdEZClSmrSDig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QitoUgnU; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so6279402a12.0
        for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 11:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907035; x=1740511835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A496sD4a/2Yi1AUooRYlTxVGsi1ThKtEtWKAWQ65LbM=;
        b=QitoUgnUu6objB1c8eInwA74Rxj/YNOtLDxQOu20evB5BHsGWE8+nNb/ApXx4WPlqs
         +SbY2pjOEKgmt+Y/txXzzL2GblDdRkBqPSTy9VdAnteToymQzP7Nq3CIR81HrL0NEr5s
         rCTz2oiIbH1ynOnaEbi1aufi53fNYwE6nc7913T5vpW0V1uR7elrKnMyF/zv7+WBxxHw
         QzCJZwJii89j6QRVnfbZviotNLeEXz6geOuy3kaOxbwBX4uSlD2pCkwIfqXCFj7IjgCe
         YyqhWK44hTHYgeKVCeJGN+3g/HEAa5Lwq0wK2k7w0doj8SOW6106hi5NDocLYFtI7Oue
         QcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907035; x=1740511835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A496sD4a/2Yi1AUooRYlTxVGsi1ThKtEtWKAWQ65LbM=;
        b=DfrVAIYab/7T3FxASjKPU5smFjp+I2N2lY28pWt2w7eKTN268uTFIXpB9gRXQ++Mgh
         IpR0gl1Uv/6A9BzN1xq7u2qHYeyHErrtT4pLs1UT5Sq0NVvso7UVWQ0e57zWIsUo+jka
         zAER0y/Ex08d/GXsRxQky6js11F1YtLOk6i6trmMRp9+Hwu3/Jfwhal3nR1VQwRph2LE
         Oa84JmNYCJqICeEDi9RpE8HWemHHW1mK/jP4Lsx2VbLC1KXu60c7n6o1+H2gIhBmgyTZ
         Zndciqbue67T6frdclpWiAW9m3Uf0sNuXcKUH1GdWihvgloEuNu6MiT4/3z9rcQujZhX
         sFtg==
X-Forwarded-Encrypted: i=1; AJvYcCXevfyiSOIrhTKU3kbSzq0GAQ91drnjce1Zsx428p7QbOkANbuMsT5Ivza+tSh5X7b86N5QrKWgCEWS@vger.kernel.org
X-Gm-Message-State: AOJu0YxtxWMKofsHNv5nb/duv1ZLeX616IQB7lVNO5wjDmM0tUsN3sPo
	TWNVHZJA3/Wy/xsrmPtXzJOz2OWmsb/4MvXUWbGXiyEiGyxyrSwYyK0bSSHnXw8=
X-Gm-Gg: ASbGnctisgZiuZRb2FjAdPYxouMrXKIJKmbiNUt1N8PJ7qxunyUm3T4K4dBs4mzAnyb
	+9g5y08d/b/CLXNg5n8MaY43E35c2TMuUh7BYn6XpLR/xqpM+B0BHmaf/7q4Xe0Y7PQs4xP3B1t
	TcL+owCGYW2RIeV+yhFWivLVIed9Gd0phP89sKF7hwU5H5aDIcA7EpTI//5xIU0pLjF/w2fVwjG
	vBwMnfLHL00+30XrsvloGw+ns3kHcmpLnUMXy48rW01dQJ86yjg23vuJgebvniEDv8X9Cue8E36
	8q1X/ydbYwsqbPjSzpehsj0/TW68
X-Google-Smtp-Source: AGHT+IE5Wa5KJ5irXNEqRMx0DZmNPYCFnRuPmEtxdUqVwUY8iuRTnfmnPlFGCgRgwZYmZjYuGxKlHA==
X-Received: by 2002:a05:6402:3589:b0:5e0:82a0:50d9 with SMTP id 4fb4d7f45d1cf-5e082a0580dmr1610706a12.25.1739907035420;
        Tue, 18 Feb 2025 11:30:35 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:35 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:46 +0100
Subject: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5226; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=PkjdIaC56eTrgW6J5aLTcTBWZbxgsIMKj1P2361ZPvk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/PpRSgjntFL4im0pKu+WkiaMHGJvFgAMlXT
 2MCP0memWuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7TfzwAKCRDm/A8cN/La
 hUPFEACcW0XW9/B/qo7EEmYWuIE8aUcE5HUVtsI0TkkMJMo5YnwHLpUNDoSEEbkKbv14vquBqbK
 Iy+dvIFKZ8BWMQZBDDHhi6jRtAFTgeQEsZMQIg2J0/+IlKhpJPF6AscLdg5p1Dgg1HXCauRxeou
 1VbEV6GrwhuTydry6GLWfyOUlmQju6OvpILm+L4mwrJpX9ykPJ6gwNIuVAlkqcJFHXmKBqJFgj6
 KmJeCGEATTKhIA/om6qi2z2GpvWfCdIjowrVc2yMdeagAGBqUnPLvJxYn6/bwDJ6h742YWZ9goy
 yRyWpO1O2zJ/6uRzZgkE1tCxJhV1BCaER8ZC7ZWzRmZhcfP6T5zY6x8Z33wkUs/HFqTl3HgAfuE
 nZdvMSmzDoGdQe4cDAzwVpup4fg2nKxCgjDq7p19/7CQWZU/HryiyHo6ek/pOAUc0xw9szxXdPV
 pJ7sSRrMpc9RV5K8nGfJW40rcwG+cKC2qkas/TwbNgzYhnn0M7XyVAVMUyQ28Gyhe3nAdEIpfHB
 rdQPj4DLQq3e/67HhncZL8agAL/LVgSmQ2/7PdJB44hJsNi1V7VGMLF9MD8RrZu1m5x/nSyXkq2
 LbPW+TWunsUuPoXm0HIZln4YNEsHFz6LlLOFjeAbeKtyzFEDL2/pqWRat04XTNU1u7RsW1bHRrR
 EFlV+exOQmrhA/Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add helper functions to create a device on the auxiliary bus.

This is meant for fairly simple usage of the auxiliary bus, to avoid having
the same code repeated in the different drivers.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/auxiliary_bus.h |  17 +++++++
 2 files changed, 125 insertions(+)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
 }
 EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
 
+static void auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	kfree(auxdev);
+}
+
+/**
+ * auxiliary_device_create - create a device on the auxiliary bus
+ * @dev: parent device
+ * @modname: module name used to create the auxiliary driver name.
+ * @devname: auxiliary bus device name
+ * @platform_data: auxiliary bus device platform data
+ * @id: auxiliary bus device id
+ *
+ * Helper to create an auxiliary bus device.
+ * The device created matches driver 'modname.devname' on the auxiliary bus.
+ */
+struct auxiliary_device *auxiliary_device_create(struct device *dev,
+						 const char *modname,
+						 const char *devname,
+						 void *platform_data,
+						 int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
+	if (!auxdev)
+		return NULL;
+
+	auxdev->id = id;
+	auxdev->name = devname;
+	auxdev->dev.parent = dev;
+	auxdev->dev.platform_data = platform_data;
+	auxdev->dev.release = auxiliary_device_release;
+	device_set_of_node_from_dev(&auxdev->dev, dev);
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret) {
+		kfree(auxdev);
+		return NULL;
+	}
+
+	ret = __auxiliary_device_add(auxdev, modname);
+	if (ret) {
+		/*
+		 * It may look odd but auxdev should not be freed here.
+		 * auxiliary_device_uninit() calls device_put() which call
+		 * the device release function, freeing auxdev.
+		 */
+		auxiliary_device_uninit(auxdev);
+		return NULL;
+	}
+
+	return auxdev;
+}
+EXPORT_SYMBOL_GPL(auxiliary_device_create);
+
+/**
+ * auxiliary_device_destroy - remove an auxiliary device
+ * @auxdev: pointer to the auxdev to be removed
+ *
+ * Helper to remove an auxiliary device created with
+ * auxiliary_device_create()
+ */
+void auxiliary_device_destroy(void *auxdev)
+{
+	struct auxiliary_device *_auxdev = auxdev;
+
+	auxiliary_device_delete(_auxdev);
+	auxiliary_device_uninit(_auxdev);
+}
+EXPORT_SYMBOL_GPL(auxiliary_device_destroy);
+
+/**
+ * __devm_auxiliary_device_create - create a managed device on the auxiliary bus
+ * @dev: parent device
+ * @modname: module name used to create the auxiliary driver name.
+ * @devname: auxiliary bus device name
+ * @platform_data: auxiliary bus device platform data
+ * @id: auxiliary bus device id
+ *
+ * Device managed helper to create an auxiliary bus device.
+ * The device created matches driver 'modname.devname' on the auxiliary bus.
+ */
+struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
+	if (IS_ERR(auxdev))
+		return auxdev;
+
+	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
+				       auxdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return auxdev;
+}
+EXPORT_SYMBOL_GPL(__devm_auxiliary_device_create);
+
 void __init auxiliary_bus_init(void)
 {
 	WARN_ON(bus_register(&auxiliary_bus_type));
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index 65dd7f15437474468acf0e28f6932a7ff2cfff2c..4086afd0cc6b96084c190f24acc304cde5d1749a 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -254,6 +254,23 @@ int __auxiliary_driver_register(struct auxiliary_driver *auxdrv, struct module *
 
 void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv);
 
+struct auxiliary_device *auxiliary_device_create(struct device *dev,
+						 const char *modname,
+						 const char *devname,
+						 void *platform_data,
+						 int id);
+void auxiliary_device_destroy(void *auxdev);
+
+struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id);
+
+#define devm_auxiliary_device_create(dev, devname, platform_data)     \
+	__devm_auxiliary_device_create(dev, KBUILD_MODNAME, devname,  \
+				       platform_data, 0)
+
 /**
  * module_auxiliary_driver() - Helper macro for registering an auxiliary driver
  * @__auxiliary_driver: auxiliary driver struct

-- 
2.47.2


