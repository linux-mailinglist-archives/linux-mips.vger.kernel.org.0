Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1592365597
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 11:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbhDTJjr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Apr 2021 05:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhDTJjq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Apr 2021 05:39:46 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E638CC06174A;
        Tue, 20 Apr 2021 02:39:15 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id c4so4964028ilq.9;
        Tue, 20 Apr 2021 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Jv5XlEMdRtVgenqiZFyWIe5z8G9lvh79SljGhJQ5iIM=;
        b=H1nzBXQp6OjNHpXgu51le5wMfd2pwcAFiJP0R+kp5IrQmMCiqKK2i4wp4uvNwA8mkC
         1i7NbMpztGGoUmqQoAA9rP+9NWJvSWy/SektYHoF9qYltXVWOYX/rxOmuxSVTgkV3WoW
         qkXEW67a+ypUFeFuVOeNhs33INPBiFM4NmkkvRs+O1FKTEmUg83ZGF3rlb9EpYSF4AO0
         xm/6BqFwFgd/I6pmu1iFGIkEeB5Iyli+6K4kOH4qtpju+4JkOEFbd2Agk7rUFekhIfwe
         +82a5WBdZ61OBO21WqOsNVCMi3blttOJUs3g2yu+JxkISD6FqZ5Od67qtYP3oYTaVEQn
         5h5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Jv5XlEMdRtVgenqiZFyWIe5z8G9lvh79SljGhJQ5iIM=;
        b=NvS3t6rADmP8dJQdL273tQTWaUpXvXhVp5Rj7hZGFRRRU2125R2Q0Dih9xhLga5AYb
         ykkd1rwW0LXIEk9ASg0Adr2NoyWuSDxU9ylPTLSLUvSmDW8W6xbdvk5TtU7m2/HjiiRd
         P+2hOEltNZOehNe905VpIm7vhVZA/KAnfevCLOanz74I1MfOMex3xU+SFmZyIxaB2MwA
         15Hhz1+4HHI086iBeqQTkoOQHYAcCllYZpsjkjDVaaILj6Wtawr9ujbgNpb7+4VgVDpO
         PhCFlRC0b7lOgbHrU9V+gFVKDgBJJOl7kTLCPUYfEKTYmNzzW7Kl/Hu74ZxEq0gaV9ai
         VVpA==
X-Gm-Message-State: AOAM530rPrM8lmVGM/Hb55+brY+rWaFmYpwRgZWPArfWkmlrWfraKkGl
        21Cd7q9Xm4pCBtOAP5+KtQ2GKqUUR35xH0Psl9ow7Hm1vKE=
X-Google-Smtp-Source: ABdhPJzBwwnQt1AiH7nyI9wz4liUzDDs9HQBAr7UqNPeVpKHVHWQUgcdY6OYQnSV6wAZpbYPcHG8gWn8IwNlbBOiVr8=
X-Received: by 2002:a92:c78a:: with SMTP id c10mr21311323ilk.64.1618911555324;
 Tue, 20 Apr 2021 02:39:15 -0700 (PDT)
MIME-Version: 1.0
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Tue, 20 Apr 2021 11:39:04 +0200
Message-ID: <CAKXUXMyNf4xCF2mWr878MKDa0-8svaiR5GToQyoEVM4FbmfJ8w@mail.gmail.com>
Subject: Invalid License ID: GPL-3.0 for arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
To:     Qing Zhang <zhangqing@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-spdx@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Ming Wang <wangming01@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Dear Qing,

./scripts/spdxcheck.py reports:

arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi: 1:28 Invalid
License ID: GPL-3.0

You have contributed this file with commit b1a792601f26 ("MIPS:
Loongson64: DeviceTree for Loongson-2K1000") to the current
linux-next.

Do you intend to contribute this under this non-default license
(GPL-3.0) for the kernel project or did you simply mean the default
license GPL-2.0?

Best regards,

Lukas
