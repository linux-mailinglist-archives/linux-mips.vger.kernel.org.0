Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF8D1D7DF8
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 18:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbgERQLf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 12:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbgERQLe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 12:11:34 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B53DC061A0C;
        Mon, 18 May 2020 09:11:34 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t7so4430011plr.0;
        Mon, 18 May 2020 09:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PZweTdyCTeKAMxoHO6mO1oUT3tSSWyHLqvLyIKGeBVY=;
        b=GET0otAdKNcL69ksN3IiyWVrfDMA5oTmg2ORXQXg1dxMLmeJHGcqKUPueDZ892Waqk
         LiahGzxVvAOb6eviKgbVMqpqH2xTB2Jmjekr265F2YTq8WGVTbTdHDJqMl0wXrOFGznR
         /ndT2roEGwCQ/iQPRVIOevzp+C4dHL7DUiGmL/Du2l5bOwMSnizD6OXLURl/+Bmh0CrV
         cSMqAO24vnPf3FXPRoGy9nntgG7zwj7eHXcOGf/gUHHXIQkUmuqSD2TACIHoLCzpICsI
         E//FSD44Fk7xhaRAKeOGCz7JAFGzEWqiq8lgebRBy1KrqTyGOmYukDswhUiC3e2tvmjo
         Hr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PZweTdyCTeKAMxoHO6mO1oUT3tSSWyHLqvLyIKGeBVY=;
        b=iglhkoupjheawNSQDkHvm47CwK5a+ZAwQ2F7Jj21oE5+ZCXKWkNsdkVs9U22TkbaLK
         oFbajjkp+Zvg/kiGd2UnsdHc+sOWDeBFiI1T++u3V8c0piPlirzV6T8XR3wbbsuW9pz8
         5RsQoxW0KAQOek4QIx8ns7MKWFjnk/4petFgxO6jDyoVwuUC/BsgKPDufa0l9+65s1S0
         7v1cq/p2qbLh3D1LBgQ4cUu2+0sEqMNjkXEn397GDgo8giZ7d+RWvkpyYp3mwoy1ISXg
         NYrJvQlG57qIQWRWW2pDv9VFFZNe0aB5BdIkhte+bxs8qGk0UIoV+LVKiz1jDLwnaXec
         RW3A==
X-Gm-Message-State: AOAM530xsxZs1RWCnnjKvDCPWogtle65rGFC0NPVF2vkfk9alq0j1/Hh
        DXkNZtrjmuJWp3U6nMweR6o=
X-Google-Smtp-Source: ABdhPJyiyoD11kFujK6YPCyAvn3cJt1s0JbqDvxe/z4TQ6/BdwXltCUrMAiNJwcIIoiI8qiWwb2Mbg==
X-Received: by 2002:a17:902:228:: with SMTP id 37mr17432610plc.105.1589818294182;
        Mon, 18 May 2020 09:11:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k3sm13299pjc.38.2020.05.18.09.11.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 09:11:33 -0700 (PDT)
Date:   Mon, 18 May 2020 09:11:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
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
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH V3 07/15] arch/kunmap_atomic: Consolidate duplicate code
Message-ID: <20200518161132.GB66689@roeck-us.net>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200516223306.GA161252@roeck-us.net>
 <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 17, 2020 at 08:49:39PM -0700, Ira Weiny wrote:

[ ... ]

> > 
> > ---
> > # bad: [bdecf38f228bcca73b31ada98b5b7ba1215eb9c9] Add linux-next specific files for 20200515
> > # good: [2ef96a5bb12be62ef75b5828c0aab838ebb29cb8] Linux 5.7-rc5
> > git bisect start 'HEAD' 'v5.7-rc5'
> > # good: [3674d7aa7a8e61d993886c2fb7c896c5ef85e988] Merge remote-tracking branch 'crypto/master'
> > git bisect good 3674d7aa7a8e61d993886c2fb7c896c5ef85e988
> > # good: [87f6f21783522e6d62127cf33ae5e95f50874beb] Merge remote-tracking branch 'spi/for-next'
> > git bisect good 87f6f21783522e6d62127cf33ae5e95f50874beb
> > # good: [5c428e8277d5d97c85126387d4e00aa5adde4400] Merge remote-tracking branch 'staging/staging-next'
> > git bisect good 5c428e8277d5d97c85126387d4e00aa5adde4400
> > # good: [f68de67ed934e7bdef4799fd7777c86f33f14982] Merge remote-tracking branch 'hyperv/hyperv-next'
> > git bisect good f68de67ed934e7bdef4799fd7777c86f33f14982
> > # bad: [54acd2dc52b069da59639eea0d0c92726f32fb01] mm/memblock: fix a typo in comment "implict"->"implicit"
> > git bisect bad 54acd2dc52b069da59639eea0d0c92726f32fb01
> > # good: [784a17aa58a529b84f7cc50f351ed4acf3bd11f3] mm: remove the pgprot argument to __vmalloc
> > git bisect good 784a17aa58a529b84f7cc50f351ed4acf3bd11f3
> > # good: [6cd8137ff37e9a37aee2d2a8889c8beb8eab192f] khugepaged: replace the usage of system(3) in the test
> > git bisect good 6cd8137ff37e9a37aee2d2a8889c8beb8eab192f
> > # bad: [6987da379826ed01b8a1cf046b67cc8cc10117cc] sparc: remove unnecessary includes
> > git bisect bad 6987da379826ed01b8a1cf046b67cc8cc10117cc
> > # good: [bc17b545388f64c09e83e367898e28f60277c584] mm/hugetlb: define a generic fallback for is_hugepage_only_range()
> > git bisect good bc17b545388f64c09e83e367898e28f60277c584
> > # bad: [9b5aa5b43f957f03a1f4a9aff5f7924e2ebbc011] arch-kmap_atomic-consolidate-duplicate-code-checkpatch-fixes
> > git bisect bad 9b5aa5b43f957f03a1f4a9aff5f7924e2ebbc011
> > # good: [0941a38ff0790c1004270f952067a5918a4ba32d] arch/kmap: remove redundant arch specific kmaps
> > git bisect good 0941a38ff0790c1004270f952067a5918a4ba32d
> > # good: [56e635a64c2cbfa815c851af10e0f811e809977b] arch-kunmap-remove-duplicate-kunmap-implementations-fix
> > git bisect good 56e635a64c2cbfa815c851af10e0f811e809977b
> > # bad: [60f96b2233c790d4f1c49317643051f1670bcb29] arch/kmap_atomic: consolidate duplicate code
> > git bisect bad 60f96b2233c790d4f1c49317643051f1670bcb29
> > # good: [7b3708dc3bf72a647243064fe7ddf9a76248ddfd] {x86,powerpc,microblaze}/kmap: move preempt disable
> > git bisect good 7b3708dc3bf72a647243064fe7ddf9a76248ddfd
> > # first bad commit: [60f96b2233c790d4f1c49317643051f1670bcb29] arch/kmap_atomic: consolidate duplicate code
> 
> I'm confused by this.  This points to an earlier commit being bad?
> 

Yes, you are correct. I was looking up the wrong commit; it had a similar
subject line. Sorry for the confusion.

Guenter
