Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC54116D31
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2019 13:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfLIMhQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Dec 2019 07:37:16 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37162 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfLIMhQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Dec 2019 07:37:16 -0500
Received: by mail-lj1-f195.google.com with SMTP id u17so15443743lja.4
        for <linux-mips@vger.kernel.org>; Mon, 09 Dec 2019 04:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=GiXpIaD3VJjUBpbqY25RmlTMgg78Egsv8eWQ1U/XvHg=;
        b=DaTTSQGptwgzSUwlKMKpHnEdfmTG2Xk+NsFw6C7tL1ZfykE2sITGqwTjarUf4bs59K
         Ao0WhZSU/uh0tzqOo455Q7C/Tm1BTWN1znZDtUryLQUs9lBf6ARkg9tjpmrgTnnpFsHr
         9yhEZMBOyaP2D/BAOoucLDtc7lBpiBbZ4B5wOcYTHBjPDr+/Kr+K0mS2zTkTXaUnq3+b
         a/L7haNvyEkXVlIue0E+Dq4KeEs9JVTo8CnIvBdrDBqIBodNR+F80eaZg4Qh+diXbr7Y
         QLsTkTA6Ve2ZI3wIvvGjOHQ4grqNZmZph43H2CLYWcICvPbAbsnsjoRZiAdg1OsFJg/F
         0xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GiXpIaD3VJjUBpbqY25RmlTMgg78Egsv8eWQ1U/XvHg=;
        b=Q6b608D0ERoy2pQTUSyHlb8BCC0TyCZpA9zGnofKcOzk2Nxeh4oW0N5nfMpVu2uMh+
         EQDfAGXDszlkW0aX/vrJL6U7+5jPbnkR3b0WzBQpWsjLB4AZ2CUtdBiX2yqTITYOibZK
         uss+cqXW9qih2U5n+67BXJamnUIIceCkTUu1XE/Wnj7wXekQ4POsVPfdnA+xlleBDzzF
         tNV/SmeWlWfIsv0FhxXmL7lGXuXy4Nxm1WiMvcKz8FGNiEgeNZMHqm1pDbkdw+X6nmSF
         5iBiebBKwZ0Ll1F44uAlaelas+jZ0fsFUF7eCQaTzejLVxqSOTxIo4gRFLs4iv2h3ew9
         Muvg==
X-Gm-Message-State: APjAAAX/VOYX8mCAkJG6qAddjHdJ5BGWiY5iIsRwwi86J9tLGVE2SosB
        +ZWkzAFV/aCuWuJIrMhMeZJK7jg5uY4=
X-Google-Smtp-Source: APXvYqyDYCTARNmLB3hVS1u2JjHg9QFOOkVVghm1nD7khMV8TSOt9m8SflF0jnqfTN1jtfrdrRH3HA==
X-Received: by 2002:a2e:8015:: with SMTP id j21mr17055063ljg.172.1575895034385;
        Mon, 09 Dec 2019 04:37:14 -0800 (PST)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.gmail.com with ESMTPSA id d11sm10784501lfj.3.2019.12.09.04.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:37:13 -0800 (PST)
From:   jouni.hogander@unikie.com
To:     linux-mips@vger.kernel.org
Cc:     Jouni Hogander <jouni.hogander@unikie.com>,
        Paul Burton <paulburton@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MIPS: Prevent link failure with kcov instrumentation
Date:   Mon,  9 Dec 2019 14:37:07 +0200
Message-Id: <20191209123707.19693-1-jouni.hogander@unikie.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jouni Hogander <jouni.hogander@unikie.com>

__sanitizer_cov_trace_pc() is not linked in and causing link
failure if KCOV_INSTRUMENT is enabled. Fix this by disabling
instrumentation for compressed image.

Cc: Paul Burton <paulburton@kernel.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Signed-off-by: Jouni Hogander <jouni.hogander@unikie.com>
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
2.17.1

