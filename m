Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7479618874B
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2020 15:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbgCQOSw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Mar 2020 10:18:52 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:43350 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726189AbgCQOSw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Mar 2020 10:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584454731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nztugtnIojkJwSB0mVguQ4PbYC04wIaERChUJYf2fk0=;
        b=iM+8YV1i6ikyDY7+KYQhUOcEczyHzthqIsVka/NAA+QSEyun9xjg9X7zu3yYyl+oaKwlYO
        JBcL4r+2IiQigpIL0aZiWgaBhjL0D1l5GANrINIGr8FVmcRK8hbEXhInpyH0dqNBDgS+mO
        hwbNNZjo49ZC/cvyeEKUB4dR1xdMf3A=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-8Nn2ExC_Pqqj0P6kUa7vnA-1; Tue, 17 Mar 2020 10:18:50 -0400
X-MC-Unique: 8Nn2ExC_Pqqj0P6kUa7vnA-1
Received: by mail-qv1-f71.google.com with SMTP id m12so20818862qvp.4
        for <linux-mips@vger.kernel.org>; Tue, 17 Mar 2020 07:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nztugtnIojkJwSB0mVguQ4PbYC04wIaERChUJYf2fk0=;
        b=hBidUJqONGtua3lu7CoKNMqQpqa61ozAbAV6KRxOLgP5NJWb83c1b7ThIOIq5NDr3H
         Hl7lK4R6LSSwVzgUXMZfRi0rjHXw19FVr1KtaV7+T/0LjcBFQEmoe8IFVCCbH5w6Dlrr
         9Lop9oyQ0GMfD39yqvXLCfAnqrxeimZAarwM1fvpJ0PKcg6pG0+wWynLz11PG6UGGh3j
         1x52V5+pOgO1GBrGrbHACmpqPStliOodjjk1H/D0FamHXKetUh5ltcfUEVAHKPabY1lk
         3wJ29bcL/csjdinwnb//3MSMc3zmaJaG/PnLA/07pom0b88twJGO6BllGOsmaZ/nGsw6
         A4EQ==
X-Gm-Message-State: ANhLgQ35FNNlOgxSAee9Fp1NxeNg/OFQVYa/8toTGifSXnLz0Vt5Hy9u
        tOM7M2PyThNwylPVR9ifCNvJ0e9yhyuNXAkCp9aWiQ8m+PULNuEk0J+UUbKqsOYOjlJFQtNBI8z
        7SmLWdl9obuvRlBNd26GYSA==
X-Received: by 2002:ac8:554a:: with SMTP id o10mr5739692qtr.224.1584454729603;
        Tue, 17 Mar 2020 07:18:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvrMULxF73NFl450EaKtUxhKQ8RE2wadz6W/eiWeg/s9hhJFyS0fpSjgmsoVMmaOPvBseqjpg==
X-Received: by 2002:ac8:554a:: with SMTP id o10mr5739661qtr.224.1584454729268;
        Tue, 17 Mar 2020 07:18:49 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id q8sm1982327qkm.73.2020.03.17.07.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 07:18:48 -0700 (PDT)
Date:   Tue, 17 Mar 2020 10:18:47 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        linux-mips@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC 0/4] KVM: MIPS: Provide arch-specific
 kvm_flush_remote_tlbs()
Message-ID: <20200317141847.GB199571@xz-x1>
References: <20200207223520.735523-1-peterx@redhat.com>
 <44ba59d6-39a5-4221-1ae6-41e5a305d316@redhat.com>
 <20200311183201.GK479302@xz-x1>
 <2db8490e-e4a0-79d0-5088-a9571b01703d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2db8490e-e4a0-79d0-5088-a9571b01703d@redhat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 17, 2020 at 02:33:00PM +0100, Paolo Bonzini wrote:
> On 11/03/20 19:32, Peter Xu wrote:
> > On Wed, Feb 12, 2020 at 01:25:30PM +0100, Paolo Bonzini wrote:
> >> On 07/02/20 23:35, Peter Xu wrote:
> >>> [This series is RFC because I don't have MIPS to compile and test]
> >>>
> >>> kvm_flush_remote_tlbs() can be arch-specific, by either:
> >>>
> >>> - Completely replace kvm_flush_remote_tlbs(), like ARM, who is the
> >>>   only user of CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL so far
> >>>
> >>> - Doing something extra before kvm_flush_remote_tlbs(), like MIPS VZ
> >>>   support, however still wants to have the common tlb flush to be part
> >>>   of the process.  Could refer to kvm_vz_flush_shadow_all().  Then in
> >>>   MIPS it's awkward to flush remote TLBs: we'll need to call the mips
> >>>   hooks.
> >>>
> >>> It's awkward to have different ways to specialize this procedure,
> >>> especially MIPS cannot use the genenal interface which is quite a
> >>> pity.  It's good to make it a common interface.
> >>>
> >>> This patch series removes the 2nd MIPS usage above, and let it also
> >>> use the common kvm_flush_remote_tlbs() interface.  It should be
> >>> suggested that we always keep kvm_flush_remote_tlbs() be a common
> >>> entrance for tlb flushing on all archs.
> >>>
> >>> This idea comes from the reading of Sean's patchset on dynamic memslot
> >>> allocation, where a new dirty log specific hook is added for flushing
> >>> TLBs only for the MIPS code [1].  With this patchset, logically the
> >>> new hook in that patch can be dropped so we can directly use
> >>> kvm_flush_remote_tlbs().
> >>>
> >>> TODO: We can even extend another common interface for ranged TLB, but
> >>> let's see how we think about this series first.
> >>>
> >>> Any comment is welcomed, thanks.
> >>>
> >>> Peter Xu (4):
> >>>   KVM: Provide kvm_flush_remote_tlbs_common()
> >>>   KVM: MIPS: Drop flush_shadow_memslot() callback
> >>>   KVM: MIPS: Replace all the kvm_flush_remote_tlbs() references
> >>>   KVM: MIPS: Define arch-specific kvm_flush_remote_tlbs()
> >>>
> >>>  arch/mips/include/asm/kvm_host.h |  7 -------
> >>>  arch/mips/kvm/Kconfig            |  1 +
> >>>  arch/mips/kvm/mips.c             | 22 ++++++++++------------
> >>>  arch/mips/kvm/trap_emul.c        | 15 +--------------
> >>>  arch/mips/kvm/vz.c               | 14 ++------------
> >>>  include/linux/kvm_host.h         |  1 +
> >>>  virt/kvm/kvm_main.c              | 10 ++++++++--
> >>>  7 files changed, 23 insertions(+), 47 deletions(-)
> >>>
> >>
> >> Compile-tested and queued.
> > 
> > Just in case it fells through the crach - Paolo, do you still have
> > plan to queue this again?
> 
> Yes, I wanted to make it compile first though.  I'm undecided between
> queuing your series and killing KVM MIPS honestly.

Understood.  Yep killing that will provide the same thing too as what
the series wanted to do anyways, as we'll remove the only outlier of
kvm_flush_remote_tlbs().  Thanks,

-- 
Peter Xu

