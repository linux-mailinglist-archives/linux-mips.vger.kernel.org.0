Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28B92013F1
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2020 18:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394200AbgFSQG0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jun 2020 12:06:26 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50058 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2394020AbgFSQGH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Jun 2020 12:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592582765;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fdwEEPmGbF+7vaa9v+aN1XHbOlUdwOKUfmYW6uYEoCM=;
        b=YefcB85riAbHoGU3YjA2sPfNbZE6JiL49GO79urIs3V2CGJau9/5vz83jwMrOAGyv5zxn8
        OwFJHKfNijkkhdA3FuYsCvst37ORGAHIIUiFE/VeQLgDZ79AbmG9EZC55EDVp1WSCAMrm8
        i/FuMFis+lSXokAffstCR9m66Dy537c=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-NZKFXwZhP92Bp7Z1RpDiqg-1; Fri, 19 Jun 2020 12:06:04 -0400
X-MC-Unique: NZKFXwZhP92Bp7Z1RpDiqg-1
Received: by mail-qt1-f199.google.com with SMTP id q21so7384735qtn.20
        for <linux-mips@vger.kernel.org>; Fri, 19 Jun 2020 09:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fdwEEPmGbF+7vaa9v+aN1XHbOlUdwOKUfmYW6uYEoCM=;
        b=YnIyRlazqVt88lOBQuxqtTKWPcdygO7B3G903CjktbxDI/aFePBz3FW1n3OcckYuPF
         jnSXFixFzRmxnH+0VYMxzLIFS1Z32qpTIiKNaD7GErS19tUTVKG93uho9N5XPmwXPcQa
         Z/KV5VCi74KsSbV5gRfmBWwUyo/N9dSWWyr5/b1vhLWoEKZt4D1DTYeQM3t7FKhKkeE/
         2gNQlLoQote6O0+6C/zUa+/6u2RRZalvozbMuoTdjjl8CYiXdXjAgu5qhDL/GD4ei93B
         A9/nkIgyqZdd4dmsrKW/2iLQL8/freuEbp+0zN5ZnF4D8SzflWkMqa0JiGlRJZe+7PhW
         /5rA==
X-Gm-Message-State: AOAM531PISXyHt0vO1Y2LlPKMnaw5Xx5bvjJV5unOyII4xUFcu4yRxnt
        rdomWJi2E55OrbleSpWqE/xdMo/nLfygAD41uifVoU5OIyW2pPur7SB75JI86cWxTwsJiAWqUIU
        44x5yOtSd5frAFAEQ13XhgQ==
X-Received: by 2002:ac8:fec:: with SMTP id f41mr1437149qtk.212.1592582761259;
        Fri, 19 Jun 2020 09:06:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8wG2GTQ9R1eiAtzaifkaB+aa3jdUijFfrRdNWsFEhdltAKDggKtTyb2MbmKOZqrM66lR9pA==
X-Received: by 2002:ac8:fec:: with SMTP id f41mr1437088qtk.212.1592582760619;
        Fri, 19 Jun 2020 09:06:00 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id g11sm6412604qkk.123.2020.06.19.09.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 09:05:59 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>, peterx@redhat.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH 11/26] mm/mips: Use general page fault accounting
Date:   Fri, 19 Jun 2020 12:05:23 -0400
Message-Id: <20200619160538.8641-12-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619160538.8641-1-peterx@redhat.com>
References: <20200619160538.8641-1-peterx@redhat.com>
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

