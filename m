Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25EDE3ABE99
	for <lists+linux-mips@lfdr.de>; Fri, 18 Jun 2021 00:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbhFQWSW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Jun 2021 18:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbhFQWST (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Jun 2021 18:18:19 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A580C061574
        for <linux-mips@vger.kernel.org>; Thu, 17 Jun 2021 15:16:10 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i13so12980286lfc.7
        for <linux-mips@vger.kernel.org>; Thu, 17 Jun 2021 15:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Om4JuohRkmHi4PHjJKgFSJXAnZij6pa7PZ+XB/Q93x4=;
        b=OOJpmNp62ZqVr6/h+5AHW1TBMZyF0mEzGOtoq/r2otQshVmw6uWPHvvmIPVKxDZJ8S
         INOe1MRD5ArDkisHNAm/m/BeaB21SJGpgm0A0A3o4jnwtPPOT4BI93x+cGmvun04tUfc
         9oed64L6ruhD5G0X3ATf8KfMWJvcjZqq/9ntWbomgnwy3H+yhpsCepGn6VD/wurC/N2N
         7eTCkGorBvJvG4JgwwjnhfMl4FmZhS2UCV+rteS/vwvyVaM5uFd33dISni3uW5mwJT7O
         a4PveGpEHqaokkFSRfCPS/C0SoVok/Hk+wPlQvWnytijp/pOuCFCkw2JVIvA6GOEp8Ed
         73Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Om4JuohRkmHi4PHjJKgFSJXAnZij6pa7PZ+XB/Q93x4=;
        b=NMbWIg6U3vIxrw6khlB7LVA24HoOkmOleWx1eUFYdMXNWDsSf8Q+4+2/ACTMiCbBXA
         SycnZGWs7aJ8qrfu+k38VJI9b59201CECob7p211TMZQ5QmjiDGTpagPGVSxBvO+SqSy
         L3YEJcoN6XUzzmMlotNdYAtYGTDYN2Wi1x+pUS+lbMcML+qcDq+k1U3SbPxjvzKZ1ct2
         m3rCcFe6HBVEMfgYXI7BSz2G5x9c206c/P/Z+6VNI3CsSqz8eg3LeFnmTJeuHNtA/jqy
         b3oHYrtJYzbtyzpbhT9kf1bPafo9llQbQ1SNzQ3zqWeIpVaZ0i7Ymm+GTO4sN9G9w1lX
         ep3A==
X-Gm-Message-State: AOAM531ZXpoGjDFIF3ZI+CH/T3bPsRXqQEVb49/9Tj58IAcfFK4/dqib
        eWYkOGO6r8UG+adDig4Ypa7mnpiWcAeXbjM+OcWrwQ==
X-Google-Smtp-Source: ABdhPJxohFfvIE3vimsdKuy3pBfzuaga47QP5AbxcBntiUHpDUZF67j+bYeQSRMJ5KlBsVBRHTjWoXc8V+tBTOqYm9M=
X-Received: by 2002:a05:6512:318d:: with SMTP id i13mr403328lfe.407.1623968168586;
 Thu, 17 Jun 2021 15:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210617044146.2667540-1-jingzhangos@google.com>
 <20210617044146.2667540-4-jingzhangos@google.com> <YMrkGZzPrt0jA1iP@kroah.com>
 <CAAdAUtik0Yw+4=4Ld-DJSokNzvdpa-tsxkqAdBCAb-C=uS0-sA@mail.gmail.com>
In-Reply-To: <CAAdAUtik0Yw+4=4Ld-DJSokNzvdpa-tsxkqAdBCAb-C=uS0-sA@mail.gmail.com>
From:   Jing Zhang <jingzhangos@google.com>
Date:   Thu, 17 Jun 2021 17:15:57 -0500
Message-ID: <CAAdAUthDbVvzFMGEp5sWEZ0MrtWaJBV4F_N4ois1D+4NO3n7fg@mail.gmail.com>
Subject: Re: [PATCH v10 3/5] KVM: stats: Add documentation for binary
 statistics interface
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.cs.columbia.edu>,
        LinuxMIPS <linux-mips@vger.kernel.org>,
        KVMPPC <kvm-ppc@vger.kernel.org>,
        LinuxS390 <linux-s390@vger.kernel.org>,
        Linuxkselftest <linux-kselftest@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Peter Shier <pshier@google.com>,
        Oliver Upton <oupton@google.com>,
        David Rientjes <rientjes@google.com>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        David Matlack <dmatlack@google.com>,
        Ricardo Koller <ricarkol@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Greg,

On Thu, Jun 17, 2021 at 10:20 AM Jing Zhang <jingzhangos@google.com> wrote:
>
> Hi Greg,
>
> On Thu, Jun 17, 2021 at 12:56 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jun 17, 2021 at 04:41:44AM +0000, Jing Zhang wrote:
> > > +     struct kvm_stats_desc {
> > > +             __u32 flags;
> > > +             __s16 exponent;
> > > +             __u16 size;
> > > +             __u32 offset;
> > > +             __u32 unused;
> > > +             char name[0];
> > > +     };
> >
> > <snip>
> >
> > > +The ``unused`` fields are reserved for future support for other types of
> > > +statistics data, like log/linear histogram.
> >
> > you HAVE to set unused to 0 for now, otherwise userspace does not know
> > it is unused, right?  And then, really it is "used", so why not just say
> > that now?  It's tricky, but you have to get this right now otherwise you
> > can never use it in the future.
> >
> Sure, will do that.
> > > +The ``name`` field points to the name string of the statistics data. The name
> >
> > It is not a pointer, it is the data itself.
> >
> Will fix it.
> > > +string starts at the end of ``struct kvm_stats_desc``.
> > > +The maximum length (including trailing '\0') is indicated by ``name_size``
> > > +in ``struct kvm_stats_header``.
> >
> > I thought we were replacing [0] arrays with [], are you sure you should
> > be declaring this as [0]?  Same for all structures in this document (and
> > code).
> >
> The reason to declare it as [0] is to have the flexibility to change the maximum
> length of KVM stats name. For now, the max len is  defined as 48, which can
> be read from the header. Then the userspace can get the length of descriptor by
> adding sizeof(struct_kvm_stats_desc) + 48. Whenever the max len is changed
> in KVM, the userspace would not have to update code to reflect that.
> However, if we are OK to restrict the maximum KVM stats' length to 48
> (or any other
> number), we can just declear it with [] instead of [0].
Please ignore my above comments.
You are right. We can just replace all zero-length arrays [0] with a
flexible array
member []. Thanks.
> > thanks,
> >
> > greg k-h
>
> Thanks,
> Jing
