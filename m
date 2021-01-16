Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DDE2F8DDE
	for <lists+linux-mips@lfdr.de>; Sat, 16 Jan 2021 18:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728508AbhAPRLI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Jan 2021 12:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728569AbhAPRLF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 Jan 2021 12:11:05 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6392C061382;
        Sat, 16 Jan 2021 06:57:22 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id e15so3682622wme.0;
        Sat, 16 Jan 2021 06:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GBNeTSu04ixKYSzbYAV+880sIV5+lGfcrwYBDcoDztA=;
        b=Tf7ga7AWLWf2ItsBKMJgzstjS0iQOHyu2Bo5P9Zu7PeqJcTXV5R0QRtWy+fAX6ZziU
         VTNdIKv1L+KoiYBkGsnBL+BhiCiRriQOW5i2KikBXwHQIALRDeXy+VTiYVnz73jP7DAl
         27BkEd63K5Hg779deY110KMYRPgeCQDyER+D7mwy7XNpWem3zdNkAXMiD48+24RuYJIU
         z0RotZ+DEDYaLV7VuLX0fzRCfjekiPoN3LBRk3jP37V7k+/qqLb5EksB0+JOLQGJvkDg
         zapzPI3f8tN+CN+LVAlIUlwTk5krGCiBKPyZl2T/h3eXWZNQpH9kbeXmx3g503dfLN6x
         DJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GBNeTSu04ixKYSzbYAV+880sIV5+lGfcrwYBDcoDztA=;
        b=aXAh9xVeFKsTte+Sjp5QQumAvwGc40uGJ7MdwJ+V1cVlQ8LnMseKsp+mwaeZD+1Z8F
         Ag5c09hM+bMnlz1Fn8bOY7v8LiNfrPmtyqrlFGhv5yWBLO2kjoTXLkLUAuHmvG1yq0Vq
         rOsOVFh+oAAXBUjaclJtjCEWpcpB+rVfMRGeXGiMb2WIvUdMlAOZVPOBWS5KDh9MGEYt
         fLeF1H3kVLwm6FxiNPwkODGnrlXGlZirMdbQUNnh4Da7wxYfnPyNxUc4i1jRaKPEg9Az
         6UQs1XmXQsQKBIhkx5ilQPWs95EVKGEaFgbWFN+CSOrEJZJJF7/SGrb8dozcnNe2yASe
         ChhQ==
X-Gm-Message-State: AOAM532usOjPa61kge6iUHluZsCywhqoErea8d5H+tk/I6CvVVY7SL6G
        O+ees49kwhcWDPcKXwIV4rE=
X-Google-Smtp-Source: ABdhPJwm71FymYwD2RCaAQe0ruh5XNahsyLNfkIwL+NUnHq8L9JrVeaj5YOOjlfFOQEHLVAB1cN/oQ==
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr13318861wmg.160.1610809041319;
        Sat, 16 Jan 2021 06:57:21 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id h83sm17285824wmf.9.2021.01.16.06.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 06:57:20 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, libc-alpha@sourceware.org,
        Dave Martin <Dave.Martin@arm.com>,
        Martin Sebor <msebor@redhat.com>
Subject: [PATCH] cacheflush.2: Update SYNOPSIS for glibc wrapper
Date:   Sat, 16 Jan 2021 15:56:33 +0100
Message-Id: <20210116145632.7636-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Glibc uses 'void *' instead of 'char *'.
And the prototype is declared in <sys/cacheflush.h>.

......

$ syscall='cacheflush';
$ ret='int';
$ find glibc/ -type f -name '*.h' \
  |xargs pcregrep -Mn "(?s)^[\w\s]*${ret}\s*${syscall}\s*\(.*?;";
glibc/sysdeps/unix/sysv/linux/nios2/sys/cachectl.h:27:
extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
glibc/sysdeps/unix/sysv/linux/mips/sys/cachectl.h:35:
extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
glibc/sysdeps/unix/sysv/linux/arc/sys/cachectl.h:30:
extern int cacheflush (void *__addr, int __nbytes, int __op) __THROW;
glibc/sysdeps/unix/sysv/linux/csky/sys/cachectl.h:30:
extern int cacheflush (void *__addr, const int __nbytes,
		       const int __op) __THROW;

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/cacheflush.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
index 2cf624f3a..0496879ca 100644
--- a/man2/cacheflush.2
+++ b/man2/cacheflush.2
@@ -27,9 +27,9 @@
 cacheflush \- flush contents of instruction and/or data cache
 .SH SYNOPSIS
 .nf
-.B #include <asm/cachectl.h>
+.B #inlcude <sys/cacheflush.h>
 .PP
-.BI "int cacheflush(char *" addr ", int "nbytes ", int "cache );
+.BI "int cacheflush(void *" addr ", int "nbytes ", int "cache );
 .fi
 .PP
 .IR Note :
-- 
2.30.0

