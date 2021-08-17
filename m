Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC3D3EEB2C
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 12:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236034AbhHQKqM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Aug 2021 06:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235380AbhHQKqL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Aug 2021 06:46:11 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E08C061764;
        Tue, 17 Aug 2021 03:45:38 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso1535409wmc.5;
        Tue, 17 Aug 2021 03:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LliqR4BffIKLKIAnT8gxu6UOIwAnFEp/t5CVTZm8b1Q=;
        b=KptzQh6LpXfJdLHBa4wnrs1TmwbhHIeUM42RRFq/LbMAM/UR4XNddtLNryvdGHXlIX
         TyJ0rULRpDUjJJHUctXt0bmY1zbEw2o9QNhdeKNoIrXGMXo8hTG18XvHeTfd7vNnRGsP
         xG9H+yQYIbzJZxLlUBIzG9Ky8Dxq8hfLf0m6Yzh0r8B6/nWu0UOplI09QQD05KAWN/6Z
         vUX1n6PQy/Covtld+vAmOYrF2RMzGrRvZm1KvrnlS/RKE7tiAbGwhmsDHas7x9aoIpLr
         nvK+Qgqm7EL+53A3ARnf2LXg8WJ1XDHZNgUIsZi4OuK+7+7CAgeAWawAPX/G+kKP+uIp
         3GZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LliqR4BffIKLKIAnT8gxu6UOIwAnFEp/t5CVTZm8b1Q=;
        b=lieD69abWHByS3Wg8YgwfSYQ5a8UM7kSwvMM69mnOnt9F47Zw45lVv6fLMVS/hBvHX
         U2iittx4jrTAK7Rydz6ml3p55eAtoI8c+0Chg7sDwInnaixr75NwftjDYNoIPJimivX5
         Due4U2SqwcnpIrqiVck91jdEkIICaqcoP3DD5I4VC4fitNHfOS1FIqwzWO1B+q1N0D0A
         51GGQfq2HLHewEdCfV6XKtn8AD/mBGuBK4Kz/8pKAJQNpUtL4HjaighxTQZRMfsxNnCl
         qpMV1PvMQOd6VvqH3VQqFgGDIh76bEzHWx07hKmlrypoahgKNRuOrsBYRbgv1/FNi8Fh
         fHyw==
X-Gm-Message-State: AOAM532pYO5ad6XJkw3BDCIqXHxiLCGOh3XvHF0jIqYi3iEWOqzLTBaN
        Fu8Kkgjxw5AMcsV2dLUiFfE=
X-Google-Smtp-Source: ABdhPJzm4lFmv43l4LmGogfnFalBlFY0tCLQVBS/sNGZvZ2jg//PjG5rVhoh22nNn8HDbPYFW2bJhg==
X-Received: by 2002:a1c:7706:: with SMTP id t6mr2663237wmi.30.1629197137064;
        Tue, 17 Aug 2021 03:45:37 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id 18sm1930912wmv.27.2021.08.17.03.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 03:45:36 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] mtd: maps: remove dead MTD map driver for PMC-Sierra MSP boards
Date:   Tue, 17 Aug 2021 12:45:31 +0200
Message-Id: <20210817104531.12675-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 1b00767fd8e1 ("MIPS: Remove PMC MSP71xx platform") removes the
config PMC_MSP in ./arch/mips/Kconfig.

Hence, since then, the corresponding MTD map driver for PMC-Sierra MSP
boards is dead code. Remove this dead driver.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/mtd/maps/Kconfig        |  23 ----
 drivers/mtd/maps/Makefile       |   1 -
 drivers/mtd/maps/pmcmsp-flash.c | 227 --------------------------------
 3 files changed, 251 deletions(-)
 delete mode 100644 drivers/mtd/maps/pmcmsp-flash.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 6650acbc961e..aaa164b977fe 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -127,29 +127,6 @@ config MTD_PHYSMAP_GPIO_ADDR
 	  Extend the physmap driver to allow flashes to be partially
 	  physically addressed and assisted by GPIOs.
 
-config MTD_PMC_MSP_EVM
-	tristate "CFI Flash device mapped on PMC-Sierra MSP"
-	depends on PMC_MSP && MTD_CFI
-	help
-	  This provides a 'mapping' driver which supports the way
-	  in which user-programmable flash chips are connected on the
-	  PMC-Sierra MSP eval/demo boards.
-
-choice
-	prompt "Maximum mappable memory available for flash IO"
-	depends on MTD_PMC_MSP_EVM
-	default MSP_FLASH_MAP_LIMIT_32M
-
-config MSP_FLASH_MAP_LIMIT_32M
-	bool "32M"
-
-endchoice
-
-config MSP_FLASH_MAP_LIMIT
-	hex
-	default "0x02000000"
-	depends on MSP_FLASH_MAP_LIMIT_32M
-
 config MTD_SUN_UFLASH
 	tristate "Sun Microsystems userflash support"
 	depends on SPARC && MTD_CFI && PCI
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 79f018cf412f..11fea9c8d561 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -25,7 +25,6 @@ physmap-objs-$(CONFIG_MTD_PHYSMAP_IXP4XX) += physmap-ixp4xx.o
 physmap-objs			:= $(physmap-objs-y)
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
 obj-$(CONFIG_MTD_PISMO)		+= pismo.o
-obj-$(CONFIG_MTD_PMC_MSP_EVM)   += pmcmsp-flash.o
 obj-$(CONFIG_MTD_PCMCIA)	+= pcmciamtd.o
 obj-$(CONFIG_MTD_SA1100)	+= sa1100-flash.o
 obj-$(CONFIG_MTD_SBC_GXX)	+= sbc_gxx.o
diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
deleted file mode 100644
index 2051f28ddac6..000000000000
--- a/drivers/mtd/maps/pmcmsp-flash.c
+++ /dev/null
@@ -1,227 +0,0 @@
-/*
- * Mapping of a custom board with both AMD CFI and JEDEC flash in partitions.
- * Config with both CFI and JEDEC device support.
- *
- * Basically physmap.c with the addition of partitions and
- * an array of mapping info to accommodate more than one flash type per board.
- *
- * Copyright 2005-2007 PMC-Sierra, Inc.
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
- *  THIS  SOFTWARE  IS PROVIDED   ``AS  IS'' AND   ANY  EXPRESS OR IMPLIED
- *  WARRANTIES,   INCLUDING, BUT NOT  LIMITED  TO, THE IMPLIED WARRANTIES OF
- *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN
- *  NO  EVENT  SHALL   THE AUTHOR  BE    LIABLE FOR ANY   DIRECT, INDIRECT,
- *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *  NOT LIMITED   TO, PROCUREMENT OF  SUBSTITUTE GOODS  OR SERVICES; LOSS OF
- *  USE, DATA,  OR PROFITS; OR  BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
- *  ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT
- *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
- *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- *  You should have received a copy of the  GNU General Public License along
- *  with this program; if not, write  to the Free Software Foundation, Inc.,
- *  675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-#include <linux/slab.h>
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-
-#include <asm/io.h>
-
-#include <msp_prom.h>
-#include <msp_regs.h>
-
-
-static struct mtd_info **msp_flash;
-static struct mtd_partition **msp_parts;
-static struct map_info *msp_maps;
-static int fcnt;
-
-#define DEBUG_MARKER printk(KERN_NOTICE "%s[%d]\n", __func__, __LINE__)
-
-static int __init init_msp_flash(void)
-{
-	int i, j, ret = -ENOMEM;
-	int offset, coff;
-	char *env;
-	int pcnt;
-	char flash_name[] = "flash0";
-	char part_name[] = "flash0_0";
-	unsigned addr, size;
-
-	/* If ELB is disabled by "ful-mux" mode, we can't get at flash */
-	if ((*DEV_ID_REG & DEV_ID_SINGLE_PC) &&
-	    (*ELB_1PC_EN_REG & SINGLE_PCCARD)) {
-		printk(KERN_NOTICE "Single PC Card mode: no flash access\n");
-		return -ENXIO;
-	}
-
-	/* examine the prom environment for flash devices */
-	for (fcnt = 0; (env = prom_getenv(flash_name)); fcnt++)
-		flash_name[5] = '0' + fcnt + 1;
-
-	if (fcnt < 1)
-		return -ENXIO;
-
-	printk(KERN_NOTICE "Found %d PMC flash devices\n", fcnt);
-
-	msp_flash = kcalloc(fcnt, sizeof(*msp_flash), GFP_KERNEL);
-	if (!msp_flash)
-		return -ENOMEM;
-
-	msp_parts = kcalloc(fcnt, sizeof(*msp_parts), GFP_KERNEL);
-	if (!msp_parts)
-		goto free_msp_flash;
-
-	msp_maps = kcalloc(fcnt, sizeof(*msp_maps), GFP_KERNEL);
-	if (!msp_maps)
-		goto free_msp_parts;
-
-	/* loop over the flash devices, initializing each */
-	for (i = 0; i < fcnt; i++) {
-		/* examine the prom environment for flash partititions */
-		part_name[5] = '0' + i;
-		part_name[7] = '0';
-		for (pcnt = 0; (env = prom_getenv(part_name)); pcnt++)
-			part_name[7] = '0' + pcnt + 1;
-
-		if (pcnt == 0) {
-			printk(KERN_NOTICE "Skipping flash device %d "
-				"(no partitions defined)\n", i);
-			continue;
-		}
-
-		msp_parts[i] = kcalloc(pcnt, sizeof(struct mtd_partition),
-				       GFP_KERNEL);
-		if (!msp_parts[i])
-			goto cleanup_loop;
-
-		/* now initialize the devices proper */
-		flash_name[5] = '0' + i;
-		env = prom_getenv(flash_name);
-
-		if (sscanf(env, "%x:%x", &addr, &size) < 2) {
-			ret = -ENXIO;
-			kfree(msp_parts[i]);
-			goto cleanup_loop;
-		}
-		addr = CPHYSADDR(addr);
-
-		printk(KERN_NOTICE
-			"MSP flash device \"%s\": 0x%08x at 0x%08x\n",
-			flash_name, size, addr);
-		/* This must matchs the actual size of the flash chip */
-		msp_maps[i].size = size;
-		msp_maps[i].phys = addr;
-
-		/*
-		 * Platforms have a specific limit of the size of memory
-		 * which may be mapped for flash:
-		 */
-		if (size > CONFIG_MSP_FLASH_MAP_LIMIT)
-			size = CONFIG_MSP_FLASH_MAP_LIMIT;
-
-		msp_maps[i].virt = ioremap(addr, size);
-		if (msp_maps[i].virt == NULL) {
-			ret = -ENXIO;
-			kfree(msp_parts[i]);
-			goto cleanup_loop;
-		}
-
-		msp_maps[i].bankwidth = 1;
-		msp_maps[i].name = kstrndup(flash_name, 7, GFP_KERNEL);
-		if (!msp_maps[i].name) {
-			iounmap(msp_maps[i].virt);
-			kfree(msp_parts[i]);
-			goto cleanup_loop;
-		}
-
-		for (j = 0; j < pcnt; j++) {
-			part_name[5] = '0' + i;
-			part_name[7] = '0' + j;
-
-			env = prom_getenv(part_name);
-
-			if (sscanf(env, "%x:%x:%n", &offset, &size,
-						&coff) < 2) {
-				ret = -ENXIO;
-				kfree(msp_maps[i].name);
-				iounmap(msp_maps[i].virt);
-				kfree(msp_parts[i]);
-				goto cleanup_loop;
-			}
-
-			msp_parts[i][j].size = size;
-			msp_parts[i][j].offset = offset;
-			msp_parts[i][j].name = env + coff;
-		}
-
-		/* now probe and add the device */
-		simple_map_init(&msp_maps[i]);
-		msp_flash[i] = do_map_probe("cfi_probe", &msp_maps[i]);
-		if (msp_flash[i]) {
-			msp_flash[i]->owner = THIS_MODULE;
-			mtd_device_register(msp_flash[i], msp_parts[i], pcnt);
-		} else {
-			printk(KERN_ERR "map probe failed for flash\n");
-			ret = -ENXIO;
-			kfree(msp_maps[i].name);
-			iounmap(msp_maps[i].virt);
-			kfree(msp_parts[i]);
-			goto cleanup_loop;
-		}
-	}
-
-	return 0;
-
-cleanup_loop:
-	while (i--) {
-		mtd_device_unregister(msp_flash[i]);
-		map_destroy(msp_flash[i]);
-		kfree(msp_maps[i].name);
-		iounmap(msp_maps[i].virt);
-		kfree(msp_parts[i]);
-	}
-	kfree(msp_maps);
-free_msp_parts:
-	kfree(msp_parts);
-free_msp_flash:
-	kfree(msp_flash);
-	return ret;
-}
-
-static void __exit cleanup_msp_flash(void)
-{
-	int i;
-
-	for (i = 0; i < fcnt; i++) {
-		mtd_device_unregister(msp_flash[i]);
-		map_destroy(msp_flash[i]);
-		iounmap((void *)msp_maps[i].virt);
-
-		/* free the memory */
-		kfree(msp_maps[i].name);
-		kfree(msp_parts[i]);
-	}
-
-	kfree(msp_flash);
-	kfree(msp_parts);
-	kfree(msp_maps);
-}
-
-MODULE_AUTHOR("PMC-Sierra, Inc");
-MODULE_DESCRIPTION("MTD map driver for PMC-Sierra MSP boards");
-MODULE_LICENSE("GPL");
-
-module_init(init_msp_flash);
-module_exit(cleanup_msp_flash);
-- 
2.26.2

