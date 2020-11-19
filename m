Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7922B8EF6
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 10:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgKSJc1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 04:32:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbgKSJc1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Nov 2020 04:32:27 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8D6C0613CF;
        Thu, 19 Nov 2020 01:32:27 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id t13so4757867ilp.2;
        Thu, 19 Nov 2020 01:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KNYi7k+SD7m8Q6dkb27HJ0eAGPSje9gd3Xmj2AuiEfo=;
        b=a05oe/+RY1dw3WMRMmVe7SMqPBLJcalWI9jZ1o8ofqpMLY6y6RNxi3sNW5B1aQwuv1
         2SYwdHkESFN72GFEtQnm8umwx9Uuu39WyCykmR8DkGf5w+vHnywzY5M6P4wldYEhdary
         Fjh7M524CpZ4VTnT2gcBjxJsdh0e10WezDKUf5KikPMOTiLnU8UudCezsF5EFemV9nuy
         wnlx4TIVPHE5yadPSTDYv0V8mtKE+cSvtXBSdRwoeKseq4a58ZjNbNOfF5gyf60EPQSE
         QMWfoFRh9y2hYc7xR3mHSCwWhTbUNfEmzzaMbvPaX3qqXfZzeMzJnlCvDI8JPSh5fRP1
         uP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KNYi7k+SD7m8Q6dkb27HJ0eAGPSje9gd3Xmj2AuiEfo=;
        b=BSJyelEuEnxQZsKyMQ0i/qigHmLJQUulvGmJ2NQ/PBbPxZ4BUSOhJDgcMpDPBWORPL
         GmsIBgNKi7j8Wyf8ljqVMNlbcqAuY527IN8GX6mOKCNOI5EX79J9lueebzVdxPBy4Akr
         CYy5wUKf0nVOXtceNiGodHbtST4p7i0GyoP1UJgNpX5PSr8JMUg4ad/iVBfNsoAtTX9p
         hJroV1eANyJnM8f0JkP/mAZzbb9SX3+UVLgwyjgCerqwpQk8AzRKMwnHKumthLOw93uJ
         IFPYQoRarlkh7pFPL5immtgDrpT8Q7X+2vSbwKmVxCTm2kM0SuCRlipfssohcCaFdrPz
         3suQ==
X-Gm-Message-State: AOAM531N3HaZexnhlKv/FQo9Cs8jtMnE4Ue9W4RPx1mS96GbHZCpHEha
        B215MTlHrf0yvRc7xRlQqj4euo/bNALaImutWx4=
X-Google-Smtp-Source: ABdhPJyd3hCc/8+RvwRQKTE0igheO/eHL6J48ND6UrkSHz8YgNeJK2v6pndGgRunYTXpv7qCNQZhEr2EkjXIlBsXRgg=
X-Received: by 2002:a92:7914:: with SMTP id u20mr20826952ilc.203.1605778346666;
 Thu, 19 Nov 2020 01:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20201113154632.24973-1-sergio.paracuellos@gmail.com> <20201113154632.24973-4-sergio.paracuellos@gmail.com>
In-Reply-To: <20201113154632.24973-4-sergio.paracuellos@gmail.com>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Thu, 19 Nov 2020 17:32:16 +0800
Message-ID: <CAJsYDVL1ZYc=OaCS7_NNu27aUKmpHp63nPuVq1V8xp8s6Vguxw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] clk: ralink: add clock driver for mt7621 SoC
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, jiaxun.yang@flygoat.com,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

On Fri, Nov 13, 2020 at 11:46 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> [...]
> diff --git a/drivers/clk/ralink/Makefile b/drivers/clk/ralink/Makefile
> new file mode 100644
> index 000000000000..cf6f9216379d
> --- /dev/null
> +++ b/drivers/clk/ralink/Makefile

Why ralink? The clock design of mt7621 doesn't seem
to be part of ralink legacy stuff, and ralink is already
acquired by mediatek anyway.
I think it should be put in drivers/clk/mediatek instead.

-- 
Regards,
Chuanhong Guo
