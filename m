Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 426B22D9A21
	for <lists+linux-mips@lfdr.de>; Mon, 14 Dec 2020 15:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408145AbgLNOjz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Dec 2020 09:39:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407660AbgLNOjt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Dec 2020 09:39:49 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553A6C0613D6;
        Mon, 14 Dec 2020 06:39:09 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id r7so16648529wrc.5;
        Mon, 14 Dec 2020 06:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y23uQOHXl8QZ5RIklxR/5d33ikY1eJDu8wcPOna5oh4=;
        b=L6tz25Dmbm6QTy/RsOTHj5HcD+iVVZXZ9pDv1dXNiPIUjzgZ3vz2s9Jsi8bDGn8OW4
         2YkyF5rU/HLezWAyBNB6QMCNBG8/HuvpFBX+rz8/VdKBKS5VVt39sWNvga9Q53e7R733
         0LpK5/rJTUMvJbs3pGlBAzAEqdZmaZgEuaPJc728JO42MKOphAv+uSg7af7zvgoz34P6
         6UG1aBiBYuu3bKLd+DJXPJTECQWb62n2d9EnSPdqZB5T6BJbifDwfjKDSUo7qDamU66o
         8VdH2J+YpEYeDoeN7/bocXWlfCox28B/i9OkKwLvgulGEKd96SGHbVV8l6K6rduduooi
         +7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y23uQOHXl8QZ5RIklxR/5d33ikY1eJDu8wcPOna5oh4=;
        b=aHLw8pxdgu0JXPC+gp31XKSnRdQOaGeu0TqiMDeR7tDzNGAswzIGBrpW4bWVgCVSu+
         d0Uqxm2vdozJaw8vVpe1xhSRjMswzDFsbfgki6vrr6sakAWSHnbYRnJk7D3KWr4SISif
         /Fu05TuITOi/kyGMbyDp70KpOERrl6PnFYKVWHQCYG/NlTZWpV07Fby9ZzvbhZik2D1B
         xu1PPUpKcas262R0e89+IoBmOWy0B+XtPul7vMN6XzMSXmi4iTZwlAnTP7kOaNEKMETQ
         gPn7ov1YoDKKwEf8RaHqMQiJdM0mlHu/bmcNuwVERxOeQmc3mZtRrwmeafLLNsQMj+Ot
         a2qw==
X-Gm-Message-State: AOAM530OohmJo4+UzEc7Cfi2YsGzkSKqVvjCVaPCoiWXqmRdKuWwuToy
        mI9EdzoqfkwfOoNaH1m5GeI=
X-Google-Smtp-Source: ABdhPJw6FLJ01Z+XyCZT/YG7W+WiJ6p1Di+54cDzlWLY2Y7+ZsEyURKbqB2sn9ipAH3YjqEV1gr5gw==
X-Received: by 2002:a05:6000:185:: with SMTP id p5mr28298483wrx.403.1607956748086;
        Mon, 14 Dec 2020 06:39:08 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id w18sm12481539wrn.2.2020.12.14.06.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:39:07 -0800 (PST)
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
        Vincent Chen <deanbo422@gmail.com>, libc-alpha@sourceware.org
Subject: [PATCH] cacheflush.2: Document Architecture-specific variants
Date:   Mon, 14 Dec 2020 15:38:53 +0100
Message-Id: <20201214143852.16565-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---

Hi Michael,

Please apply this patch after
'[PATCH v5] cacheflush.2: Document __builtin___clear_cache() as a more
 portable alternative'.

Thanks,

Alex

 man2/cacheflush.2 | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
index fc35f1a0b..0761b429a 100644
--- a/man2/cacheflush.2
+++ b/man2/cacheflush.2
@@ -31,6 +31,10 @@ cacheflush \- flush contents of instruction and/or data cache
 .PP
 .BI "int cacheflush(char *" addr ", int "nbytes ", int "cache );
 .fi
+.PP
+.IR Note :
+On some architectures,
+there is no glibc wrapper for this system call; see NOTES.
 .SH DESCRIPTION
 .BR cacheflush ()
 flushes the contents of the indicated cache(s) for the
@@ -87,6 +91,44 @@ but nowadays, Linux provides a
 .BR cacheflush ()
 system call on some other architectures, but with different arguments.
 .SH NOTES
+.SS Architecture-specific variants
+Glibc provides a wrapper for this system call,
+with the prototype shown in SYNOPSIS,
+for the following architectures:
+ARC, CSKY, MIPS, and NIOS2.
+.PP
+On some other architectures,
+Linux provides this system call, with different arguments:
+.TP
+M68K:
+.PP
+.in +4n
+.EX
+.BI "int cacheflush(unsigned long " addr ", int " scope ", int " cache ,
+.BI "               unsigned long " len );
+.EE
+.in
+.TP
+SH:
+.PP
+.in +4n
+.EX
+.BI "int cacheflush(unsigned long " addr ", unsigned long " len ", int " op );
+.EE
+.in
+.TP
+NDS32:
+.PP
+.in +4n
+.EX
+.BI "int cacheflush(unsigned int " start ", unsigned int " end ", int " cache );
+.EE
+.in
+.PP
+On the above architectures,
+glibc does not provide a wrapper for this system call; call it using
+.BR syscall (2).
+.SS GCC alternative
 Unless you need the finer grained control that this system call provides,
 you probably want to use the GCC built-in function
 .BR __builtin___clear_cache (),
-- 
2.29.2

