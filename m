Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F02A794A
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2019 05:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbfIDD2u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 23:28:50 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39375 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbfIDD2u (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Sep 2019 23:28:50 -0400
Received: by mail-io1-f67.google.com with SMTP id d25so38454375iob.6;
        Tue, 03 Sep 2019 20:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AgXSmzwyZZlC9RGIALdPqPvVz8SuZyV2bVF/XPSrAps=;
        b=Efo1R4/yAj50n+N8aNIUjsL5/wz8GYZ+lwgSxZeRX/PNSETumZROhNcjvj5cZWbwej
         HctERQiMgLIY7UCLyKlKqVlxEMmF9Txa+DHDjoJe8NiIi22DOL4jq5L/0m0s0X+zv4CR
         LRzVd8I3+L6c9W6mEc12XGmvnPqYYQi4fjOlYBnlItHXan8GLPgmNFeazcai1qo/NCUU
         BmjxmhlImq0oTK1/qtgGIc4K4Guhy/6veI0xGTtmTDXqOvSPQtNtEOTkbHMAetByIlLy
         30iyMGfVaFikdl0lqTAEdW1d6girJzLXcLkzbGEbyNa9pGoJBkVDZOKxoXgm0fL0TMl+
         hgGQ==
X-Gm-Message-State: APjAAAU/ndKyme6mK9O/dKM0Q21qf2QWsD0T3ybQhKIodVKkNmmUuT59
        ktF91M2V3Cq9MHNOGv/TNH/ugg7R1u0KHBxadx0=
X-Google-Smtp-Source: APXvYqxh670kTisiRTP1SVMZl5nx1rPsHxIbGPdQLMKXE7oisMJVC+E5BIpK/5G/mRdY8/unzNfEa1PJSLWCr7jrNQU=
X-Received: by 2002:a6b:ef0b:: with SMTP id k11mr6023481ioh.143.1567567729507;
 Tue, 03 Sep 2019 20:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-12-jiaxun.yang@flygoat.com> <CAL_JsqL6htVye-LSBWw1WwRy9xH=zwuH6gurscwoCWj9Te_hAg@mail.gmail.com>
 <d94eff2b-76ec-5cd2-512d-5ee0406a1bb9@flygoat.com> <20190827204105.7nyt4pi7lvxse5ij@pburton-laptop>
 <CAL_Jsq+VmFi6r1-WOa9RJ4vfqsZLqcn5HMbv1oyQjhtJ8Qd8Lw@mail.gmail.com> <20190903085904.bwmm4knaodopvzvd@pburton-laptop>
In-Reply-To: <20190903085904.bwmm4knaodopvzvd@pburton-laptop>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 4 Sep 2019 11:33:20 +0800
Message-ID: <CAAhV-H5xsFY8cN_ckmVQ6rmGqb70Z2rEpx+eRwy_eA4HRLrhiA@mail.gmail.com>
Subject: Re: [PATCH 11/13] dt-bindings: mips: Add loongson cpus & boards
To:     Paul Burton <paul.burton@mips.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.co>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 3, 2019 at 5:08 PM Paul Burton <paul.burton@mips.com> wrote:
>
> Hi Rob,
>
> On Mon, Sep 02, 2019 at 03:50:47PM +0100, Rob Herring wrote:
> > > In general on MIPS we detect CPU properties at runtime from coprocessor
> > > 0 registers & similar sources of information, so there's not really a
> > > need to specify anything about the CPU in devicetree.
> >
> > We thought the same thing initially for Arm... Mostly what is in DT is
> > not what is discoverable. Are clock speeds, power domains, low power
> > states, etc. all discoverable?
>
> No, that's a good point - clocks etc may need to be specified in DT. I
> just don't see any of that in this patchset - it appears all that is
> specified is cache sizes which we already detect. So in this case I
> don't see a need for including CPUs in DT at all.
>
> Jiaxun - did you add all this information to DT to avoid the "cacheinfo:
> Unable to detect cache hierarchy for CPU" messages during boot? If so
> that should be fixed by commit b8bea8a5e5d9 ("mips: fix cacheinfo"). If
> not, could you describe why the CPU nodes are needed here?

Yes, this can avoid "cacheinfo: Unable to detect cache hierarchy for CPU".
In our own git repository we have already reverted commit b8bea8a5e5d9
("mips: fix cacheinfo")

Huacai

>
> Thanks,
>     Paul
