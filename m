Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF8A1B61C0
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 19:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729887AbgDWRS2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 13:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729873AbgDWRS2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Apr 2020 13:18:28 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA6AC09B042;
        Thu, 23 Apr 2020 10:18:27 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id j4so7372806otr.11;
        Thu, 23 Apr 2020 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ox1WLU3YUxcP2R/GVPO/gQRlaX6uwFvhGgYlvzhom8U=;
        b=kI4TGFfZQrCLM1ubOC/N78oRrvYMQ6BxrVgdxTtoQslDCYMJE3n/662x/Xd0mwXm5G
         tHiz3Y2sDzdZLmBQUXVx747nAIPALN8pY6wwvpEmyhySXPySpmV97OeZ0tHN/pQPx6an
         X3BKdzft+rAeeWqIlol73cmETF+wXRXgwrM+SnWCFN+N3XP/TkJfIVxy4RoYkAfjzG/e
         jTaMG91B0QMA5hGONLzDgaBIPL/0BWBHPobB7zZj8JR0HEZBN6hQIoCClXHlULCFombJ
         H1yeds+T43FcDhQ47sgLlA6pNXx2Ey8RkOXhG80tR2YQkCGw7DMOxInDns3yzEY/UaSg
         rNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ox1WLU3YUxcP2R/GVPO/gQRlaX6uwFvhGgYlvzhom8U=;
        b=jNh7wDHUpxUPAJgasFqjn4dKhAxYGu5tPs+E3HTtEyi12+k3FFVJ0XVrAD6nlh36lQ
         y9xbANvODLJoRLbVbQvO7kk6tuq7oKMkm2Gxh5q1fijpIS8AMhmt8wKU4l+TbCbZi1Xj
         nKng9J+lCpGiqdUnibG6cMLnZ5qElR54ufOOOsqeSQMqEfzAKXThNtqBYF/HhODY6hmT
         hMm/cioDE0BYsA86JlaMLkfhFZKdq0MSSiOD3+wjspFahJ46GOghVDtKwWhxZAq8Ssmb
         w+mGOHEFKxHw6Xf8CZTWU5FjOuZAxPoDnpzMFLNGcgypg0A3MMq6TpZ3dABv1F05xlJa
         2DaQ==
X-Gm-Message-State: AGi0PubjBLoXEXr9eHo6K94/s11r2Jv02U//fNmvmavwXu/QK8alY31G
        uEsB00ldsMAtnt0PpGtZTm8PcS7DAbs=
X-Google-Smtp-Source: APiQypJsLrMoxkPad47LLuoBzFyGFl+3ifX7fd/TyQ5Wz3cRz5hiX82bq9xWH+v1uQTO6Ss1dknxVg==
X-Received: by 2002:aca:6002:: with SMTP id u2mr3861263oib.45.1587662306403;
        Thu, 23 Apr 2020 10:18:26 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id y5sm746726otq.38.2020.04.23.10.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 10:18:25 -0700 (PDT)
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
Subject: [PATCH v3 1/4] kbuild: add CONFIG_LD_IS_LLD
Date:   Thu, 23 Apr 2020 10:18:04 -0700
Message-Id: <20200423171807.29713-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200419202128.20571-1-natechancellor@gmail.com>
References: <20200419202128.20571-1-natechancellor@gmail.com>
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

base-commit: ae83d0b416db002fe95601e7f97f64b59514d936
-- 
2.26.2

