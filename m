Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08DC82B596A
	for <lists+linux-mips@lfdr.de>; Tue, 17 Nov 2020 06:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgKQFit (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Nov 2020 00:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgKQFit (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Nov 2020 00:38:49 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E71ADC0613CF;
        Mon, 16 Nov 2020 21:38:48 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id k26so21468749oiw.0;
        Mon, 16 Nov 2020 21:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rLinOapGuOZ7A3D9bbaR3AD8/7b7elhTbAVHcuXosMo=;
        b=iXvdipyXlKjO7vkforOOErJKLT9l4kohPmwWzx4eNeAhWv2I9a7ZbqC9XZXGVZVzfw
         retLRzNLwVhSlMhZHq9AP7fyn+PonHcaZfY57osuAJE6d95sWlhEOWQBL5H0RppGentn
         CyhtliOdaassc48YU+yghUdgt23RT1peNURP1REIhw9BqP4ZKD2xFEr4llr5Lv6LEla8
         cWKkwwWzQkiFba8dGx1hirKCEs+VdCLhJYhiH7USr8G2QHiDTl7XBUbEHpiirWCs3bCs
         NTItdkuIvKOl0Wp2WhA5k4pfn0/GFuzczCHO4uXHxRvWLrmi3f+3E+XyFKRCGLToabS8
         cPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rLinOapGuOZ7A3D9bbaR3AD8/7b7elhTbAVHcuXosMo=;
        b=s6IlFBuscevvdBf30GmZZzrozJFnLCdwRJibMoYpE7uOUVJ8lGIKAHPPF0QODRZKEx
         ilENKGsrfczTcuRVDGMwykD9sXwI3/LFslQRfolYJnVsGnzjGNVJMix5bES9q9H4oYvJ
         yxX2RNshLA6WusKsZd+prgTjxsL+uUywj4h0CXM0zq2ohsCG6bn05DQ1C1pK7eYKIQLL
         GTGdKg8QvOawIGwLVAv2t8R02PIwuD5DYKC79p+Z8PXnSySWi6pOXsW7a/kWN7ZrYMF3
         sZASq1t4pjd4bs9HJ9U3s3As+zNxXAvpZPUeGmV5xNC/Dx15cB43Qpqg2V9Yy8B1e8CR
         1QZA==
X-Gm-Message-State: AOAM5303TPSt0vwLQhx8vV9S2zaZ1eNhxkHp2EdOjs91jkWAjqI/UxXx
        yn2ixoJyMl/vfDr8jEbMl7sZCI+LwnJtqzpvyS0Ka3XkFcmQfA==
X-Google-Smtp-Source: ABdhPJxa3gnCClGBduWs8WfAYuHfg1PA10bCTWr3VOszhOIntH/xH1I3a3tV7gQnPMFYqO8/upkWQ8tDN51FXMvd3WY=
X-Received: by 2002:aca:6106:: with SMTP id v6mr1521999oib.158.1605591528436;
 Mon, 16 Nov 2020 21:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
 <20201111163013.29412-3-sergio.paracuellos@gmail.com> <20201116191655.GA1981921@bogus>
In-Reply-To: <20201116191655.GA1981921@bogus>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 17 Nov 2020 06:38:37 +0100
Message-ID: <CAMhs-H-vgf7c9-mEi8vF3rWiTFq5wQbRUkQQ0tO0zKTjuV9oXw@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt: bindings: add mt7621-pll device tree binding documentation
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        John Crispin <john@phrozen.org>, jiaxun.yang@flygoat.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Weijie Gao <hackpascal@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On Mon, Nov 16, 2020 at 8:16 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 11 Nov 2020 17:30:08 +0100, Sergio Paracuellos wrote:
> > Adds device tree binding documentation for PLL controller in
> > the MT7621 SOC.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../bindings/clock/mediatek,mt7621-pll.yaml   | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for the review. In that series there were two clock bindings
relating the pll and gates, There were finally joined in only one
binding and driver. This is done in the v3 of this series sent on
friday. Thanks for your time in looking also into this new version,

Best regards,
    Sergio Paracuellos
