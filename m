Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA97210B265
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 16:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfK0P0S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Nov 2019 10:26:18 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46004 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfK0P0R (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Nov 2019 10:26:17 -0500
Received: by mail-ot1-f66.google.com with SMTP id r24so19405181otk.12;
        Wed, 27 Nov 2019 07:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=me7kgiteLQ9tBYz/2oGhlaa5X/BJbN+0Enr1z5kqeGo=;
        b=Ivu133lzP84wLszg/h+Jmm3izW4DQyR4+hFLX/2g36TgxXKrrxp9UHS6aWz/yXlspj
         xI4id2eCYtrInwWojTk0bujvQQrcFPHIak44nBMEAVNttyJw5djHwlASpkHtpZWF1HFS
         YnD7Kpp2/qXyACEHLfrbKqFmWhqMKDRyQedZFIdxKxzaIndTFeQtymPChgxsdkMW4PeW
         jfXBmkKKbc46GME/6qQZPVbTX6uRFLR3a09F2cHzY3xT9DCekWuxXvgySkShlgeHkw1y
         3jjsGLzZ6lAGTbznw2MNBFtMCzUbloT5HjrHbaM8UzOxppnG1m+tbhfq+eC1e1ozMkZl
         Tmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=me7kgiteLQ9tBYz/2oGhlaa5X/BJbN+0Enr1z5kqeGo=;
        b=fy1JRnpF4PN/juzAcL2GH3fSXT6VUdAjJuLkt13Mo1nndZcYCF0asp3/SRp5XyHk5B
         +nkCSH8VkJiI8wsa1wFEB2+Sa21Gabup5suz5Hba5U9+MEiut0o/+v7Ufskw4JBmqYmv
         dTYtynuXOosnDelj2P4foGsDD2+k3UL5v7CWen3VVeWIxXrQs2uKTITqd92EYTF7SbBh
         0mQkteJM/tGZO9FRhjWH3wqwgQ3HkzHaxKMO3fPJacmzzRK6zPRLUtTs+NXJ0Xm6O/gu
         MGravszAgLde53e2V10g2mgmLGH32lfACqffcAUbzKOfZRaumygE3Ga5jNl/pUumO1hN
         9LEA==
X-Gm-Message-State: APjAAAWf/kIqvmewdPTa4Ub9NkwPR267ncMdjXXao4vmmib6van0bzsX
        fbqW5Y/F/YQT28khMfaANeSH+I7b
X-Google-Smtp-Source: APXvYqwVokyEpM8hxkIkwhdEoyAzjdA660S1cKaaxde4nESS4l7yjdePmetLQzCaapg79OitiR5RvA==
X-Received: by 2002:a05:6830:2001:: with SMTP id e1mr4212508otp.48.1574868376820;
        Wed, 27 Nov 2019 07:26:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r13sm4962402otp.54.2019.11.27.07.26.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 07:26:15 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: Fix boot on Fuloong2 systems
Date:   Wed, 27 Nov 2019 07:26:12 -0800
Message-Id: <20191127152612.21945-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 268a2d60013049 ("MIPS: Loongson64: Rename CPU TYPES") changed
Kconfig symbols as follows:
	CPU_LOONGSON2 to CPU_LOONGSON2EF
	CPU_LOONGSON3 to CPU_LOONGSON64
	SYS_HAS_CPU_LOONGSON3 to SYS_HAS_CPU_LOONGSON64

It did not touch SYS_HAS_CPU_LOONGSON2E or SYS_HAS_CPU_LOONGSON2F.
However, the patch changed a conditional from

 #if defined(CONFIG_SYS_HAS_CPU_LOONGSON2E) || \
     defined(CONFIG_SYS_HAS_CPU_LOONGSON2F)

to

 #if defined(CONFIG_SYS_HAS_CPU_LOONGSON2EF)

SYS_HAS_CPU_LOONGSON2EF does not exist, resulting in boot failures
with the qemu fulong2e emulation. Revert to the original code.

Fixes: 268a2d60013049 ("MIPS: Loongson64: Rename CPU TYPES")
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/mips/include/asm/cpu-type.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
index c46c59b0f1b4..49f0061a6051 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -15,7 +15,8 @@
 static inline int __pure __get_cpu_type(const int cpu_type)
 {
 	switch (cpu_type) {
-#if defined(CONFIG_SYS_HAS_CPU_LOONGSON2EF)
+#if defined(CONFIG_SYS_HAS_CPU_LOONGSON2E) || \
+    defined(CONFIG_SYS_HAS_CPU_LOONGSON2F)
 	case CPU_LOONGSON2EF:
 #endif
 
-- 
2.17.1

