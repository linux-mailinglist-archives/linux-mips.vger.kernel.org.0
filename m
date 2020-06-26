Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD4E20BC8E
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jun 2020 00:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgFZWcF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Jun 2020 18:32:05 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37500 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726169AbgFZWby (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 26 Jun 2020 18:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593210712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u5CO9Ioy3aEI+rpepvYK9awRSU/1xBbKoMWw19CoOCA=;
        b=YqMRzY9UmmivSqNJwor9lHlPZtmLoum/hrb1+qoist/75KZ9HWiyTzALtNGy43c42gmlvE
        Uws11V9xL1kryZArO0OsTroIffFJYNMhk/IdbMC/b5vddvjGSHLzZ8YLKiRAcRkDHn4UNB
        7nFouGXzayc6wHfjOmZ0iD8VqOS87Kk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-8E5YzYzOPAK2nPQo0SZlSQ-1; Fri, 26 Jun 2020 18:31:50 -0400
X-MC-Unique: 8E5YzYzOPAK2nPQo0SZlSQ-1
Received: by mail-qt1-f197.google.com with SMTP id z26so7520690qto.15
        for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2020 15:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u5CO9Ioy3aEI+rpepvYK9awRSU/1xBbKoMWw19CoOCA=;
        b=qIV+lg6vxPqtWb3DPzxUTD4IjtexbespkuabzMw5vTB5spxOn0wHLiiA+BF6izLtwF
         Hi3ps4ErZJSJPVcmJihBuaJw2meCwY8DvtD3TCn+fEKexc9R29qQtJ5LCkOj170V/cHB
         4N1/gSu1029wB7d6dbkZsNYDkufbz7Px0HbUqoQGxXUo4y3x2x80Q6b564dVq/Xjg5+l
         AmTh1m2f3r9Hno7viirbmTYD4rl2dzG7CcWht7ok9a2ZEjXSy0idDzwJjZELhXDasMZz
         9wgyQfQXWdVr6mPirf2iTvHDGFDut2jHcLJMmWJyQaKQEypxd3dWxXYakLkAZNRBvQfV
         292w==
X-Gm-Message-State: AOAM533rq8KM1XlZH8BltQlkwK+829UT3dQlMaxDHWPxMTEqu3PTw6Vf
        /44sTUNzX0qRmh9DDEWEjM3y9zNIPiDxRF8i4icKZTKx03prv76XnIFATL5zy1TO/4oxZn6TWCI
        g0w7X2il7awv+eu/Y0NpcVg==
X-Received: by 2002:ac8:1bad:: with SMTP id z42mr5330183qtj.110.1593210710386;
        Fri, 26 Jun 2020 15:31:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx55mkHv5JA7KsCjLa9A+G8OruKBcVHC68/qR9rih5tmrLSf1Prppo2YVIg8T1r9n5+R3Awzw==
X-Received: by 2002:ac8:1bad:: with SMTP id z42mr5330160qtj.110.1593210710153;
        Fri, 26 Jun 2020 15:31:50 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id f203sm9903311qke.135.2020.06.26.15.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 15:31:49 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>, peterx@redhat.com,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH 11/26] mm/mips: Use general page fault accounting
Date:   Fri, 26 Jun 2020 18:31:15 -0400
Message-Id: <20200626223130.199227-12-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626223130.199227-1-peterx@redhat.com>
References: <20200626223130.199227-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the general page fault accounting by passing regs into handle_mm_fault().
It naturally solve the issue of multiple page fault accounting when page fault
retry happened.

Fix PERF_COUNT_SW_PAGE_FAULTS perf event manually for page fault retries, by
moving it before taking mmap_sem.

CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: linux-mips@vger.kernel.org
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/mips/mm/fault.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index 31c2afb8f8a5..750a4978a12b 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -96,6 +96,8 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
+
+	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
 	down_read(&mm->mmap_sem);
 	vma = find_vma(mm, address);
@@ -152,12 +154,11 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 	 * make sure we exit gracefully rather than endlessly redo
 	 * the fault.
 	 */
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	if (fault_signal_pending(fault, regs))
 		return;
 
-	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
@@ -168,15 +169,6 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 		BUG();
 	}
 	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_MAJOR) {
-			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ, 1,
-						  regs, address);
-			tsk->maj_flt++;
-		} else {
-			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1,
-						  regs, address);
-			tsk->min_flt++;
-		}
 		if (fault & VM_FAULT_RETRY) {
 			flags |= FAULT_FLAG_TRIED;
 
-- 
2.26.2

