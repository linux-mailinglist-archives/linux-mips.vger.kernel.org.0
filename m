Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2258CBBCFF
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2019 22:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502762AbfIWUfF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Sep 2019 16:35:05 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56884 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502755AbfIWUfE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Sep 2019 16:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jeUp5+lKmcF/04ueHLJZUYIvt6Ip7WoukEyBumn2fVY=; b=Rp7KwCGBA1u0fTRuTtn353Iqg
        U1m+WAQt9nn2fAGVujebKUGETSc3lGylxo6ybOFrC6OjqOh6jQ3v/DS5f3WAkIPyz8mslZ534nPPF
        w/unipekNmfUEpWS+8sKsDNny4hh/TUmdhJAPIZWH2ZRICzTYlxFR1ynoVzBW1pYsSzPlTXy9kFo8
        Isg6dRFXpBOi7a6PiA7uGzWX65FTAfllSiv/KpO5JJ5OOAofnU1CPXj0xiiTFQerXgpuCzvcT/6/Q
        SuqnTR2lR5rXkZN2iOh+yxAo8ns7Qujb+vZw/+amd8qwDo2R1+BLFhPLMDyxnUTx5OlVv5h2LyDch
        CDhZ19tzw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iCV2F-0002BC-Is; Mon, 23 Sep 2019 20:34:15 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C0BAA301A7A;
        Mon, 23 Sep 2019 22:33:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 0BAD120D80D4E; Mon, 23 Sep 2019 22:34:11 +0200 (CEST)
Date:   Mon, 23 Sep 2019 22:34:10 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Michal Hocko <mhocko@kernel.org>
Cc:     Yunsheng Lin <linyunsheng@huawei.com>, catalin.marinas@arm.com,
        will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net,
        ink@jurassic.park.msu.ru, mattst88@gmail.com,
        benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
        heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, ysato@users.sourceforge.jp,
        dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com,
        chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com,
        anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw,
        robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org,
        dave.hansen@linux.intel.com, luto@kernel.org, len.brown@intel.com,
        axboe@kernel.dk, dledford@redhat.com, jeffrey.t.kirsher@intel.com,
        linux-alpha@vger.kernel.org, naveen.n.rao@linux.vnet.ibm.com,
        mwb@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, tbogendoerfer@suse.de,
        linux-mips@vger.kernel.org, rafael@kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190923203410.GI2369@hirez.programming.kicks-ass.net>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923165235.GD17206@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 23, 2019 at 06:52:35PM +0200, Michal Hocko wrote:
> On Mon 23-09-19 17:48:52, Peter Zijlstra wrote:

> To the NUMA_NO_NODE itself. Your earlier email noted:
> : > +
> : >  	if ((unsigned)node >= nr_node_ids) {
> : >  		printk(KERN_WARNING
> : >  			"cpumask_of_node(%d): (unsigned)node >= nr_node_ids(%u)\n",
> : 
> : I still think this makes absolutely no sense what so ever.
> 
> Did you mean the NUMA_NO_NODE handling or the specific node >= nr_node_ids
> check?

The NUMA_NO_NODE thing. It's is physical impossibility. And if the
device description doesn't give us a node, then the description is
incomplete and wrong and we should bloody well complain about it.

> Because as to NUMA_NO_NODE I believe this makes sense because this is
> the only way that a device is not bound to any numa node.

Which is a physical impossibility.

> I even the
> ACPI standard is considering this optional. Yunsheng Lin has referred to
> the specific part of the standard in one of the earlier discussions.
> Trying to guess the node affinity is worse than providing all CPUs IMHO.

I'm saying the ACPI standard is wrong. Explain to me how it is
physically possible to have a device without NUMA affinity in a NUMA
system?

 1) The fundamental interconnect is not uniform.
 2) The device needs to actually be somewhere.

From these it seems to follow that access to the device is subject to
NUMA.

