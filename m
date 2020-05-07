Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF1A1C81E3
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 07:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgEGFyP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 01:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgEGFyP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 01:54:15 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A68FC061A0F
        for <linux-mips@vger.kernel.org>; Wed,  6 May 2020 22:54:15 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id js4so117999pjb.5
        for <linux-mips@vger.kernel.org>; Wed, 06 May 2020 22:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=DSez4N0yarBpZ5CDI4/L071hnr+Fr8/yKrsk6OTCcqc=;
        b=FMoh6qruoxZiNgfG/iEu3Vl5HrfoH9uXVJv7HtuY5KzUFxD+xJkelBNNShB43gXfK7
         XHQf12YsXAfvIW6bsKRP92nj/OYkjGfrJWvhayouTfol1XZnBsv0BShDAVfajecgQZmc
         bm75LF1nkuH7qJBI0ikmCD68G25dJEFBeSl76Iy5FKehE6P6incg449U/PEiHPMfTFbX
         +ISYTGrk5LXzffGuOyetdBgn8L5UEXva2J3B7/V5AXV9bmIP96q0alPp0/Dy35saFLnP
         Bh6QC5cW6q7EU2VYYQBR+VCobDTajTUwYGVTCuYSXxff2O7hYDOt7jz4UsPfEJkjLgQq
         m60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=DSez4N0yarBpZ5CDI4/L071hnr+Fr8/yKrsk6OTCcqc=;
        b=MIQT/mSwqsUCodfiGpMpMQ+AdMRpGjuuT1eaLZrdDQUypxdZUD6xRDUxFeKZbIoZA3
         YSYTQnZDCI6uqU6F1Qd4h6Mhk4OnLYkNypgNri7hWNjhWR+Ih1+/f5el+UeaVH5IBZM6
         hf3DPcZnqE9cOaFc7LiS1uqr+jvX2F6WKf4qVKcOr5EkZeYUIAAqoDYbICCTpc3G7i51
         X1C6E3hzORYKdGIXhjRmLGe8rb07NRFH1ww4ESALRToCz8rONhSqxIZ0JY9xcfxNboGj
         sw05q8jl12swbr91Yo9YPYY0wmTGkyTWhB5JWoFLASNMT8T2MCdJkBklCZ0YkfeK24oI
         LiNw==
X-Gm-Message-State: AGi0PuYge8MWU8bZNtMjGBWWiVobocTNQYr2WqpUeAYgsZlRimOuP4mO
        vzz1liRFg59y5lE9Sn6U+70=
X-Google-Smtp-Source: APiQypKQ35TzncYPOqh83wHwA+9EKzaz+uMRDaNe/1AIfzSxtbxq93IDociSqTYfIyWXGR0IZLzpAQ==
X-Received: by 2002:a17:90a:688f:: with SMTP id a15mr973766pjd.111.1588830854701;
        Wed, 06 May 2020 22:54:14 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id h17sm3682661pfk.13.2020.05.06.22.54.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 22:54:14 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: asm: Use __ASSEMBLY__ to guard some macros to avoid build error
Date:   Thu,  7 May 2020 13:54:23 +0800
Message-Id: <1588830863-30416-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use __ASSEMBLY__ to guard definitions of some macros (PANIC and PRINT)
to avoid build error:

1, PANIC conflicts with drivers/scsi/smartpqi/smartpqi_init.c
2, PRINT conflicts with net/netfilter/nf_conntrack_h323_asn1.c and net/
   mac80211/debugfs_sta.c

Fixes: d339cd02b888eb8c ("MIPS: Move unaligned load/store helpers to inst.h")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/asm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
index 934465d..b01762ab 100644
--- a/arch/mips/include/asm/asm.h
+++ b/arch/mips/include/asm/asm.h
@@ -74,6 +74,8 @@ symbol:		.insn
 		.globl	symbol;				\
 symbol		=	value
 
+#ifdef __ASSEMBLY__
+
 #define PANIC(msg)					\
 		.set	push;				\
 		.set	reorder;			\
@@ -98,6 +100,8 @@ symbol		=	value
 #define PRINT(string)
 #endif
 
+#endif
+
 #define TEXT(msg)					\
 		.pushsection .data;			\
 8:		.asciiz msg;				\
-- 
2.7.0

