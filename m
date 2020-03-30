Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB51197FF7
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 17:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbgC3PmH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 11:42:07 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46313 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgC3PmH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Mar 2020 11:42:07 -0400
Received: by mail-io1-f66.google.com with SMTP id i3so9065464ioo.13;
        Mon, 30 Mar 2020 08:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XToUOXTBi4v+G+zH1meistMeAK6/7kaJVHzaJ0IgHkE=;
        b=f1ZsDbxR2FfpJdEdxwNjwq4aR3pKPSmVhTUSSHaC4GpZIBCxoN/ZQ0hw9614oIHJE3
         UvLupyUmWwnN6esvWfGLH20978tGG4JyFS3qpvZ3bzD38y97Gh66nhcR7AdDCeJXQhzB
         UegY+rWIq9S5GjZmssrAes2eOKGZ88UaQzCPvYBj6XGXkSpl0xdi+i1dvuffeT+6tib2
         ZzHwpzGqIUVPdeEFsvJzqhg65Wef0JQ1NEggEIlo07EvAgbC4LxIOqJdxADUfpN7LO+Y
         NNf8Ete1eSGEi75IekkSGmUA5A88RpiMY5nppTR3M3JebOwL1WJ04l3sCKJE3aFVJHiC
         vnlA==
X-Gm-Message-State: ANhLgQ33dmQEwg/DK2mN+1ybTVp9KXt+gxwjRTc7M0OXoBtDZOdjDi6c
        Vz9me9OMBCuNs3c77HDeLw==
X-Google-Smtp-Source: ADFU+vuo2GMSlIScfz8VpFQrF31IFo0FS6MvSyPlgMZwQJUJOQOv+ANaUZdUOCWSeh/xQWl4VpTXlQ==
X-Received: by 2002:a02:641:: with SMTP id 62mr11747164jav.79.1585582926290;
        Mon, 30 Mar 2020 08:42:06 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c12sm5004502ila.31.2020.03.30.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 08:42:05 -0700 (PDT)
Received: (nullmailer pid 24611 invoked by uid 1000);
        Mon, 30 Mar 2020 15:42:02 -0000
Date:   Mon, 30 Mar 2020 09:42:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        mips-creator-ci20-dev@googlegroups.com
Subject: Re: [RFC v3 1/8] dt-bindings: display: convert ingenic,lcd.txt to
 ingenic,lcd.yaml
Message-ID: <20200330154202.GA23233@bogus>
References: <cover.1585503354.git.hns@goldelico.com>
 <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 29 Mar 2020 19:35:47 +0200, "H. Nikolaus Schaller" wrote:
> and add compatible: jz4780-lcd, including an example how to
> configure both lcd controllers.
> 
> Also fix the clock names and examples.
> 
> Based on work by Paul Cercueil <paul@crapouillou.net> and
> Sam Ravnborg <sam@ravnborg.org>
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/ingenic,lcd.txt          |  45 ------
>  .../bindings/display/ingenic,lcd.yaml         | 128 ++++++++++++++++++
>  2 files changed, 128 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic,lcd.example.dt.yaml: lcd-controller@13050000: clocks: [[4294967295, 9]] is too short

See https://patchwork.ozlabs.org/patch/1263508

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
