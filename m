Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7BB2679C6
	for <lists+linux-mips@lfdr.de>; Sat, 12 Sep 2020 13:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgILLKw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Sep 2020 07:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgILLJx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Sep 2020 07:09:53 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B96C061347
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2020 04:08:36 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id n14so9086472pff.6
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2020 04:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FZnp4yDc6/H8oZY5gPE0ntNCiw9S8Y24vH6szdlcBNQ=;
        b=Zk/gIvdNfjQE/2unl26djetvFbMWk4A8shRgP7V779rbL1iDmAqb/WJsaeUEyvkWho
         8jG+lsS6GNlo3kWdNKOEks2fdvmH3bO73kMlDWOuyuO55TqqWNyvjERND1Wyg09jCOar
         c+he/PZbFxcnDUtW7NY4RKVcPovh+GacMTNqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FZnp4yDc6/H8oZY5gPE0ntNCiw9S8Y24vH6szdlcBNQ=;
        b=G+uxpgvmURCkFr/2RTIaKvHrGXKq0a+Xq8zpzzU9ymTE0FAH+mdbv6vdUmXaEiNTwh
         KB8W1vNeAqHnUql+x87YFZFMkaBDB6QABUVUEg5g5DJakaXZMHTkjDrBt/tJsdY7S6Vg
         yZUnM/M//sn/9G4uHWxBKt2O0S15HTaaClikmoUM7fECc/nk//5H3EVXO9JxYf9QvOsm
         CoYREo8hzHkXe1ZHM54oziGGl/l38aaU1pTKuirwSghhI4crVHk3BPnqx6OxxRS5WL70
         wH8RCG9dEUtZXLuk9IJX+v8ov5loScT+5iCpu7aL+dfHUW5FVBBovYNWdJ6LC8r00HbL
         OXvw==
X-Gm-Message-State: AOAM532lCtZZxdzI7Greu9QzUslJzEVLZZGQ8+yBTFVmaKvdF6Iofw26
        I/pPLmuy9Jf3AI+mwqF6XAyeLg==
X-Google-Smtp-Source: ABdhPJxq4vqIb6iJR4MN1IGlGkXsD9IVC0sP3rRF3lcvwIHfpvEszE0WWk+A5K78Aa5hwg8SNrEAAg==
X-Received: by 2002:aa7:9ac9:0:b029:13e:d13d:a133 with SMTP id x9-20020aa79ac90000b029013ed13da133mr6030859pfp.27.1599908916069;
        Sat, 12 Sep 2020 04:08:36 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 17sm4796064pfi.55.2020.09.12.04.08.29
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
Subject: [PATCH 15/15] selftests/seccomp: Use __NR_mknodat instead of __NR_mknod
Date:   Sat, 12 Sep 2020 04:08:20 -0700
Message-Id: <20200912110820.597135-16-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912110820.597135-1-keescook@chromium.org>
References: <20200912110820.597135-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The __NR_mknod syscall doesn't exist on arm64 (only __NR_mknodat).
Switch to the modern syscall.

Fixes: ad5682184a81 ("selftests/seccomp: Check for EPOLLHUP for user_notif")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 26c712c6a575..b34ede28f314 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -3773,7 +3773,7 @@ TEST(user_notification_filter_empty)
 	if (pid == 0) {
 		int listener;
 
-		listener = user_notif_syscall(__NR_mknod, SECCOMP_FILTER_FLAG_NEW_LISTENER);
+		listener = user_notif_syscall(__NR_mknodat, SECCOMP_FILTER_FLAG_NEW_LISTENER);
 		if (listener < 0)
 			_exit(EXIT_FAILURE);
 
-- 
2.25.1

