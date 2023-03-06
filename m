Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336416ABAEC
	for <lists+linux-mips@lfdr.de>; Mon,  6 Mar 2023 11:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbjCFKJK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Mar 2023 05:09:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbjCFKI4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Mar 2023 05:08:56 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DC0C170
        for <linux-mips@vger.kernel.org>; Mon,  6 Mar 2023 02:08:51 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso7755218wmi.4
        for <linux-mips@vger.kernel.org>; Mon, 06 Mar 2023 02:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jj1u1uhVF2sQ2RVxtjKMw18KpQKd83rLKq4resJQVxg=;
        b=1usxcaORk4vzUD7wjdTWxPIGkmkWNgCtULONTBP34T8McDvKYGW/MpGSlcjwuDrfTn
         PniNNii9N82GcQQ+BCwD2y2VKaJOj7+a0LBXroxQjjCWs8+c/oePRs3PD6QcNiookTy8
         HsE0IjeoDi+OqkZiqnMPpD/Dnv195K5+bK3HsT1aS0IyJY3m+etbpjyzPHPcgf0Dblx+
         VbsU/63YrNvC+XmZlMMMJYW/2PKq166WJKRAGBiQoXU8DYNnS8chrbImu/2FF6C7LxvM
         q8yiCPLoCakYyn/D9iUgJvTKXSNni+Qk37+EYd0xmJ3/KxDlX2zL8FsZfHSK/drojFTO
         lu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jj1u1uhVF2sQ2RVxtjKMw18KpQKd83rLKq4resJQVxg=;
        b=u+xbAtsDapBL4DF0M7kxTL1YKC2v9cxCi+gi5a+OYshGHFnNgtv+H+hEWEh9+fILU2
         vW0td8rw2Bt13+lCgWxyDqrczPb+D6IpI0PhFHcd3xUfl/L3r9oFktOfhfkCHX2aLJh4
         Zg2ZkxfKiDISGadR2UX54WzxBUYc7ZJbGM4MTRULqlnsrg5TRs2oCZzzh2rH9NNt2Kmd
         zdzgLUr9YRflhO22ykhKcg9wbG1hFWjIewKwxN411GM2NDAo2kzFDr64FiS0457U1mfB
         IPDWCLwe4STLAIO8R49usaZA/xDxrWtRb4AkJBq1O9QMiPp/TTFDvo7vtvO0jsnk8F6c
         pt7Q==
X-Gm-Message-State: AO0yUKXOmCQ/AWi/5p4d8w1/78LrvnH8+cNK73YydCN8S9zQHikt8Ojt
        Tc+XW8vjJPIFWYso4OmowgltuA==
X-Google-Smtp-Source: AK7set/ZePibjJOtk8oWIgABJFyRrkee7knkF+V6hkYaFn2pS6WICyq1eAFhhu5xpZsAhsUsORtBLQ==
X-Received: by 2002:a05:600c:1990:b0:3e2:20c7:6553 with SMTP id t16-20020a05600c199000b003e220c76553mr8682179wmq.13.1678097329516;
        Mon, 06 Mar 2023 02:08:49 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z7-20020a05600c0a0700b003dc434b39c7sm22915060wmp.0.2023.03.06.02.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:08:49 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 03/26] arm: Remove COMMAND_LINE_SIZE from uapi
Date:   Mon,  6 Mar 2023 11:04:45 +0100
Message-Id: <20230306100508.1171812-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Russell King (Oracle) <linux@armlinux.org.uk>
---
 arch/arm/include/asm/setup.h      | 1 +
 arch/arm/include/uapi/asm/setup.h | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/setup.h b/arch/arm/include/asm/setup.h
index ba0872a8dcda..8a1e4f804d1b 100644
--- a/arch/arm/include/asm/setup.h
+++ b/arch/arm/include/asm/setup.h
@@ -13,6 +13,7 @@
 
 #include <uapi/asm/setup.h>
 
+#define COMMAND_LINE_SIZE 1024
 
 #define __tag __used __section(".taglist.init")
 #define __tagtable(tag, fn) \
diff --git a/arch/arm/include/uapi/asm/setup.h b/arch/arm/include/uapi/asm/setup.h
index 25ceda63b284..87a4f4af28e1 100644
--- a/arch/arm/include/uapi/asm/setup.h
+++ b/arch/arm/include/uapi/asm/setup.h
@@ -17,8 +17,6 @@
 
 #include <linux/types.h>
 
-#define COMMAND_LINE_SIZE 1024
-
 /* The list ends with an ATAG_NONE node. */
 #define ATAG_NONE	0x00000000
 
-- 
2.37.2

