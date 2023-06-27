Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8255B7404F4
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jun 2023 22:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbjF0U0B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Jun 2023 16:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbjF0UZ7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Jun 2023 16:25:59 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 960F12691
        for <linux-mips@vger.kernel.org>; Tue, 27 Jun 2023 13:25:56 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a337ddff16so598115b6e.0
        for <linux-mips@vger.kernel.org>; Tue, 27 Jun 2023 13:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687897556; x=1690489556;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LZAV5n644nbF2fspex915RKKOQRg7bETsj2bpveqEMY=;
        b=xNz2k+2fBy79SBSN7O3Nv7cLANq5HCaENIBFu+yQEGe96a1YOHtJEoPaKnyife8HRe
         5dU95/2GVD5K+lpOCTP593eJsZJwf/2wZp9yo1OQfO/oNZwywWrdmA09H1o2gjeFBMGa
         2z17oC13XR4C8ajUueC5PeNsuXdi61YrDmFXBoVZVdvnVAtqQrU5JobTasqjeN7xrIeJ
         MpmBPZJhwD6ptkxugjRgmTxswvpeogN6O0bHDNZg4lSF5UmKAFt+JTRw6jFkbjRuUe/7
         Do+RKbNuWG1nZ+QFgPFa8R4odd5nhFz3t0Eq/rbGXPI4aHvGzMWePtxiLYZ9tzwtN2+N
         73Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687897556; x=1690489556;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZAV5n644nbF2fspex915RKKOQRg7bETsj2bpveqEMY=;
        b=D6Lp0QQjsWIbfwFm8CT/Lv504ERFC0hy1que0mQNry/BgkNs/yBfs2KDypbw1bXbQP
         rPz3f9Y8MAqIryWbMv7MKtSEKLrhgyZeLVPQy1xfPSjzrcPZkTDSlWNQjmsCkwzQMzI6
         UdrCfleNMOBXcdELXkhoe4o65itetHrXWt2INXC0V2vwwjPcjkogM0+8SW4DNMqlIK8G
         9BX3pWO2I/u9827qntYOt+T7qLtgGcUVPbhEQKeGO+Ky5XxPIcWhwR6gtB4RQz8O3pqZ
         pQbu7j7uYDS26rdIEEr5ka5E7LQ4gBPv84D6ZPYbj/bpYtfN3LJvjeqXwcaXi8vBRUwl
         0zGw==
X-Gm-Message-State: AC+VfDwqoRzNlQ1siBuxzdZgImMA2dxyy1kbJHhNFZrIetT3IQij+M7o
        koNC8rtlX8w+GbByAMuM1glizg==
X-Google-Smtp-Source: ACHHUZ4XO8G5i/7kBsDqN0SkVyZDmn1Y3+y5XriSrT6/YkoTOhARrZtNyfUTkKT2V2obJFMfnoberA==
X-Received: by 2002:a05:6808:1a8d:b0:39e:ff3d:af9d with SMTP id bm13-20020a0568081a8d00b0039eff3daf9dmr24552508oib.46.1687897555783;
        Tue, 27 Jun 2023 13:25:55 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id p79-20020a0de652000000b00573a2a0808esm2002459ywe.77.2023.06.27.13.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 13:25:55 -0700 (PDT)
Date:   Tue, 27 Jun 2023 13:25:52 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Matthew Wilcox <willy@infradead.org>
cc:     Hugh Dickins <hughd@google.com>,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        David Hildenbrand <david@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "David S. Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v6 00/33] Split ptdesc from struct page
In-Reply-To: <ZJsG3oMF+FaH0iMw@casper.infradead.org>
Message-ID: <8f1f3dd-50a-3726-87f2-b66d35804ba7@google.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com> <e8992eee-4140-427e-bacb-9449f346318@google.com> <ZJsG3oMF+FaH0iMw@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 27 Jun 2023, Matthew Wilcox wrote:
> On Mon, Jun 26, 2023 at 09:44:08PM -0700, Hugh Dickins wrote:
> > On Mon, 26 Jun 2023, Vishal Moola (Oracle) wrote:
> > 
> > > The MM subsystem is trying to shrink struct page. This patchset
> > > introduces a memory descriptor for page table tracking - struct ptdesc.
> > ...
> > >  39 files changed, 686 insertions(+), 455 deletions(-)
> > 
> > I don't see the point of this patchset: to me it is just obfuscation of
> > the present-day tight relationship between page table and struct page.
> > 
> > Matthew already explained:
> > 
> > > The intent is to get ptdescs to be dynamically allocated at some point
> > > in the ~2-3 years out future when we have finished the folio project ...
> > 
> > So in a kindly mood, I'd say that this patchset is ahead of its time.
> > But I can certainly adapt to it, if everyone else sees some point to it.
> 
> If you think this patchset is ahead of its time, we can certainly put
> it on hold.  We're certainly prepared to redo it to be merged after your
> current patch series.

Thank you, but I can adapt.  That was not my point:
I'm claiming this patchset is ~2-3 years ahead of its time.

> 
> I think you can see the advantage of the destination, so I don't think
> you're against that.

Maybe - I have some scepticism, but I'll be happy for that to be dissolved.

> Are you opposed to the sequencing of the work to
> get us there?  I'd be happy to discuss another way to do it.

Yes, I'm opposed to churn for no benefit.

> 
> For example, we could dynamically allocate ptdescs right now.  We'd get
> the benefit of having an arbitrary amount of space in the ptdesc,
> although not the benefit of a smaller memmap until everything else is
> also dynamically allocated.

That sounded much better, at first: churn serving good purpose.  But now
I suspect you're offering to dynamically allocate a ptdesc, in addition
to the struct page of the page table(s) itself, which will be wasted:
more memory consumption to no advantage.  If that's so, no thanks.

Hugh
