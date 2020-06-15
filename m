Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4601FA35A
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2020 00:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgFOWRA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jun 2020 18:17:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39154 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726564AbgFOWQe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jun 2020 18:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592259393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k8RD1B8wb1dTFuTqvcr6ZWbigMuslfX1X9yF8acF4FQ=;
        b=QuJdK3yBcMMA4wn0+wAflpc9+yP4D8qw1sN9W4Gou0bsZ/8VhrWisTIQdjs3K1NBojqE/S
        IocruoJoxbDyCZeqZ4mQYDIjePxiw60Sb94XAYu5G5ofjz55Jl3c/UXwhijPNeom1Rjjaj
        s4pUMHQZPK1BW4511D7JrICSsUaBzMg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-_RXsBhMpPhaDXdl_4FlwjA-1; Mon, 15 Jun 2020 18:16:31 -0400
X-MC-Unique: _RXsBhMpPhaDXdl_4FlwjA-1
Received: by mail-qv1-f72.google.com with SMTP id p18so14113246qvy.11
        for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2020 15:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k8RD1B8wb1dTFuTqvcr6ZWbigMuslfX1X9yF8acF4FQ=;
        b=A6M7RFhpHRU7TUyvsp2jFdsKwxoV+3+v0sWmLvHJGw6CwMPVE2HmbuAxU2VmlMXz1k
         czX9+pRkSGQFnMZeVXE02iT+4IELGnbza4uWhmpBx3m15I2uQ1x0ZtgwtgCLYC7cX5ub
         TlnlnhCaKo1WxRP56ahR24YKKwlCj6uJtyC0npWA44ZGDzHmrvO16QAEsyQHlQ7i9hvO
         l2mCp7/W5LaYeyQ9w+TnmthELWXlz8FMdwCGTeOAaQe4hC6sOoJWlpcHb81fQlwsLgvU
         bjoMijQz5ne+VqVAR3voaUQJpGWNKrndqqrrzxKNPbziXvXUb9hK8x3FgLQg1liDsgU4
         JnYQ==
X-Gm-Message-State: AOAM530H7Z4GsKSO4vwn5WXShwtEEhSFfSZz9rmSe7dpa4lYOmCUp2rU
        MI6r2zHFSyQqOIFO6Yu152pOLw6UN1YOdZyHuM9D9turfu6eketNX20h5TlR5BDaEgTrUKiNLoa
        ta70S4Ht/NL3DWzTQR5ghwA==
X-Received: by 2002:a37:ac14:: with SMTP id e20mr17758581qkm.20.1592259390904;
        Mon, 15 Jun 2020 15:16:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk1+i3mjIQwPhD2lbehxtygSZfiJxv5Zm8yfvOnzyKWTHYGgv5WurQfy7csXRutMmX+Ql/qw==
X-Received: by 2002:a37:ac14:: with SMTP id e20mr17758556qkm.20.1592259390643;
        Mon, 15 Jun 2020 15:16:30 -0700 (PDT)
Received: from xz-x1.hitronhub.home ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id w13sm12351509qkb.91.2020.06.15.15.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:16:30 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, peterx@redhat.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH 12/25] mm/mips: Use mm_fault_accounting()
Date:   Mon, 15 Jun 2020 18:15:54 -0400
Message-Id: <20200615221607.7764-13-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615221607.7764-1-peterx@redhat.com>
References: <20200615221607.7764-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the new mm_fault_accounting() helper for page fault accounting.

Avoid doing page fault accounting multiple times if the page fault is retried.
Since at it, move the accouting out of mmap_sem because not needed.

CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: linux-mips@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/mips/mm/fault.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index f8d62cd83b36..0b937fb12614 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -43,7 +43,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 	struct mm_struct *mm = tsk->mm;
 	const int field = sizeof(unsigned long) * 2;
 	int si_code;
-	vm_fault_t fault;
+	vm_fault_t fault, major = 0;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 
 	static DEFINE_RATELIMIT_STATE(ratelimit_state, 5 * HZ, 10);
@@ -153,11 +153,11 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 	 * the fault.
 	 */
 	fault = handle_mm_fault(vma, address, flags);
+	major |= fault & VM_FAULT_MAJOR;
 
 	if (fault_signal_pending(fault, regs))
 		return;
 
-	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
@@ -168,15 +168,6 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
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
 
@@ -191,6 +182,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 	}
 
 	up_read(&mm->mmap_sem);
+	mm_fault_accounting(tsk, regs, address, major);
 	return;
 
 /*
-- 
2.26.2

