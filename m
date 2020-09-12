Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9160B2679C7
	for <lists+linux-mips@lfdr.de>; Sat, 12 Sep 2020 13:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgILLKw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Sep 2020 07:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgILLJo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Sep 2020 07:09:44 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FF0C061344
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2020 04:08:35 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d19so2151218pld.0
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2020 04:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yfwK3v59ulDG8xRv4Cwr4k2seeBZHBJy/fMB9LYQCYQ=;
        b=KLE1PL50FLBo8ev5qSDoj1kBBVOJoMyiHr99ME6rCPqlayRiESNpQWvxCHB3om2Bfc
         XN0BVMjBNpBx5otJmu1jvqPjeWgsI4KksNuYIwR70mc27cvFLWlhjTRLgt83KBE2MFDw
         Dm8vSbSJaJpHsO2XD/IeVUJf+GCoM9n5H04mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yfwK3v59ulDG8xRv4Cwr4k2seeBZHBJy/fMB9LYQCYQ=;
        b=VKjEW/zcJM/QoYRPteVaGrKhq0H6E/OhMRi1Rx0QDdoGi/LVGMxKj1akxdGNVSyjIi
         cJQeiMFj45EG8eAjg3fEG7fNxehhkt8/LchL6xjvue+TrWP4jYrPz5LJC357txaWx5oM
         +lQyCr2p2xbi9sxEZL65PV5iAPk9AeRqReYyhhfnHXUMNRmT8JX72pU0gwf+G4/pkOff
         LzszQ4p9G7MeVOORpxSuxqmdWEUpfZ25fyGYPNOVINjiinBUqCO+Ay/G8OsY0JssW3pT
         aTXKJY1BCyYPqJJy6lM3LDYWlhNPTxqiNQvpc5FBELmGlmFBDxtr+2wf5Li8E24WnVWX
         2Gkg==
X-Gm-Message-State: AOAM533v6Xh3b76XTOKAVPe/EoOfut0kQVA6Mb5PsOaI+L9CwomN9gCm
        u64Eac3yUtWqXApDOF/qodB0Fw==
X-Google-Smtp-Source: ABdhPJz39VXqPylLzqvKf+nVy4cjgyiwubNgnhEKUOy/E1w6B1m+xyacV3sKJYHyjEOTCLca7/KdBw==
X-Received: by 2002:a17:902:7489:b029:d0:4c09:be with SMTP id h9-20020a1709027489b02900d04c0900bemr6604087pll.0.1599908915516;
        Sat, 12 Sep 2020 04:08:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q190sm5265820pfq.99.2020.09.12.04.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 04:08:34 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christian Brauner <christian@brauner.io>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>,
        linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-xtensa@linux-xtensa.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/15] selftests/clone3: Avoid OS-defined clone_args
Date:   Sat, 12 Sep 2020 04:08:19 -0700
Message-Id: <20200912110820.597135-15-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912110820.597135-1-keescook@chromium.org>
References: <20200912110820.597135-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As the UAPI headers start to appear in distros, we need to avoid
outdated versions of struct clone_args to be able to test modern
features. Additionally pull in the syscall numbers correctly.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
I needed to fix this to get MIPS to build the seccomp selftests.
---
 .../testing/selftests/clone3/clone3_selftests.h  | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3_selftests.h b/tools/testing/selftests/clone3/clone3_selftests.h
index 91c1a78ddb39..bc0f34e37ae1 100644
--- a/tools/testing/selftests/clone3/clone3_selftests.h
+++ b/tools/testing/selftests/clone3/clone3_selftests.h
@@ -4,11 +4,19 @@
 #define _CLONE3_SELFTESTS_H
 
 #define _GNU_SOURCE
+
+/* Pull in syscall numbers. */
+#include <unistd.h>
+#include <sys/syscall.h>
+
+/* Avoid old OS versions of "struct clone_args". */
+#define clone_args old_clone_args
 #include <sched.h>
 #include <linux/sched.h>
+#undef clone_args
+
 #include <linux/types.h>
 #include <stdint.h>
-#include <syscall.h>
 #include <sys/wait.h>
 
 #include "../kselftest.h"
@@ -25,6 +33,7 @@
 
 #ifndef __NR_clone3
 #define __NR_clone3 -1
+#endif
 struct clone_args {
 	__aligned_u64 flags;
 	__aligned_u64 pidfd;
@@ -34,13 +43,16 @@ struct clone_args {
 	__aligned_u64 stack;
 	__aligned_u64 stack_size;
 	__aligned_u64 tls;
+#ifndef CLONE_ARGS_SIZE_VER1
 #define CLONE_ARGS_SIZE_VER1 80
+#endif
 	__aligned_u64 set_tid;
 	__aligned_u64 set_tid_size;
+#ifndef CLONE_ARGS_SIZE_VER2
 #define CLONE_ARGS_SIZE_VER2 88
+#endif
 	__aligned_u64 cgroup;
 };
-#endif /* __NR_clone3 */
 
 static pid_t sys_clone3(struct clone_args *args, size_t size)
 {
-- 
2.25.1

