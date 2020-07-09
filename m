Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD46421AB22
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 01:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgGIXBb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 19:01:31 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33003 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgGIXBb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 19:01:31 -0400
Received: by mail-io1-f66.google.com with SMTP id d18so4138354ion.0;
        Thu, 09 Jul 2020 16:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=do47ZWBYWd84imqTZeOn2NfoIN1AnvEBXVl3Hhhovg4=;
        b=k8SMX/MEyyk438K54glIyWtLsnKTADQJi2VsLpovr2huUMpd75T5CUF+Afh6HMXZMf
         gnMTKV/BQSYgmL4RXxpll9sAiRhM+nflv8G11/awhdyUUTG+LtYkgmNcAJGi0A/7W0tm
         iwz+8suax0RAidL8ARxg/ib5OwLHS1OZvYTwA6G55aKgzBPB0/g5M18txx51AF4Qu5H0
         BI9GlYGjQBMDvmHJFO78WC+e0NzWvQXVp1P80V4Mzd5e4qgbyyrkTUlsignV9c3uCMSX
         ms21Cob6GodxQAJxdLyrPkBJh7Ur9tDqk7U0yeaN+BXRARE7e9y6xr/4zIHzYyHuc4hG
         ELOA==
X-Gm-Message-State: AOAM531Ac+fdrOOioavb3t3rnAQ1COKxyf0T2Kwo6VQK6jwVHodD8VgT
        tFptke8SKTuL005LhKzQAPXK0ekztw==
X-Google-Smtp-Source: ABdhPJw9FUKpB9X0nNwu3Q/Warw6uTLpUeICn06hHAjP0DEUa/C1UxzF5Lq80AoxUT6ct+su9R7efQ==
X-Received: by 2002:a05:6638:14d3:: with SMTP id l19mr74532622jak.25.1594335690503;
        Thu, 09 Jul 2020 16:01:30 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id m6sm2700971ilb.39.2020.07.09.16.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 16:01:29 -0700 (PDT)
Received: (nullmailer pid 1053566 invoked by uid 1000);
        Thu, 09 Jul 2020 23:01:28 -0000
Date:   Thu, 9 Jul 2020 17:01:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        zajec5@gmail.com, robh+dt@kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, f.fainelli@gmail.com,
        hauke@hauke-m.de, linux-mips@vger.kernel.org,
        jonas.gorski@gmail.com, tsbogend@alpha.franken.de
Subject: Re: [PATCH v4 4/9] mips: bmips: add BCM63268 power domain definitions
Message-ID: <20200709230128.GA1053536@bogus>
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
 <20200613082140.2009461-5-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200613082140.2009461-5-noltari@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 13 Jun 2020 10:21:35 +0200, Álvaro Fernández Rojas wrote:
> BCM63268 SoCs have a power domain controller to enable/disable certain
> components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v4: Remove "dts: " from commit title.
>  v3: Separate dt-bindings definitions from power domain .dtsi support.
> 
>  include/dt-bindings/soc/bcm63268-pm.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 include/dt-bindings/soc/bcm63268-pm.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
