Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC09B2B135B
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 01:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgKMAkX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 19:40:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgKMAkU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Nov 2020 19:40:20 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24DCC0613D1;
        Thu, 12 Nov 2020 16:40:20 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id u21so8036364iol.12;
        Thu, 12 Nov 2020 16:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KwsRYTIelL+rQfaWByBY2jDX2TK6VO5EvbvbPDRhoZM=;
        b=ItHGWFKBEnfm/3yEFqHr4tpisqmr5LgUINwjxMECLYJ5Sd0mrylFpr6fulRr09T39A
         FUUYt+sm3Fd7f8p2rl+B7maioKkcie9N4EhRWXwPF/pYXsLT5Xp0px5KMDQKOiAHzFuz
         DmF4vKn9hm5xsAeym/TPrhjYeBX4dVXeP7EA/BBrlVnqHUaIcLmz+AF/DQPoywiSDnm6
         oeFc0khKuJTd4ef7M7+M10XxOqHjf9ApbH+foEsKEUUmO6gN2bjEGJIk3Z7e4UrEaEHK
         OTdYpoph/DPIviUOLUzu4NDn/o+02lX26JiHJmJqB09rii4ME1C3QRIepAziPJ2/pHG/
         IpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KwsRYTIelL+rQfaWByBY2jDX2TK6VO5EvbvbPDRhoZM=;
        b=SKgtHzVjCHs76Nkl7HOIv/yd2UlnaQ0p0ki2oE3I9yV4gl0Qf7A5whz8yFWtEXyjKL
         3GzSgeuPKlTu93tjCv5DfCuDvYA2LFpNb3++HuHlQG33gl0rH3TdJgUF2SFUH22cXjoh
         OAYy5lNsp46912uJSPVQX62T8/Yx19wjzaPTSSjcBL3K7cPdok8LUhkOmnxfyBoqmha0
         iqehVTA9tZoUKyCZ+JcKxc8OxAnJ8QsSsy5zBErUGxnzGNYY9+ai/XofeslimQceZObI
         ypTmENC6UW351iw2PMiZA28h26lirmx+Jtt3uQuLUj90MeX4Yk5W5NNFs0cT4G0yeDMb
         qjjg==
X-Gm-Message-State: AOAM531oBX1H6HtAp2DX0Y8MqMv1/Maei7nM6IIZN/SL0l2zjENBgYBj
        wM2g1ElMlxaHHZ31kwN9rkmVuoXqLXTMDXwl9o0=
X-Google-Smtp-Source: ABdhPJzZnfm6M/D6C6FDUIUrc/BiG76DixcJoRURxDV7ng30jOeHO75IwXPePu7T8eJ0AmyOnQSk8e26ZTZDyc2lAvM=
X-Received: by 2002:a02:c995:: with SMTP id b21mr1977945jap.65.1605228019942;
 Thu, 12 Nov 2020 16:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
 <CAJsYDVJtPqd-aPjJZFC76R2fbv1i=tVzRR7S1VFAMzp1QcPbiQ@mail.gmail.com>
 <CAJsYDVKWuygjbBErQt1B5XD8Bp06-TdrziBzDdYmMGhU_8X-aA@mail.gmail.com> <CAMhs-H85RCK=a_y+fVm-oR3hOEfr=rtVcLvX09YH4F65enz3oA@mail.gmail.com>
In-Reply-To: <CAMhs-H85RCK=a_y+fVm-oR3hOEfr=rtVcLvX09YH4F65enz3oA@mail.gmail.com>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Fri, 13 Nov 2020 08:40:09 +0800
Message-ID: <CAJsYDV+Gm-0HpvE7W8iG=t5JT+whrQjerRUT65eXxv2av9160A@mail.gmail.com>
Subject: Re: [PATCH 0/7] MIPS: ralink: add CPU clock detection and clock gate
 driver for MT7621
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
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 12, 2020 at 1:23 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> To avoid weird behaviour because of some drivers are
> not using properly clocks we have the CLK_IGNORED_UNUSED, which as you
> can see is currently being used in my code. Using that all seems to
> work as expected as it is now.

The whole point of having a clock gate driver is to gate unused
clocks to save (maybe a tiny bit of) power. It's other peripheral
drivers' fault that it doesn't enable clocks properly and we shouldn't
just work-around the problem in the clock driver by disallowing auto
clock gating.

-- 
Regards,
Chuanhong Guo
