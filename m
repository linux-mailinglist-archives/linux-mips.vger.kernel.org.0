Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C50ADA56D0
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 14:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730399AbfIBM5g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 08:57:36 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55238 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729950AbfIBM5g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 08:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=9h13EkBbQnZFZZifKdj3rs2HLYagXdgFWT2AUzdmgpI=; b=hbKCmxrhUY1zqpP0uzODVohmc
        7Gc3fRoEvRGtWXSR1YHAsRyqeOQZ+xSo3xueOYK0vZkz2wXZDvUnLNC21905DicvN9MPBAs4DBoHP
        3bEPPX3Lah67+Yt2YExpC+47yEB1NRTiRlG2syuXFfZuBnYx1rgsSfXzIhagdqy2nJMJMcIGaOkBm
        jqE6smn69C/mhsZ+W09pCKWboIYlgkXz4x5ucnn1GxJP4fgNnVDc7NhwfOC1XwO1DTcx+XifaEChK
        ej/28hnJz2yhxza7ykMLMj5I6MCx6KdQRmTPPejmkQG2Pu2wo4ajJdOKDSq+MquqSIw54tqAYCWoV
        lCZUHOQWA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i4lt4-0006FG-Ob; Mon, 02 Sep 2019 12:56:51 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B054A30116F;
        Mon,  2 Sep 2019 14:56:08 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 695CA29B408C9; Mon,  2 Sep 2019 14:56:44 +0200 (CEST)
Date:   Mon, 2 Sep 2019 14:56:44 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Yunsheng Lin <linyunsheng@huawei.com>
Cc:     dalias@libc.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com,
        dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
        linuxarm@huawei.com, jiaxun.yang@flygoat.com,
        linux-kernel@vger.kernel.org, mwb@linux.vnet.ibm.com,
        paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org,
        chenhc@lemote.com, will@kernel.org, linux-s390@vger.kernel.org,
        ysato@users.sourceforge.jp, mpe@ellerman.id.au, x86@kernel.org,
        rppt@linux.ibm.com, borntraeger@de.ibm.com, dledford@redhat.com,
        mingo@redhat.com, jeffrey.t.kirsher@intel.com,
        benh@kernel.crashing.org, jhogan@kernel.org,
        nfont@linux.vnet.ibm.com, mattst88@gmail.com, len.brown@intel.com,
        gor@linux.ibm.com, anshuman.khandual@arm.com,
        ink@jurassic.park.msu.ru, cai@lca.pw, luto@kernel.org,
        tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com,
        linux-arm-kernel@lists.infradead.org, rth@twiddle.net,
        axboe@kernel.dk, robin.murphy@arm.com, linux-mips@vger.kernel.org,
        ralf@linux-mips.org, tbogendoerfer@suse.de, paul.burton@mips.com,
        linux-alpha@vger.kernel.org, bp@alien8.de,
        akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
        davem@davemloft.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
Message-ID: <20190902125644.GQ2369@hirez.programming.kicks-ass.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
 <20190902072542.GN2369@hirez.programming.kicks-ass.net>
 <5fa2aa99-89fa-cd41-b090-36a23cfdeb73@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fa2aa99-89fa-cd41-b090-36a23cfdeb73@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 02, 2019 at 08:25:24PM +0800, Yunsheng Lin wrote:
> On 2019/9/2 15:25, Peter Zijlstra wrote:
> > On Mon, Sep 02, 2019 at 01:46:51PM +0800, Yunsheng Lin wrote:
> >> On 2019/9/1 0:12, Peter Zijlstra wrote:
> > 
> >>> 1) because even it is not set, the device really does belong to a node.
> >>> It is impossible a device will have magic uniform access to memory when
> >>> CPUs cannot.
> >>
> >> So it means dev_to_node() will return either NUMA_NO_NODE or a
> >> valid node id?
> > 
> > NUMA_NO_NODE := -1, which is not a valid node number. It is also, like I
> > said, not a valid device location on a NUMA system.
> > 
> > Just because ACPI/BIOS is shit, doesn't mean the device doesn't have a
> > node association. It just means we don't know and might have to guess.
> 
> How do we guess the device's location when ACPI/BIOS does not set it?

See device_add(), it looks to the device's parent and on NO_NODE, puts
it there.

Lacking any hints, just stick it to node0 and print a FW_BUG or
something.

> It seems dev_to_node() does not do anything about that and leave the
> job to the caller or whatever function that get called with its return
> value, such as cpumask_of_node().

Well, dev_to_node() doesn't do anything; nor should it. It are the
callers of set_dev_node() that should be taking care.

Also note how device_add() sets the device node to the parent device's
node on NUMA_NO_NODE. Arguably we should change it to complain when it
finds NUMA_NO_NODE and !parent.

---
 drivers/base/core.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index f0dd8e38fee3..2caf204966a0 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2120,8 +2120,16 @@ int device_add(struct device *dev)
 		dev->kobj.parent = kobj;
 
 	/* use parent numa_node */
-	if (parent && (dev_to_node(dev) == NUMA_NO_NODE))
-		set_dev_node(dev, dev_to_node(parent));
+	if (dev_to_node(dev) == NUMA_NO_NODE) {
+		if (parent)
+			set_dev_node(dev, dev_to_node(parent));
+#ifdef CONFIG_NUMA
+		else {
+			pr_err("device: '%s': has no assigned NUMA node\n", dev_name(dev));
+			set_dev_node(dev, 0);
+		}
+#endif
+	}
 
 	/* first, register with generic layer. */
 	/* we require the name to be set before, and pass NULL */
