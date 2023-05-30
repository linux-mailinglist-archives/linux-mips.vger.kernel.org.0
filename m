Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62312716B2D
	for <lists+linux-mips@lfdr.de>; Tue, 30 May 2023 19:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbjE3Rc1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 May 2023 13:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbjE3RcZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 May 2023 13:32:25 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5A810A
        for <linux-mips@vger.kernel.org>; Tue, 30 May 2023 10:31:52 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-53f2128ab1bso2602599a12.1
        for <linux-mips@vger.kernel.org>; Tue, 30 May 2023 10:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685467912; x=1688059912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5dIo9ozu/tftAp1UmpoAUrczqs99lWKXi5qA1UpHNYE=;
        b=fcMt7E9oftWvnXylT0q0LSi2ovxYU6GROaZO/YpP+hWVROA5CGkN858ssUM/OEUsq+
         cy2yKP5XxthrBWOhhRWmnMfaInbcFln+rmGuOYxtdLasZqdrf9i2ZKdgt/TEdCrBBjG7
         ZT9ootqRsxe/NChBz/85WsRSsuU1KSVsGHKC2qIH/mmVq1mmccPpcHFqUeIQGRkih0S3
         aGvDJJEkz3g8ZQ99QNMUDAP/dYZioxFkRygbUSwiPYm9+GJu5Jyv2dh2A01JO3qxQH41
         6ykaek6RLxvtQMhW8/hOelD76pSAAtY75YP51exJDFZC+VMuMAXLJkFisg7dDXEPnO0i
         fv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467912; x=1688059912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dIo9ozu/tftAp1UmpoAUrczqs99lWKXi5qA1UpHNYE=;
        b=djwSayOD66ZCa6HjvYM9griD5jK5QKh99ZX580bhaljp6ndnkHvjesW8YMfJH8n/zX
         K8J37Hqlfz4M4ENWCpWRheTxa3csjHqjWATKZ/WZuXUcMtIvyFz67KG2bGZm8apHSR++
         O6Vn1Xib+NW7tWk00HGSu7vIw8TqrVHABQnV+FFOB7pY/KK0YqUNMt1dzOI8r6uysQKP
         J3URzRyppsRKqxKisxQiYzhhK6BT8b+1Lv6gJByfhvRQi1yFNC3xX3zDMpRzKvcnBEe/
         Q1+x0uk5Gb7mZxsGKOx+sBYA2XPvOEOZ20VByVsNHR9LYu+4vm0rqv2Era1reydLzWkp
         sgOQ==
X-Gm-Message-State: AC+VfDy9faw9TmpgAuGJvEw9XwQyTGOdT7k3/fppO8XDNTilUreQxinL
        LvUWXdYfSyFj9aB/xA1w8sjKDramdB0=
X-Google-Smtp-Source: ACHHUZ5mA8belaIiWlXNNvjxlntxz+3HEXuwwih113OoUIVv+U+qOnHhtSEzZI4lNu6RqPJOqokzHLfKYhE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:510:0:b0:52c:9996:c1f8 with SMTP id
 16-20020a630510000000b0052c9996c1f8mr555070pgf.10.1685467911952; Tue, 30 May
 2023 10:31:51 -0700 (PDT)
Date:   Tue, 30 May 2023 10:31:50 -0700
In-Reply-To: <20230530170210.ujkv737uyjfvdoay@box.shutemov.name>
Mime-Version: 1.0
References: <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx> <87cz2ija1e.ffs@tglx> <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name>
 <87wn0pizbl.ffs@tglx> <20230530170210.ujkv737uyjfvdoay@box.shutemov.name>
Message-ID: <ZHYzBrLfT6DIKBw4@google.com>
Subject: Re: [patch] x86/smpboot: Disable parallel bootup if cc_vendor != NONE
From:   Sean Christopherson <seanjc@google.com>
To:     "Kirill A. Shutemov" <kirill@shutemov.name>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
        David Woodhouse <dwmw2@infradead.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Brian Gerst <brgerst@gmail.com>,
        Arjan van de Veen <arjan@linux.intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Paul McKenney <paulmck@kernel.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>,
        Usama Arif <usama.arif@bytedance.com>,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Sabin Rapan <sabrapan@amazon.com>,
        "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
        Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 30, 2023, Kirill A. Shutemov wrote:
> On Tue, May 30, 2023 at 06:00:46PM +0200, Thomas Gleixner wrote:
> > On Tue, May 30 2023 at 15:29, Kirill A. Shutemov wrote:
> > > On Tue, May 30, 2023 at 02:09:17PM +0200, Thomas Gleixner wrote:
> > >> The decision to allow parallel bringup of secondary CPUs checks
> > >> CC_ATTR_GUEST_STATE_ENCRYPT to detect encrypted guests. Those cannot use
> > >> parallel bootup because accessing the local APIC is intercepted and raises
> > >> a #VC or #VE, which cannot be handled at that point.
> > >> 
> > >> The check works correctly, but only for AMD encrypted guests. TDX does not
> > >> set that flag.
> > >> 
> > >> Check for cc_vendor != CC_VENDOR_NONE instead. That might be overbroad, but
> > >> definitely works for both AMD and Intel.
> > >
> > > It boots fine with TDX, but I think it is wrong. cc_get_vendor() will
> > > report CC_VENDOR_AMD even on bare metal if SME is enabled. I don't think
> > > we want it.
> > 
> > Right. Did not think about that.
> > 
> > But the same way is CC_ATTR_GUEST_MEM_ENCRYPT overbroad for AMD. Only
> > SEV-ES traps RDMSR if I'm understandig that maze correctly.
> 
> I don't know difference between SEV flavours that well.
> 
> I see there's that on SEV-SNP access to x2APIC MSR range (MSR 0x800-0x8FF)
> is intercepted regardless if MSR_AMD64_SNP_ALT_INJ feature is present. But
> I'm not sure what the state on SEV or SEV-ES.

With SEV-ES, if the hypervisor intercepts an MSR access, the VM-Exit is instead
morphed to a #VC (except for EFER).  The guest needs to do an explicit VMGEXIT
(i.e. a hypercall) to explicitly request MSR emulation (this *can* be done in the
#VC handler, but the guest can also do VMGEXIT directly, e.g. in lieu of a RDMSR).

With regular SEV, VM-Exits aren't reflected into the guest.  Register state isn't
encrypted so the hypervisor can emulate MSR accesses (and other instructions)
without needing an explicit hypercall from the guest.
