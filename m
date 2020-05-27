Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2F21E4FAD
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 22:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgE0Uzj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 16:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbgE0Uzi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 16:55:38 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BCAC03E97D
        for <linux-mips@vger.kernel.org>; Wed, 27 May 2020 13:55:38 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id c3so687166otr.12
        for <linux-mips@vger.kernel.org>; Wed, 27 May 2020 13:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=CR9dwsvfsyVy6G6eufz7hLC4jiMaO3cWV54dCy7eHCU=;
        b=tnKZJrMIcf0/z4kaB+rJl3FXPTJHht//RCQa4J59uzyChfalXhlpPFz5E0fYsdyFFE
         ZJvl5QVLp1xf7s4kzKZpAW5feSDjc2nAFIp4uAutc73kgMQqJ7Qf4gVH0kuM6JXaf4rr
         Cc5K/SBc3R3k210aYcI++2fWr6jGHExFKnZYm/oJqnBwanurHfAFGaTRti3RuuUw2v1a
         KjoFcUj5mweabEKNICEPUCPMZzsVLMma4k1+nxXVAD/X/3p/r9fScN26LuA3aBf30jkv
         WRC8LDsOwmZKb7/sIxW3Qk/N0n3lIJT5LPbRwMNKnRAl8DuZN85iuQMQXMRdU6NhSJ2A
         ONMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=CR9dwsvfsyVy6G6eufz7hLC4jiMaO3cWV54dCy7eHCU=;
        b=rKFJ170l5uC+gqoVLcaXgGpGCqocc3Z3tUZKlexqiW03VzRq6mA4/tvV5hvghCqxTF
         gcfrWlki5fEoHTXzXlPQa9tPmCXvfjsUltH95NG6oDWIzGOW6ubuBVRJ5JF1ACoscQSK
         wCa5ypvVlQHSBXxwHUd1spLc5aK8r8VYzv/UsmeW46FVDioJBQ7be8QkRFUAyn8UWq2u
         ZUrpNFupSnIly0WjRrtcF0+gTy0OfG5/1Wel7sXVJRxm/nN0nGV6Fl5b1ws7n3YMwMgF
         R5mSsxXaRTRuMHk36pyN2033AOmV/ZMO8/GSxrFH+bXjUoFtVwCRlA3aaRBOaUQLuR/I
         OFaw==
X-Gm-Message-State: AOAM531H7QMrR6002ttDXI0JkjPXsXBbKi/xyV4tgu2Fu1LMOH0qo7qN
        tsDwaIvMn8c32EYuzJUSfp4RBg==
X-Google-Smtp-Source: ABdhPJxe3WPDsF/Ss6eKC+aL78ToDj1r+IEd2rMAwohSMI+2b4yzHLOnjhl8EBq8paJZUxhB9cJ54g==
X-Received: by 2002:a05:6830:18a:: with SMTP id q10mr6226851ota.25.1590612937438;
        Wed, 27 May 2020 13:55:37 -0700 (PDT)
Received: from eggly.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id g22sm1150339ooh.36.2020.05.27.13.55.34
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 27 May 2020 13:55:36 -0700 (PDT)
Date:   Wed, 27 May 2020 13:55:18 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To:     maobibo <maobibo@loongson.cn>
cc:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 3/3] mm/memory.c: Add memory read privilege before
 filling PTE entry
In-Reply-To: <d1646320-51ec-4b5f-bcad-41eba85b78cf@loongson.cn>
Message-ID: <alpine.LSU.2.11.2005271329050.6217@eggly.anvils>
References: <1589778529-25627-1-git-send-email-maobibo@loongson.cn> <1589778529-25627-3-git-send-email-maobibo@loongson.cn> <20200518135747.d8837ba6742b2d193e14fbb0@linux-foundation.org> <d1646320-51ec-4b5f-bcad-41eba85b78cf@loongson.cn>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 19 May 2020, maobibo wrote:
> On 05/19/2020 04:57 AM, Andrew Morton wrote:
> > On Mon, 18 May 2020 13:08:49 +0800 Bibo Mao <maobibo@loongson.cn> wrote:
> > 
> >> On mips platform, hw PTE entry valid bit is set in pte_mkyoung
> >> function, it is used to set physical page with readable privilege.
> > 
> > pte_mkyoung() seems to be a strange place to set the pte's valid bit. 
> > Why is it done there?  Can it be done within mips's mk_pte()?
> On MIPS system hardware cannot set PAGE_ACCESS bit when accessing the page,
> software sets PAGE_ACCESS software bit and PAGE_VALID hw bit together during page
> fault stage.
> 
> If mk_pte is called in page fault flow, it is ok to set both bits. If it is not 
> called in page fault, PAGE_ACCESS is set however there is no actual memory accessing.

Sorry for joining in so late, but would you please explain that some more:
preferably in the final commit message, if not here.

I still don't understand why this is not done in the same way as on other
architectures - those that care (I just checked x86, powerpc, arm, arm64,
but not all of them) make sure that all the bits they want are there in
mm/mmap.c's protection_map[16], which then feeds into vma->vm_page_prot,
and so into mk_pte() as Andrew indicated.

And I can see that arch/mips/mm/cache.c has a setup_protection_map()
to do that: why does it not set the additional bits that you want?
including the valid bit and the accessed (young) bit, as others do.
Are you saying that there are circumstances in which it is wrong
for mk_pte() to set the additional bits?

I'm afraid that generic mm developers will have no clue as to whether
or not to add a pte_sw_mkyoung() after a mk_pte(); and generic source
will be the cleaner if it turns out not to be needed (but thank you
for making sure that it does nothing on the other architectures).

Hugh
