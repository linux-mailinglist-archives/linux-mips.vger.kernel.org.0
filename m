Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF7C22153E
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2020 21:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgGOThh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Jul 2020 15:37:37 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41270 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgGOThf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 15 Jul 2020 15:37:35 -0400
Received: by mail-io1-f66.google.com with SMTP id p205so3501166iod.8;
        Wed, 15 Jul 2020 12:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6yPEJQ72Q1EfjEQSdgbDJUxAG/Z1XD+AX4bIWkXOAZg=;
        b=AVTLuYLkPR5aLldQKyhzl1xhO0zyByUQyDzIwaTjSXN9NKZ1HeAAYHB53RUYVcawoN
         1L0QtA+CWR03pv+uIqmuHUUHDRmLvqQ5qO8GZLXBP2PszKaqQTwZLyJPtDyRgLDYpu3t
         nVyir8swxNBOiCeXUR0ny6SFUdnLxxzV+TSL+AUZxSKST487kznsl18W8xMEQnH5CIrQ
         yZV4H2kNgUIO9SVfFD8ShDeAcRI7h2GqqER2Yj2KOA7d2WNlswIYWP2zYnGmMfW5YESN
         fkehtTt0womhSDOXQytp/QQSXxQR3oi87qm7fdLTBmQC8n9Y5it484K2YO9mu68k0O6q
         zVOg==
X-Gm-Message-State: AOAM530TqD6B3NCae2XYUibUQNXeul2jQdRW9AGEf+1c68ZMDnklghxk
        gq7MdZdLo24NItHJSXL+HQNOPT2u8A==
X-Google-Smtp-Source: ABdhPJzuQ0nT4s41jp1YOfkEXOeSdQsfn/Wq2jydOXxQtQlEud9sRPHgTsAshlMejXSjulz4/siM4g==
X-Received: by 2002:a02:cc58:: with SMTP id i24mr1143377jaq.38.1594841855092;
        Wed, 15 Jul 2020 12:37:35 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c16sm1506198ilh.54.2020.07.15.12.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 12:37:34 -0700 (PDT)
Received: (nullmailer pid 696944 invoked by uid 1000);
        Wed, 15 Jul 2020 19:37:33 -0000
Date:   Wed, 15 Jul 2020 13:37:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        devicetree@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: timer/ingenic,tcu: Add compatible
 strings for JZ4725B SoC
Message-ID: <20200715193733.GA696896@bogus>
References: <20200623182432.187843-1-paul@crapouillou.net>
 <20200623182432.187843-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623182432.187843-3-paul@crapouillou.net>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 23 Jun 2020 20:24:28 +0200, Paul Cercueil wrote:
> Add compatible strings for the PWM and watchdog IPs on the Ingenic
> JZ4725B SoC.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Documentation/devicetree/bindings/timer/ingenic,tcu.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
