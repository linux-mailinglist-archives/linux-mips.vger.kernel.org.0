Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5FE1D9D41
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 18:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729345AbgESQy3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 12:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbgESQyZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 May 2020 12:54:25 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7A1C08C5C0;
        Tue, 19 May 2020 09:54:24 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n18so195616pfa.2;
        Tue, 19 May 2020 09:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xmBBbLK3vjWE/EyjvUc68p3tw/EXGXu0OK+6vpkbzqQ=;
        b=US3KTRvNcsr1JQ3EhzPolHH5YLTbLmBZ8QACOxRX4DSdLWVJ77w+ufdLjru2exOJj5
         cGgDdNSpGJSLCToXHOYtummYRYMikc607MQTtZw3CIAeMX52xLfkzXJFnqV++/4JZPBX
         TkfA6bA2OQ/tBu0verEpOr/8yTMghh7JOJnq8blVosibdSwn9t4VGf6TTFO3jl9Ku+S6
         us7ewjcIE1yEdgRycst8zGi/M73AaWLcbuldE63QokhOzCU4Lv6vQlzl3U74bTRQpiDW
         76aVV76mP+yZNV5Arg3qVa0f6SZeHYOumZT/8SZvPzqHfkPYn2L9uFwTaop85+0WCxz9
         dP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=xmBBbLK3vjWE/EyjvUc68p3tw/EXGXu0OK+6vpkbzqQ=;
        b=cR6rLjJSzdiF1nQScGxbyfon6rGmIz1g5SRot5TGVx+q12D4LBFQjIEZ7FtBzuNBsC
         +Y/PgJZLmk2Lrj1hZ2VE1AFKurMoYrg9qWIxYwXNxH4wL94J9O5fV2CUQYouixDWw02B
         BD4jvXyj27qYMH9YB0VXJcQQROPDbjyJq/i/0T1qzg4qywWbi3vxsWZGiT4yyvQb2QaL
         hDaOkqhsDa1D/AO1HoNlTjBd2g7LlhsgdOPV3cQgCKoJm3bdPobs/hi1Xy/jSgjCYQae
         Wv4xNXArratXgBzpzyUVHoLkgdB0NvDbDTWbzDfcgJxgqVZfW6vSEVzxcxv7G5Wep7RD
         RWXQ==
X-Gm-Message-State: AOAM533o4YvoYqt9DFSB/Z1J5YPibL2IeI7opTFE3XXPVqim5TfuC0/u
        qUlHD6ihRt5fJP1fNgVcBWM=
X-Google-Smtp-Source: ABdhPJyjXg6Tl4Trqy/ovTHZ7agsZDG2QZ23n+CG2Df9YrHRxk8WNFN4fKgw/J0SX04nl9fKvZEDwg==
X-Received: by 2002:aa7:9297:: with SMTP id j23mr36511pfa.15.1589907263910;
        Tue, 19 May 2020 09:54:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id go14sm111069pjb.42.2020.05.19.09.54.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 09:54:23 -0700 (PDT)
Date:   Tue, 19 May 2020 09:54:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     ira.weiny@intel.com
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org,
        Christian Koenig <christian.koenig@amd.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200519165422.GA5838@roeck-us.net>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518184843.3029640-1-ira.weiny@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> enables when vaddr is not in the fixmap.
> 
> Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

microblazeel works with this patch, as do the nosmp sparc32 boot tests,
but sparc32 boot tests with SMP enabled still fail with lots of messages
such as:

BUG: Bad page state in process swapper/0  pfn:006a1
page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
flags: 0x0()
raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
page dumped because: nonzero mapcount
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
[f00e7ab8 :
bad_page+0xa8/0x108 ]
[f00e8b54 :
free_pcppages_bulk+0x154/0x52c ]
[f00ea024 :
free_unref_page+0x54/0x6c ]
[f00ed864 :
free_reserved_area+0x58/0xec ]
[f0527104 :
kernel_init+0x14/0x110 ]
[f000b77c :
ret_from_kernel_thread+0xc/0x38 ]
[00000000 :
0x0 ]

Code path leading to that message is different but always the same
from free_unref_page().

Still testing ppc images.

Guenter
