Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B47DFBC6D7
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2019 13:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392383AbfIXLaO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Sep 2019 07:30:14 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44738 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389832AbfIXLaN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Sep 2019 07:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=dbh+LNpfHGx1ZW50djITCw4VayzNg3bZoJJA4YYciR4=; b=d4/1g7KQ1Xnql+EJZmSt4Ms/A
        0kSfUvB3z8BGH4YfjpK+w8xfrcLLNVbYGqE0IwCSm+BLV7pKw6G5NZ5UEYQeV3TR6qeUrdp4jxnCN
        ygmvFOm0ruyWip5tSlEee3x65/eg6WDULrHhw/ixBwEzwTXhk4XwVdCiJ/rQnjVlWD4w7vz40SLOY
        SEA6f0EClYW0upPoWk4an8xBrUkd66PIkIbK4xNgZCV+I2JAjqfFxdUFzZpVwWLm1MkcuXGCJ0oed
        ZwsSGpYE8GM1VXWGm/CJpmZHJnB72d+InX8H012hfsD7p1dmugvRPkyunHJfFESBuUPHyoVEOOni0
        JIODc5loA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iCizP-00088l-If; Tue, 24 Sep 2019 11:28:17 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AFA6F3053E9;
        Tue, 24 Sep 2019 13:27:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 440C520D80D42; Tue, 24 Sep 2019 13:28:11 +0200 (CEST)
Date:   Tue, 24 Sep 2019 13:28:11 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Yunsheng Lin <linyunsheng@huawei.com>
Cc:     Michal Hocko <mhocko@kernel.org>, catalin.marinas@arm.com,
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
Message-ID: <20190924112811.GK2332@hirez.programming.kicks-ass.net>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <f1362dbb-ad31-51a8-2b06-16c9d928b876@huawei.com>
 <20190924092551.GK2369@hirez.programming.kicks-ass.net>
 <c816abbe-155b-504b-cef1-6413f7cdd20c@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c816abbe-155b-504b-cef1-6413f7cdd20c@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 24, 2019 at 07:07:36PM +0800, Yunsheng Lin wrote:
> On 2019/9/24 17:25, Peter Zijlstra wrote:
> > On Tue, Sep 24, 2019 at 09:29:50AM +0800, Yunsheng Lin wrote:
> >> On 2019/9/24 4:34, Peter Zijlstra wrote:
> > 
> >>> I'm saying the ACPI standard is wrong. Explain to me how it is
> >>> physically possible to have a device without NUMA affinity in a NUMA
> >>> system?
> >>>
> >>>  1) The fundamental interconnect is not uniform.
> >>>  2) The device needs to actually be somewhere.
> >>>
> >>
> >> From what I can see, NUMA_NO_NODE may make sense in the below case:
> >>
> >> 1) Theoretically, there would be a device that can access all the memory
> >> uniformly and can be accessed by all cpus uniformly even in a NUMA system.
> >> Suppose we have two nodes, and the device just sit in the middle of the
> >> interconnect between the two nodes.
> >>
> >> Even we define a third node solely for the device, we may need to look at
> >> the node distance to decide the device can be accessed uniformly.
> >>
> >> Or we can decide that the device can be accessed uniformly by setting
> >> it's node to NUMA_NO_NODE.
> > 
> > This is indeed a theoretical case; it doesn't scale. The moment you're
> > adding multiple sockets or even board interconnects this all goes out
> > the window.
> > 
> > And in this case, forcing the device to either node is fine.
> 
> Not really.
> For packet sending and receiving, the buffer memory may be allocated
> dynamically. Node of tx buffer memory is mainly based on the cpu
> that is sending sending, node of rx buffer memory is mainly based on
> the cpu the interrupt handler of the device is running on, and the
> device' interrupt affinity is mainly based on node id of the device.
> 
> We can bind the processes that are using the device to both nodes
> in order to utilize memory on both nodes for packet sending.
> 
> But for packet receiving, the node1 may not be used becuase the node
> id of device is forced to node 0, which is the default way to bind
> the interrupt to the cpu of the same node.
> 
> If node_to_cpumask_map() returns all usable cpus when the device's node
> id is NUMA_NO_NODE, then interrupt can be binded to the cpus on both nodes.

s/binded/bound/

Sure; the data can be allocated wherever, but the control structures are
not dynamically allocated every time. They are persistent, and they will
be local to some node.

Anyway, are you saying this stupid corner case is actually relevant?
Because how does it scale out? What if you have 8 sockets, with each
socket having 2 nodes and 1 such magic device. Then returning all CPUs
is just plain wrong.

> >> 2) For many virtual deivces, such as tun or loopback netdevice, they
> >> are also accessed uniformly by all cpus.
> > 
> > Not true; the virtual device will sit in memory local to some node.
> > 
> > And as with physical devices, you probably want at least one (virtual)
> > queue per node.
> 
> There may be similar handling as above for virtual device too.

And it'd be similarly broken.
