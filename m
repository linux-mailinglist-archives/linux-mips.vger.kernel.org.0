Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E51479B5
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jun 2019 07:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725280AbfFQF0s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Jun 2019 01:26:48 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36482 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfFQF0s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Jun 2019 01:26:48 -0400
Received: by mail-ot1-f68.google.com with SMTP id r6so8108318oti.3
        for <linux-mips@vger.kernel.org>; Sun, 16 Jun 2019 22:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=9SYCL63I3BMbiuw5P5gTgfyuN0niUE5XIQ2AbTmH0q4=;
        b=dvYGEQJmAVHy4lv8+VW0/OAr7qewt9irNceY5v0l1sVzMqhQd3JI86A+pn1fklPvkC
         o1Y5BQoTlh0dCsNc04dptaGjxd1zG6rIKCG4CrgHmEKVXY8JJVadVpYnkpwYvrs4vlrw
         qbfqK3GxFYIwoBFpxImCwPrUwphQoX9cq1UyzvaMl2JibKK23kjBin9fWzOEjSb3OqSf
         RBH9WBraCfNhLZlWMkJ+hE+VpYS7p8WaOrMdvQea/SYsBKAmvD0gd/eVtUXn6GYNqoIU
         6M5gjZYGqluhWvE3PaWdX1eRPNBvy/52BnGjyx2GvWx2WfALUqfq6B4AoYT91XXRqdr/
         bdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=9SYCL63I3BMbiuw5P5gTgfyuN0niUE5XIQ2AbTmH0q4=;
        b=T5Vnw+350OqLwtrdyS63Y0bFViSQM5q/IemmSvC07sPCqNMMQIQA/lS6Ft3gETbPF2
         xJJP96s9cQi81JL3efgykCVWz4kKKIL/3ozGy2XrXRvwaowFqVei9IPAihrThTJonrxx
         8cA19VuTVK0I25UrHMuOq2aMfDIAXyqt3LRDbXVpMBgmR5qEzb9k5wGcKs7pmIAWOKJQ
         ZtB3TbcNDIDDS2m0tZsJ854+nhLOtXkWRz23BwKFMaKT8sadUHBBYvZZpH4qUy05nn6F
         TpAsVdm3VStfOL1FmsTJdA3tPgD6e2KPB1ioUhzW0mpa/TwD5iyElU4GkAY3atQglH82
         xqaw==
X-Gm-Message-State: APjAAAVw3UcFxxGU13UMmB7dQIw2q52yoRocNxc3wEvy8jCh+gMLW6gK
        pfYGbgpo+v9dMA+cSbFHXm/dcDSZ
X-Google-Smtp-Source: APXvYqyQfscwgPYTZxzeBUxVnhpv8kDFlTTotR/g+9bPPQPDXNTdOwbhqNNe17G6qkq2XLIwasCXGg==
X-Received: by 2002:a9d:eab:: with SMTP id 40mr18028684otj.316.1560749207397;
        Sun, 16 Jun 2019 22:26:47 -0700 (PDT)
Received: from [192.168.1.3] ([47.189.59.40])
        by smtp.gmail.com with ESMTPSA id i19sm5222260oib.12.2019.06.16.22.26.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Jun 2019 22:26:47 -0700 (PDT)
To:     hauke@hauke-m.de
Cc:     linux-mips@vger.kernel.org
From:   =?UTF-8?Q?Edward_Matijevi=c4=87?= <motolav@gmail.com>
Subject: [PATCH] MIPS: BCM47XX: Add support for Netgear R6200 V1
Message-ID: <6e003471-e7bd-6e0a-c00c-7de5e1b01428@gmail.com>
Date:   Mon, 17 Jun 2019 00:26:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Netgear R6200 v1 uses a BCM4718A1 SOC and a BCM4352/BCM4360 for 5GHz wireless.
This patch adds support for detecting this model board and registers the 3 buttons.
I have tested that the device can boot kernels 4.14 and 4.19 under OpenWRT.

There is one issue that the LEDs on the device are controlled by a 74HC164 that uses bit-banging instead of SPI so it isn't accessible to the kernel without adding a workaround.
Without any workaround the device on boot will flash all LEDs once then the power LED will remain amber as all other LEDs stay off.

I placed my change in board.c in that location because in OpenWRT it would be above the R6300 V1 in one of their patches.

Signed-off-by: Edward Matijevic <motolav@gmail.com>
---
 arch/mips/bcm47xx/board.c                          | 1  +
 arch/mips/bcm47xx/buttons.c                        | 10 ++++++++++
 arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h | 1  +
 3 files changed, 12 insertions(+)

--- a/arch/mips/bcm47xx/board.c
+++ b/arch/mips/bcm47xx/board.c
@@ -163,6 +163,7 @@ struct bcm47xx_board_type_list1 bcm47xx_board_list_board_id[] __initconst = {
     {{BCM47XX_BOARD_NETGEAR_WGR614V8, "Netgear WGR614 V8"}, "U12H072T00_NETGEAR"},
     {{BCM47XX_BOARD_NETGEAR_WGR614V9, "Netgear WGR614 V9"}, "U12H094T00_NETGEAR"},
     {{BCM47XX_BOARD_NETGEAR_WGR614_V10, "Netgear WGR614 V10"}, "U12H139T01_NETGEAR"},
+    {{BCM47XX_BOARD_NETGEAR_R6200_V1, "Netgear R6200 V1"}, "U12H192T00_NETGEAR"},
     {{BCM47XX_BOARD_NETGEAR_WNDR3300, "Netgear WNDR3300"}, "U12H093T00_NETGEAR"},
     {{BCM47XX_BOARD_NETGEAR_WNDR3400V1, "Netgear WNDR3400 V1"}, "U12H155T00_NETGEAR"},
     {{BCM47XX_BOARD_NETGEAR_WNDR3400V2, "Netgear WNDR3400 V2"}, "U12H187T00_NETGEAR"},
--- a/arch/mips/bcm47xx/buttons.c
+++ b/arch/mips/bcm47xx/buttons.c
@@ -384,6 +384,13 @@ bcm47xx_buttons_motorola_wr850gv2v3[] __initconst = {
 
 /* Netgear */
 
+static const struct gpio_keys_button
+bcm47xx_buttons_netgear_r6200_v1[] __initconst = {
+    BCM47XX_GPIO_KEY(2, KEY_RFKILL),
+    BCM47XX_GPIO_KEY(3, KEY_RESTART),
+    BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
+};
+
 static const struct gpio_keys_button
 bcm47xx_buttons_netgear_wndr3400v1[] __initconst = {
     BCM47XX_GPIO_KEY(4, KEY_RESTART),
@@ -664,6 +671,9 @@ int __init bcm47xx_buttons_register(void)
         err = bcm47xx_copy_bdata(bcm47xx_buttons_motorola_wr850gv2v3);
         break;
 
+    case BCM47XX_BOARD_NETGEAR_R6200_V1:
+        err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_r6200_v1);
+        break;
     case BCM47XX_BOARD_NETGEAR_WNDR3400V1:
         err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_wndr3400v1);
         break;
--- a/arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h
+++ b/arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h
@@ -98,6 +98,7 @@ enum bcm47xx_board {
     BCM47XX_BOARD_MOTOROLA_WR850GP,
     BCM47XX_BOARD_MOTOROLA_WR850GV2V3,
 
+    BCM47XX_BOARD_NETGEAR_R6200_V1,
     BCM47XX_BOARD_NETGEAR_WGR614V8,
     BCM47XX_BOARD_NETGEAR_WGR614V9,
     BCM47XX_BOARD_NETGEAR_WGR614_V10,

