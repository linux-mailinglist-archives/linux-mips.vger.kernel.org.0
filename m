Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F4062454D2
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2019 08:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbfFNGgP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Jun 2019 02:36:15 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43714 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfFNGgP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Jun 2019 02:36:15 -0400
Received: by mail-lj1-f194.google.com with SMTP id 16so1156017ljv.10;
        Thu, 13 Jun 2019 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2MEVIt+PlMUB27yCjfj/2xmvsTwKURfuQtH2qPYNxsw=;
        b=IJ0JOvSspzYxd6Ul4Sy7Np9tIWkHfUBiGstx0XJxV5LbgwgM+SUdsahe520SjIR9eP
         S3K9OWDFjelMsjJC9b7pQNsvVj1FdC82XBfBSfEdOLHhCjS6U7dQCT0s8TNp5Lgwxk6f
         KWK/E3iKiXjPzUWZ9UEfvjoRCgtgd3z930Ae5mBok/eA2d+dXbm87Oi3El6PG1sJ6Jvs
         OQA/JCEeAJzyEiRFUUCG4TF1yKPKN/jnLSkWk4zCD6GDsGE/RYOrG5pPDMnHzd7yFm4m
         JTgDWCTlNgOQCpfofp/znJNLCFSW2itYRui1wza3209BDimAhZeWCUdrzZcuhe1wbbmf
         nrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2MEVIt+PlMUB27yCjfj/2xmvsTwKURfuQtH2qPYNxsw=;
        b=RngrHps+aewf+kodDkO6D62paV3a5hfKaUQR1rghJB1FesgylCiwzEgFBqK+LgCBRy
         hB0sMwp3RvCi3OmBRJH4eArvYMyobPK6H2oQ9ctOm9xPlhSbTxSEXp7GACWhc2KK6EJv
         zFv3BtCU2/HDuBkEnuB6VU6iKqe3BGEc39cW2wCcMiLBCwu/CRsPvGAI0weZcFEtFuxS
         xB6mpUK2smS5OwlteCaFnd8EdYDAPjyAPHTl9sDxyLOEVOnwA01rYXEuIFTs2AQ7LYg7
         5VaMDIHrIlLKXRFGqb8BAc4ObuqOK8ncj/rHj1WSuLN+D82oxu13I8c8gYNsnX7/xWpk
         Z0Fw==
X-Gm-Message-State: APjAAAWMBCdXpWuJudxsTjPC8xZrgokrC9Zo84X3pSCbpjJKNvMkflSE
        7qKUbiROM2iYr0s4RaGske44DCCR
X-Google-Smtp-Source: APXvYqzwsZzaCaFXxcWCo00HdeQ2ZkEM08b9HJZzaTN3xwQoyHs7ZXv3dvYO4laBtzf9YEmuWv40LQ==
X-Received: by 2002:a2e:81c4:: with SMTP id s4mr38659037ljg.182.1560494173078;
        Thu, 13 Jun 2019 23:36:13 -0700 (PDT)
Received: from localhost.localdomain ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id z12sm318548lfg.67.2019.06.13.23.36.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 23:36:12 -0700 (PDT)
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Serge Semin <Sergey.Semin@t-platforms.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mips: Remove q-accessors from non-64bit platforms
Date:   Fri, 14 Jun 2019 09:33:42 +0300
Message-Id: <20190614063341.1672-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are some generic drivers in the kernel, which make use of the
q-accessors or their derivatives. While at current asm/io.h the accessors
are defined, their implementation is only applicable either for 64bit
systems, or for systems with cpu_has_64bits flag set. Obviously there
are MIPS systems which are neither of these, but still need to have
those drivers supported. In this case the solution is to define some
generic versions of the q-accessors, but with a limitation to be
non-atomic. Such accessors are defined in the
io-64-nonatomic-{hi-lo,lo-hi}.h file. The drivers which utilize the
q-suffixed IO-methods are supposed to include the header file, so
in case if these accessors aren't defined for the platform, the generic
non-atomic versions are utilized. Currently the MIPS-specific asm/io.h
file provides the q-accessors for any MIPS system even for ones, which
in fact don't support them and raise BUG() in case if any of them is
called. Due to this the generic versions of the accessors are never
used while an attempt to call the IO-methods causes the kernel BUG().
In order to fix this we need to define the q-accessors only for
the MIPS systems, which actually support them, and don't define them
otherwise, so to let the corresponding drivers to use the non-atomic
q-suffixed accessors.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Cc: Vadim V. Vlasov <vadim.vlasov@t-platforms.ru>
---
 arch/mips/include/asm/io.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 29997e42480e..4597017f147b 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -462,7 +462,12 @@ __BUILD_MEMORY_PFX(, bwlq, type, 0)
 BUILDIO_MEM(b, u8)
 BUILDIO_MEM(w, u16)
 BUILDIO_MEM(l, u32)
+#ifdef CONFIG_64BIT
 BUILDIO_MEM(q, u64)
+#else
+__BUILD_MEMORY_PFX(__raw_, q, u64, 0)
+__BUILD_MEMORY_PFX(__mem_, q, u64, 0)
+#endif
 
 #define __BUILD_IOPORT_PFX(bus, bwlq, type)				\
 	__BUILD_IOPORT_SINGLE(bus, bwlq, type, 1, 0,)			\
@@ -488,12 +493,16 @@ __BUILDIO(q, u64)
 #define readb_relaxed			__relaxed_readb
 #define readw_relaxed			__relaxed_readw
 #define readl_relaxed			__relaxed_readl
+#ifdef CONFIG_64BIT
 #define readq_relaxed			__relaxed_readq
+#endif
 
 #define writeb_relaxed			__relaxed_writeb
 #define writew_relaxed			__relaxed_writew
 #define writel_relaxed			__relaxed_writel
+#ifdef CONFIG_64BIT
 #define writeq_relaxed			__relaxed_writeq
+#endif
 
 #define readb_be(addr)							\
 	__raw_readb((__force unsigned *)(addr))
@@ -516,8 +525,10 @@ __BUILDIO(q, u64)
 /*
  * Some code tests for these symbols
  */
+#ifdef CONFIG_64BIT
 #define readq				readq
 #define writeq				writeq
+#endif
 
 #define __BUILD_MEMORY_STRING(bwlq, type)				\
 									\
-- 
2.21.0

