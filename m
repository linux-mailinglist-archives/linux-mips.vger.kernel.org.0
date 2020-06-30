Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E30D120FE0D
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 22:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729097AbgF3Uqn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jun 2020 16:46:43 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56113 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730191AbgF3Upg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Jun 2020 16:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593549936;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=DEmzww7H5zywGqZA9zT7LUnhxIyJ8MI0ZWzVs6Wigj0=;
        b=KYAAa0MuyKob9fgQu0zoY0DOpesYzUz+qqFx7bFocza9RZUuO3UJ2tTYHndvG5f/s8g1zA
        UFNEDTdBg052jw+DyQvlUsdSiFiZp56yH3FH/r7yfdievobBTerwWF5vYyVq6eWZPiDUSg
        ds0DbrrplHOayuaceQnt8EyN4fj0rUY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-nqrkEdEVMgy1aNJvhglcSw-1; Tue, 30 Jun 2020 16:45:34 -0400
X-MC-Unique: nqrkEdEVMgy1aNJvhglcSw-1
Received: by mail-qt1-f200.google.com with SMTP id c26so15267664qtq.6
        for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2020 13:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DEmzww7H5zywGqZA9zT7LUnhxIyJ8MI0ZWzVs6Wigj0=;
        b=PyxiHEtU1yqdNYZsYfDFpAeIv2Oza+48TZfFMfTBKh8eVi/WMuRjwt4ynhCA6qQVvU
         5WMnE5iRG5zgde6pO1HbdZJ8QioIjgyNiwZFI6mSsNOq3gjEzB2hoLiUYqoJ0QyBJVKV
         3TPcW0GGa6lsS30tLTgfUKR+C4IxCwnD3qM+GM9ZJW40GtUblEb5NEj6TTyr0rzMlSz2
         w1K3nOCfII0V+yp29GY1qtgzzI3E7wpeJf/8lpfUWvfrTDxwq76o4IR3cZGq9sSoQBdQ
         0J5ew5bmFmmv95GOFSl+0Zqk7eOltxftO+PhL4zHeKFQcXywM7G6Tys01mAYfo67M0aH
         CDqg==
X-Gm-Message-State: AOAM533VASEXpIJx1GmVqbg3Oa0CnZFUjBMrgveClO2ufI6c7GR9tg5w
        dGsFpE2VuUIkKtUq5yLbZoBwawUaqPV10tXSfUEzdTLVq/rCA8EzCTaESi9o0bb+ERANjiJyXYr
        s9xW0heaUP0wa4k/0Vd+neA==
X-Received: by 2002:a0c:f385:: with SMTP id i5mr22470550qvk.4.1593549933153;
        Tue, 30 Jun 2020 13:45:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlcR9sS9E2sPm9khBe36+osfWhMWvjfpILkpvioRaSYPtX3w5/pAVkcwQLHo7Ww9mgcZBAyg==
X-Received: by 2002:a0c:f385:: with SMTP id i5mr22470520qvk.4.1593549932874;
        Tue, 30 Jun 2020 13:45:32 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id b186sm3862220qkd.28.2020.06.30.13.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:45:32 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>, peterx@redhat.com,
        John Hubbard <jhubbard@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH v4 11/26] mm/mips: Use general page fault accounting
Date:   Tue, 30 Jun 2020 16:45:30 -0400
Message-Id: <20200630204530.39003-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
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
index b1db39784db9..7c871b14e74a 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -96,6 +96,8 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
+
+	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
 	mmap_read_lock(mm);
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

