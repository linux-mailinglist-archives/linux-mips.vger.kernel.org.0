Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F7B85F33
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2019 12:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389774AbfHHKEg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Aug 2019 06:04:36 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46801 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389773AbfHHKEg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Aug 2019 06:04:36 -0400
Received: by mail-qt1-f196.google.com with SMTP id h21so91447767qtn.13;
        Thu, 08 Aug 2019 03:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RjvrmHnLkNY8judMLmiwx+J5kIvDISrhio/7dX5zE9M=;
        b=A4L/lVEnAhzimNvZOk2dlay//kRmDE29VrHcAuetZ/+P4JB3Sld8H0YWMeCC1c3mQE
         wstifSkxoflQ2ddSoIE+VNQ+yTVy9glgoyoKBxzR4dpYfrXoefpDcWMF4HLPEV9jWTbp
         K/aasTxqk54UTrMWMLdLmxYVnjY1ccSJoj5VgLepnNfA/zFcgC71Hm/eYtj/OW69Wklk
         m1fISftkc6C8sQD/5EYLMmNzB2TEHQKn2mMMsL2lyru+dNW0pRKJOcBxqmW20PWaae0/
         GRB0xs0T6TDjR/3W+8s3e4B4sTRhQXX8HsRQ952ImdBoNy1lbzQ8vrriBqfc9opIoqAy
         7X0A==
X-Gm-Message-State: APjAAAUsGdPI8Qq8syVEwBV4KItFjxH2sLeAHH0lDWzjKDEUuP3KCn/g
        Q5SAozm65eI/XTwDwDp5+v1TUv/8Yox7o0uE9hM=
X-Google-Smtp-Source: APXvYqzYiIGgaQsnnsl/ev4HI3EBWf/N9eNNIZAf4tphrn0oTVGBurf6vSIQ6z6xYL8ITJbX0KbZAIZ3U8xYBBzOq94=
X-Received: by 2002:ac8:6684:: with SMTP id d4mr7259661qtp.204.1565258674868;
 Thu, 08 Aug 2019 03:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190724171615.20774-1-paul@crapouillou.net> <20190724171615.20774-5-paul@crapouillou.net>
 <20190729165536.dd67ws6nr2msx4pk@pburton-laptop>
In-Reply-To: <20190729165536.dd67ws6nr2msx4pk@pburton-laptop>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 8 Aug 2019 12:04:18 +0200
Message-ID: <CAK8P3a0nOc2tpxYAoE0EGzXT1+FXFqzdK1mYE+ZR9CTqAaH_fQ@mail.gmail.com>
Subject: Re: [EXTERNAL][PATCH v15 04/13] mfd/syscon: Add device_node_to_regmap()
To:     Paul Burton <paul.burton@mips.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Lee Jones <lee.jones@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "od@zcrc.me" <od@zcrc.me>, Mathieu Malaterre <malat@debian.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 29, 2019 at 6:55 PM Paul Burton <paul.burton@mips.com> wrote:
>
> Lee, Arnd,
>
> On Wed, Jul 24, 2019 at 01:16:06PM -0400, Paul Cercueil wrote:
> > device_node_to_regmap() is exactly like syscon_node_to_regmap(), but it
> > does not check that the node is compatible with "syscon", and won't
> > attach the first clock it finds to the regmap.
> >
> > The rationale behind this, is that one device node with a standard
> > compatible string "foo,bar" can be covered by multiple drivers sharing a
> > regmap, or by a single driver doing all the job without a regmap, but
> > these are implementation details which shouldn't reflect on the
> > devicetree.
>
> Does this looks like a good path forwards to you? Its use in this case
> is described by Documentation/devicetree/bindings/timer/ingenic,tcu.txt
> in patch 3 of the series.
>
> If you're OK with it an ack would be appreciated so I can take the
> series through mips-next, otherwise I guess we'd need to go back to the
> v14 approach.

Yes, I guess this is ok, sorry for missing the submission earlier.

Acked-by: Arnd Bergmann <arnd@arndb.de>
