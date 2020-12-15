Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A29CB2DAE02
	for <lists+linux-mips@lfdr.de>; Tue, 15 Dec 2020 14:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgLONbY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Dec 2020 08:31:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgLONbX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Dec 2020 08:31:23 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C6BC0617B0;
        Tue, 15 Dec 2020 05:30:43 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 3so18496924wmg.4;
        Tue, 15 Dec 2020 05:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hViOtnvGY+4JO9VZW4NA9Ghhzl7JHbPghEwPrt1jtVA=;
        b=Ef1XRfiw3/YMjfpkmB3NKEy4+KAYGtJ/+5Yxui3w2yjbH1Gt/dX4iseHBTlgLJjd20
         gYS0onONCVD/HrfoC8e3fMUi6Z3LdJJdGCF4B/Um+kw/DHUDYbWXyXSDS/rrg2YsjBJa
         qQmJZczHi1Xvg3Ef38xPYQqTMMxHx2unXWexJ8r4hl0VxMxzT5AaZRrfg/UGWaAbZoqA
         LAp4H6IeS3k6Fghi+mhE06nCPQTbDMpk000kVfv3o5tDuAhUvx/d5hWKWIlxW3V4Qdlz
         HKZRcpnWLTbEJs3t6OGooiaszoWYFiAuibNR+52c0riuvNqU1tI0DuSKE9CpOLEBU+rE
         JHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hViOtnvGY+4JO9VZW4NA9Ghhzl7JHbPghEwPrt1jtVA=;
        b=uA/HtLxgnTZeuv4umBn2dFD/QQ87ic/08KMZqwQ6AK8vj2znlkkmovL97a2mia1h6+
         ioPGwYenin0DC2bUwh63cX+KxZIkK55KwjEipxLAHdSbhilnEYAAN8/J3JttqxXJsf4m
         nQsLRirBa/BvTZ4eK0lXInR75c19gzvzgJQKNjwQyQ6cvWS7X5AVameE+hjfj5JaXg/r
         xjtdeNaNjknsVIxU7MuSP3rQHT0bx8pFyoFJ3oF8rohQFtqI6mJHNcRMt444zZntU7kn
         7sclWVuuzAP1048jxES9kYtvoULmIwlhQ57tNviWqbhxKeZUsLvNj/4Pw+7Lu46+q+Jr
         XVCw==
X-Gm-Message-State: AOAM533sQ2Sg6R6nzRc3ZlgOIccuNXD4uPqxMNUNqgxnFGWNb0swSu33
        10EBGi+fSYTofgFSkeSRIb8=
X-Google-Smtp-Source: ABdhPJxu0j/rXyBcT8i0pqy+eH/ROTi4+4c71h3L9WrE4dLOb7tZam/y9JAqsyWuoSkrUgKVrypPgQ==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr32319066wme.40.1608039042332;
        Tue, 15 Dec 2020 05:30:42 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id z8sm36888479wmg.17.2020.12.15.05.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 05:30:41 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     Michael Kerrisk <mtk.manpages@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        linux-man@vger.kernel.org, Martin Sebor <msebor@redhat.com>
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, gcc-patches@gcc.gnu.org,
        cfe-users@lists.llvm.org, cfe-dev@lists.llvm.org
Subject: [PATCH v6] cacheflush.2: Document __builtin___clear_cache() as a more portable alternative
Date:   Tue, 15 Dec 2020 14:30:20 +0100
Message-Id: <20201215133019.14411-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <e2424619-2a5a-a44a-2dc0-a16310725250@gmail.com>
References: <e2424619-2a5a-a44a-2dc0-a16310725250@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
Cc: Martin Sebor <msebor@redhat.com>
Cc: Dave Martin <Dave.Martin@arm.com>
---

v6:
- GCC has always exposed 'void *', as Martin Sebor noted.
  It's Clang (and maybe others) that (following GCC's docs)
  exposed 'char *'.

 man2/cacheflush.2 | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
index aba625721..7a2eed506 100644
--- a/man2/cacheflush.2
+++ b/man2/cacheflush.2
@@ -86,6 +86,30 @@ On Linux, this call first appeared on the MIPS architecture,
 but nowadays, Linux provides a
 .BR cacheflush ()
 system call on some other architectures, but with different arguments.
+.SH NOTES
+Unless you need the finer grained control that this system call provides,
+you probably want to use the GCC built-in function
+.BR __builtin___clear_cache (),
+which provides a portable interface
+across platforms supported by GCC and compatible compilers:
+.PP
+.in +4n
+.EX
+.BI "void __builtin___clear_cache(void *" begin ", void *" end );
+.EE
+.in
+.PP
+On platforms that don't require instruction cache flushes,
+.BR __builtin___clear_cache ()
+has no effect.
+.PP
+.IR Note :
+On some GCC-compatible compilers,
+the prototype for this built-in function uses
+.I char *
+instead of
+.I void *
+for the parameters.
 .SH BUGS
 Linux kernels older than version 2.6.11 ignore the
 .I addr
-- 
2.29.2

