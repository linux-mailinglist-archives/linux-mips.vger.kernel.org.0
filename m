Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854E6422E7B
	for <lists+linux-mips@lfdr.de>; Tue,  5 Oct 2021 18:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236665AbhJEQ4U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Oct 2021 12:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236644AbhJEQ4Q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Oct 2021 12:56:16 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98201C061749
        for <linux-mips@vger.kernel.org>; Tue,  5 Oct 2021 09:54:25 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z1so1282825edb.8
        for <linux-mips@vger.kernel.org>; Tue, 05 Oct 2021 09:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fk/QQrhvhWl250xqim6BP5LgFJXVKgL6oVVyy4HUcfw=;
        b=G570B2PDZ3/zdJ99HDzFrC8qRpbniSiXKaCIxSgzflaXdJedTNsBuPysNIJ6MbrmQ0
         19UNZ/YgIRWgWHzlUuCspP7P2dZ+owuCK1e78xpHQjNiqLyG/ymCnJEuxPdJfFGux7XD
         RThWYPTuXhz2scNJbJEXcC0oMA42f88wY5qvq9ESroAbyBAbopN5PuZXILHZPQxHhWWZ
         OwEflE3WOizjGftt1iwjW8L27MikeDVY+fdJJClueH0ismx7su7CjbQuSYzen1fIZbDG
         XB1nmjK5iHK1GnWKR3rBi2+8jguhUX6Me8CGNf+R5VHbR6Zlg99ZswtWCiz2gPkdcH3Y
         Dzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fk/QQrhvhWl250xqim6BP5LgFJXVKgL6oVVyy4HUcfw=;
        b=oE4ebGHr35tq6pv7ywBBByv6cpsyMCNBXoSEEOCVP+fxE6TlTdV5yu5i1ZGwKdcn+r
         IIKXvIyM8J1ux2+pI5T6kD6wFlyfa1orEMjcE+ubR3igjvV00JL82hTCAx3UCEjGKdNt
         uPaZqnYpk3U3nrMV7Ea/YIth3++IKxBJ7x7cb2DvHS5q6WJtJf7ZLTUOrguDtfEbhksu
         V8FtNzTqExPTKK6M4XyO5ZB+T5UQpv0uI03u2DWphAwR59Qtz0L+Lmdv9qPZeGQetqnK
         n4NSMbACQxEizaR5klWGYNFGcOBbyCCX8k/i6gYua+oPtDnGpyvmo/+gSH74iKNzkrGG
         CNDw==
X-Gm-Message-State: AOAM532K1kzrh2cdEjQ+GNAbCqjRQWa5v2b1BpMDNCo4VqMD6KRqfj/6
        HxtWm1r5R98UUCdJ42XTlx48uA==
X-Google-Smtp-Source: ABdhPJyyPI5stv7KN0YLvTZoYccWLo7ht3abgf9z8XoF2WaCVEcyc4fBItT34ciGJddcxFarUqBXfg==
X-Received: by 2002:a17:906:7a50:: with SMTP id i16mr15609210ejo.507.1633452864191;
        Tue, 05 Oct 2021 09:54:24 -0700 (PDT)
Received: from anpc2.lan (static-213-115-136-2.sme.telenor.se. [213.115.136.2])
        by smtp.gmail.com with ESMTPSA id x16sm3447818ejj.8.2021.10.05.09.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 09:54:23 -0700 (PDT)
From:   Johan Almbladh <johan.almbladh@anyfinetworks.com>
To:     ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        paulburton@kernel.org
Cc:     kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
        john.fastabend@gmail.com, kpsingh@kernel.org,
        tsbogend@alpha.franken.de, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, yangtiezhu@loongson.cn,
        tony.ambardar@gmail.com, bpf@vger.kernel.org,
        linux-mips@vger.kernel.org, netdev@vger.kernel.org,
        Johan Almbladh <johan.almbladh@anyfinetworks.com>
Subject: [PATCH 2/7] mips: uasm: Add workaround for Loongson-2F nop CPU errata
Date:   Tue,  5 Oct 2021 18:54:03 +0200
Message-Id: <20211005165408.2305108-3-johan.almbladh@anyfinetworks.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005165408.2305108-1-johan.almbladh@anyfinetworks.com>
References: <20211005165408.2305108-1-johan.almbladh@anyfinetworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch implements a workaround for the Loongson-2F nop in generated,
code, if the existing option CONFIG_CPU_NOP_WORKAROUND is set. Before,
the binutils option -mfix-loongson2f-nop was enabled, but no workaround
was done when emitting MIPS code. Now, the nop pseudo instruction is
emitted as "or ax,ax,zero" instead of the default "sll zero,zero,0". This
is consistent with the workaround implemented by binutils.

Link: https://sourceware.org/legacy-ml/binutils/2009-11/msg00387.html

Signed-off-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
---
 arch/mips/include/asm/uasm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/uasm.h b/arch/mips/include/asm/uasm.h
index 5efa4e2dc9ab..296bcf31abb5 100644
--- a/arch/mips/include/asm/uasm.h
+++ b/arch/mips/include/asm/uasm.h
@@ -249,7 +249,11 @@ static inline void uasm_l##lb(struct uasm_label **lab, u32 *addr)	\
 #define uasm_i_bnezl(buf, rs, off) uasm_i_bnel(buf, rs, 0, off)
 #define uasm_i_ehb(buf) uasm_i_sll(buf, 0, 0, 3)
 #define uasm_i_move(buf, a, b) UASM_i_ADDU(buf, a, 0, b)
+#ifdef CONFIG_CPU_NOP_WORKAROUNDS
+#define uasm_i_nop(buf) uasm_i_or(buf, 1, 1, 0)
+#else
 #define uasm_i_nop(buf) uasm_i_sll(buf, 0, 0, 0)
+#endif
 #define uasm_i_ssnop(buf) uasm_i_sll(buf, 0, 0, 1)
 
 static inline void uasm_i_drotr_safe(u32 **p, unsigned int a1,
-- 
2.30.2

