Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB9839C4AD
	for <lists+linux-mips@lfdr.de>; Sat,  5 Jun 2021 02:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhFEBBE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Jun 2021 21:01:04 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:37535 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbhFEBBE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Jun 2021 21:01:04 -0400
Received: by mail-pf1-f178.google.com with SMTP id y15so8642051pfl.4
        for <linux-mips@vger.kernel.org>; Fri, 04 Jun 2021 17:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=osHu87SZoZXOMS0NS84nF9iOOHnrmeoNqfJAhUD9Nl8=;
        b=Pa2JkyxLSE1rRGXabDLfYGJX/e+p4npDVCtYeuxRukmJiFGdGIs7Vo8XKOzfnQzs/h
         pbb10ZmPwg85W0Dj/cd2W3ynNa33DRRMiaarmlMcQH7ryJSk8MkcmDQypI8DrMcWoYol
         7goaClgk0qO6BplZ0Ao8y/pEzN0c96DZijxn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=osHu87SZoZXOMS0NS84nF9iOOHnrmeoNqfJAhUD9Nl8=;
        b=n9zAJXpKBROURbNM0S2rBRkME7/40dzv45sIU0r/kZ3uunjMaQwmwuZLPcPvWHc64y
         N4QZRovi689CZF0uTvzqM7WNcKOZcfYi1nNqwYaEQidKSz37SPWBonsjfz06ZxBrkpDT
         aZr/2GIqhhsAzJ+FWtw4c2T0OVXaK1HmC0sg0vj7xoNG2J9Nk9ENRieYNTK4QsxXh+pC
         680NoBSA9v75mEcDyjgpnNUURyzPQ+8vhzJGVRApKyXtYRsz3dUu3hh6m1D3aV/FDLuc
         5kTGo76yLOToUIkfah4MesLpykWiMCPTMWniNo5l7Xqq+RRgkb65A2L+Wt5HeW/m5HLs
         cG3A==
X-Gm-Message-State: AOAM533vNh5WKvKzS0hrvdzxMSG3PShG6mEAJ2+BvPfySeHSgqK8yQBw
        eIHFbRw50cBGn3D2GPuTkxLDIQ==
X-Google-Smtp-Source: ABdhPJy+XB9KHA35L5KIcgyH8Y+GaTXYvt2kl0/zackCdS6suLdzG8cg7LKDJkfhiNoNuu0cLhDNPw==
X-Received: by 2002:a63:4145:: with SMTP id o66mr7648691pga.4.1622854697107;
        Fri, 04 Jun 2021 17:58:17 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:5981:261e:350c:bb45])
        by smtp.gmail.com with ESMTPSA id v11sm2662358pfm.143.2021.06.04.17.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 17:58:16 -0700 (PDT)
Date:   Sat, 5 Jun 2021 09:58:10 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Suleiman Souhlal <suleiman@google.com>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: Re: [RFC][PATCH] kvm: add suspend pm-notifier
Message-ID: <YLrMIugtkxePl/UZ@google.com>
References: <20210603164315.682994-1-senozhatsky@chromium.org>
 <87v96uyq2v.wl-maz@kernel.org>
 <YLnwXD5pPplTrmoZ@google.com>
 <87tumeymih.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tumeymih.wl-maz@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On (21/06/04 11:03), Marc Zyngier wrote:
[..]
> > Well on the other hand PM-callbacks are harmless on those archs, they
> > won't overload the __weak function.
> 
> I don't care much for the callbacks. But struct kvm is bloated enough,
> and I'd be happy not to have this structure embedded in it if I can
> avoid it.

Got it.

> > > How about passing the state to the notifier callback? I'd expect it to
> > > be useful to do something on resume too.
> > 
> > For different states we can have different kvm_arch functions instead.
> > kvm_arch_pm_notifier() can be renamed to kvm_arch_suspend_notifier(),
> > so that we don't need to have `switch (state)` in every arch-code. Then
> > for resume/post resume states we can have kvm_arch_resume_notifier()
> > arch functions.
> 
> I'd rather we keep an arch API that is similar to the one the rest of
> the kernel has, instead of a flurry of small helpers that need to grow
> each time someone adds a new PM state. A switch() in the arch-specific
> implementation is absolutely fine.

OK.
