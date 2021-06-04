Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C94B839AF23
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jun 2021 02:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhFDAmj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Jun 2021 20:42:39 -0400
Received: from mail-pj1-f44.google.com ([209.85.216.44]:44784 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhFDAmj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Jun 2021 20:42:39 -0400
Received: by mail-pj1-f44.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so4891769pjq.3
        for <linux-mips@vger.kernel.org>; Thu, 03 Jun 2021 17:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hsyO5EEm3dG2GUVsZApwZQUFiUjt1oJTpcTgXFZNdfs=;
        b=BlYNVPE305FbxEUMO5lSCEn5LG3JutO1Lg3tWns9s0oCrpDQwG+i6qmuM/hisKYpP+
         y5qZfeRJIC4++esHrRYMFwklEwa2AsIP8FI2G+izcydAmHDQpIvGWGtM265YiTqVep0S
         1wPk4/uTSpfKNxeIwC0sNPU2Zfv4gAByw74Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hsyO5EEm3dG2GUVsZApwZQUFiUjt1oJTpcTgXFZNdfs=;
        b=AkAdGpYEZEmgLD8djFFTiP3kmDyYgJFeAODdnd2LRTeE48k+PZ33WYjKwNhJeFfGHp
         /ZlOLi4N+09PIdmt7nNrJFDrKM2qE8i6X1e26J8S5XqHFQB3xX1VUdxRrktyLpQXuX5Q
         PIXzb07bJirQ5p+DQmZKy1umWz8I7wNZ3f8c7fWFFqreqYUuYAcDqbGDeTzEpPrgAegy
         MiGxUwQS4+Yw73QQH5OWKE4/To0pJFyi5rcknOCc5FnXZ4y/0RyQUx/WiEHI/cP1asCr
         aSjIX9oAyb/uPHRKig+4q3ZxAyKMDSm8l3c+yRYkCg4T9DmBzFske2NywQExrm3vZuw8
         QNCg==
X-Gm-Message-State: AOAM53271OfG0r9tX+zjn9j+MzpbQbNQq6UeuQwpda3crenYyPkDxAYg
        wulbK6bU+DyfToEstmz2Yr9IsA==
X-Google-Smtp-Source: ABdhPJwUR3L1tC9qXtsxtXxpLe8tNcJAE3/COLahbUTOQi2i1KnLOCdr6jBvw3P/Ytpi3HasD6ls1Q==
X-Received: by 2002:a17:90a:7345:: with SMTP id j5mr13827315pjs.64.1622767177417;
        Thu, 03 Jun 2021 17:39:37 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:36b:f5b6:c380:9ccf])
        by smtp.gmail.com with ESMTPSA id j16sm3074017pjn.55.2021.06.03.17.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 17:39:36 -0700 (PDT)
Date:   Fri, 4 Jun 2021 09:39:29 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Suleiman Souhlal <suleiman@google.com>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: Re: [RFC][PATCH] kvm: add suspend pm-notifier
Message-ID: <YLl2QeoziEVHvRAO@google.com>
References: <20210603164315.682994-1-senozhatsky@chromium.org>
 <YLkRB3qxjrXB99He@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLkRB3qxjrXB99He@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On (21/06/03 19:27), Peter Zijlstra wrote:
> On Fri, Jun 04, 2021 at 01:43:15AM +0900, Sergey Senozhatsky wrote:
[..]
> >  
> > +void kvm_arch_pm_notifier(struct kvm *kvm)
> > +{
> > +}
> > +
> >  long kvm_arch_vm_ioctl(struct file *filp,
> >  		       unsigned int ioctl, unsigned long arg)
> >  {
> 
> What looks like you wants a __weak function.

True. Thanks for the suggestion.

I thought about it, but I recalled that tglx had  __strong opinions
on __weak functions.
