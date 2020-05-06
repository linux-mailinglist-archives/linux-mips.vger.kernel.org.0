Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549581C67FA
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 08:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgEFGMN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 02:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725782AbgEFGMM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 02:12:12 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A62C061A0F;
        Tue,  5 May 2020 23:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=SZWs6cuTwWDpHnradHiRX/tMQZ
        +Al2Fwz0adWeAKm7BUCM1a6l1tkbbJ8ZQog7GVVIkeO0X7gAY9m81Rv4rv0nDDkEb+PxjEJvPK0Ya
        +Hh/826mXAFL+qTsal90JM2zjfE9f/x/DCnYyyw9k6mWGl7bU51QoIC4l6b7CQMQD1i/BqWGb9Udv
        erKicqJNxaN9YezH+3Wx8x3AUCQ21pUpDBNZ9RAK817fBUxFMDx9lHx1p5UKm4j6rQsgjMWI9t/EA
        2f3koc0nA9VhmzavBfVPBE6kZw9fsglQe8ENPgseP6QVG8TR7VhMVn5m60OuYUAuLnMGLw3V6+09y
        TtfksgLw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWDHu-0004KN-O0; Wed, 06 May 2020 06:12:10 +0000
Date:   Tue, 5 May 2020 23:12:10 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     ira.weiny@intel.com
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH V2 06/11] arch/kmap_atomic: Consolidate duplicate code
Message-ID: <20200506061210.GB5192@infradead.org>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-7-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504010912.982044-7-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
