Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 471E491554
	for <lists+linux-mips@lfdr.de>; Sun, 18 Aug 2019 09:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbfHRHTU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Aug 2019 03:19:20 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33692 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbfHRHTU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 18 Aug 2019 03:19:20 -0400
Received: by mail-oi1-f193.google.com with SMTP id q10so4135176oij.0;
        Sun, 18 Aug 2019 00:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l3gV2KQAk+24sUCcPZUWGgMw3Dm+sc+Ox5ibH9xYpcQ=;
        b=Xq9n7rYsgmSdz/cTXIDtxyVx178tu5+JS4tfsINLZRygFxfjMU4PNb00VSKmpnV+qo
         LSLNvwfcXrtWLF6+ZDN/RXs6+vdvMh7kTg5izHZxGRhImMYpZhMiIgejf8nInzBSEu65
         8ZNaFG9WDFiS1YCabNDS6vOkE+Qf1yDFB+kkr/B32W/YOrC7VQe04vYPh5LOUqcrR26S
         yFe9ufgCKUpJp63v7vx0agEUoWj7JIHB/CWF09UpPDS7OD3IYdP8FdOT/zMDM5czkvti
         t/3BuNmTXUZg6C1iMhKvIUGQ7U/XtHAGU9WENde6HofIxm5brhhBrGM8MbG1XYR5IKf4
         ABcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l3gV2KQAk+24sUCcPZUWGgMw3Dm+sc+Ox5ibH9xYpcQ=;
        b=Et8PhGoCwMgDd1S368sxVuXYo20vLRmunwpePwP9w0V4lhqKwReggbq97UA13/zLbY
         tQ6A07HnPb43tFq973G25yfLEvdsTmiUBWsD6XpCd52D2Ys3YbFcQF/Q2JmwYyeCEEzI
         id+Hh29msakhfzh5Zuou8NI+94cDFHc5/wbAwTbG+BYV+ukvId/Y3UETuDqgfPMT5fpY
         5R1zWxVaWJO6ZRMd3XA/PS03UufVIqi9OIVN39S+eLYXGgEPPZRPZVLyJvCzVGmM6BEp
         d4j8kQfn0psz7ZO6fPdwT+RGz+rs0C8V53l0qOsUDw4NJLISZGju1HRWpK2Y53F1TUUV
         EmTQ==
X-Gm-Message-State: APjAAAXXEfT4XtxZRJf5s4CQYVJFSUFMXhUx6bbrEvJxNLr6yzM85Vki
        9iqo3FhXgQB3iZJfU7YhV8M7UD1zQq1PlI5Ea6U=
X-Google-Smtp-Source: APXvYqytauuG/JmQ89iJexPdxtEypdx++JqmuBJURnMXZ/BgdAT6iC3dquzsHJfz35N8IZOMQHXjI2u6e2Q1SsKkN0c=
X-Received: by 2002:aca:df08:: with SMTP id w8mr9418590oig.84.1566112758963;
 Sun, 18 Aug 2019 00:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190724022310.28010-1-gch981213@gmail.com> <20190724022310.28010-5-gch981213@gmail.com>
 <20190813155143.GA19830@bogus> <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net> <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
 <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de> <CAJsYDVLLPa07wUg2EoeJww9XSJYgX_kBu-oGiv7n+zejUc877w@mail.gmail.com>
 <fb39803d-d303-f259-d78d-9f8b1fc7dde3@rempel-privat.de>
In-Reply-To: <fb39803d-d303-f259-d78d-9f8b1fc7dde3@rempel-privat.de>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Sun, 18 Aug 2019 15:19:08 +0800
Message-ID: <CAJsYDVK9Yj02WxNFo7iEP3aJn+j5MqzCtLrmgsz=4zWnfQ4VOw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding documentation
To:     Oleksij Rempel <linux@rempel-privat.de>
Cc:     Rob Herring <robh@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>,
        Paul Fertser <fercerpav@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

On Sun, Aug 18, 2019 at 2:10 PM Oleksij Rempel <linux@rempel-privat.de> wrote:
>
> >> We have at least 2 know registers:
> >> SYSC_REG_CPLL_CLKCFG0 - it provides some information about boostrapped
> >> refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
> >> SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
> >> all or some ip cores.
> >> What is probably missing is a set of dividers for
> >> each ip core. From your words it is not document.
> >
> > The specific missing part I was referring to, is parent clocks for
> > every gates. I'm not going to assume this with current openwrt device
> > tree because some peripherals doesn't have a clock binding at all or
> > have a dummy one there.
>
> Ok, then I do not understand what is the motivation to upstream
> something what is not nearly ready for use.

Why isn't it "ready for use" then?
A complete mt7621-pll driver will contain two parts:
1. A clock provider which outputs several clocks
2. A clock gate with parent clocks properly configured

Two clocks provided here are just two clocks that can't be controlled
in kernel no matter where it goes (arch/mips/ralink or drivers/clk).
Having a working CPU clock provider is better than defining a fixed
clock in dts because CPU clock can be controlled by bootloader.
(BTW description for CPU PLL register is also missing in datasheet.)
Clock gate is an unrelated part and there is no information to
properly implement it unless MTK decided to release a clock plan
somehow.

> This code is currently on prototyping phase

Code for clock calculation is done, not "prototyping".

> It means, we cannot expect that this driver will be fixed any time soon.

I think clock gating is a separated feature instead of a broken part
that has to be fixed.

Regards,
Chuanhong Guo
