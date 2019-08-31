Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 618F5A42EB
	for <lists+linux-mips@lfdr.de>; Sat, 31 Aug 2019 08:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfHaGxn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Aug 2019 02:53:43 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:47488 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfHaGxn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 31 Aug 2019 02:53:43 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id BF53B15520975;
        Fri, 30 Aug 2019 23:53:39 -0700 (PDT)
Date:   Fri, 30 Aug 2019 23:53:37 -0700 (PDT)
Message-Id: <20190830.235337.570776316111294728.davem@davemloft.net>
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
In-Reply-To: <1567231103-13237-8-git-send-email-linyunsheng@huawei.com>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
        <1567231103-13237-8-git-send-email-linyunsheng@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 30 Aug 2019 23:53:41 -0700 (PDT)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Yunsheng Lin <linyunsheng@huawei.com>
Date: Sat, 31 Aug 2019 13:58:21 +0800

> According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
> of proximity domain is optional, as below:

What in the world does the ACPI spec have to do with sparc64 NUMA
node ID checking?
