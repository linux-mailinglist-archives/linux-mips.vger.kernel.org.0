Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD908118F4D
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2019 18:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbfLJRuV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Dec 2019 12:50:21 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45751 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbfLJRuV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Dec 2019 12:50:21 -0500
Received: by mail-ed1-f67.google.com with SMTP id v28so16704701edw.12;
        Tue, 10 Dec 2019 09:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gl8wdP2EUp9HIKPXPYWQGeBPIE0AvYplATcxTNQp+FQ=;
        b=d3Ihjq2eYRXnJk1W8uQgeCA8+nU6QL9Yj5whBTl82ZuLbKs8mut9JzZnqVbg4ngu2i
         uJdo2wwQihLVjTqVloNbSwmwtRTfdXDiIaTh0c7Ivu6ddqSVOYESvVEuyhS+zTxDfi3i
         8XIn2N8p5iMtC6d6j5/1Y4/B+DTHwJH/oGTH7wvgEGXi+ribVzPMAbrDjgnqdrGWKyKZ
         2eLvSGMoKBnLrKDHgOC7VXKWRT+s8AHr+4TqmX72NmKsZBbA4LqcZVJyR7dmB5Rpa4cx
         ILNRX8Lmq26fkKZ/Q8vSA45WD4xTs2WP+pMbZRTkUPnRx29jDRRbykyMI2+Ku6lQ1dsN
         bgJA==
X-Gm-Message-State: APjAAAVCB3BHdmYR2vBTLJigjDlFsMNJoQd8jsFzZTiARmJCVjnk3rQm
        COQwiMXH+g9Cb2KC7sM5BjA=
X-Google-Smtp-Source: APXvYqyt9Abl1Mcv8OW3/2jNBm+jIQ4W9TAi2s4z1zMqvJqLcaG878AzjWy4uzYOz9hDOq7HfKCtHA==
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr40376626edr.164.1576000219268;
        Tue, 10 Dec 2019 09:50:19 -0800 (PST)
Received: from green.intra.ispras.ru (bran.ispras.ru. [83.149.199.196])
        by smtp.googlemail.com with ESMTPSA id d20sm111782ejc.0.2019.12.10.09.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 09:50:18 -0800 (PST)
From:   Denis Efremov <efremov@linux.com>
To:     Ralf Baechle <ralf@linux-mips.org>
Cc:     Denis Efremov <efremov@linux.com>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: disable kcov instrumentation in compressed dir
Date:   Tue, 10 Dec 2019 20:50:02 +0300
Message-Id: <20191210175002.981-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch fixes the compilation with CONFIG_KCOV enabled.
Otherwise linking fails with:
ld: arch/mips/boot/compressed/piggy.o: in function `main':
dummy.c:(.text.startup+0x8): undefined reference to `__sanitizer_cov_...'
make[1]: *** [arch/mips/boot/compressed/Makefile:101: vmlinuz] Error 1

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 arch/mips/boot/compressed/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 172801ed35b8..d859f079b771 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -29,6 +29,9 @@ KBUILD_AFLAGS := $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
 	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) \
 	-DKERNEL_ENTRY=$(VMLINUX_ENTRY_ADDRESS)
 
+# Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
+KCOV_INSTRUMENT		:= n
+
 # decompressor objects (linked with vmlinuz)
 vmlinuzobjs-y := $(obj)/head.o $(obj)/decompress.o $(obj)/string.o
 
-- 
2.20.1

