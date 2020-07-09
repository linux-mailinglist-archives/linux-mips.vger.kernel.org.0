Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B778021A8E8
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 22:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgGIU0n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 16:26:43 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:45468 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgGIU0m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 16:26:42 -0400
Received: by mail-il1-f194.google.com with SMTP id o3so3132536ilo.12;
        Thu, 09 Jul 2020 13:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/eSMuWkNJsUphXh8e6HzM35yVDDPZlMFwLX/JKcpMik=;
        b=gao8iiSfw7er0sHsEDKHOdPx9GENm2WYlv2Vb6GvCflsoo6QES4ANXTVMSk8Ajg0LP
         w5sP/C2vbIG1tKqmuOR6sr2Hy5aqYcREejI5bsNuKCfHql/kuw1KsQBtYwvmaMR5M+x4
         tCTH3XEA3YJjbG6wc+ASr4I0INh1q8xeg77048g/GVnphJog8vidFtI6jurJ9dcQ45dr
         CH2MLXgktt0YzPT9SPENNq2z90FCAfRBkG7BPzFa+yjMTAd9nZ2dtrQJnKNOv2QghWhM
         4oH5dQf/+s39pBU+QTLIrLxcl0a8AlqHB8IkvRfpXaKY+h/pjuMrxzT1VjnOCWTcHZYx
         TeJw==
X-Gm-Message-State: AOAM531IRoY4be0ktqbFbImX/JY8YHJGejGX4w2rnnR/JdGpmxwMjLUG
        mEUXWlLdGJ0+lXQzRj6XFw==
X-Google-Smtp-Source: ABdhPJzqXAC0s2b7gUxdhxKBjsMk4vL8KZ082sV/MG1iXFYb39032CYm+1hGLrSMXSaERSWOoD7qJw==
X-Received: by 2002:a92:c10b:: with SMTP id p11mr28752779ile.60.1594326401691;
        Thu, 09 Jul 2020 13:26:41 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id e1sm2411143ilr.23.2020.07.09.13.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:26:41 -0700 (PDT)
Received: (nullmailer pid 831547 invoked by uid 1000);
        Thu, 09 Jul 2020 20:26:40 -0000
Date:   Thu, 9 Jul 2020 14:26:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     linux-kernel@vger.kernel.org, f.fainelli@gmail.com,
        p.zabel@pengutronix.de, robh+dt@kernel.org, jonas.gorski@gmail.com,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v7 4/9] mips: bmips: dts: add BCM6328 reset controller
 support
Message-ID: <20200709202640.GA831491@bogus>
References: <20200617105042.3824116-1-noltari@gmail.com>
 <20200617105042.3824116-5-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617105042.3824116-5-noltari@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 17 Jun 2020 12:50:36 +0200, Álvaro Fernández Rojas wrote:
> BCM6328 SoCs have a reset controller for certain components.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  v7: no changes.
>  v6: no changes.
>  v5: no changes.
>  v4: no changes.
>  v3: add reset controller definitions header file.
>  v2: no changes.
> 
>  arch/mips/boot/dts/brcm/bcm6328.dtsi      |  6 ++++++
>  include/dt-bindings/reset/bcm6328-reset.h | 18 ++++++++++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/reset/bcm6328-reset.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
