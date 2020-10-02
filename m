Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD02281063
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 12:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387705AbgJBKMT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 06:12:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:46596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbgJBKMQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Oct 2020 06:12:16 -0400
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 399BE206FA;
        Fri,  2 Oct 2020 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601633535;
        bh=YMb+SikBzA0kaz01qg1rFRGqMR34IEZDdELzQnvannc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=m+QSecoZOGe8dvzGAzaVLu6djX6wvstSNjTufshrQ7pLbM+zd/i00BMIxk9HtkH36
         4RGMtD5Y9P1GyZIBAMLBkI9wveIJaHkolhG9ddl4D8wp9XAcl991RL+EtWsjr+8KQt
         XTGHujSHsO4T0sIxR14eOk8W/1eFzzgroCv9ipS4=
Received: by mail-ed1-f42.google.com with SMTP id t16so1074147edw.7;
        Fri, 02 Oct 2020 03:12:15 -0700 (PDT)
X-Gm-Message-State: AOAM533Qbb6gT6IZ4HG2NMPpbS0Ptqz0nNs6SrvluK/rCdNivT6R0Y5M
        E4S2ivAyYaJNOlSUkpASU6q31BB19q6M6FuZuBo=
X-Google-Smtp-Source: ABdhPJyIAzURzd3Z3ZQc9dk3WngtlZ5byJRK3kR//jIcYN1OLykt0UVP1CzVTSlm3oLD4xmvK0KWSQpcyp1ktS9V6aw=
X-Received: by 2002:aa7:da16:: with SMTP id r22mr1552459eds.132.1601633533817;
 Fri, 02 Oct 2020 03:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de> <20200930234637.7573-4-post@lespocky.de>
 <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com> <1708987.KbI9FDK2aH@ada>
In-Reply-To: <1708987.KbI9FDK2aH@ada>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 2 Oct 2020 12:12:01 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfK_fnyf0bJY_d_pKH0es3C9x07Fc425LPCr323qZkugw@mail.gmail.com>
Message-ID: <CAJKOXPfK_fnyf0bJY_d_pKH0es3C9x07Fc425LPCr323qZkugw@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] dt-bindings: mfd: Fix schema warnings for pwm-leds
To:     Alexander Dahl <ada@thorsis.com>
Cc:     linux-leds@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 2 Oct 2020 at 12:07, Alexander Dahl <ada@thorsis.com> wrote:
>
> Hello Krzysztof,
>
> Am Freitag, 2. Oktober 2020, 11:21:10 CEST schrieb Krzysztof Kozlowski:
> > On Thu, 1 Oct 2020 at 01:51, Alexander Dahl <post@lespocky.de> wrote:
> > > The node names for devices using the pwm-leds driver follow a certain
> > > naming scheme (now).
> >
> > What warning? Please post them here and in every DTS patch.
>
> ack
>
> > Your schema does not enforce pwmleds node naming (the main node, not
> > children), or at least I could not see it. You change multiple files
> > in your patchset so are you sure that all these are justified by
> > warnings pointed out by schema?
>
> The rename was suggested by Rob [1], and I think you're right, those names are
> not (yet) enforced by schema?  So at least the commit message is misleading
> for now.  I'll have to see if I rather reword or update the schema again.

If schema does not enforce it, then maybe just mention that you align
the children names with schema and pwmleds node to device tree
specification guidelines (node name should be generic, reflecting
function of the device). However in such case changing only pwmleds
node name in DTS (without changing children) would not be justified,
IMHO.

Best regards,
Krzysztof
