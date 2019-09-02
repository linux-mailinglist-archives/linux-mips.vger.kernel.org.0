Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86B1AA5A52
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 17:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730711AbfIBPRd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 11:17:33 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:32998 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbfIBPRd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 11:17:33 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 5750E1537CAFA;
        Mon,  2 Sep 2019 08:17:30 -0700 (PDT)
Date:   Mon, 02 Sep 2019 08:17:27 -0700 (PDT)
Message-Id: <20190902.081727.1498167275046613083.davem@davemloft.net>
To:     linyunsheng@huawei.com
Cc:     catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com,
        bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru,
        mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org,
        mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, ysato@users.sourceforge.jp,
        dalias@libc.org, ralf@linux-mips.org, paul.burton@mips.com,
        jhogan@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw,
        robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        len.brown@intel.com, axboe@kernel.dk, dledford@redhat.com,
        jeffrey.t.kirsher@intel.com, linux-alpha@vger.kernel.org,
        nfont@linux.vnet.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
        mwb@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, tbogendoerfer@suse.de,
        linux-mips@vger.kernel.org, linuxarm@huawei.com
Subject: Re: [PATCH v2 7/9] sparc64: numa: check the node id consistently
 for sparc64
From:   David Miller <davem@davemloft.net>
In-Reply-To: <1e128e33-427f-19a2-0e13-95a9c0656ab1@huawei.com>
References: <0195eb73-99ae-fec2-3e11-2cb9e6677926@huawei.com>
        <20190831.130250.1236116087422472663.davem@davemloft.net>
        <1e128e33-427f-19a2-0e13-95a9c0656ab1@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 02 Sep 2019 08:17:31 -0700 (PDT)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Yunsheng Lin <linyunsheng@huawei.com>
Date: Mon, 2 Sep 2019 14:08:31 +0800

> The NUMA node id in sparc64 system is defined by DT semantics?

Sometimes, and in other cases other methods are used to determine
the NUMA node id.
