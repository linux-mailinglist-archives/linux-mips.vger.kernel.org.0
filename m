Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409834183C0
	for <lists+linux-mips@lfdr.de>; Sat, 25 Sep 2021 19:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhIYRr7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Sep 2021 13:47:59 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:42563 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbhIYRr7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Sep 2021 13:47:59 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N2m7O-1mrKnS16K4-0133dE; Sat, 25 Sep 2021 19:46:22 +0200
Received: by mail-wr1-f51.google.com with SMTP id t8so37583160wri.1;
        Sat, 25 Sep 2021 10:46:22 -0700 (PDT)
X-Gm-Message-State: AOAM531LitsS4VfzUFhSsR5JRLxeKSPfuukWBhVIybQI6Jwal8b2JE0q
        l/PyCNQTAdGFqzLkZnwc70PtPwLkQIvFPaoVhMY=
X-Google-Smtp-Source: ABdhPJw4AC++CUgGftyBEQQ1PqMHK2UxvHDhOv0IVrP5JJG7i4nuvnhKaRpsibhTISXsdFjvIezzm7yDZOhM7MC91sk=
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr7846290wmj.1.1632591981794;
 Sat, 25 Sep 2021 10:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210924170546.805663-1-f.fainelli@gmail.com> <20210924170546.805663-11-f.fainelli@gmail.com>
 <87sfxsua9l.wl-maz@kernel.org>
In-Reply-To: <87sfxsua9l.wl-maz@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 25 Sep 2021 19:46:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2yJwE3fbG5t41eN+N_vVzWdnDuDEi6vi32aRYX+mXX3g@mail.gmail.com>
Message-ID: <CAK8P3a2yJwE3fbG5t41eN+N_vVzWdnDuDEi6vi32aRYX+mXX3g@mail.gmail.com>
Subject: Re: [PATCH 10/11] arm64: broadcom: Removed forced select of interrupt controllers
To:     Marc Zyngier <maz@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rWH4hivfycKeWeQsl22K7IKMBeMDH7SwCpqK/AzeiSwpYSsopVz
 79satCGijFSVwWBbPjMyCxhXEAd94DMowRiPP0q09AJ/d1WjsBCU/q32QClzKdBuUpwX1w8
 Ui/NTH2geziacN1RZtsCT+n6LDXzGMsmuW2gI6Yg/3vCgalbeGvyiNKwYByfabzIfaxXCez
 DtJMlwWUAfX8lH+OIjEYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YgcIQgk0EWM=:6OmkmHeCeTvSksfKp/8jhs
 0lQb7X6tgBdRlunafpzJ6OVOt+LkkDgiWdNiRr5qtH3fQuTgCr9t1YYzIWy8MzKGUJ7V7e2pH
 S/SbroPOhwwfLq/jyCU79KszPfh7q7MHXltbz3M63DiTHSC4pM9AGj8VfAiYw+ujaZ9M7rVXC
 H1pYx8xkIpBfXx5oVGRI3+pGENwEpNMw4J+J3ohQotmKPqE9KCYqEH/ANeBHjr9xd050DEYet
 ChhUz/4h8CI/fIZserY2GDCT3/U4a/bqcQL7oNpn7NktLlBUA7PBq6JMVe9w1okVsOqc29Q3l
 gH5+vxU978bh90rDHp1MJVvg8zQ4lgp7qPNfq75Ag34SZowHr8dr2dx+c/7r8W8x/VtgtJen4
 hokoAaqRcQgM0jAoW9Zj4eda/UoCfXaEpKdCu+JxTzl6j1EXtcX/dBDTgkKqg0GSWyMI67zCb
 2GLgCA/iSDwZCM//kXPM/KgFDgYi8E2Ras3CyBAnTu65r0fz+1Pz5pNMK1H5WPR9fAM1d79gg
 dZOEB1BKvrS+pqWm9ugGhzEofqaSPUPwnPvjhxh0ts0ZQVI8P4HA9VTHdVRAUg+06xTFnV96I
 Fteso6+TDU53NIXvATt5n97UXstmEyGcIWa83/1ogM/xFQPXN/i3IKNh+xZ1ZGSKNkSiEftcN
 D4YsamW7E1Vc5CvBibPPqdyxHjzlzY4BWZ1HZbs6pJqaLgvtOS0lotoGOTNiRh4tqYmdNOoq/
 CuTkh8qrGEG9h0rQF5huCQMU1mXaNsrnniKnPaqDk40mi44jT64r3LClwcH5kZzbISSHQd7Gr
 j9EQ/8pH7MJ9eOljFOlqHovnfWuY7rLU9BASw7+OvAXZ6kEAnCgx+GLySMY76/Z6mbYpgIw7V
 087CsAHCLpVcAJb9HYzQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Sep 25, 2021 at 2:10 PM Marc Zyngier <maz@kernel.org> wrote:
> On Fri, 24 Sep 2021 18:05:45 +0100, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> How does the user know about that? People will build a kernel
> selecting their platform, and find out it doesn't work. This seems
> terribly counter-productive to me.

It's default-enabled on the platforms that need it, see one of the
earlier patches.

Having the option to make it a loadable module is a definite benefit as
far as I'm concerned, and I generally like the idea of having individually
selectable symbols for consistency as that is what we have in other
subsystems as well.

Ideally I'd do away with all the 'select' statements for the platforms and
only have them control dependencies as we do for most other subsystems.
irqchip is one of the few exceptions here, though I understand the reason
for having the most important drivers tied to the platform more closely.

       Arnd
