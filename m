Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA1E118EF9
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2019 18:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfLJR1v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Dec 2019 12:27:51 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39214 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbfLJR1v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Dec 2019 12:27:51 -0500
Received: by mail-ed1-f68.google.com with SMTP id v16so16675631edy.6;
        Tue, 10 Dec 2019 09:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xva8oE2U+TcDPpdROXmdllFCHqfIKM5OSsqzvczV2xQ=;
        b=qOeKcPfcILTV8vSMXsbmLLYD/7m5FEEXFrHRcRVX2LMCBgXAq56iTrswr72GUxriiN
         UjmVxZuUiE9QbGJuacZswZ4spfE24lfVB0StfVMnyo/JnB0OQIzrTTOwwx7TPwjotCaU
         2quQdXO20Aa9LljR7O2jEyCjiDQQTp5uIA6ee3UTd3yHf+I3KgKHzhyeeTIGKqbclGKg
         973Y72p6o3Lrd4NwDFWIWFiEi5uZ+Sgo7j562WeBSssBdrkagxPDrkDkKgNjkqMN5HVw
         jYDJMX2op0sOoR20m5ew9ih+22Gm/KkHwvSBG5VpMoM4JRQu8S3lmoJXYqBFCa04seQL
         Xvmw==
X-Gm-Message-State: APjAAAUmTnThrqUvceTEcyjVmDC9aMZcGEmV3Z1I2N6siTZZlmaw+z67
        HmBHrZjR7SuLfnlYLA0cK9QofL0LZB0=
X-Google-Smtp-Source: APXvYqyKTlyZ7Elgoo4p2icd9ya6BFLgLalgqMQkpACzXdvAv6kDFFCwY1556FwTUgk8oZf8gZfHvw==
X-Received: by 2002:a17:907:423b:: with SMTP id oi19mr5066637ejb.176.1575998869187;
        Tue, 10 Dec 2019 09:27:49 -0800 (PST)
Received: from green.intra.ispras.ru (bran.ispras.ru. [83.149.199.196])
        by smtp.googlemail.com with ESMTPSA id k15sm115648ejc.35.2019.12.10.09.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 09:27:48 -0800 (PST)
From:   Denis Efremov <efremov@linux.com>
To:     Ralf Baechle <ralf@linux-mips.org>
Cc:     Denis Efremov <efremov@linux.com>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Add KSEG*ADDR definitions to CONFIG_64BIT
Date:   Tue, 10 Dec 2019 20:27:39 +0300
Message-Id: <20191210172739.27131-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The patch adds KSEG0ADDR, KSEG1ADDR, KSEG2ADDR, KSEG3ADDR
definitions to CONFIG_64BIT ifdef. This fixes broken compilation:
  CC      drivers/watchdog/mtx-1_wdt.o
In file included from drivers/watchdog/mtx-1_wdt.c:44:
./arch/mips/include/asm/mach-au1x00/au1000.h: In function ‘alchemy_rdsys’:
./arch/mips/include/asm/mach-au1x00/au1000.h:603:36: error: implicit
  declaration of function ‘KSEG1ADDR’; did you mean ‘CKSEG1ADDR’?
  [-Werror=implicit-function-declaration]

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 arch/mips/include/asm/addrspace.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/mips/include/asm/addrspace.h b/arch/mips/include/asm/addrspace.h
index 59a48c60a065..db663654c1fd 100644
--- a/arch/mips/include/asm/addrspace.h
+++ b/arch/mips/include/asm/addrspace.h
@@ -65,6 +65,10 @@
 #define XKSSEG			_CONST64_(0x4000000000000000)
 #define XKPHYS			_CONST64_(0x8000000000000000)
 #define XKSEG			_CONST64_(0xc000000000000000)
+#define KSEG0			_CONST64_(0xffffffff80000000)
+#define KSEG1			_CONST64_(0xffffffffa0000000)
+#define KSSEG			_CONST64_(0xffffffffc0000000)
+#define KSEG3			_CONST64_(0xffffffffe0000000)
 #define CKSEG0			_CONST64_(0xffffffff80000000)
 #define CKSEG1			_CONST64_(0xffffffffa0000000)
 #define CKSSEG			_CONST64_(0xffffffffc0000000)
@@ -75,6 +79,14 @@
 #define CKSEG2ADDR(a)		(CPHYSADDR(a) | CKSEG2)
 #define CKSEG3ADDR(a)		(CPHYSADDR(a) | CKSEG3)
 
+/*
+ * Map an address to a certain kernel segment
+ */
+#define KSEG0ADDR(a)		(CPHYSADDR(a) | KSEG0)
+#define KSEG1ADDR(a)		(CPHYSADDR(a) | KSEG1)
+#define KSEG2ADDR(a)		(CPHYSADDR(a) | KSEG2)
+#define KSEG3ADDR(a)		(CPHYSADDR(a) | KSEG3)
+
 #else
 
 #define CKSEG0ADDR(a)		(CPHYSADDR(a) | KSEG0)
-- 
2.20.1

