Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C9C1DF817
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 17:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgEWPu5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 May 2020 11:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgEWPu4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 May 2020 11:50:56 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC86DC061A0E
        for <linux-mips@vger.kernel.org>; Sat, 23 May 2020 08:50:56 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q16so5632227plr.2
        for <linux-mips@vger.kernel.org>; Sat, 23 May 2020 08:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4WNrTk1OF/kguKov/TFb9FKgkkQLOp1IGH/U6eZl2f8=;
        b=MvXek4/NVTlAN+AkOlsR9anjIaqt1jH0lHlZ31lpxLAcYFivyaprENlB7iGGvmTKPQ
         4MuN3xKkZ6xjf8YfioC1s+8lLaV4fICeE0ytEyrwzPr1yR38+VJ8ies+/mkhgkTqe6ZQ
         OLYcHkCT9pWrx8vlcsn68Pc7MMlnIm5PhJV93WN11qX5fyDJTXQbzWooGRD1k4METPtT
         o0va8W5jt2CI8ek/tJF7ce192ZR9LjtUuKQ1E7RLnpPFPyQFvGT79DJsdtVtzmjGRMpP
         2JThy8dgJU8+Hg9OS3cO5RIuOm4QSccdjM6jwP2zjUcHohBxWenpLR/heLzXreGRfrUW
         uXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=4WNrTk1OF/kguKov/TFb9FKgkkQLOp1IGH/U6eZl2f8=;
        b=pRnBYtygr2/jq6L0/v4Ne62P2hVqh6qoZhg24J2KCmHgh/eUMcSB8FUbM3f2ik7/bD
         Qt+L0QRxBSMpFUFa9ZAy0aXFP+uJCd++QUnv+DB4WsGv09r0T+t+H7I8bYBtjIthMaX7
         WrkKa5Lotw5wqtWaCg/oUpNK5+/40o/uVZjxFgzMz/BnygG5ZapzAMZq0DgVSXCpEwUs
         cfro7rj0dc6Hvhn0DT9O8Ajn/bQPGfVUeAaQzuaTW1oFMvOBisaMlb4c3dAre6bx1AJD
         eoBKlI1fhxB97n3f02bzCTbweB3IoB4VX7T8RZhRSiWFgfbBQ0tn218UAy5wflyShHKB
         8kYg==
X-Gm-Message-State: AOAM533aiHt80CUmaGUzDmClNKmh60cGPqeu8szla6NhspBL24LsUkGc
        f5ixPgyfhNpE4I6YzeUwWbA=
X-Google-Smtp-Source: ABdhPJyIu7gXlrXFgt/UGYec70rIbLGzTOwgWSCX0zY0Xxn3hlMXD499G3WkNT+C9pIo00XcZ8V04A==
X-Received: by 2002:a17:90a:950d:: with SMTP id t13mr11746114pjo.102.1590249056438;
        Sat, 23 May 2020 08:50:56 -0700 (PDT)
Received: from localhost.localdomain ([142.147.94.151])
        by smtp.gmail.com with ESMTPSA id z186sm203801pgb.93.2020.05.23.08.50.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 May 2020 08:50:55 -0700 (PDT)
From:   YunQiang Su <syq@debian.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>,
        YunQiang Su <syq@debian.org>
Subject: MIPS: Fix exception handler memcpy()
Date:   Sat, 23 May 2020 23:50:34 +0800
Message-Id: <20200523155034.52907-1-syq@debian.org>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ben Hutchings <ben@decadent.org.uk>

The exception handler subroutines are declared as a single char, but
when copied to the required addresses the copy length is 0x80.

When range checks are enabled for memcpy() this results in a build
failure, with error messages such as:

In file included from arch/mips/mti-malta/malta-init.c:15:
In function 'memcpy',
    inlined from 'mips_nmi_setup' at arch/mips/mti-malta/malta-init.c:98:2:
include/linux/string.h:376:4: error: call to '__read_overflow2' declared with attribute error: detected read beyond size of object passed as 2nd parameter
  376 |    __read_overflow2();
      |    ^~~~~~~~~~~~~~~~~~

Change the declarations to use type char[].

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: YunQiang Su <syq@debian.org>
---
--- a/arch/mips/loongson2ef/common/init.c
+++ b/arch/mips/loongson2ef/common/init.c
@@ -19,10 +19,10 @@ unsigned long __maybe_unused _loongson_a
 static void __init mips_nmi_setup(void)
 {
 	void *base;
-	extern char except_vec_nmi;
+	extern char except_vec_nmi[];
 
 	base = (void *)(CAC_BASE + 0x380);
-	memcpy(base, &except_vec_nmi, 0x80);
+	memcpy(base, except_vec_nmi, 0x80);
 	flush_icache_range((unsigned long)base, (unsigned long)base + 0x80);
 }
 
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -16,10 +16,10 @@
 static void __init mips_nmi_setup(void)
 {
 	void *base;
-	extern char except_vec_nmi;
+	extern char except_vec_nmi[];
 
 	base = (void *)(CAC_BASE + 0x380);
-	memcpy(base, &except_vec_nmi, 0x80);
+	memcpy(base, except_vec_nmi, 0x80);
 	flush_icache_range((unsigned long)base, (unsigned long)base + 0x80);
 }
 
--- a/arch/mips/mti-malta/malta-init.c
+++ b/arch/mips/mti-malta/malta-init.c
@@ -90,24 +90,24 @@ static void __init console_config(void)
 static void __init mips_nmi_setup(void)
 {
 	void *base;
-	extern char except_vec_nmi;
+	extern char except_vec_nmi[];
 
 	base = cpu_has_veic ?
 		(void *)(CAC_BASE + 0xa80) :
 		(void *)(CAC_BASE + 0x380);
-	memcpy(base, &except_vec_nmi, 0x80);
+	memcpy(base, except_vec_nmi, 0x80);
 	flush_icache_range((unsigned long)base, (unsigned long)base + 0x80);
 }
 
 static void __init mips_ejtag_setup(void)
 {
 	void *base;
-	extern char except_vec_ejtag_debug;
+	extern char except_vec_ejtag_debug[];
 
 	base = cpu_has_veic ?
 		(void *)(CAC_BASE + 0xa00) :
 		(void *)(CAC_BASE + 0x300);
-	memcpy(base, &except_vec_ejtag_debug, 0x80);
+	memcpy(base, except_vec_ejtag_debug, 0x80);
 	flush_icache_range((unsigned long)base, (unsigned long)base + 0x80);
 }
 
--- a/arch/mips/pistachio/init.c
+++ b/arch/mips/pistachio/init.c
@@ -83,12 +83,12 @@ phys_addr_t mips_cdmm_phys_base(void)
 static void __init mips_nmi_setup(void)
 {
 	void *base;
-	extern char except_vec_nmi;
+	extern char except_vec_nmi[];
 
 	base = cpu_has_veic ?
 		(void *)(CAC_BASE + 0xa80) :
 		(void *)(CAC_BASE + 0x380);
-	memcpy(base, &except_vec_nmi, 0x80);
+	memcpy(base, except_vec_nmi, 0x80);
 	flush_icache_range((unsigned long)base,
 			   (unsigned long)base + 0x80);
 }
@@ -96,12 +96,12 @@ static void __init mips_nmi_setup(void)
 static void __init mips_ejtag_setup(void)
 {
 	void *base;
-	extern char except_vec_ejtag_debug;
+	extern char except_vec_ejtag_debug[];
 
 	base = cpu_has_veic ?
 		(void *)(CAC_BASE + 0xa00) :
 		(void *)(CAC_BASE + 0x300);
-	memcpy(base, &except_vec_ejtag_debug, 0x80);
+	memcpy(base, except_vec_ejtag_debug, 0x80);
 	flush_icache_range((unsigned long)base,
 			   (unsigned long)base + 0x80);
 }
