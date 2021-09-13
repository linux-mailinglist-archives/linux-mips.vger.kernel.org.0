Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A014083E5
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 07:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237030AbhIMFoB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Sep 2021 01:44:01 -0400
Received: from pv50p00im-zteg10021401.me.com ([17.58.6.47]:41690 "EHLO
        pv50p00im-zteg10021401.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237033AbhIMFoA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Sep 2021 01:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
        s=1a1hai; t=1631511402;
        bh=Brrzgs7G+ie0QIm4dqheYM3EgHMJf4edT/j47PDHf1g=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=pN6oqNaZcRrs8OIY15mLYHVIFy+R+UObmDZk7aRetSgvL0g+Mt+yzKr43nMA9bB4y
         TAzjVPaWdS1wIKNIiIgVefYwh/kLcqIKLRhrvALg1zmP8QP0JMtksoQw75YX2PtQ18
         0pmvthJl1qkbW1/fjpjKh8Qtunoma0rmt3/s6pAadSeAz7tPPqspheYDYwUNP+QpG0
         1q73T09554hHji5/GmI1RG02n0BTwdNOmS//06udMe19zExuVhbC/9uSbz4eVWq3xO
         UOw0hpxtdRHgc6n2QP8aWPDf0N0OaiFN986uLdwceTSQ9OEdyJmbAqaOaLP02fhL7E
         8kdd6LgQbXWDA==
Received: from localhost.localdomain (unknown [58.240.82.166])
        by pv50p00im-zteg10021401.me.com (Postfix) with ESMTPSA id D7F424804B4;
        Mon, 13 Sep 2021 05:36:39 +0000 (UTC)
From:   wangyangbo <yangbonis@icloud.com>
To:     tsbogend@alpha.franken.de, hejinyang@loongson.cn,
        chenhuacai@kernel.org, peterz@infradead.org, frederic@kernel.org,
        axboe@kernel.dk
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiehuanjun@uniontech.com, wangyangbo <yangbonis@icloud.com>
Subject: [PATCH 0/1] Create kernel thread possibly with USEDFPU flag in mips
Date:   Mon, 13 Sep 2021 13:36:23 +0800
Message-Id: <cover.1631510421.git.yangbonis@icloud.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-09-13_02:2021-09-09,2021-09-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2109130036
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,
I want to use new syscall io_uring in mips,

Problem:
Running ./liburing/examples/io_uring-cp of liburing in mips kernel,
[  132.538431] do_cpu invoked from kernel context![#1]:
[  132.597936] CPU: 2 PID: 4154 Comm: iou-wrk-4153 Not tainted 5.14.0-rc1+ #5
[  132.680373] Hardware name: THTF CQTL630 Series/THTF-LS3A4000-7A1000-1W-VB1-ML4A, BIOS V2.0.3 05/08/2020
[  133.560951] Hi    : 0000000000000002
[  133.603728] Lo    : 000000000c49ba60
[  133.646499] epc   : ffffffff80217670 _save_fp+0x10/0xa0
[  133.709104] ra    : ffffffff80cb9c44 __schedule+0x574/0xad8
[  133.775875] Status: 5400cce2 KX SX UX KERNEL EXL
[  133.832222] Cause : 1000002c (ExcCode 0b)
[  133.880215] PrId  : 0014c004 (ICT Loongson-3)
[  135.382659] Call Trace:
[  135.411868] [<ffffffff80217670>] _save_fp+0x10/0xa0
[  135.470296] [<ffffffff80cb9c44>] __schedule+0x574/0xad8
[  135.532893] [<ffffffff80cba22c>] schedule+0x84/0x138
[  135.592361] [<ffffffff80cbf714>] schedule_timeout+0x1bc/0x3c0
[  135.661219] [<ffffffff80510588>] io_wqe_worker+0x110/0x350
[  135.726947] [<ffffffff80205a6c>] ret_from_kernel_thread+0x14/0x1c
[  135.799981]
[  135.817718] Code: 000c6940  05a10011  00000000 <f4810a00> f4830a20  f4850a40  f4870a60  f4890a80  f48b0aa0

Reason:
io-wq, fork worker threads from original user task(commit 3bfe6106693b6b4ba175ad1f929c4660b8f59ca8).
This causes copy_thread with TIF_USEDFPU flag in mips, meaning save_fp in switch_to, triggering do_cpu trap, however cpid 1(fpu) don't allow kernel to use.

Fix:
clear FPU flag in kernel IO_WORKER thread_copy branch.

wangyangbo (1):
  MIPS: Fix fpu trap invoked by io-worker

 arch/mips/kernel/process.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.20.1

