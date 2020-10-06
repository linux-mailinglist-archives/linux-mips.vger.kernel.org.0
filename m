Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584F328548F
	for <lists+linux-mips@lfdr.de>; Wed,  7 Oct 2020 00:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbgJFW15 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Oct 2020 18:27:57 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33698 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgJFW14 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Oct 2020 18:27:56 -0400
Received: by mail-ot1-f68.google.com with SMTP id t15so428098otk.0;
        Tue, 06 Oct 2020 15:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bIxfwcUKhwWi5PXEHY2oibtjWm53f5qOOJ6d+hhSij8=;
        b=lQlcfl6ttx/kRd+oJdSUjrKcdM6Xo9OQEa/6y8r7y588RTWRMk5/KzZ5SFT32fBBGC
         M2lmnQp5A12GD8nCUpe48V+AwesNiShKp70dwy2fcrOh/CJK+5CpNwPlG1hfTXdLQsWw
         y+8Wel8UQLVLbnWdGbfW7FOZPIXCRJjm8i6+ZEBwGf9hdfu1V+VsMV1kKdyegJf/c6tx
         2vvh6E/0w3pajSv82neWpsYALMZjJc7hOBC75YtafnC8BSo/2axzz2PV35/wcFimk5Db
         5PaCCbRCD7JADFc9WFMN3AtUTuk2BmEYkNfIt1Dqv+w0xEk2hDSg3na5wsN6JKm8ch1B
         ORfQ==
X-Gm-Message-State: AOAM530lkJYn0fS7pnihxedg87TpjsFFx5BuQ8RCQEdTLbMBG3+UWa5u
        2UoFCV5A6Tvp1tGBXloKxS3KMeAQ5eTZ
X-Google-Smtp-Source: ABdhPJxRwMszI2DlfXiX8dwjERn3YfMK8ci9QTyyCK5c1CqJYSx11XCGap5FgjPbZZOpuJCAn1RIGg==
X-Received: by 2002:a05:6830:138f:: with SMTP id d15mr85548otq.342.1602023275282;
        Tue, 06 Oct 2020 15:27:55 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t5sm96136otl.22.2020.10.06.15.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 15:27:54 -0700 (PDT)
Received: (nullmailer pid 2969307 invoked by uid 1000);
        Tue, 06 Oct 2020 22:27:53 -0000
Date:   Tue, 6 Oct 2020 17:27:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alexander Dahl <ada@thorsis.com>
Cc:     Jeff LaBundy <jeff@labundy.com>, Alexander Dahl <post@lespocky.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for
 pwm-leds
Message-ID: <20201006222753.GA2965477@bogus>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
 <20201006021729.GA4822@labundy.com>
 <3367098.sbkyfNuaKI@ada>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3367098.sbkyfNuaKI@ada>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 06, 2020 at 08:34:23AM +0200, Alexander Dahl wrote:
> Hello Jeff,
> 
> Am Dienstag, 6. Oktober 2020, 04:17:29 CEST schrieb Jeff LaBundy:
> > Hi Alexander,
> > 
> > On Mon, Oct 05, 2020 at 10:34:42PM +0200, Alexander Dahl wrote:
> > > The node names for devices using the pwm-leds driver follow a certain
> > > naming scheme (now).  Parent node name is not enforced, but recommended
> > > by DT project.
> > > 
> > >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > > 
> > > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.exampl
> > > e.dt.yaml: pwmleds: 'panel' does not match any of the regexes:
> > > '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'> 
> > >         From schema:
> > >         /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/
> > >         leds-pwm.yaml> 
> > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > ---
> > > 
> > > Notes:
> > >     v6 -> v7:
> > >       * added warning message to commit message (Krzysztof Kozlowski)
> > >     
> > >     v6:
> > >       * added this patch to series
> > >  
> > >  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
> > > b/Documentation/devicetree/bindings/mfd/iqs62x.yaml index
> > > 541b06d80e73..92dc48a8dfa7 100644
> > > --- a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
> > > 
> > > @@ -90,10 +90,11 @@ examples:
> > >              };
> > >      
> > >      };
> > > 
> > > -    pwmleds {
> > > +    led-controller {
> > > 
> > >              compatible = "pwm-leds";
> > > 
> > > -            panel {
> > > +            led-1 {
> > > +                    label = "panel";
> > > 
> > >                      pwms = <&iqs620a_pwm 0 1000000>;
> > >                      max-brightness = <255>;
> > >              
> > >              };
> > 
> > I like the consistency this brings. My only feedback is that in the other
> > examples I found (common.yaml and leds-gpio.yaml), the children count off
> > from 0 (e.g. led-0) instead of 1 as your series appears to.
> 
> You're right.  And that's also the same in leds-lp50xx.yaml and … well I did 
> not look close enough, maybe the numbering scheme on the PCB on my desk 
> confused me.

If you can tie the numbering to the PCB, then do that.

> Okay, we are already talking about starting index.  What about the parent 
> node's "led-controller" then in case there are more than one?  IIRC Rob 
> acknowledged starting from 1 like "led-controller-1", "led-controller-2" and 
> so on.

No, I'd assume we start at 0.

> > That's not a huge deal; it simply seems more consistent to count from the
> > first index allowed by the regex (0). The patch is still fine, and so:
> > 
> > Acked-by: Jeff LaBundy <jeff@labundy.com>
> 
> Thanks.
> 
> I'm not sure how many more iterations of this series we will need, at least 
> one for the binding license acks I guess, so I could also adapt the child node 
> indexes in schema and actual dts files in v8 or so.
> 
> Greets
> Alex
> 
> 
> 
