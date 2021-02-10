Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7B2316964
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 15:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhBJOrr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 09:47:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53506 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231543AbhBJOrq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Feb 2021 09:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612968378;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=fPXbqURy6kSX4ZxoBdBuEq+FZUuby0EHA9k832hQnFM=;
        b=X2pSm1cHDIH/x5FHLcrG4KW9NeagUJDeCotD0t6Mu/kvFkP+DEsmMO5g4xSOCAd8p9WcDy
        2rZGoGxqs3EiJVo0d6QiZDBNuAata/iUyie7UOman50IKE98BvieddLSAZg0tZ7kkx7r/a
        LIONWPG2/V+RWOcI6BibcCn9kfiIxbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-oJQTCZx_MwWRjqm9NwJ5tQ-1; Wed, 10 Feb 2021 09:46:16 -0500
X-MC-Unique: oJQTCZx_MwWRjqm9NwJ5tQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CD8B1005501;
        Wed, 10 Feb 2021 14:46:13 +0000 (UTC)
Received: from llong.com (ovpn-115-20.rdu2.redhat.com [10.10.115.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0C24860936;
        Wed, 10 Feb 2021 14:46:06 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ben Gardon <bgardon@google.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH] locking/arch: Move qrwlock.h include after qspinlock.h
Date:   Wed, 10 Feb 2021 09:45:56 -0500
Message-Id: <20210210144556.10932-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The queued rwlock code has a dependency on the current spinlock
implementation (likely to be qspinlock), but not vice versa. Including
qrwlock.h before qspinlock.h can be problematic when expanding qrwlock
functionality.

If both qspinlock.h and qrwlock.h are to be included, the qrwlock.h
include should always be after qspinlock.h. Update the current set of
asm/spinlock.h files to enforce that.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 arch/arm64/include/asm/spinlock.h  | 2 +-
 arch/mips/include/asm/spinlock.h   | 2 +-
 arch/xtensa/include/asm/spinlock.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/spinlock.h b/arch/arm64/include/asm/spinlock.h
index 9083d6992603..0525c0b089ed 100644
--- a/arch/arm64/include/asm/spinlock.h
+++ b/arch/arm64/include/asm/spinlock.h
@@ -5,8 +5,8 @@
 #ifndef __ASM_SPINLOCK_H
 #define __ASM_SPINLOCK_H
 
-#include <asm/qrwlock.h>
 #include <asm/qspinlock.h>
+#include <asm/qrwlock.h>
 
 /* See include/linux/spinlock.h */
 #define smp_mb__after_spinlock()	smp_mb()
diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
index 8a88eb265516..6ce2117e49f6 100644
--- a/arch/mips/include/asm/spinlock.h
+++ b/arch/mips/include/asm/spinlock.h
@@ -10,7 +10,6 @@
 #define _ASM_SPINLOCK_H
 
 #include <asm/processor.h>
-#include <asm/qrwlock.h>
 
 #include <asm-generic/qspinlock_types.h>
 
@@ -27,5 +26,6 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
 }
 
 #include <asm/qspinlock.h>
+#include <asm/qrwlock.h>
 
 #endif /* _ASM_SPINLOCK_H */
diff --git a/arch/xtensa/include/asm/spinlock.h b/arch/xtensa/include/asm/spinlock.h
index 584b0de6f2ca..41c449ece2d8 100644
--- a/arch/xtensa/include/asm/spinlock.h
+++ b/arch/xtensa/include/asm/spinlock.h
@@ -12,8 +12,8 @@
 #define _XTENSA_SPINLOCK_H
 
 #include <asm/barrier.h>
-#include <asm/qrwlock.h>
 #include <asm/qspinlock.h>
+#include <asm/qrwlock.h>
 
 #define smp_mb__after_spinlock()	smp_mb()
 
-- 
2.18.1

