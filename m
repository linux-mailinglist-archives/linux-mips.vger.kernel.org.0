Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5DA81AA903
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 15:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636252AbgDONsE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 09:48:04 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36671 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633569AbgDONsA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 15 Apr 2020 09:48:00 -0400
Received: by mail-ed1-f67.google.com with SMTP id i7so4907187edq.3;
        Wed, 15 Apr 2020 06:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mIOZ/sd96Rx46ThWOAXmWIaAK4iqfwYtds7TxEtsnA0=;
        b=b65oEdfKBbQENn+m6r1YGJMnQQK5bSe4g1HPaD3KzwgECpObb3/ACMCvwfhpuEcPQj
         KF89eStc3t0zv4U+T9zsDUbnT2GnrJOmEHGN8wyEf8wX+p/H+Jn6yQiQLAaQmmW4TVAV
         4bHmw205FEzwXRexi12XK4wWpeYDtL3ZA8KuggwqI/XvALFXT+9PehUCAr2e+kaAE5FV
         Tc3LllCimCp+J0jG3XVup0qKyH3A/jZpwrhYDM+PyQmxOLGoBmmTVu5xIYqRFC/wgwrY
         708HaR3jBZD9POXaX4cpG18kxrzisNG0G4+BNvvsiIxzhmIugnwLU29fBH8idXJH1hco
         C+ng==
X-Gm-Message-State: AGi0PuZdk/gYNsO0DBCI0AgfaOWgGe1zQJXZWlq/N8GDNvq2ZHlS7ZyR
        1BgDX/jcGj1pfYxjK3gTSjU=
X-Google-Smtp-Source: APiQypL993rtIwMeMfH5wHZyMs+H8Y65XYCjw99y7Fo0rlwZe8pf8YowOuo4m22Vp9YytQslngDtFA==
X-Received: by 2002:aa7:c2c3:: with SMTP id m3mr18170324edp.10.1586958478322;
        Wed, 15 Apr 2020 06:47:58 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id gf12sm2524950ejb.62.2020.04.15.06.47.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 06:47:57 -0700 (PDT)
Date:   Wed, 15 Apr 2020 15:47:54 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
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
Subject: Re: [PATCH v6 07/12] ARM: DTS: omap5: add sgx gpu child node
Message-ID: <20200415134754.GB21120@kozik-lap>
References: <cover.1586939718.git.hns@goldelico.com>
 <004611c9660943759b635a87484932869927cf74.1586939718.git.hns@goldelico.com>
 <CAJKOXPdEkWniffmGZmf=S6E5UxWTdVGXnycqTFftXwo_45rz3w@mail.gmail.com>
 <EFA7F2F0-96EA-45D9-B8C8-00DC8C72344D@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <EFA7F2F0-96EA-45D9-B8C8-00DC8C72344D@goldelico.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 15, 2020 at 01:46:06PM +0200, H. Nikolaus Schaller wrote:
> Hi Krzysztof,
> 
> > Am 15.04.2020 um 13:38 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
> > 
> > On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >> 
> >> and add interrupt.
> >> 
> >> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # Pyra-Handheld.
> > 
> > Don't add your own Tested-by tags. These are implied by authorship,
> > otherwise all patches people make should have such tag.
> 
> Ok I see. AFAIR it originates in several phases of editing to report on which device it was tested.
> 
> Is there a canonical way of writing "tested-on: ${HARDWARE}"?
> 
> E.g. would this be ok?
> 
> Signed-off: H. Nikolaus Schaller <hns@goldelico.com> # tested on Pyra-Handheld

If you think tested platform is worth mentioning in the commit msg
(it will stay there forever, ever, ever) then just add a line like:

"Add SGX GPU node. Tested on Pyra-Handheld."

From time to time we add such information to note that only one platform
was actually tested.  I am not sure what benefit it brings to most
cases... but your commit msg is so short that adding one more sentence
seems reasonable. :)

Best regards,
Krzysztof

