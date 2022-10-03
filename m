Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 133645F351D
	for <lists+linux-mips@lfdr.de>; Mon,  3 Oct 2022 20:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiJCSAW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Oct 2022 14:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiJCR72 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Oct 2022 13:59:28 -0400
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79DC40E25;
        Mon,  3 Oct 2022 10:59:00 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id n83so12066010oif.11;
        Mon, 03 Oct 2022 10:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=jsFBWQdyENFLVSPAWaRsFcNzTsC/248jtvvx+X5ea8g=;
        b=hqVIMzk9aRWrpIx21W1Peb0rnSX8+0kOjC0iQ7CtnMJo4LIjN0YKSjP2hQHQZ/qJAu
         uVlwLE7JWmifJoUDKTnbzo24bLXuc9sWS+18k1PbfFIzkBc5RlQ64r4jKBUtHQqQRvD3
         OhMlZzHeJ8ABTV+kOqKD/8xnYpAduauoNFtVpqZbhGCRdbeumd6cmYWJHLu0FLFdlMlJ
         QSa9ef5yxgTWRdYuauUjSYX5R0YSukoYJHjkJMr/10FG7y7EZ6UEcuYmRjUvnP/b1M69
         WVCY19bzE4U5jjDEp1oLfo4giKwUUCIxPHBPj1KdqjGLJISaptT0I1Rj31B3dfmThedO
         sfwA==
X-Gm-Message-State: ACrzQf24H5sShe0EWXG1t4MazpFPjXJSgJiIPeommIu4r610GxPGhZfK
        2Iandel9XxEExL+pycuTFw==
X-Google-Smtp-Source: AMsMyM52zXejSllTBXcHyWmvXxfGmMUOuQa7B0+mZ10IliVgFZ0KW8GWLVHuLkmJKfcx9YOEW+vZFg==
X-Received: by 2002:aca:6541:0:b0:350:f570:4df with SMTP id j1-20020aca6541000000b00350f57004dfmr4509157oiw.239.1664819940015;
        Mon, 03 Oct 2022 10:59:00 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x65-20020a9d37c7000000b0065bf42c967fsm2500694otb.19.2022.10.03.10.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:58:59 -0700 (PDT)
Received: (nullmailer pid 2512339 invoked by uid 1000);
        Mon, 03 Oct 2022 17:58:58 -0000
Date:   Mon, 3 Oct 2022 12:58:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     arinc.unal@arinc9.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        hauke@hauke-m.de, zajec5@gmail.com, zhouyanjie@wanyeetech.com
Subject: Re: [PATCH v5 2/2] dt-bindings: mips: brcm: convert Broadcom SoCs to
 schema
Message-ID: <166481993839.2512291.4307743279168088281.robh@kernel.org>
References: <20221002091611.946210-1-sergio.paracuellos@gmail.com>
 <20221002091611.946210-3-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221002091611.946210-3-sergio.paracuellos@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 02 Oct 2022 11:16:11 +0200, Sergio Paracuellos wrote:
> Add the yaml binding for MIPS Broadcom cable/DSL/settop platforms.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../devicetree/bindings/mips/brcm/soc.yaml    | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
