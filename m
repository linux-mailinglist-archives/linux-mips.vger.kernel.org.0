Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A5D21A8F4
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 22:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgGIU2R (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 16:28:17 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45743 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGIU2R (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 16:28:17 -0400
Received: by mail-io1-f66.google.com with SMTP id e64so3696082iof.12;
        Thu, 09 Jul 2020 13:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=foB9dQuQ24UaTnQbQ4ZdxS1OKh6MKCGS+EusAkO2nUE=;
        b=ffN+lfdvK1KvvJHiopT2ADTHFyqPh/1a8Nn8u/hTPVI1q6ZOMO3A+9d65UgMBj8/HF
         xdYXN4kPw/u1mweHgHrv/mCcjRgcf3NpGbsgH/aRKgDjhEw0SSiakZTHdBxFUEUDDa27
         EVFXYavXJ7Lp4MzbGqnR3NWD+xbdOFNmc3COTdgcUZOxWkIBxZ1TbE60aNTo++98o2or
         LXgZXZjtBH2u89t5SZni8S/pniGzdmAzwqf3Eh06WDFt1D8KG1DoDCxJaIgAsILg4nDh
         RW6H8/eOmXsJt/ti2TgX0tpiWw0ZZRCQML2AOEjAAlAahSNduwEEOsYV8v4HzApEqKNL
         em2g==
X-Gm-Message-State: AOAM532PiY1MqGTCpEur7k+SSP9QRARuulK/TEl3s0K5jTdUFS+wTTSq
        sr8TLBfS0YJzw9tor6A98WywjFNf3A==
X-Google-Smtp-Source: ABdhPJyFSDsuk7FtQu5kAzb34pTXXheXMNk3fFtqbn+JkY82tHP65Tl8S7eU3Ojt4TuBrSC/pTdU1Q==
X-Received: by 2002:a6b:1449:: with SMTP id 70mr44058123iou.153.1594326495885;
        Thu, 09 Jul 2020 13:28:15 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id b21sm2713424ioc.36.2020.07.09.13.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:28:15 -0700 (PDT)
Received: (nullmailer pid 834055 invoked by uid 1000);
        Thu, 09 Jul 2020 20:28:14 -0000
Date:   Thu, 9 Jul 2020 14:28:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     p.zabel@pengutronix.de, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, f.fainelli@gmail.com,
        robh+dt@kernel.org
Subject: Re: [PATCH v7 8/9] mips: bmips: dts: add BCM63268 reset controller
 support
Message-ID: <20200709202814.GA834025@bogus>
References: <20200617105042.3824116-1-noltari@gmail.com>
 <20200617105042.3824116-9-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617105042.3824116-9-noltari@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 17 Jun 2020 12:50:40 +0200, Álvaro Fernández Rojas wrote:
> BCM63268 SoCs have a reset controller for certain components.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  v7: no changes.
>  v6: no changes.
>  v5: no changes.
>  v4: no changes.
>  v3: add new path with BCM63268 reset controller support.
> 
>  arch/mips/boot/dts/brcm/bcm63268.dtsi      |  6 +++++
>  include/dt-bindings/reset/bcm63268-reset.h | 26 ++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 include/dt-bindings/reset/bcm63268-reset.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
