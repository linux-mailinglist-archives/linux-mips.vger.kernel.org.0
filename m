Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A56015616A
	for <lists+linux-mips@lfdr.de>; Sat,  8 Feb 2020 00:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgBGXAa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Feb 2020 18:00:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46380 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727243AbgBGXAa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Feb 2020 18:00:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581116429;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Mg3ZsC4pgFdFBM7wdlAk9wteMT5/edAs8oS1GJ/WtPQ=;
        b=Px9/Dybu8CRw7hOLsAMfmhNI6t/iyrgxV1/R5XrWFp7MJjBUjXGVISm1mPxa0wCnp6lBq7
        1xFdvVRBxfidT8tlW/or7TtBHA7OtzL0nPw0j5QXY+fzAhSLYt6ReEBh6EAfbe3iI4ezax
        G6sNodKPCXZyXehQ0AdWSjgJ3Qc3SNs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-DVL5ru_1Olagzzow8vJ3bw-1; Fri, 07 Feb 2020 18:00:21 -0500
X-MC-Unique: DVL5ru_1Olagzzow8vJ3bw-1
Received: by mail-qt1-f200.google.com with SMTP id m8so552732qta.20
        for <linux-mips@vger.kernel.org>; Fri, 07 Feb 2020 15:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Mg3ZsC4pgFdFBM7wdlAk9wteMT5/edAs8oS1GJ/WtPQ=;
        b=SxV30k5tQT1Kb0JYG36eDvrjqVRFaZT942+iQeNy0wezU5fZ24LVcK7tahfutjCQ49
         tulLrdB7OAYWPHe2WdKQhoQMJQEz8RZ8+hPSp6F5WxHorW+BeVm7/6w/OBREI6tpR8g6
         n+G7ZDgsdl6j0GgH8dvT95uYH17QVABWr1Gv3mwhl6GDRSlUvSQ3BldZM+PdpwzipvVK
         WvmoerpQAAb0tqmItKV1uVL8rSyxwAEghzQFIQPm31JfXCWqKyBBdE/h1tZzBG5u3C30
         uux2bZsaDdkPS1XSrGxOglUBuMkf0HJ57+TB7xK7j6Ezi8xzlWUwZLBTbNrC2KEQtZ4k
         Lp9Q==
X-Gm-Message-State: APjAAAUWiDy9bP8MW2XEl9VgxvkjNWVTH56v5TeVrXhistoqQr6vuwEa
        IHs0EgbcAvwsNb7FUAFVieRFACFC6HCtlRO/CgOc/9azKSRoXv3/7SUUjKzi+QpaD0kerACE5s7
        LkmNI94Rbnuag0AO98sm5Ww==
X-Received: by 2002:a05:620a:4e:: with SMTP id t14mr1267816qkt.396.1581116420705;
        Fri, 07 Feb 2020 15:00:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqzuF1LLIxUFKrrOHlnN6saW0tHnTBvZDP+QG2258sOq7kKKURMnwYV9pi8GIsHumI9LY+ZCrQ==
X-Received: by 2002:a05:620a:4e:: with SMTP id t14mr1267793qkt.396.1581116420453;
        Fri, 07 Feb 2020 15:00:20 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id g201sm709092qke.110.2020.02.07.15.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 15:00:19 -0800 (PST)
Date:   Fri, 7 Feb 2020 18:00:15 -0500
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        linux-mips@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC 0/4] KVM: MIPS: Provide arch-specific
 kvm_flush_remote_tlbs()
Message-ID: <20200207230015.GI720553@xz-x1>
References: <20200207223520.735523-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200207223520.735523-1-peterx@redhat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Feb 07, 2020 at 05:35:16PM -0500, Peter Xu wrote:
> [This series is RFC because I don't have MIPS to compile and test]
> 
> kvm_flush_remote_tlbs() can be arch-specific, by either:
> 
> - Completely replace kvm_flush_remote_tlbs(), like ARM, who is the
>   only user of CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL so far
> 
> - Doing something extra before kvm_flush_remote_tlbs(), like MIPS VZ
>   support, however still wants to have the common tlb flush to be part
>   of the process.  Could refer to kvm_vz_flush_shadow_all().  Then in
>   MIPS it's awkward to flush remote TLBs: we'll need to call the mips
>   hooks.
> 
> It's awkward to have different ways to specialize this procedure,
> especially MIPS cannot use the genenal interface which is quite a
> pity.  It's good to make it a common interface.
> 
> This patch series removes the 2nd MIPS usage above, and let it also
> use the common kvm_flush_remote_tlbs() interface.  It should be
> suggested that we always keep kvm_flush_remote_tlbs() be a common
> entrance for tlb flushing on all archs.
> 
> This idea comes from the reading of Sean's patchset on dynamic memslot
> allocation, where a new dirty log specific hook is added for flushing
> TLBs only for the MIPS code [1].  With this patchset, logically the

[1] https://lore.kernel.org/kvm/20200207194532.GK2401@linux.intel.com/T/#m2da733d75dab5e54e2ae68de94fe8411166d6274

> new hook in that patch can be dropped so we can directly use
> kvm_flush_remote_tlbs().
> 
> TODO: We can even extend another common interface for ranged TLB, but
> let's see how we think about this series first.
> 
> Any comment is welcomed, thanks.
> 
> Peter Xu (4):
>   KVM: Provide kvm_flush_remote_tlbs_common()
>   KVM: MIPS: Drop flush_shadow_memslot() callback
>   KVM: MIPS: Replace all the kvm_flush_remote_tlbs() references
>   KVM: MIPS: Define arch-specific kvm_flush_remote_tlbs()
> 
>  arch/mips/include/asm/kvm_host.h |  7 -------
>  arch/mips/kvm/Kconfig            |  1 +
>  arch/mips/kvm/mips.c             | 22 ++++++++++------------
>  arch/mips/kvm/trap_emul.c        | 15 +--------------
>  arch/mips/kvm/vz.c               | 14 ++------------
>  include/linux/kvm_host.h         |  1 +
>  virt/kvm/kvm_main.c              | 10 ++++++++--
>  7 files changed, 23 insertions(+), 47 deletions(-)
> 
> -- 
> 2.24.1
> 

-- 
Peter Xu

