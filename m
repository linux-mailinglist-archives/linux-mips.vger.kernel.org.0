Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F429322A82
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 13:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbhBWMau (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 07:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbhBWMat (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 07:30:49 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99D4C061574;
        Tue, 23 Feb 2021 04:30:08 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id i7so1548888wmb.0;
        Tue, 23 Feb 2021 04:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=7sT+TMfZJ7ymgZkRWmXedrtcKDIJlvZXDaPwKlmpcIQ=;
        b=dNkIkeF8HefVhaR/XCPENSOCvB8oKThYxvSZis4Hyf8+e1EbeNAJrShJn2OckRKxHS
         fhzI+PH++2boCL+NM6OQguGXIKG+DIoZsaeoxoFpeNSsjLRrZvJ8L+9YmqYdwX1XnBP1
         3zLUkVQRRSRfysMWQ051CFjQdNba085qJoVIyZ3k0fMCCPfGw0p4XkZeKvjExuOH/LeZ
         oZ8XAsiE2T6sBjPefInk5p85Lhxn4o2wWsCWVL1LuoPGKMZAeAals1UtYj+sz7PZbfEQ
         1EWVU5OEzBJqUrh23hhIjLJfh9qGsnaaGmvcXyZ30hAgiXPaiYnVqbFfe0Ar6Sa3FmRJ
         GJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=7sT+TMfZJ7ymgZkRWmXedrtcKDIJlvZXDaPwKlmpcIQ=;
        b=QfEKBxKVaNiJ45TOMtGaQM4I+lozVQmlYbh6P28g19zpA8ZHmfnwrAbLy/UHVySjUy
         sVsG2DDhMwBEo6wlmjPBx95v4ft+KXQIEDg4eNOcJrD45JBDd+ESmGXFguQfyY1OvNb2
         u9T2wGiTd9mzYWLf+1k/jzUC+Z3m1IzN5yb94FyGlGChzUZqHk5Ze3/29quulyjzWTe7
         GTF8D+4DGPF3XdF0UKzUJm2ucAuOsK67Qw7Za69K7uSLRke0Y7AiD/cy5ACR3b95zEDV
         jLiEA/SSsOMyxdeBmWajA8r8ep0iXs/THQEpLMh9GWbO+ovtG2IFHu10Jzr3aEVVDDyl
         HrLQ==
X-Gm-Message-State: AOAM532mOpgbxOoyOsXX5R/xLHhhyv2CTlw3GnQ+oJLClPUNrBC7Nbmk
        pHVd6Nu1hx5Ta9FIPLY0E0U=
X-Google-Smtp-Source: ABdhPJyaxFieXLPWWlxiZS+uCWunW11jWazrdkrn5LF8syOYzNQHzzL9LiQkOgLO8OPe/3ZAPe5kAA==
X-Received: by 2002:a7b:c391:: with SMTP id s17mr6874498wmj.155.1614083407364;
        Tue, 23 Feb 2021 04:30:07 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id g141sm2624342wme.19.2021.02.23.04.30.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 04:30:06 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] irqchip/bcm-6345-l1: fix SMP support
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <6169cb21-538b-1066-51cb-dd362f811fa1@gmail.com>
Date:   Tue, 23 Feb 2021 13:30:06 +0100
Cc:     Jonas Gorski <jonas.gorski@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B78512C9-E73F-45E2-B7D8-C184D9A273A0@gmail.com>
References: <20210222201332.30253-1-noltari@gmail.com>
 <6169cb21-538b-1066-51cb-dd362f811fa1@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Florian,

Yes, you=E2=80=99re right, there seems to be a bug, because =
cpu_number_map() and cpu_logical_map() are returning the same when =
BCM6358 starts with CMT 1:
[    4.662896] bcm6345_l1_irq_handle: smp_id=3D0 cpu_logical=3D1 =
cpu_number=3D1

Let=E2=80=99s see if I can fix it=E2=80=A6

Best regards,
=C3=81lvaro.

> El 22 feb 2021, a las 22:00, Florian Fainelli <f.fainelli@gmail.com> =
escribi=C3=B3:
>=20
>=20
>=20
> On 2/22/2021 12:13 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> Some BCM6358 devices start with Core #1 instead of Core #0.
>> Apart from that, SMP is restricted to 1 CPU since BCM6358 has a =
shared TLB,
>> which makes it impossible for the current SMP support to start both =
CPUs.
>>=20
>> The problem is that smp_processor_id() returns 0 and then =
cpu_logical_map()
>> converts that to 1, which accesses an uninitialized position of =
intc->cpus[],
>> resulting in a kernel panic.
>=20
> Sounds like you nee to correct the way the cpu_logical_map[] is
> populated then?
> --=20
> Florian

