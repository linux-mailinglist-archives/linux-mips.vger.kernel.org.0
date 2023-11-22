Return-Path: <linux-mips+bounces-150-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F137F3DAE
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 06:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 997C1281C1A
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 05:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7409011C9E;
	Wed, 22 Nov 2023 05:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeLGbfb0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D5B185;
	Tue, 21 Nov 2023 21:41:53 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-548f6f3cdc9so2474634a12.2;
        Tue, 21 Nov 2023 21:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700631711; x=1701236511; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aZqmcfYBbrAwHfQxSijXcVr/4Fn8eCufnaWHNVSYUo=;
        b=aeLGbfb0HMdvORo2L05IAWuHypYYkYV0hHu6ycMbS5E6QuFOmpWSMhjZdojuYfseuF
         C8Hy38BXlYXuMjLYcPvsLvMz6eecSpXj6lr6/SoSyD6Vj+fin0WDKisb4MyGjAZ0T5Il
         Jxf6RMVg8EPAqBZVF4NbBEY4fb8csAl/fL4Kdasmd4ScIRn5ub+0HatdYOwrcbpLvPPB
         tbnnKzifIMs0xCN74jIKLyLC8EEnE/Ylr9EhFhiK8TF+oNQK1aeg6PNSJhwFe5GkM4Wo
         IbWyIOV/8P317669Cty4H/q+GD0aPIAinSyn0Rr4G59GNP0G6Hn/TbyUCTu+gNtcaJtr
         09pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700631711; x=1701236511;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aZqmcfYBbrAwHfQxSijXcVr/4Fn8eCufnaWHNVSYUo=;
        b=Th3yzdbHMQzCi/2du/l3Wh5EGze0E/vQBCyC4+1ZrHZ1fZbC8NFAKL1fwD/1nKog97
         8b6WZ3PA3DZZlNME31vqZG9WOZs5LQlupEWWv04NgjWyGSmwOigJXgO2SSmvjbxvJ/tw
         NinqdVTTeqLVBO8pTc+cKZoUpWvdIVVMXUE+MNNMq3fZqjg2DUxsngE/HWPl/d64Qkjb
         /txH91VMqUjebp1W/g7sYCnXMRt9k2t8QFn+tFpLTW0pDvcbI3ow8SbFwroxt4N7CNKy
         E1WyX0atEBsYmWOUpCEBsGD0vnLua/w9aGUhhznxI57xjqISuXF+3Hu3zI6jU6eyMkBP
         SoIw==
X-Gm-Message-State: AOJu0YyapdWm1xPpJ+l88HQqAghQnaS7OC1OhHG7QSCG2OVe38ySl38w
	+XJkr1zPPVmGCua0XSNMWkSar8fguJ4=
X-Google-Smtp-Source: AGHT+IEImB9WEU8Dff7wAmw0uyKQ6unSKzYjR8guFrN7so2VrCSOyEM6eY2QufNTE5ftsjeRLo6A7g==
X-Received: by 2002:a17:906:4119:b0:a03:a857:c6e0 with SMTP id j25-20020a170906411900b00a03a857c6e0mr507265ejk.77.1700631711167;
        Tue, 21 Nov 2023 21:41:51 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:14bb:d13c:65e3:46bf])
        by smtp.gmail.com with ESMTPSA id r15-20020a1709067fcf00b00985ed2f1584sm6132440ejs.187.2023.11.21.21.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 21:41:50 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: add section MIPS BAIKAL-T1 SOC DRIVERS
Date: Wed, 22 Nov 2023 06:41:42 +0100
Message-Id: <20231122054142.31322-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

In recent years, a number of drivers for the MIPS Baikal-T1 SoC have been
added to the kernel tree, but there is no dedicated MAINTAINERS section for
this SoC.

As all of the code has been contributed by Serge Semin, let us assume he is
still the active maintainer for this code rather than marking it orphan.

Add a new section MIPS BAIKAL-T1 SOC DRIVERS in MAINTAINERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9613c9c3cc97..820f1ab1ee80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14474,6 +14474,19 @@ F:	arch/mips/
 F:	drivers/platform/mips/
 F:	include/dt-bindings/mips/
 
+MIPS BAIKAL-T1 SOC DRIVERS
+M:	Serge Semin <Sergey.Semin@baikalelectronics.ru>
+S:	Maintained
+F:	Documentation/hwmon/bt1-pvt.rst
+F:	drivers/ata/ahci_dwc.c
+F:	drivers/bus/bt1-*.c
+F:	drivers/clk/baikal-t1/
+F:	drivers/hwmon/bt1-pvt.[ch]
+F:	drivers/memory/bt1-l2-ctl.c
+F:	drivers/mtd/maps/physmap-bt1-rom.[ch]
+F:	drivers/pci/controller/dwc/pcie-bt1.c
+F:	drivers/spi/spi-dw-bt1.c
+
 MIPS BOSTON DEVELOPMENT BOARD
 M:	Paul Burton <paulburton@kernel.org>
 L:	linux-mips@vger.kernel.org
-- 
2.17.1


