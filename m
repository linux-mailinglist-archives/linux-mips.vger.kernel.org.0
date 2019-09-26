Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 940C4BF296
	for <lists+linux-mips@lfdr.de>; Thu, 26 Sep 2019 14:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfIZMMD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Sep 2019 08:12:03 -0400
Received: from merlin.infradead.org ([205.233.59.134]:35780 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfIZMMC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 26 Sep 2019 08:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=QmSB+iJQpid0KK6OgKLqID3ggufRi3prpqIsy8HQWNc=; b=KVBm0ALWj1UZADG6S1S003WTm
        6Y/Z2mNgsSiMdagtvJlukp3nGNsy545VNOD+MXDGI+CgrWveZsq3kwIiK+W1LpQFSlw2FO8gUGdVM
        W2VBJT0Xlb+/aHD/PsZOmPJdK4xvYogq73w0VV+DZOF+NK+Pw3EhlTl3L/B56oc0gDiH5L7IOTOmh
        9SS8hCDwrkF/LGwTT8i48Krgh9Vh7dcBpmex2wkYQ8Bfn7Fuyfe20YRVwniKWyJcj4Nza9/eRfeAA
        s7HghavBEgLci7cWRly+tTQOqfAmcSTvyTWhdg9bVpOtanHW5Wossu0KBHPpav8mRaq/Jr31Cr0YE
        u4u0ZZw0Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iDSb7-00059a-Ne; Thu, 26 Sep 2019 12:10:14 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 77211305BD3;
        Thu, 26 Sep 2019 14:09:21 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id C40552013B759; Thu, 26 Sep 2019 14:10:07 +0200 (CEST)
Date:   Thu, 26 Sep 2019 14:10:07 +0200
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
Message-ID: <20190926121007.GB4581@hirez.programming.kicks-ass.net>
References: <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <20190925104040.GD4553@hirez.programming.kicks-ass.net>
 <20190925132544.GL23050@dhcp22.suse.cz>
 <20190925163154.GF4553@hirez.programming.kicks-ass.net>
 <20190925214526.GA4643@worktop.programming.kicks-ass.net>
 <20190926090559.GA4581@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190926090559.GA4581@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 26, 2019 at 11:05:59AM +0200, Peter Zijlstra wrote:
> On Wed, Sep 25, 2019 at 11:45:26PM +0200, Peter Zijlstra wrote:
> > [    7.149889] [Firmware Bug]: device: 'pci0000:7f': no node assigned on NUMA capable HW
> > [    7.882888] [Firmware Bug]: device: 'pci0000:ff': no node assigned on NUMA capable HW
> 
> Going by the limited number of intel numa boxes I have, it looks like:
> 
>   socket = (~busid) >> (8-n)

Bah, I got my notes mixed up, it should be: busid >> (8-n)

> where 'n' is the number of bits required to encode the largest socket
> id, ie 1 for 2-socket and 2 for 4 socket.
> 
> For 8 socket systems we start using pci domains, and things get more
> 'interesting' :/
