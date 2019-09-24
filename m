Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 177B9BC6C0
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2019 13:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388906AbfIXLZj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Sep 2019 07:25:39 -0400
Received: from merlin.infradead.org ([205.233.59.134]:48286 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388764AbfIXLZi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Sep 2019 07:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=isxcP9+Vg1+kwXIWM2pRevI6pFFfcA3SAgXAxcXJX1A=; b=Bm13otZDN/DQnCOAtFkzdrnnM
        zkvjJkcT+TzoTSkYyXk6CUDPqWCTejC2G9SL2SC53LxaKZ8mProoAMNi2uYDVn8mz0DyOt/qzP7SR
        lZSwxZN7PeAdu7Z2ZQjQLyF7BiFyzmMo00H55GMBhnPkvMsBC174sUCxJHQxQx75a5pZbEMTPqOS0
        k2I1B807SpKVw0Tjzpyo5FmB9U9GkPr4VuNCNXTrdXWX2zmWnjjJT2uOpFVqJP+zpcae4qbGcr5OT
        NGK4FZqhdJ2Fyx/HzTaCOi2dhhJvhEYlZ4CbO1GFWWjfcHPe2urE01e1MJzYY+ChyvqhUFotLoeAR
        +7ehzzx/A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iCivD-0007xZ-CD; Tue, 24 Sep 2019 11:23:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 89B20305E54;
        Tue, 24 Sep 2019 13:23:03 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 270C220D80D42; Tue, 24 Sep 2019 13:23:49 +0200 (CEST)
Date:   Tue, 24 Sep 2019 13:23:49 +0200
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
Message-ID: <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <20190924074751.GB23050@dhcp22.suse.cz>
 <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
 <20190924105622.GH23050@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924105622.GH23050@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 24, 2019 at 12:56:22PM +0200, Michal Hocko wrote:
> On Tue 24-09-19 11:17:14, Peter Zijlstra wrote:
> > On Tue, Sep 24, 2019 at 09:47:51AM +0200, Michal Hocko wrote:
> > > On Mon 23-09-19 22:34:10, Peter Zijlstra wrote:
> > > > On Mon, Sep 23, 2019 at 06:52:35PM +0200, Michal Hocko wrote:
> > > [...]
> > > > > I even the
> > > > > ACPI standard is considering this optional. Yunsheng Lin has referred to
> > > > > the specific part of the standard in one of the earlier discussions.
> > > > > Trying to guess the node affinity is worse than providing all CPUs IMHO.
> > > > 
> > > > I'm saying the ACPI standard is wrong.
> > > 
> > > Even if you were right on this the reality is that a HW is likely to
> > > follow that standard and we cannot rule out NUMA_NO_NODE being
> > > specified. As of now we would access beyond the defined array and that
> > > is clearly a bug.
> > 
> > Right, because the device node is wrong, so we fix _that_!
> > 
> > > Let's assume that this is really a bug for a moment. What are you going
> > > to do about that? BUG_ON? I do not really see any solution besides to either
> > > provide something sensible or BUG_ON. If you are worried about a
> > > conditional then this should be pretty easy to solve by starting the
> > > array at -1 index and associate it with the online cpu mask.
> > 
> > The same thing I proposed earlier; force the device node to 0 (or any
> > other convenient random valid value) and issue a FW_BUG message to the
> > console.
> 
> Why would you "fix" anything and how do you know that node 0 is the
> right choice? I have seen setups with node 0 without any memory and
> similar unexpected things.

We don't know 0 is right; but we know 'unkown' is wrong, so we FW_BUG
and pick _something_.

> To be honest I really fail to see why to object to a simple semantic
> that NUMA_NO_NODE imply all usable cpus. Could you explain that please?

Because it feels wrong. The device needs to be _somewhere_. It simply
cannot be node-less.
