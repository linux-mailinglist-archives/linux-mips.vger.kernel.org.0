Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7C61AD158
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 22:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgDPUmU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 16:42:20 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41470 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731844AbgDPUmB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Apr 2020 16:42:01 -0400
Received: by mail-ot1-f68.google.com with SMTP id c3so153569otp.8;
        Thu, 16 Apr 2020 13:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=anW0cTk2V2JJay0BG4lZbAZX39UmWgVy33oQofhYL+o=;
        b=TrOIgi/Psi9lHEQb0p80KCPztg6udz4+rr0XyCa8Wkt57hera+PoysMJRclxDiM/7t
         tCUFQiKwFGtZFk80IsqoxTrrcKd3YsUVaKvd0io//86RBx7n0MgbwjXTEc/HorcO3N+1
         DsXgZjF2jNj7U0ZTHpTulxAHeKStOIRo4atSFMyMw7q8XarNxhspS4czCwzi9VgTL1UC
         FaH4zzO2AbA3QrHhKiO2rDseQbzJ60KIHsWCC5ECKMtBKG2oqUBb+KpSWfFyvgZL2OC/
         K9k/7P4X3YN8FJXAid1NOJn1DFJHpR4c3pJxYfuky4mWsPRn2ORllT7NvbWEqkcz9+EN
         ODcQ==
X-Gm-Message-State: AGi0PuZzUWvCP681alK6PrRPA81k8SRaaWAKc8BzuZhL+W1YFJIFBTK6
        sk6bY7VySAvn4HXqL0KCDg==
X-Google-Smtp-Source: APiQypLW3db/YOgTAVu/J1ZAay4EFYrxFtuax8O/ijjNSMUub8dIEYBEUvJBFYL72MQmqT4sac6WuA==
X-Received: by 2002:a9d:6644:: with SMTP id q4mr39174otm.229.1587069719796;
        Thu, 16 Apr 2020 13:41:59 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s13sm8064384oov.28.2020.04.16.13.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 13:41:59 -0700 (PDT)
Received: (nullmailer pid 13530 invoked by uid 1000);
        Thu, 16 Apr 2020 20:41:58 -0000
Date:   Thu, 16 Apr 2020 15:41:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: add img,pvrsgx.yaml for
 Imagination GPUs
Message-ID: <20200416204158.GA1006@bogus>
References: <cover.1586939718.git.hns@goldelico.com>
 <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 15 Apr 2020 10:35:08 +0200, "H. Nikolaus Schaller" wrote:
> The Imagination PVR/SGX GPU is part of several SoC from
> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
> Allwinner A83 and others.
> 
> With this binding, we describe how the SGX processor is
> interfaced to the SoC (registers, interrupt etc.).
> 
> In most cases, Clock, Reset and power management is handled
> by a parent node or elsewhere (e.g. code in the driver).
> 
> Tested by make dt_binding_check dtbs_check
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml:  while parsing a block mapping
  in "<unicode string>", line 74, column 13
did not find expected key
  in "<unicode string>", line 117, column 21
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/gpu/img,pvrsgx.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/gpu/img,pvrsgx.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1264: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1270997

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
