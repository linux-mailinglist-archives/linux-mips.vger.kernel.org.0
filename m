Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D84F1A024
	for <lists+linux-mips@lfdr.de>; Fri, 10 May 2019 17:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727710AbfEJP2F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 May 2019 11:28:05 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:60108 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbfEJP2F (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 May 2019 11:28:05 -0400
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
        by vmicros1.altlinux.org (Postfix) with ESMTP id 6BB4872CCD3;
        Fri, 10 May 2019 18:28:03 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
        id 5AEC97CCE09; Fri, 10 May 2019 18:28:03 +0300 (MSK)
Date:   Fri, 10 May 2019 18:28:03 +0300
From:   "Dmitry V. Levin" <ldv@altlinux.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Elvira Khabirova <lineprinter@altlinux.org>,
        Eugene Syromyatnikov <esyr@redhat.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Andy Lutomirski <luto@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v11 3/7] mips: define syscall_get_error()
Message-ID: <20190510152803.GC28558@altlinux.org>
References: <20190510152640.GA28529@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510152640.GA28529@altlinux.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

syscall_get_error() is required to be implemented on all
architectures in addition to already implemented syscall_get_nr(),
syscall_get_arguments(), syscall_get_return_value(), and
syscall_get_arch() functions in order to extend the generic
ptrace API with PTRACE_GET_SYSCALL_INFO request.

Acked-by: Paul Burton <paul.burton@mips.com>
Cc: Elvira Khabirova <lineprinter@altlinux.org>
Cc: Eugene Syromyatnikov <esyr@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <jhogan@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
---

Notes:
    v11: unchanged
    v10: unchanged
    v9: unchanged
    v8: unchanged
    v7: added Acked-by from https://lore.kernel.org/lkml/20181213190015.olf6vhuimjl4jixs@pburton-laptop/
    v6: unchanged
    v5: initial revision

 arch/mips/include/asm/syscall.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
index acf80ae0a430..83bb439597d8 100644
--- a/arch/mips/include/asm/syscall.h
+++ b/arch/mips/include/asm/syscall.h
@@ -89,6 +89,12 @@ static inline unsigned long mips_get_syscall_arg(unsigned long *arg,
 	unreachable();
 }
 
+static inline long syscall_get_error(struct task_struct *task,
+				     struct pt_regs *regs)
+{
+	return regs->regs[7] ? -regs->regs[2] : 0;
+}
+
 static inline long syscall_get_return_value(struct task_struct *task,
 					    struct pt_regs *regs)
 {
-- 
ldv
