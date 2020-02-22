Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0250316909A
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 18:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgBVREb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 12:04:31 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45836 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgBVREb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 Feb 2020 12:04:31 -0500
Received: by mail-pg1-f194.google.com with SMTP id b9so2645573pgk.12;
        Sat, 22 Feb 2020 09:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4n6bs4f2I9HHkeFr8cnzxb3GG42Q6+aqDQfllFs8fw=;
        b=EFJy7e3Eq30aIQGBqf/iwJEPsDkEACKnMwZhFjxrXWdljZzhdxE9Qjwrsquvi//fUL
         fQ8sHy7uWtebXDKKEP3SIkj+1UwkTG5Hr5kdmo/YihVEVbptQEa/iC71Or4TxOiLPfZP
         Oc58NbNS2P8B8bGPgTDd7m7IdClb6RfYqLqgWX0y4HBXava/33zDhVpHpIcPXV4ShFAB
         SmoewSz/btGVstg5VhuiiIwxRbyInxM+x4R2RawGwm1hTboWMtZl2Lb9wcqau5Z1s7JX
         Nx4LXkdgRcdFvxwV3uju0miTQHEjiZgZpLcF0pDBXlnAjhU+sRycHHBSCtr4M3quwE5P
         c4Tw==
X-Gm-Message-State: APjAAAV/tiZyt8VvKZG1/Jw5+zGnrQCoYGF48rhqxIBs3POPeenziRIt
        4KdUwZLgsuODsxKeFR4Vg7Ql9h9EWgIBkA==
X-Google-Smtp-Source: APXvYqyE0wlSP1pvJenNgGssttvJm4/4JyLPClTGGGNhQG+G2ctMAMNBtBcimn8VddB5YGpmEp4kug==
X-Received: by 2002:a63:9c12:: with SMTP id f18mr41786345pge.397.1582391069907;
        Sat, 22 Feb 2020 09:04:29 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id s206sm7232100pfs.100.2020.02.22.09.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2020 09:04:29 -0800 (PST)
From:   Paul Burton <paulburton@kernel.org>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v2] MAINTAINERS: Hand MIPS over to Thomas
Date:   Sat, 22 Feb 2020 09:04:17 -0800
Message-Id: <20200222170417.1531867-1-paulburton@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

My time with MIPS the company has reached its end, and so at best I'll
have little time spend on maintaining arch/mips/.

Ralf last authored a patch over 2 years ago, the last time he committed
one is even further back & activity was sporadic for a while before
that. The reality is that he isn't active.

Having a new maintainer with time to do things properly will be
beneficial all round. Thomas Bogendoerfer has been involved in MIPS
development for a long time & has offered to step up as maintainer, so
add Thomas and remove myself & Ralf from the MIPS entry.

Ralf already has an entry in CREDITS to honor his contributions, so this
just adds one for me.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
Changes in v2:
- Merge the 2 patches & add Thomas :)
- Drop the link to Ralf's git tree
---
 CREDITS     | 5 +++++
 MAINTAINERS | 6 ++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/CREDITS b/CREDITS
index a97d3280a627..032b5994f476 100644
--- a/CREDITS
+++ b/CREDITS
@@ -567,6 +567,11 @@ D: Original author of Amiga FFS filesystem
 S: Orlando, Florida
 S: USA
 
+N: Paul Burton
+E: paulburton@kernel.org
+W: https://pburton.com
+D: MIPS maintainer 2018-2020
+
 N: Lennert Buytenhek
 E: kernel@wantstofly.org
 D: Original (2.4) rewrite of the ethernet bridging code
diff --git a/MAINTAINERS b/MAINTAINERS
index a0d86490c2c6..86e70a216ab1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11114,14 +11114,12 @@ S:	Maintained
 F:	drivers/usb/image/microtek.*
 
 MIPS
-M:	Ralf Baechle <ralf@linux-mips.org>
-M:	Paul Burton <paulburton@kernel.org>
+M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
 L:	linux-mips@vger.kernel.org
 W:	http://www.linux-mips.org/
-T:	git git://git.linux-mips.org/pub/scm/ralf/linux.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
 Q:	http://patchwork.linux-mips.org/project/linux-mips/list/
-S:	Supported
+S:	Maintained
 F:	Documentation/devicetree/bindings/mips/
 F:	Documentation/mips/
 F:	arch/mips/
-- 
2.25.1

