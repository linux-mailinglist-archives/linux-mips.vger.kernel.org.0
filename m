Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461B533F9A1
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 21:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbhCQUAM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 17 Mar 2021 16:00:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40998 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233338AbhCQUAA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 16:00:00 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMcKl-0007dU-AJ
        for linux-mips@vger.kernel.org; Wed, 17 Mar 2021 19:59:59 +0000
Received: by mail-ed1-f72.google.com with SMTP id y10so7650427edr.20
        for <linux-mips@vger.kernel.org>; Wed, 17 Mar 2021 12:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W0esqWHCzb193v8SoX3wXdHFUTCrLmnQ//TF0pO6cDw=;
        b=sNcvSYmmbK8scJGTEUAOIaJkZ5Y0DKZw+3E0GE8rH6bTkcNheeUqTXrYd4edJnMfFA
         quM2lbTPcDGOR7JMAqExW3CKkep1bH5Et2UEHYyN5IsV+MRziSsIi+XTw5/TO1G1AG+t
         dhwjY2CUOBOFV0i7DHOm3QxFNJJ1fEMTtAUFYsMzDyqcMSSk4kpQAeNPnQ9ONkAm6Isj
         ajnPxT/4c9rpzmzfNNOUPEQ1eyNUwZA9N1P2F4fol/+niwtQh7SvtU1ZIuQA2a14UrlE
         aXM6w9swtDTHYzL/sWglsr0NxigVccgAU6B0cTxDNdLlKt4Wkw8LgEMvWlFDLStbvh/2
         OuOA==
X-Gm-Message-State: AOAM531SGoGmIaCgl1WPua2uhSdwk9mjpxrv0w5x+o6IQ84Nf4AyMywo
        cec6V/mC7xfTXa4WXAygVfQtPIiErTQTuEHVnDoIAg5YjXx46SMadDCZYNnAQCBDikaHsH1IS+n
        fqMzf32sqZcqMqsUDaQmW7YQ10KTJVARxGI1NcfQvHN6QIFq/lmkbk3U=
X-Received: by 2002:a17:906:3552:: with SMTP id s18mr37750184eja.497.1616011199080;
        Wed, 17 Mar 2021 12:59:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKpXA6eex5KBnMD0YRhdIc3IgyUiajyllnwZ+8QpwubjtA8e3lNRvcdiU21o5z7zP05vSTZtRGnwfwk8Fqg74=
X-Received: by 2002:a17:906:3552:: with SMTP id s18mr37750164eja.497.1616011198940;
 Wed, 17 Mar 2021 12:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
 <880d5e61-fec5-e7d6-7403-b1823c77b3c1@gmail.com> <856fbd45-67ae-fed2-97c4-b555993d5ae9@canonical.com>
 <1cd074f0-3a58-d1bf-2a72-4fadd0d3b796@gmail.com>
In-Reply-To: <1cd074f0-3a58-d1bf-2a72-4fadd0d3b796@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date:   Wed, 17 Mar 2021 20:59:47 +0100
Message-ID: <CA+Eumj6GDMTv8qyiPwvSjqbpvZcXTpa0SFeRONAq058gWY8GDg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: define stubs for clk_set_parent to fix
 compile testing
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 17 Mar 2021 at 20:37, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 17.03.2021 12:56, Krzysztof Kozlowski пишет:
> > On 17/03/2021 10:52, Sergei Shtylyov wrote:
> >> Hello!
> >>
> >> On 16.03.2021 20:57, Krzysztof Kozlowski wrote:
> >>
> >>> The Ralink MIPS platform does not use Common Clock Framework and does
> >>> not define certain clock operations leading to compile test failures:
> >>>
> >>>      /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
> >>>      phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
> >>>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >>> ---
> >>>   arch/mips/ralink/clk.c | 14 ++++++++++++++
> >>>   1 file changed, 14 insertions(+)
> >>>
> >>> diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
> >>> index 2f9d5acb38ea..8387177a47ef 100644
> >>> --- a/arch/mips/ralink/clk.c
> >>> +++ b/arch/mips/ralink/clk.c
> >>> @@ -70,6 +70,20 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
> >>>   }
> >>>   EXPORT_SYMBOL_GPL(clk_round_rate);
> >>>
> >>> +int clk_set_parent(struct clk *clk, struct clk *parent)
> >>> +{
> >>> +   WARN_ON(clk);
> >>> +   return -1;
> >>
> >>     Shouldn't this be a proepr error code (-1 corresponds to -EPRERM)?
> >
> > Could be ENODEV or EINVAL but all other stubs here and in ar7/clock.c
> > use -1. Do you prefer it then to have it inconsistent with others?
>
> I don't see where -1 is used, ar7/clock.c returns 0. Other drivers
> either return 0 or EINVAL.
>
> Since linux/clk.h returns 0 in the stub, I think 0 is the correct variant.

The ar7 returns 0 but the other stubs in ralink return -1.

Best regards,
Krzysztof
