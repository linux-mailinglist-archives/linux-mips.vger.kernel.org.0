Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964231ABBD0
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 10:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503047AbgDPI4S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 04:56:18 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46861 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502720AbgDPIvD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Apr 2020 04:51:03 -0400
Received: by mail-ed1-f67.google.com with SMTP id w4so7902927edv.13;
        Thu, 16 Apr 2020 01:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=612iSfEdCExrydRb4c/BtgR5OtI+RlzyNcwVt1HFejQ=;
        b=BNN1dm8BnF20ZEVRVraemvq1X1zndJl0bV3Sz8GJRusVtvnKGfe1jIrl//7n+DdVxr
         O5W1vwiHhm9sUxMY9Uka9BiarY9vwI5p2k4I8pLkyLNYjoCBtuAj4TqErl8r4nkM7+kM
         QnXgj9GKwGZbV2YIPKanYlLxMOA1D6je6ff9AEz4IEctQlSnf60/WoFYD/1AB20GmGT6
         ugdpNdsHoG6TF6OI9dv/DSoB2gGGr2RF4eFycnzDp3LjXd0o188XNu7vR4efKiKUSABj
         ciKsQAgDnFOQhTR7AuZjjdZCjxJr5OHOBZ3egy3hTu7n0HBQYE6aDESG9F4gS/sAjm0m
         nDwA==
X-Gm-Message-State: AGi0PuYJx7kh5qnDyfwANOKUjdd7WqM5uzgC9EM5towOsx+JcA4YiIJW
        CHJQWR/Wl+BFtcrel7sAk4E=
X-Google-Smtp-Source: APiQypLBJohNWBf8al3U6Nm7wdqmu7TVhKtwUuNuYqABpoxhkFpKFPfFew2b9nU4yPhd8D2/wycwag==
X-Received: by 2002:aa7:d1d6:: with SMTP id g22mr7466242edp.36.1587027059468;
        Thu, 16 Apr 2020 01:50:59 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id b15sm2495600edn.69.2020.04.16.01.50.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 01:50:58 -0700 (PDT)
Date:   Thu, 16 Apr 2020 10:50:49 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, openpvrsgx-devgroup@letux.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
Message-ID: <20200416085049.GA7193@kozik-lap>
References: <cover.1586939718.git.hns@goldelico.com>
 <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
 <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
 <AB9B8741-CFF7-414D-9489-D381B539538D@goldelico.com>
 <BN6PR04MB0660640B15550F75C8CCD4DEA3DB0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BN6PR04MB0660640B15550F75C8CCD4DEA3DB0@BN6PR04MB0660.namprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 15, 2020 at 11:17:16AM -0700, Jonathan Bakker wrote:
 
> >>
> >>> +
> >>> +                       assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
> >>> +                       assigned-clock-rates = <0>, <66700000>;
> >>> +                       assigned-clock-parents = <&clocks MOUT_MPLL>;
> >>
> >> Probably this should have status disabled because you do not set
> >> regulator supply.
> 
> I don't believe there is a regulator on s5pv210, if there is, then it is a
> fixed regulator with no control on both s5pv210 devices that I have.
> 
> The vendor driver did use the regulator framework for its power domain
> implementation, but that definitely shouldn't be upstreamed.

Starting with Exynos4210 usually they have separate regulator from PMIC
but maybe S5Pv210 indeed is different.  Leave it then without it.

Best regards,
Krzysztof

