Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6481BCFA2
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 00:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgD1WOm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 18:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726256AbgD1WOm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 18:14:42 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 359BBC03C1AC;
        Tue, 28 Apr 2020 15:14:42 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x10so4614652oie.1;
        Tue, 28 Apr 2020 15:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7XOJVk+5A6GR6NFBTWs7oO+THtl1yOH5oBnsh7etyh4=;
        b=BdArs0mrOvf4vDg6yt3ztcZ29g5JtSe1yTHw1ft5HjnH3G62okZZMu63TXKmhYKlxg
         4sUvq3tM0F6IEdnnanK+kwRi3j+q8W9XmHazDT0uZj7NJRTpkKPklnt3Fr2BQJlCcrIG
         bx1wLEEJvABjRPJlcIPUpvm3dgwk50IUI/ianTZg1InMCgk7T4DLWaUhOTiv7Hlg+del
         IMY4HBW31mSvSDDTrGrlEuBHqhaCaDSdk/ntrlai5d0roNS857bf6xlBSO2B4EBHQG5C
         t60jShHdyYU5GRWGrAl5NKrlYGvkvNA0DYS9CEb6IqL+jhFJEnsArQJvnWGXln1OAIqw
         3gBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7XOJVk+5A6GR6NFBTWs7oO+THtl1yOH5oBnsh7etyh4=;
        b=Akm1gqw6+KBGHqQUrh3X5ZlM2601cs3qRjyczsaTJKF9oN6Rt9DJeL25nHEID/sopn
         jgq1OgOZj1v+8oeaHUc7JfN+Wn3KpGjmw2lws4ibrP9zeqtHdCaqfxqMhLJxuNQ1Xilf
         mvLnWWzlkJcNP6sdlM0El+vLtOHbeYX3lfy9ixSji1HaA5YfR4MAqBu8kXftaT6bWXG6
         a5WRN2yBQtDjkEg72a0pFXEJufnzJ74p9OlJIzOvfwS80tYKZX+8M3qp79ppQxw+bbdB
         RzfuzbiXPAMRuDQL9uUN4qsC+OpC3pE411M69ClH3bQaTeeosygp7/AV2ypqu8/c4cWm
         0oZg==
X-Gm-Message-State: AGi0PuaNsZTqJZLGDVYFj/UWaYtYs9N21da8MIEYpQkZNfRHLFSlH21f
        MfJeH2yV69jFjG86Bixenr0=
X-Google-Smtp-Source: APiQypJdXXmuvEQupoPz94R0JkmRbpfP1GKLTTIk9oabIbN6Ux7EMlPAJppliNPI6I6KSjObc+nMLg==
X-Received: by 2002:aca:d06:: with SMTP id 6mr4352574oin.78.1588112081485;
        Tue, 28 Apr 2020 15:14:41 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 186sm5267476ooi.30.2020.04.28.15.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 15:14:40 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH v4 1/5] kbuild: add CONFIG_LD_IS_LLD
Date:   Tue, 28 Apr 2020 15:14:15 -0700
Message-Id: <20200428221419.2530697-2-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200428221419.2530697-1-natechancellor@gmail.com>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
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
Acked-by: Masahiro Yamada <masahiroy@kernel.org>
[nc: Reword commit message]
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v3 -> v4:

* No changes.

v2 -> v3:

* Add Masahiro's ack.

v1 -> v2:

* No changes.

Sami, please scream if you are unhappy with how I worded this commit.

 init/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 9e22ee8fbd75e..c15ee42b82726 100644
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

base-commit: 96c9a7802af7d500a582d89a8b864584fe878c1b
-- 
2.26.2

