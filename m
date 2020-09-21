Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8562A272B8D
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 18:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgIUQSf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 12:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgIUQSf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 12:18:35 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CFAC061755;
        Mon, 21 Sep 2020 09:18:35 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id l126so9688518pfd.5;
        Mon, 21 Sep 2020 09:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3bcasITYJcvaICUjS8LM3CMudbHrdSshaP9nO3BF0+0=;
        b=EjG3TpTvNOOVqz1MTLCqISk7nevAJ1GYEmhh5iulNEzz9CgLZrLg7jfLq8v6cQ+fK5
         afawgseQIWFVvJyyp4CbJ1kZB/Cedkxdf/LMf0hC7RyzkiZ1CVbTjCU71WEQqSzBxyeE
         dNDycOa7ss4qFCpq5BHNNS2zKugeZZ95mXKp7co3xDtma7vGNNGAJ+AmuxUA9LZ5CvKu
         HHW1La+smK1zeQFH84QrAR97Kg7FbSVLPFGeVuynpIvYFYrkK03+avYXF73Pqnsy+mhD
         ppRues7FpZGMWkTs1MNJ7aJluv9RwSGX6jVxq8Brtwxi2/O9Q6BpSctMiLHsGfaWcDcK
         nqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3bcasITYJcvaICUjS8LM3CMudbHrdSshaP9nO3BF0+0=;
        b=CVta95mjWQeIpkiFJtfqqLeEPcVleprgzVp0ONh7oVhJpcSk1/hRl+OvUfyzBOpdWK
         yK99lK8GTdbwqGyQmVogpunOfnoHxbTTRhOh/vDp/vDYM2FLvsw4EbBTs+bC0qZYImnL
         ALVtoQrwB+W+TW5jNQM9FQPpnne8rZxvW/7gXO9VielTlGd7ng0FQ6qjYL8BlKsbr0Kw
         TmtPhiRnq/8Yehazyg0ozhHIEt3k05FL/AnY2+QdGgNZ2VN4XmyLA1f3S22qyFuPVKyT
         G49ibPejKToMTs4pAGOjpIxPR35lFIIl3FSncRljZTzpYbtBd0jL1u3FFpzQzfjVHogJ
         ipiQ==
X-Gm-Message-State: AOAM531K+wTbScLRIEJ+O07LPG26Ik2Q9CjD/YzCxWjoeIU/Gpq0P5sz
        u8DmKJNB6Ua0G4LhuwPtkA==
X-Google-Smtp-Source: ABdhPJw36Lj7NCId/C5Ie/W8KFUYXvlsi+213sOcmaLie+y07vSzZ7aPYESnIAoQWZ+Rh9Aj9vE0Jw==
X-Received: by 2002:aa7:9093:0:b029:142:2501:39da with SMTP id i19-20020aa790930000b0290142250139damr520129pfa.41.1600705114856;
        Mon, 21 Sep 2020 09:18:34 -0700 (PDT)
Received: from localhost.localdomain ([47.242.131.39])
        by smtp.gmail.com with ESMTPSA id p11sm12447179pfq.130.2020.09.21.09.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:18:34 -0700 (PDT)
From:   Pujin Shi <shipujin.t@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        hankinsea@gmail.com, shipujin.t@gmail.com,
        Pujin Shi <shipj@lemote.com>
Subject: [PATCH v2] MIPS: kernel: include probes-common.h header in branch.c
Date:   Tue, 22 Sep 2020 00:18:21 +0800
Message-Id: <20200921161821.2350-1-shipujin.t@gmail.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

arch/mips/kernel/branch.c:876:5: error: no previous prototype for '__insn_is_compact_branch' [-Werror=missing-prototypes]

Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
Signed-off-by: Pujin Shi <shipj@lemote.com>
---
 arch/mips/kernel/branch.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index fb3e203698ea..0216ff24c392 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -20,6 +20,8 @@
 #include <asm/ptrace.h>
 #include <linux/uaccess.h>
 
+#include "probes-common.h"
+
 /*
  * Calculate and return exception PC in case of branch delay slot
  * for microMIPS and MIPS16e. It does not clear the ISA mode bit.
-- 
2.18.1

