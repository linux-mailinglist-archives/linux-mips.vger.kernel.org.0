Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C5F3A680E
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jun 2021 15:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233803AbhFNNig (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Jun 2021 09:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233421AbhFNNie (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Jun 2021 09:38:34 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC25C061574
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 06:36:16 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id bn21so20237122ljb.1
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8eDKzbSZu1SwWJ0P86Rh5OM8P2vVwoJZM4q1bflykQ8=;
        b=R0CbDztlv0la7WD/fHY4DFjQzcsop/sh/PmzKnq/2thw9f3PUT2P3wOo+csesCUKls
         LS9qMnbXlXxKgcujagKu/oXpOxYpy2dxS7IHIP6s3wQi+HK7YPP3VHeVgYnLTuvxw2W8
         e9JmgplDrf0dXO+4lR9EtTG+25VcDjXtBgPbHQRB0R7jiHpwm4cLbzR7H4GApyDAID41
         6ySSLIw03/EDfbQ30EEFVf7PeSaHBB2ZEQMx2Bk0fP2scv+TBKF3DLaDOqTLw4lzoHFa
         wNkM22Y6pJCUDfCfDdm2C57VbEIz5RbUdG+Q4N+Wr+1C67rueWN6JzUgBH8Obhx2/D3l
         bWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8eDKzbSZu1SwWJ0P86Rh5OM8P2vVwoJZM4q1bflykQ8=;
        b=hBOo7lkQr/VlB29B1jws+OnRIc6o/i6QmRH8vj7UFzCl/7tpxJWIZM66AwB03GeRou
         X0DUtdAME9KSRChAvm1Jgv9qDfkeUKdg7sf5mbXx/7GEXY1/yP5R/DxRyYt2Bpq4aO8T
         dQ2xr8VFx7M6xLxfkWrP73FY83SzREvA4lhNTUJTeIppq+P3IJ0KnleHR8NHJW9iO+Vq
         MICwDVO4GPSqC0HK7+3i4Zeo1volOU9reQyBvl7pxXJg/a+YlxjM24QJiWoSCYb7s5Yu
         apBJJQfWuH9+UYzJK1o8eNneryKaUoakumoQUxIy/+L7MEDtQDUem30Qn4pGh0k1QQ25
         oIJQ==
X-Gm-Message-State: AOAM532q3J41m8MFABs/oKACMLUOKpBmFUcmMSU7RDlc1OouF3pYmhWf
        Jn9COhdziPqgs4RWCqQnBtodJgMBrJgfOXHE5V8b76/hSss=
X-Google-Smtp-Source: ABdhPJyRerJorqPpaASqjE9boZ8l83RWNQm1Z5lsPnNwsXUo1I390oxKiUv+iF3/YpVooNiCx/RtKI8ne6I6YJoWEvk=
X-Received: by 2002:a2e:b8c9:: with SMTP id s9mr5867978ljp.216.1623677774828;
 Mon, 14 Jun 2021 06:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210614025351.365284-1-jingzhangos@google.com>
 <20210614025351.365284-3-jingzhangos@google.com> <1b57502b-116a-9be5-fa2f-1e8f5b5fce2d@redhat.com>
In-Reply-To: <1b57502b-116a-9be5-fa2f-1e8f5b5fce2d@redhat.com>
From:   Jing Zhang <jingzhangos@google.com>
Date:   Mon, 14 Jun 2021 08:36:02 -0500
Message-ID: <CAAdAUtiG6Wt52Z3sKchBKR7-7qyeux6CfR1KFEnvi6nNoCRE_Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] KVM: stats: Use binary stats descriptors for debugfs interface
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.cs.columbia.edu>,
        LinuxMIPS <linux-mips@vger.kernel.org>,
        KVMPPC <kvm-ppc@vger.kernel.org>,
        LinuxS390 <linux-s390@vger.kernel.org>,
        Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paolo,

On Mon, Jun 14, 2021 at 4:51 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 14/06/21 04:53, Jing Zhang wrote:
> > +     STATS_DESC_ICOUNTER_RONLY(VM, lpages),
> > +     STATS_DESC_ICOUNTER_RONLY(VM, nx_lpage_splits),
> >       STATS_DESC_ICOUNTER(VM, max_mmu_page_hash_collisions)
>
> I think we're now adding too many macros.
>
> max_mmu_page_hash_collisions is the only remaining instant counter that
> is not read-only.  In fact, in the statsfs prototype we made all instant
> counters read-only.
>
> You could add a third type in addition to instant and cumulative, let's
> call it "peak".  This essentially corresponds to the "max" aggregation
> function in the statsfs prototype.  Then instant counters would be read
> only, while cumulative and peak would be read-write.
>
> Paolo
>
Thanks for the suggestion. Will do that.
Jing
