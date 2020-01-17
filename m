Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20BA11402F6
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2020 05:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729610AbgAQEVX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 23:21:23 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:45151 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729165AbgAQEVX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 23:21:23 -0500
Received: by mail-il1-f193.google.com with SMTP id p8so20201344iln.12
        for <linux-mips@vger.kernel.org>; Thu, 16 Jan 2020 20:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qfpdnB0mDY3WUkUnXeznDzcUOnDJRLF4NNorY2l78Ps=;
        b=ZqPtCjnTL5BpE5R5EYfpzHPeea5Qp7vGjfHVQtwYh6GS2G1E6qCQktHCtcgcj750RB
         KbbeLBevioO95S1auUbZ5BvudJZBXmK4sZWDFvDOzsSReMywkA736vs8L2yTMRHJL3WU
         YtEnCvSIJYSnrMDfuobFoVMMr2wwZ08zgjuVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qfpdnB0mDY3WUkUnXeznDzcUOnDJRLF4NNorY2l78Ps=;
        b=S60/Sc30sOkELQ1KPPbaMIz8b6DaT3DOgkeVQViVqseHHxjq4mTpXPTLjd63yqegXC
         8upm/dvPjJeI+k7Q/gTTZlyQMDROcq/ci7hpTFNxgi5MzJ4MaznJg+1yrgwjbXh+Dcfu
         p6KuPRRWl49nWH1AbZswvbuINUmvHBriMtyZi1EF1l+FBbjY3VfEviml5pGkWFt8tq2z
         ZxRRR7zqSv2zPcy9NIYTlLp3sDI2/S2poP0/43xtqdtImXfNRNuGgYJWnGWfNHzvSJiA
         aM4A8tfkLDFyDgILzQVsSFmL589ShT3b+4IQz/w2OxIlfEPrJof5Tom853fbLW7Frc46
         ct6w==
X-Gm-Message-State: APjAAAXwsWSsnNROKvxoMKbLu+icLzBCd686BH9Ds2lfd1OJjwJnkL63
        hlKTy6emJnQun7APU0fmQWhj5zLIghkRDBBiEbTDqw==
X-Google-Smtp-Source: APXvYqx+51arEmX8KrYJLorNsz5cqX3rSL1q9+0np0e9Hh5Vavh2uliQ4xTj4S5fGKDgZ5Qi5GtPwcY6HIB8S7Zf6a8=
X-Received: by 2002:a92:5c8f:: with SMTP id d15mr1631366ilg.102.1579234882781;
 Thu, 16 Jan 2020 20:21:22 -0800 (PST)
MIME-Version: 1.0
References: <20200114110620.164861-1-hsinyi@chromium.org> <a701522f-73aa-2277-4a25-f84a27f38118@landley.net>
In-Reply-To: <a701522f-73aa-2277-4a25-f84a27f38118@landley.net>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Fri, 17 Jan 2020 12:20:56 +0800
Message-ID: <CAJMQK-iH7FPgj2cNZr==Szd8bnRyHC7=GzQt6-zsFq3eCdWJ1Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v4] reboot: support offline CPUs before reboot
To:     Rob Landley <rob@landley.net>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Pavankumar Kondeti <pkondeti@codeaurora.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Aaro Koskinen <aaro.koskinen@nokia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        James Morse <james.morse@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Guenter Roeck <groeck@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 17, 2020 at 12:16 PM Rob Landley <rob@landley.net> wrote:
>
> On 1/14/20 5:06 AM, Hsin-Yi Wang wrote:
> > This patch adds a config ARCH_OFFLINE_CPUS_ON_REBOOT, which would offline cpus in
> > migrate_to_reboot_cpu(). If non reboot cpus are all offlined here, the loop for
> > checking online cpus would be an empty loop. If architecture don't enable this
> > config, or some cpus somehow fails to offline, it would fallback to ipi
> > function.
>
> I'm curious:
>
> > +# Select to do a full offline on secondary CPUs before reboot.
> > +config ARCH_OFFLINE_CPUS_ON_REBOOT
> > +     bool "Support for offline CPUs before reboot"
> > +     depends on HOTPLUG_CPU
>
> The new symbol can't be selected without the other symbol.
>
> > +     select ARCH_OFFLINE_CPUS_ON_REBOOT if HOTPLUG_CPU
>
> And the other symbol automatically selects the new one.
>
> Why are you adding a second symbol that means the same thing as the existing symbol?
>

I should make the arch selecting this symbol in other patches and let
the arch decides if they want to opt in, as Thomas pointed out in v5:
https://lore.kernel.org/lkml/8736cgxmxi.fsf@nanos.tec.linutronix.de/

Current solution is not sufficient since it only solve problems for
system that enables HOTPLUG_CPU.

> > +#if defined(CONFIG_PM_SLEEP_SMP) || defined(CONFIG_ARCH_OFFLINE_CPUS_ON_REBOOT)
> > +extern int freeze_secondary_cpus(int primary, bool reboot);
> > +#endif
>
> Couldn't that just test HOTPLUG_CPU? What's the second symbol for? (You can have
> empty stub functions when architectures don't support a thing...)
>
> Rob
