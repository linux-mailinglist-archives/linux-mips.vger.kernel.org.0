Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E181AFE07
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 22:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgDSUVp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 16:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgDSUVp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 16:21:45 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A414BC061A0C;
        Sun, 19 Apr 2020 13:21:43 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d17so4007173pgo.0;
        Sun, 19 Apr 2020 13:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mE8tb2wID6Gq1tu3H9S3tHcs8Ey6O9MmS8FBya2Z96U=;
        b=ME82ILm+p3oPMG7JB6M9mPlvX5J2E3kS4lcenqA7AoLeFVCmgw23tcwPcBbZiskvuh
         +Xf//5QbMvo3BIkgu0+7gKjpKFDTxPw24BHbQBuI/20dVuNirUzkSsNWlohfggEWXIwu
         AqZCD2iPaWAZ1acE2JPXAJdL5+DXz/1I+fBM4z2eZ7tDlDX3iV/IL/kt6e15NPtXEq8B
         d40hWEeikfZNCJji5QLhygbFAiVLpUWRgMZ6BVrgH6emBDrwyXa0sMk6QII0f3SJYJjV
         MJc8cc/NaHuss5PKTGA/aWs9UWy5sdEZ+6UtFNH6LYcbtB/G65UfvBGizsLgpu4ihKp0
         Snsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mE8tb2wID6Gq1tu3H9S3tHcs8Ey6O9MmS8FBya2Z96U=;
        b=WuBH0Wa3vDZc4rW29mIuQ5V6APsWnvzXj1wZSwjK2wSILodvsPUictBsQK0wRFBd+k
         3b7/zL0m72fqHnDbB6OAuoBhWvPhAOpop3G+VCEJIWlBwgoSH7CFrDlK+sFdWYSdATsZ
         yTZQR8Zx0pyRLPuLWbtMFrmPHKkRXPil+/d7mmoWC12NWsdpNsBb4YVZTjiIdTb4WRs1
         o1e80wxi7QemjJ3ftEJEt+zJ70DRjYC7kka9Chg1imV8mtLg6A7s2lA922NexBzHP77v
         zJIzZma92z+MpZuUdZn9Pw6eg/u/GKuFAXJMh7xlfrPYkLGGu2zpi8XLRJ1Dr/8MU+Vh
         GZcA==
X-Gm-Message-State: AGi0PubkywyHfdUty30KVt048LOlrGTESI9cgrAs2y6uUNaqvRzIGM+W
        msRb4HEsN22c3VJ+q40es+Y=
X-Google-Smtp-Source: APiQypKMqQbw+p15BuMghL6vVuzujQW+YL/Sh0T4rLJNebDRMm9OYq7hZcAzKng/GEoTVWrIeZ1lZw==
X-Received: by 2002:a62:4dc3:: with SMTP id a186mr13921704pfb.40.1587327703004;
        Sun, 19 Apr 2020 13:21:43 -0700 (PDT)
Received: from Ryzen-7-3700X.localdomain ([82.102.31.53])
        by smtp.gmail.com with ESMTPSA id s66sm10881010pgb.84.2020.04.19.13.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 13:21:42 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH v2 1/3] kbuild: add CONFIG_LD_IS_LLD
Date:   Sun, 19 Apr 2020 13:21:26 -0700
Message-Id: <20200419202128.20571-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200419180445.26722-1-natechancellor@gmail.com>
References: <20200419180445.26722-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Sami Tolvanen <samitolvanen@google.com>

Similarly to the CC_IS_CLANG config, add LD_IS_LLD to avoid GNU ld
specific logic such as ld-version or ld-ifversion and gain the
ability to select potential features that depend on the linker at
configuration time such as LTO.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
[nc: Reword commit message]
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* No changes.

Sami, please scream if you are unhappy with how I worded this commit.

 init/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 9e22ee8fbd75..c15ee42b8272 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -23,6 +23,9 @@ config LD_VERSION
 config CC_IS_CLANG
 	def_bool $(success,$(CC) --version | head -n 1 | grep -q clang)
 
+config LD_IS_LLD
+	def_bool $(success,$(LD) -v | head -n 1 | grep -q LLD)
+
 config CLANG_VERSION
 	int
 	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))

base-commit: 50cc09c18985eacbbd666acfd7be2391394733f5
-- 
2.26.1

