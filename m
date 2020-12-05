Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A982CFAB1
	for <lists+linux-mips@lfdr.de>; Sat,  5 Dec 2020 09:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgLEIx4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 5 Dec 2020 03:53:56 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39335 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbgLEIxs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Dec 2020 03:53:48 -0500
Received: by mail-pl1-f195.google.com with SMTP id p6so4469302plo.6
        for <linux-mips@vger.kernel.org>; Sat, 05 Dec 2020 00:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q4s242OUPLGoq21XHrpbfduhW1dxO9cM7RvX9rTcfPU=;
        b=tAEmxhiiw/B3MVJLdyu/8ZRI1IWSFHezY7dMImu2YhArAIUEDSfB/AgLVte4UNWOpZ
         dXHwXxaeLYu7ZlX7hODvfOixmcRY9tb969Lg3D1neLJwBtd848P/qW3CHlnIFJQ1hUsP
         pq5t8Hiwmj++5U1ZcwzO00VN1Yj8us42DRbMhoNyGjBTCu1mcxdaxgnbQVuiCcswDtFo
         7FSETwCqo4hRsprxJdIaJ6KJnjerq83uCYvjqG3W8iEWf9O0a98Ulvxe9ksWviqzWVYx
         loB/BlOHHYr+qMsxo72x1gwYXvHl1MZji7PKCuReX2PXgy0pUEZbuo2/PGFA3z92zeMf
         Fd7A==
X-Gm-Message-State: AOAM531Gg/Mx6JluuLm5p0MB58UERzz4Avu5yKQZ11sZ+T/RsMwhgSra
        qMGp+c7724qrm6cCML/+xeuZdPI6xrcr4PMz
X-Google-Smtp-Source: ABdhPJw8vXs/UdVksYUbMP1lT+rpDZs/23ZFSThr7kOP9sftPGURP+YOVlfuJTTgxUGa8RdQlZ8pyA==
X-Received: by 2002:a17:90a:6844:: with SMTP id e4mr7703750pjm.151.1607158382258;
        Sat, 05 Dec 2020 00:53:02 -0800 (PST)
Received: from software.domain.org ([132.145.85.142])
        by smtp.gmail.com with ESMTPSA id b28sm7646845pfp.195.2020.12.05.00.52.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Dec 2020 00:53:01 -0800 (PST)
From:   chenhuacai@kernel.org
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH] MAINTAINERS: chenhc@lemote.com -> chenhuacai@kernel.org
Date:   Sat,  5 Dec 2020 16:55:07 +0800
Message-Id: <1607158507-11888-1-git-send-email-chenhuacai@kernel.org>
X-Mailer: git-send-email 2.7.0
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Huacai Chen <chenhuacai@kernel.org>

Use @kernel.org address as the main communications end point. Update the
corresponding M-entries and .mailmap (for git shortlog translation).

Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index d9fb83d6..4e212ff 100644
--- a/.mailmap
+++ b/.mailmap
@@ -122,6 +122,8 @@ Henk Vergonet <Henk.Vergonet@gmail.com>
 Henrik Kretzschmar <henne@nachtwindheim.de>
 Henrik Rydberg <rydberg@bitmath.org>
 Herbert Xu <herbert@gondor.apana.org.au>
+Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
+Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
 Jacob Shin <Jacob.Shin@amd.com>
 Jaegeuk Kim <jaegeuk@kernel.org> <jaegeuk@google.com>
 Jaegeuk Kim <jaegeuk@kernel.org> <jaegeuk.kim@samsung.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index ebe4829..34b353e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9622,7 +9622,7 @@ F:	arch/arm64/kvm/
 F:	include/kvm/arm_*
 
 KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
-M:	Huacai Chen <chenhc@lemote.com>
+M:	Huacai Chen <chenhuacai@kernel.org>
 M:	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
 L:	linux-mips@vger.kernel.org
 L:	kvm@vger.kernel.org
@@ -11704,7 +11704,7 @@ F:	drivers/*/*/*loongson2*
 F:	drivers/*/*loongson2*
 
 MIPS/LOONGSON64 ARCHITECTURE
-M:	Huacai Chen <chenhc@lemote.com>
+M:	Huacai Chen <chenhuacai@kernel.org>
 M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-- 
2.7.0

