Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E25D4083F8
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 07:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237025AbhIMFrR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Sep 2021 01:47:17 -0400
Received: from pv50p00im-ztdg10021901.me.com ([17.58.6.55]:55123 "EHLO
        pv50p00im-ztdg10021901.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232388AbhIMFrR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Sep 2021 01:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
        s=1a1hai; t=1631511446;
        bh=dePJyHcuaFN4g6WiG86/8aHijMqYflSApma+4vcsLKU=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=zvDVenfkf60eRcs6TTae3/ariTILKcgyvhO/B7n7BA5YFwBOpObdeVawdaCljfTt/
         zfZOe9Ti2FYHq6vjsu2w0zbSnlzDwSV/qCv5EclmFEfI/7D0FVBoOtgzslT5TFhBcB
         DX27tgsmLaTEt3ZmX8PEAErkNIHyeSvHOm5WDxQ/3KBZCoJsKJ/aD1+sksAa+yECGO
         QJpxkK3I8PYfnYFVhkJHnHwS8+aDwIFVG7JthrPdQu+iakSLHR190QqgdV0P7Sa3yv
         aCQLhMFAHpELyy0avnJN/K0wpWqtlw3pYiwNJELh1jZktuAqwOvVlfMFKk0rEl9Hbk
         sMsXG7wRlL1jw==
Received: from localhost.localdomain (unknown [58.240.82.166])
        by pv50p00im-ztdg10021901.me.com (Postfix) with ESMTPSA id 84237880279;
        Mon, 13 Sep 2021 05:37:23 +0000 (UTC)
From:   wangyangbo <yangbonis@icloud.com>
To:     tsbogend@alpha.franken.de, hejinyang@loongson.cn,
        chenhuacai@kernel.org, peterz@infradead.org, frederic@kernel.org,
        axboe@kernel.dk
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiehuanjun@uniontech.com, wangyangbo <yangbonis@icloud.com>
Subject: [PATCH 1/1] MIPS: Fix fpu trap invoked by io-worker
Date:   Mon, 13 Sep 2021 13:37:17 +0800
Message-Id: <c3a171e31fab6eaaadd67b8e672c5d33aa9ee20c.1631510421.git.yangbonis@icloud.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1631510421.git.yangbonis@icloud.com>
References: <cover.1631510421.git.yangbonis@icloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-09-13_02:2021-09-09,2021-09-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=745 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2109130036
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: wangyangbo <wangyangbo@uniontech.com>

Create worker thread from original user task in mips, possibly copying
FPU flag from user task, introducing save_fp when switch_to, triggering
do_cpu trap. So clear USEDFPU flag for IO_WORKER in copy_thread.

Signed-off-by: wangyangbo <yangbonis@icloud.com>
---
 arch/mips/kernel/process.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 95aa86fa6077..0095006d48c7 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -135,6 +135,9 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 		status |= ST0_EXL;
 #endif
 		childregs->cp0_status = status;
+
+		if (p->flags & PF_IO_WORKER)
+			clear_tsk_thread_flag(p, TIF_USEDFPU);
 		return 0;
 	}
 
-- 
2.20.1

