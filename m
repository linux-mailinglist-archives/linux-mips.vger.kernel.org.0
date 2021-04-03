Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEDC33534F6
	for <lists+linux-mips@lfdr.de>; Sat,  3 Apr 2021 19:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236933AbhDCRnL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 3 Apr 2021 13:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236924AbhDCRnJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 3 Apr 2021 13:43:09 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64EB9C061788
        for <linux-mips@vger.kernel.org>; Sat,  3 Apr 2021 10:43:06 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 15so8675406ljj.0
        for <linux-mips@vger.kernel.org>; Sat, 03 Apr 2021 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/IBHWY9KNBBG6nCdTgxJNzHRop44ReYjl5lJIYYJHDQ=;
        b=EfS5LLvX3kU4+qQlEroXp84UFgM7EjtkSw2FfILegRS42vivBkZ7RR2MoGlv8+dRbi
         1acuh9KHT7n9AFDUVT3Q0qHd8a7twsus/RwsjzQ2PyhI54fauvY2FBUy3lzoJhSc8VYp
         G8Cju+PDs14tS1te2kd1HiHMw4cfxrb3XHTaCXx0Zpq3Xd/Pa4C5k8D7a4hCclp5vyxs
         3BQpos0LsADLfyv2xTDioRz/bsdv6Jnd/a54wdHR9p/37YCw58vQrjsm/M7Ao40eS6Ml
         Xsp3JsuzxNKH9s/jCWOQcApw1S/ksfxwA6FUq23rvEfMMgJ1VSIQTBdB8l2r2WWTrtH0
         wmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/IBHWY9KNBBG6nCdTgxJNzHRop44ReYjl5lJIYYJHDQ=;
        b=ns7ARV5+9THEOYev4VFy5ZmvJAZDfyQfVKzYceEJfxnpLJ9VrW5Jc3cMwIrFtWBk78
         Gy4UDxa7NR3tZT+SMC2WgMHi9tEAWnKziZtbYxhl4caMG/6aVfYIUKmn/zU9KMAhziJk
         O2GSaD2QQO1xFFCxbw7JooRn16QEF5uo8YZtr+iepvAfX/XAjEdJyGb/mtKQrdO6oohj
         IzYPSPJecgSyrgcY8nKdXINFbUEGpnt2CwNFCiM+Ag1IlWPYO398P49ZZYfCgEc12n2p
         Szfx2DO6BknMXCOExIf5glWy5a+9hqmV//WcxBjGHpEQjuLE2LHQVTqMaiI7/GmX2g65
         VwsA==
X-Gm-Message-State: AOAM531LLZWj4pSmpydeRIpeh3bR733xsyHb3YSAVTs48wl0/mv3pPlY
        iWaPCG0D/DISZ+VuhcuKVMSC+i0WwXF0ybmqOtk/nSX7wBFnHdAj
X-Google-Smtp-Source: ABdhPJxEjp5gonu+hQHB4Abduquvh78zo5GomYM0ev+L22zJaVtT8zAODonDrRhIx1y/0PA+aUruMV2Qf67ktMgTwEk=
X-Received: by 2002:a2e:9907:: with SMTP id v7mr11657200lji.256.1617471784580;
 Sat, 03 Apr 2021 10:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210402224359.2297157-3-jingzhangos@google.com> <202104031344.oNE1vaQq-lkp@intel.com>
In-Reply-To: <202104031344.oNE1vaQq-lkp@intel.com>
From:   Jing Zhang <jingzhangos@google.com>
Date:   Sat, 3 Apr 2021 12:42:52 -0500
Message-ID: <CAAdAUthtA8K1bpB1W4pm+Bgi10JokPi=Q_tv037qMu7+5b9N6Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] KVM: stats: Add fd-based API to read binary stats data
To:     kernel test robot <lkp@intel.com>
Cc:     KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.cs.columbia.edu>,
        LinuxMIPS <linux-mips@vger.kernel.org>,
        KVMPPC <kvm-ppc@vger.kernel.org>,
        LinuxS390 <linux-s390@vger.kernel.org>,
        Linuxkselftest <linux-kselftest@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 3, 2021 at 12:25 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Jing,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on f96be2deac9bca3ef5a2b0b66b71fcef8bad586d]
>
> url:    https://github.com/0day-ci/linux/commits/Jing-Zhang/KVM-statistics-data-fd-based-binary-interface/20210403-064555
> base:   f96be2deac9bca3ef5a2b0b66b71fcef8bad586d
> config: i386-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> cocci warnings: (new ones prefixed by >>)
> >> arch/x86/kvm/x86.c:270:36-37: WARNING: Use ARRAY_SIZE
>    arch/x86/kvm/x86.c:235:34-35: WARNING: Use ARRAY_SIZE
>
> vim +270 arch/x86/kvm/x86.c
>
>    267
>    268  struct _kvm_stats_header kvm_vcpu_stats_header = {
>    269          .name_size = KVM_STATS_NAME_LEN,
>  > 270          .count = sizeof(kvm_vcpu_stats_desc) / sizeof(struct _kvm_stats_desc),
Thanks, will do.
>    271          .desc_offset = sizeof(struct kvm_stats_header),
>    272          .data_offset = sizeof(struct kvm_stats_header) +
>    273                  sizeof(kvm_vcpu_stats_desc),
>    274  };
>    275
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
