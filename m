Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71BB45FB01D
	for <lists+linux-mips@lfdr.de>; Tue, 11 Oct 2022 12:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiJKKEX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Oct 2022 06:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbiJKKEH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Oct 2022 06:04:07 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7BE8D0CA;
        Tue, 11 Oct 2022 03:03:51 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id r17so30220079eja.7;
        Tue, 11 Oct 2022 03:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6r9TR6k7ZFnpYRrQ79w4enoBrUyIdRGewHutjKTPK0c=;
        b=dit3LHF+DkfIOR2jPB98pCnX5hBg2tdQYKlOSSnzZwUddl2fl8cHYDeZJpUO9A4Aw/
         Af1C5cwxE5Q7nDLsh8IxLaXYaKJsMiSJGko8AJIB7p2FCiz6Y5Ye/uuADYF+EAGaljkZ
         4sHPGDDV6V9B5carYU3TAuQTxOgUDlgYqmscEIax3d7+v0Fr9gFsdTdmCPtX0l0nrNR3
         zamYQt+nYWT1XzLaSHw5OFuD/LqFwbunGbhVl+vUC5/UJrqSdNtXlTR6Qng6cHsnEF5Y
         JKEM2E36Tl2Rf+I0Ev7tvP53V3Dkbm4npeiVyV5qj9gTVNmmT2X4lAosMLgoyHSzWkKN
         gMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6r9TR6k7ZFnpYRrQ79w4enoBrUyIdRGewHutjKTPK0c=;
        b=TTyRqSjvcKV4rcZwtESvWWqMpdfUIc0/5pQJPblr03bDSdmYkpfVTffZAi6Q1x7tDK
         6PDIem70JJjqrjoqB6yg7xoolp7T/yGjIkb9ChyP4LgXqW07TAIqEZDGa8/kZrSWh9fr
         8rb18GA5QnoAQm+hxyYVN6cZBHr6bt7lb0g96hUpMkgg0IHdR47HsKAOEjCaQm/F1xH9
         OLQcsg5Vzguu122EhyZE6X06Xvd0W45E5yoh2YBJh6eDaRHJBi7w99408haL6I62PBkh
         dY7Q2HlWO/Neq2PZvp7P5LZmlmET14ZKeDh8VO26DVXqmFtBRVN8nYIDCoeosTLAJQ5c
         Jbyg==
X-Gm-Message-State: ACrzQf0pdr6ebQcbMf506XqLUsHv0SG0WjkMcBRkGVAZEPrq1NNCuihB
        JpCqJnk+dzkRkCTUUxemrrM=
X-Google-Smtp-Source: AMsMyM6gizhUse19Na7gK9CEfRA28qIOD56HDJigggh7Xg6DDqwtaArMlhx4ISEVp6zi9p7QQUvsgQ==
X-Received: by 2002:a17:907:1c1a:b0:78d:426c:2828 with SMTP id nc26-20020a1709071c1a00b0078d426c2828mr18691133ejc.331.1665482629474;
        Tue, 11 Oct 2022 03:03:49 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id o8-20020a170906768800b00780ab5a9116sm4597749ejm.211.2022.10.11.03.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 03:03:49 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        bcm-kernel-feedback-list@broadcom.com,
        John Crispin <john@phrozen.org>,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] mtd: parsers: add TP-Link SafeLoader partitions table parser
Date:   Tue, 11 Oct 2022 12:03:33 +0200
Message-Id: <20221011100333.32536-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011100333.32536-1-zajec5@gmail.com>
References: <20221011100333.32536-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This parser deals with most TP-Link home routers. It reads info about
partitions and registers them in the MTD subsystem.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/parsers/Kconfig             |  15 +++
 drivers/mtd/parsers/Makefile            |   1 +
 drivers/mtd/parsers/tplink_safeloader.c | 150 ++++++++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 drivers/mtd/parsers/tplink_safeloader.c

diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index aaa06050c9bc..c258ba2a3a6f 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -123,6 +123,21 @@ config MTD_AFS_PARTS
 	  for your particular device. It won't happen automatically. The
 	  'physmap' map driver (CONFIG_MTD_PHYSMAP) does this, for example.
 
+config MTD_PARSER_TPLINK_SAFELOADER
+	tristate "TP-Link Safeloader partitions parser"
+	depends on MTD && (ARCH_BCM_5301X || ATH79 || SOC_MT7620 || SOC_MT7621 || COMPILE_TEST)
+	help
+	  TP-Link home routers use flash partitions to store various data. Info
+	  about flash space layout is stored in a partitions table using a
+	  custom ASCII-based format.
+
+	  That format was first found in devices with SafeLoader bootloader and
+	  was named after it. Later it was adapted to CFE and U-Boot
+	  bootloaders.
+
+	  This driver reads partitions table, parses it and creates MTD
+	  partitions.
+
 config MTD_PARSER_TRX
 	tristate "Parser for TRX format partitions"
 	depends on MTD && (BCM47XX || ARCH_BCM_5301X || ARCH_MEDIATEK || RALINK || COMPILE_TEST)
diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
index 23fa4de4016f..0e70b621a1d8 100644
--- a/drivers/mtd/parsers/Makefile
+++ b/drivers/mtd/parsers/Makefile
@@ -10,6 +10,7 @@ ofpart-$(CONFIG_MTD_OF_PARTS_BCM4908)	+= ofpart_bcm4908.o
 ofpart-$(CONFIG_MTD_OF_PARTS_LINKSYS_NS)+= ofpart_linksys_ns.o
 obj-$(CONFIG_MTD_PARSER_IMAGETAG)	+= parser_imagetag.o
 obj-$(CONFIG_MTD_AFS_PARTS)		+= afs.o
+obj-$(CONFIG_MTD_PARSER_TPLINK_SAFELOADER)	+= tplink_safeloader.o
 obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
 obj-$(CONFIG_MTD_SERCOMM_PARTS)		+= scpart.o
 obj-$(CONFIG_MTD_SHARPSL_PARTS)		+= sharpslpart.o
diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/parsers/tplink_safeloader.c
new file mode 100644
index 000000000000..7317d1faabbb
--- /dev/null
+++ b/drivers/mtd/parsers/tplink_safeloader.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2022 Rafał Miłecki <rafal@milecki.pl>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+
+#define TPLINK_SAFELOADER_DATA_OFFSET		4
+#define TPLINK_SAFELOADER_MAX_PARTS		32
+
+struct safeloader_cmn_header {
+	__be32 size;
+	uint32_t unused;
+} __packed;
+
+static void *mtd_parser_tplink_safeloader_read_table(struct mtd_info *mtd)
+{
+	struct safeloader_cmn_header hdr;
+	struct device_node *np;
+	size_t bytes_read;
+	size_t offset;
+	size_t size;
+	char *buf;
+	int err;
+
+	np = mtd_get_of_node(mtd);
+	if (mtd_is_partition(mtd))
+		of_node_get(np);
+	else
+		np = of_get_child_by_name(np, "partitions");
+
+	if (of_property_read_u32(np, "partitions-table-offset", &offset)) {
+		pr_err("Failed to get partitions table offset\n");
+		goto err_put;
+	}
+
+	err = mtd_read(mtd, offset, sizeof(hdr), &bytes_read, (uint8_t *)&hdr);
+	if (err && !mtd_is_bitflip(err)) {
+		pr_err("Failed to read from %s at 0x%zx\n", mtd->name, offset);
+		goto err_put;
+	}
+
+	size = be32_to_cpu(hdr.size);
+
+	buf = kmalloc(size + 1, GFP_KERNEL);
+	if (!buf)
+		goto err_put;
+
+	err = mtd_read(mtd, offset + sizeof(hdr), size, &bytes_read, buf);
+	if (err && !mtd_is_bitflip(err)) {
+		pr_err("Failed to read from %s at 0x%zx\n", mtd->name, offset + sizeof(hdr));
+		goto err_kfree;
+	}
+
+	buf[size - 1] = '\0';
+
+	of_node_put(np);
+
+	return buf;
+
+err_kfree:
+	kfree(buf);
+err_put:
+	of_node_put(np);
+	return NULL;
+}
+
+static int mtd_parser_tplink_safeloader_parse(struct mtd_info *mtd,
+					      const struct mtd_partition **pparts,
+					      struct mtd_part_parser_data *data)
+{
+	struct mtd_partition *parts;
+	char name[65];
+	size_t offset;
+	size_t bytes;
+	char *buf;
+	int idx;
+	int err;
+
+	parts = kcalloc(TPLINK_SAFELOADER_MAX_PARTS, sizeof(*parts), GFP_KERNEL);
+	if (!parts) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+
+	buf = mtd_parser_tplink_safeloader_read_table(mtd);
+	if (!buf) {
+		err = -ENOENT;
+		goto err_out;
+	}
+
+	for (idx = 0, offset = TPLINK_SAFELOADER_DATA_OFFSET;
+	     idx < TPLINK_SAFELOADER_MAX_PARTS &&
+	     sscanf(buf + offset, "partition %64s base 0x%llx size 0x%llx%n\n",
+		    name, &parts[idx].offset, &parts[idx].size, &bytes) == 3;
+	     idx++, offset += bytes + 1) {
+		parts[idx].name = kstrdup(name, GFP_KERNEL);
+		if (!parts[idx].name) {
+			err = -ENOMEM;
+			goto err_free;
+		}
+	}
+
+	if (idx == TPLINK_SAFELOADER_MAX_PARTS)
+		pr_warn("Reached maximum number of partitions!\n");
+
+	kfree(buf);
+
+	*pparts = parts;
+
+	return idx;
+
+err_free:
+	for (idx -= 1; idx >= 0; idx--)
+		kfree(parts[idx].name);
+err_out:
+	return err;
+};
+
+static void mtd_parser_tplink_safeloader_cleanup(const struct mtd_partition *pparts,
+						 int nr_parts)
+{
+	int i;
+
+	for (i = 0; i < nr_parts; i++)
+		kfree(pparts[i].name);
+
+	kfree(pparts);
+}
+
+static const struct of_device_id mtd_parser_tplink_safeloader_of_match_table[] = {
+	{ .compatible = "tplink,safeloader-partitions" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtd_parser_tplink_safeloader_of_match_table);
+
+static struct mtd_part_parser mtd_parser_tplink_safeloader = {
+	.parse_fn = mtd_parser_tplink_safeloader_parse,
+	.cleanup = mtd_parser_tplink_safeloader_cleanup,
+	.name = "tplink-safeloader",
+	.of_match_table = mtd_parser_tplink_safeloader_of_match_table,
+};
+module_mtd_part_parser(mtd_parser_tplink_safeloader);
+
+MODULE_LICENSE("GPL");
-- 
2.34.1

