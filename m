Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACEA16A98F
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2020 16:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbgBXPPS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Feb 2020 10:15:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:42248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727742AbgBXPPS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:18 -0500
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7BEA20838;
        Mon, 24 Feb 2020 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582557318;
        bh=o1nOGaQHdZL0UAsK/bjsu+6BAwDuNsTZaQNaSLe2HLE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HRf8OqzGxscXlFCy7Kr95TbhR2fqQG8f2vdcwZdx5MMJTpA8+DrGUKwwDupCJHAXJ
         Lpe/vG+HPf7LfAKpn/L6UjmIzGsfYogpJjWyPPuIKX2EwdWPCP33Ps5cc9AEuDNSJq
         wd6cUOAExGR8miZSpHtD5A3/EEFKNcuBNIhykFfA=
Received: by mail-qv1-f49.google.com with SMTP id y2so4236512qvu.13;
        Mon, 24 Feb 2020 07:15:17 -0800 (PST)
X-Gm-Message-State: APjAAAXYoRVmrwG9KiFEgH3rdmQm/NtEw+2dx8UdR2DZVjccrCMCJl0E
        ciO2aAKbC83gJoKWEtKrQCoT47aDzgg6YDdxVA==
X-Google-Smtp-Source: APXvYqx6fBgVnq9vjh/yHZnkbthH3EWPw/BqHYWMQ6citY+xthXlZQgnZuHLmeSOEN0UIorxy5g/2npA/CWQaro2QqE=
X-Received: by 2002:a0c:ef47:: with SMTP id t7mr12552684qvs.136.1582557317000;
 Mon, 24 Feb 2020 07:15:17 -0800 (PST)
MIME-Version: 1.0
References: <CFE9AEF5-FFF9-44A9-90D8-DE6AC7E7DD4F@goldelico.com>
 <20200220060001.25807-1-andreas@kemnade.info> <CAL_JsqKTdpbLfPq_eGUf-w-0s8JMndbMrQ2BsMt+8y+eqQ-kZw@mail.gmail.com>
 <20200224074804.3a5999ca@kemnade.info>
In-Reply-To: <20200224074804.3a5999ca@kemnade.info>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 24 Feb 2020 09:15:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKNAQT996sDSW+k=SZq5NwzQn4wbEB0fS9_19rKdXMGYg@mail.gmail.com>
Message-ID: <CAL_JsqKNAQT996sDSW+k=SZq5NwzQn4wbEB0fS9_19rKdXMGYg@mail.gmail.com>
Subject: Re: [PATCH RFC] Bindings: nvmem: add bindings for JZ4780 efuse
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 24, 2020 at 12:48 AM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> On Thu, 20 Feb 2020 13:53:55 -0600
> Rob Herring <robh@kernel.org> wrote:
>
> [...]
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clock
> >
> > 'make dt_binding_check' would have pointed the error here for you:
> >
> I did run make dt_binding_check...
> It stopped because the jz4780-cgu.h included was missing. Then I have added
> that line and have started dt_binding_check again.
> At least here it is doing a full rerun in the second part.
> After some time I scrolled back and noticed DTC passed
> and missed that
>
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.example.dt.yaml:
> > efuse@134100d0: 'clock' is a required property
> >
> in the CHECKS line. Well, dt_binding_check is a bit noisy. I guess I should
> have redirected all output to a text file, before and after my changes. and
> diffed the results.
> Is there any script ready for that?

grep 'ingenic,jz4780-efuse' <build log> ?

Noisy? There's 8 warnings on Linus' master currently[1]. I try to keep
that at 0, but I wouldn't call 8 noisy.

Rob

[1] https://gitlab.com/robherring/linux-dt-bindings/-/jobs/447630363
