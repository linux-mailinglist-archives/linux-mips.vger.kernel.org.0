Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 047246ABB58
	for <lists+linux-mips@lfdr.de>; Mon,  6 Mar 2023 11:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjCFKN6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Mar 2023 05:13:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbjCFKNe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Mar 2023 05:13:34 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2B6222FA
        for <linux-mips@vger.kernel.org>; Mon,  6 Mar 2023 02:13:07 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id l25so8207512wrb.3
        for <linux-mips@vger.kernel.org>; Mon, 06 Mar 2023 02:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpWo932tuk1D2POoIh3SqR6//enYEECaor8dEe11NsU=;
        b=vhZCFKWfGvUSFsDhwWjJlH3hyhWGt7HLROOh778mTjNL4gufsnGp53NJud40dToGnL
         8qeC6NM2iT55IerKG49oK2vLQT27iAmsasr2ot41mlOSG5YUL8p/DoV2zIOqsjUJN70B
         iUNvLxug4rs0TE8uXJSZn2y/hL+ydY2fsar06hmtO2Uh2XPxMhySCU9kPXtTJmyZZJcH
         r9474lsQdRJ0C1FBrn3WG5vVYQBWXu1Jdki7lFNTTENCldpadEIDTXWSqH1uoKwoJR9g
         2LLGa0YGt4DGUA5hFaNPatUSHD4DOzvgtiIvwoB1Z6VTUA6hmBwFZHLc3uL05jusP5nK
         Sjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpWo932tuk1D2POoIh3SqR6//enYEECaor8dEe11NsU=;
        b=nVslsgCAyMAeXAkYdHRrCdybFXEp3WfUzhh7fg1k7UleJ2vRSzbMz/In3VLnfGQe75
         jne4xWynT+kLJOpQ58l8As0C0trGM5bapGjRJykz7T+c2Sz3Vlnj/8yToB1qUwvblUD5
         CuAsnRk8KyAyrr3EthU2kN0UyVRu/bjeIHGqzMyis6txPc4g3+liTDiRWaYaoeq59A5b
         cHGD5UGdcF4VlYu9H98mzfHAZ1nSsnUE+/wM8lHPpikB/lctqWgPDaMFg9a6rZ72WSo4
         oQ1JUrtyBbjeeScL2VB3lugSCuCW/146WE2zt4OXzrgg/163cQpuFa5viYft2vI1JemO
         d5dA==
X-Gm-Message-State: AO0yUKUrrVrK5Fv85M7jHs28l7jd7cdXMG4r+NwCh4C/FEPkw+GIMSAt
        9hq1GI6L1O4xhbKdG0NpnHA1cg==
X-Google-Smtp-Source: AK7set+31TNEuPO6s3cfa55rRLYq6o+G/3pR5nmNea15dX1hG89weq3ojmUgEkCYiX0LzcBMJ05hsg==
X-Received: by 2002:a05:6000:110f:b0:2cb:5f2a:274e with SMTP id z15-20020a056000110f00b002cb5f2a274emr6011928wrw.41.1678097576202;
        Mon, 06 Mar 2023 02:12:56 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u18-20020a5d6ad2000000b002c5539171d1sm9171191wrw.41.2023.03.06.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:12:56 -0800 (PST)
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
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 07/26] mips: Remove COMMAND_LINE_SIZE from uapi
Date:   Mon,  6 Mar 2023 11:04:49 +0100
Message-Id: <20230306100508.1171812-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 arch/mips/include/asm/setup.h      | 3 ++-
 arch/mips/include/uapi/asm/setup.h | 3 ---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/setup.h b/arch/mips/include/asm/setup.h
index 8c56b862fd9c..a13b9259b476 100644
--- a/arch/mips/include/asm/setup.h
+++ b/arch/mips/include/asm/setup.h
@@ -3,7 +3,8 @@
 #define _MIPS_SETUP_H
 
 #include <linux/types.h>
-#include <uapi/asm/setup.h>
+
+#define COMMAND_LINE_SIZE	4096
 
 extern void prom_putchar(char);
 extern void setup_early_printk(void);
diff --git a/arch/mips/include/uapi/asm/setup.h b/arch/mips/include/uapi/asm/setup.h
index 7d48c433b0c2..157c3c392fb4 100644
--- a/arch/mips/include/uapi/asm/setup.h
+++ b/arch/mips/include/uapi/asm/setup.h
@@ -2,7 +2,4 @@
 #ifndef _UAPI_MIPS_SETUP_H
 #define _UAPI_MIPS_SETUP_H
 
-#define COMMAND_LINE_SIZE	4096
-
-
 #endif /* _UAPI_MIPS_SETUP_H */
-- 
2.37.2

