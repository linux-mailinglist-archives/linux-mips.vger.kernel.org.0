Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCFA2D979B
	for <lists+linux-mips@lfdr.de>; Mon, 14 Dec 2020 12:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438456AbgLNLoo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Dec 2020 06:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438197AbgLNLoi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Dec 2020 06:44:38 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18194C0613CF;
        Mon, 14 Dec 2020 03:43:58 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id m5so16136074wrx.9;
        Mon, 14 Dec 2020 03:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Duu0tFo0BYN5uj6dURuetdL16PH4j+9j2ppt0P47uAQ=;
        b=pB9wTxjZ7/mVFcG7DEye1eerxxcC4ixF6IXGpSf6sVJ0MNqfl5c03LarhNR+9Rb2wn
         3pUbhdPn6nInHo0E+Pf0mVki3C3Zr8fzOwKjpmZ2FX+BoX5rSfJQc9pDUK21jbtX5km8
         9hRb5LbE1+MlqnR9s/G3R2MfzK7J+xYgG1eIiWgMh82BZtIgop2XPtldp0Th0azQFyRY
         KDdJSgiOHjte4z7WP35RrewVVvovSMtgDYj0loZslXUF9lmzklXkN7xOHqLOQd3sA/J0
         Zj2Diw5iZ7iWLGyaA+9LP0oyg8BDFKWESTaXBUyl0ml60gLMafwZ0samI25t67EX/iUA
         HCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Duu0tFo0BYN5uj6dURuetdL16PH4j+9j2ppt0P47uAQ=;
        b=H08r69D69ETndCmUXJ44qfuN45tv8uNNuqms7y0Q8VHfEpQI1+qp7N5ggE0ge9bJDO
         wiNxYh5FGhV5+F8QbT98OySRguSoS9zTwrA/RrfBuomeYRRbgebNyE6Nxt5IiNvtzp0y
         ixLs8q2owVeT2ZVNMkXRnbzLKAXEFiq+oxDV0XngnrZ1ryAZyF0y8nP0ah0Hia/U8pIf
         BGHQEXUNeOm8QIryq12ZfenQ8dCJbdweDBy4upHBGClXLyx7Kl7UhAJdSCxYgf2EeDSA
         QSKJZhYtuLZdHw9Sl4fkeBTkVhOm+uTReWn9fNif1kPBoZ+cEGuN9kbJHieoyfmUBgZ0
         Xmjg==
X-Gm-Message-State: AOAM530CeTEeO/AcL6iHbPM3PS5P81LcXyTwX7Z1xqzuViXC+3WrGXQx
        EkP8KdYP2joZKgfuAUbE7II=
X-Google-Smtp-Source: ABdhPJxsLEA1x2BvX2Vfv0PWw5ZALM5wpjW+lZrR3OZvh23vfIoL8ABymDaKKnKOm5kmY/zsMlVxdQ==
X-Received: by 2002:a5d:4d02:: with SMTP id z2mr29370287wrt.109.1607946236907;
        Mon, 14 Dec 2020 03:43:56 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id w18sm11738403wrn.2.2020.12.14.03.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 03:43:56 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     Michael Kerrisk <mtk.manpages@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        linux-man@vger.kernel.org
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, gcc-patches@gcc.gnu.org,
        cfe-users@lists.llvm.org, cfe-dev@lists.llvm.org
Subject: [PATCH v5] cacheflush.2: Document __builtin___clear_cache() as a more portable alternative
Date:   Mon, 14 Dec 2020 12:43:07 +0100
Message-Id: <20201214114306.10784-1-alx.manpages@gmail.com>
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
---
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
+Until GCC 9.1.0,
+the prototype for this built-in function used
+.I char *
+instead of
+.I void *
+for the parameters.
 .SH BUGS
 Linux kernels older than version 2.6.11 ignore the
 .I addr
-- 
2.29.2

