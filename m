Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6714635ED
	for <lists+linux-mips@lfdr.de>; Tue, 30 Nov 2021 14:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241828AbhK3OAx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Nov 2021 09:00:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbhK3OAx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Nov 2021 09:00:53 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5C0C061574
        for <linux-mips@vger.kernel.org>; Tue, 30 Nov 2021 05:57:32 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id e136so52754212ybc.4
        for <linux-mips@vger.kernel.org>; Tue, 30 Nov 2021 05:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i8mC6OqW0NDo60h/ey+ips1XwWpcV67dhd9iu/BhDz0=;
        b=WRlEVbKlNULbDO6M6gbl896ndTKr+un9IDkTKhxYx3kDhMjanE6bsjMsPGAzq97Hs9
         crYTXwAvhcyMq0NWjblhRU+XgfOOV8KfhaRjJK5IdAOTnu2vDmQtmO7FOn8mSBDsKa4m
         YW5rnK8qkBbukBswLIUOA56UjHBAV5lJj+siep6KiR6wcCMAEFsdlxJxGMWoJ0cU2ZeO
         EpGx1VdKsIXJbD+GHuwD4rtflOshZHkR4BLyyawq8g2S9UDZi/AWRB+14W+nxsqaUXTR
         /EoGaAHK0pdgbtQ6FUYKHkvKvtWBroMuvCqWmhqPx5vLQF26e030cQ3Su0fjv+eMkVZZ
         jovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i8mC6OqW0NDo60h/ey+ips1XwWpcV67dhd9iu/BhDz0=;
        b=eZ3PsZ2M1jZ8R5daH4AW/dWM7RYHj4rpoi/oFZ7pb7hy+F4iEloKO13iQ03Jz87Z+L
         BlwBGF3l+pKmk87nZ7ypjYh5hkM2R/UI2vIwnmWemJFfBMXX7/2ftGbry3kWI43b1K4g
         4fOZoHUcnGzl3tzhG1g8LMw7J33LbWH0Kuk2xeRcXIflNu/rtEj66nLd4HHQiSSbAcU2
         e2wq7F8Xb+xOJG03CpX5wF8AxYJkR+QKYRSLtm1KYmgzLx5HDc7ZPY+ky55+/brxAGkl
         Bn0RZPPO6K0S4p+mj466QcVYtGl95lD+9Ze1DynTDnImG+mwzYIErT/zr3ItzuFFVWCl
         Laew==
X-Gm-Message-State: AOAM530ziAR+BtuuCcQQHnaZ5Eq0fPOViVe7u1b5nVDe4aBTaHWRSzaF
        PBii41xtspz8T5dOa7E7DyqszGK027F3ffnQD96ZLg==
X-Google-Smtp-Source: ABdhPJy/BtczKyJzappms/4cO8+1NIBYpHuseK0gvuukRHbl9fVIpSbl33dqQ/eIMS4vDHBMIe0jGEVN1VclOswS83I=
X-Received: by 2002:a25:94d:: with SMTP id u13mr14311330ybm.723.1638280651971;
 Tue, 30 Nov 2021 05:57:31 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMyEqSsA1Xez+6nbdQTqbKJZFUVGtzG6Xb2aDDcTHCe8sg@mail.gmail.com>
In-Reply-To: <CAKXUXMyEqSsA1Xez+6nbdQTqbKJZFUVGtzG6Xb2aDDcTHCe8sg@mail.gmail.com>
From:   Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date:   Tue, 30 Nov 2021 14:57:21 +0100
Message-ID: <CAM1=_QQBfO_RQuYFrhdvZeM+KbY+5w=YVHTfb-zZQsN4fiBMcw@mail.gmail.com>
Subject: Re: Reference to non-existing symbol WAR_R10000 in arch/mips/net/bpf_jit_comp.h
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Lukas,

On Mon, Nov 29, 2021 at 7:39 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Dear Johan,
>
> In arch/mips/net/bpf_jit_comp.h and introduced with commit commit
> 72570224bb8f ("mips, bpf: Add JIT workarounds for CPU errata"), there
> is an ifdef that refers to a non-existing symbol WAR_R10000. Did you
> intend to refer to WAR_R10000_LLSC instead?

You are right, that is a typo. I will prepare a patch with a fix.

Thanks for catching!
Johan

>
> This issue was identified with the script ./scripts/checkkconfigsymbols.py.
>
> Best regards,
>> Lukas
