Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA208601652
	for <lists+linux-mips@lfdr.de>; Mon, 17 Oct 2022 20:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiJQScJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Oct 2022 14:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiJQScI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Oct 2022 14:32:08 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7C5165B6;
        Mon, 17 Oct 2022 11:32:05 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id e53-20020a9d01b8000000b006619152f3cdso6293704ote.0;
        Mon, 17 Oct 2022 11:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4KBKSBI/F2weccO+8vpMaQLojrwtOI7PJEtNGMBbv8=;
        b=Oyj0ZdEeRJ1L/5NbaUN1cafmt/WNyleKdS37H1vK93IziGknIy1UGPhRhvBABLZeV+
         z82QPSpHKzvFIKT+efHkyACZ/QWlttQ5SAu29/jKDHykKLrFlFEFTgKV4i+9WF93J6Yz
         3nRudtkEldvKiCcafWspa9gDVGsPrf7+K667/mzW//QSiK2K8AvHj58BWr3XIqjqqRIH
         N00LyfCjS6tMGAm1RuReJNNQqUa+6Y7XaXTtq9vWYKUr7vwL+9JaaTVjE1XVKbRAsrfL
         fGDdeVkkGHpnoTtFjmvjWyrhkl/RFA5HVj/5rUTT/2skfmz+6DOUxU58W77RLMD67S0y
         N6IQ==
X-Gm-Message-State: ACrzQf0p76SXwqhb+bf6dvei6pu6P3LAdbN7nLcq/4AZjMVJBcH9wrxG
        xSps0Wq2p1zYZXSLq1sZlg==
X-Google-Smtp-Source: AMsMyM7ovuhrFJCmyacsMdvY9jbycE7gO4OGU8WmReWBvQJS/W8Dc2fQZBZQVAyGeUjYqjO+vSZ5SA==
X-Received: by 2002:a9d:4b02:0:b0:661:b51b:d1f5 with SMTP id q2-20020a9d4b02000000b00661b51bd1f5mr5729804otf.45.1666031524698;
        Mon, 17 Oct 2022 11:32:04 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t18-20020a9d7f92000000b00660fe564e12sm4936549otp.58.2022.10.17.11.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 11:32:04 -0700 (PDT)
Received: (nullmailer pid 2252177 invoked by uid 1000);
        Mon, 17 Oct 2022 18:32:04 -0000
Date:   Mon, 17 Oct 2022 13:32:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        John Crispin <john@phrozen.org>, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        Richard Weinberger <richard@nod.at>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: mtd: partitions: add TP-Link
 SafeLoader layout
Message-ID: <166603152420.2252138.6710200769138696652.robh@kernel.org>
References: <20221015092950.27467-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221015092950.27467-1-zajec5@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 15 Oct 2022 11:29:49 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Most TP-Link home routers use the same partitioning system based on a
> custom ASCII table.
> 
> It doesn't seem to have any official name. GPL sources contain tool
> named simply "make_flash" and Makefile target "FlashMaker".
> 
> This partitions table format was first found in devices with a custom
> SafeLoader bootloader so it was called SafeLoader by a community. Later
> it was ported to other bootloaders but it seems the name sticked.
> 
> Add binding for describing flashes with SafeLoader partitions table. It
> allows operating systems to parse it properly and register proper flash
> layout.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Fix typo in commit: s/same/name/
> V3: Drop quotes from $ref
>     Describe flash space coverage & partitions types in the binding
>     See commit body of PATCH 2/2 for real life example
> ---
>  .../tplink,safeloader-partitions.yaml         | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
